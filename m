Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09C606A330
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4CSrD4P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA94D10E3DF;
	Tue, 24 Nov 2026 10:55:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0D10E3DF;
 Tue, 24 Nov 2026 10:54:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E10C3625D9;
 Tue, 24 Nov 2026 10:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6E51F000C0;
 Tue, 24 Nov 2026 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795517695;
 bh=PViI4YFFHH8dsw1LEuH9tJVkgS7gEQVSJSwRx25RdBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=L4CSrD4Pd/4635lRv+mKeClDsIQNVAGClY7J5B0TFbtCYJrv8XGrNSv8bfYb099KF
 wC8o1R6aQ0Bn7nTiOoZmqpe3qTBP9O2kp3uY8t0QLHE923JaYsAiAs647syhGGi3ql
 rzDemC7kdFGZcp87kXJx3NxOWdQbmNsJaZ677/uvXT5JcmBcHYKCCQGBduJ8p544lp
 XyYzCXsNck038FHGiMzId9PGt9Nv3JE/yK6xkniFpiNN3BdanIdvqgkRSAUVHUUZOx
 pbPYIeumK9G8uPRbuWNXluD1WkjBbhz5KVZ5tJlZIguCGyW4jCIEiTrS/+Dv3FJXPh
 i7O28MNBb4rcA==
Date: Tue, 24 Nov 2026 10:54:50 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Felix Kuehling <felix.kuehling@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t] tests/gem_mmap_offset: Accept partial read in
 oob-read
Message-ID: <awVlaeEQSpee2cI2@gremlin>
References: <20261123211018.12339-1-david@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123211018.12339-1-david@kernel.org>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 10:10:18PM +0100, David Hildenbrand (Arm) wrote:
> The oob-read test reads 8 bytes through /proc/self/mem, assuming that
> the kernel would reject the entire read with EIO.
>
> However, we have 4 remaining bytes in the 4 KiB mapping we can read, so
> it's valid for the kernel to only do a partial read that covers these 4
> bytes. Allow that as well.
>
> Otherwise, the test will fail on a kernel with upcoming vm_ops->access
> fixes, whereby vm_ops->access is limited to the current VMA, so the
> read would continue with the next mapping (if any).
>
> So we have to make sure that nothing is mapped after the GEM mapping.
> Let's reserve an 8 KiB memory region, map the GEM object into the first
> 4 KiB slot, and create a hole by unmapping the second 4 KiB slot.
>
> With the kernel changes in place:
>
>   $ build/tests/gem_mmap_offset --run-subtest oob-read
>   [...]
>   Using IGT_SRANDOM=1795467759 for randomisation
>   Opened device: /dev/dri/card1
>   Starting subtest: oob-read
>   Subtest oob-read: SUCCESS (0,000s)
>
> Link: https://lore.kernel.org/r/20261122-access_shite-v2-0-808d8d2aa700@kernel.org
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

It's funny how these things can ripple out, but very much seems a correct
change!

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tests/intel/gem_mmap_offset.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index d3c56ab40..e4c0cfbd9 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -482,13 +482,29 @@ test_oob_read(int i915)
>  	handle = gem_create(i915, 4096);
>
>  	for_each_mmap_offset_type(i915, t) {
> -		uint32_t *ptr;
> +		struct drm_i915_gem_mmap_offset arg = {
> +			.handle = handle,
> +			.flags = t->type,
> +		};
> +		void *ptr;
>
> -		ptr = __mmap_offset(i915, handle, 0, 4096,
> -				    PROT_READ | PROT_WRITE,
> -				    t->type);
> -		if (!ptr)
> +		if (mmap_offset_ioctl(i915, &arg))
> +			continue;
> +
> +		/* Reserve a region for mapping + hole to stop read(). */
> +		ptr = mmap(NULL, 8192, PROT_NONE,
> +			   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +		igt_assert(ptr != MAP_FAILED);
> +
> +		/* Place our mapping into the first slot. */
> +		if (mmap(ptr, 4096, PROT_READ | PROT_WRITE,
> +			 MAP_SHARED | MAP_FIXED, i915, arg.offset) == MAP_FAILED) {
> +			munmap(ptr, 8192);
>  			continue;
> +		}
> +
> +		/* And our hole into the second slot. */
> +		munmap(ptr + 4096, 4096);
>
>  		memfd = open("/proc/self/mem", O_RDWR);
>  		igt_require_f(memfd != -1, "/proc/self/mem\n");
> @@ -497,9 +513,14 @@ test_oob_read(int i915)
>  		ret = lseek(memfd, addr, SEEK_SET);
>  		igt_assert_f(ret != -1, "lseek failed\n");
>
> -		/* Triggering the buf (out of bound read) */
> +		/*
> +		 * Read across the end of the mapping. The read is either
> +		 * rejected entirely, or completes partially for the remaining
> +		 * 4 bytes in the mapping.
> +		 */
>  		ret = read(memfd, read_buf, 8);
> -		igt_assert(ret == -1 && errno ==  EIO);
> +		igt_assert_f((ret == -1 && errno == EIO) || ret == 4,
> +			     "ret=%d errno=%d\n", ret, errno);
>
>  		munmap(ptr, 4096);
>  		close(memfd);
> --
> 2.56.1
>

--
Cheers, Lorenzo
