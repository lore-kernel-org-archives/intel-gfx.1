Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090C9606A326
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ReUDI1vB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AE510E1E4;
	Tue, 24 Nov 2026 17:23:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0196910E1E4;
 Tue, 24 Nov 2026 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795540988; x=1827076988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=B1jilPwUeusB7PG2DHmeoL58moYF94tE0IcDHfzTFo0=;
 b=ReUDI1vBLi3MapA/97Q5VEn/6WqQmzkKG7SOFZKlQ6NDxDhsdKGGX9PV
 +tSvzOhJciRou76fa8w4kfpcgc/hQlBRYyWgeNqr+jIdjN480/sJWUVTS
 kHAJjC7CmlLYuOTMMXgRooX24XgZa9s/Lt2TcAbzeWxVuOijJHc2ZjrLs
 7xqBD+DvutO/IW0uCqILk1q7KIthTBf1CtRcqQ7APLyR5B2iOtvaomqg9
 qMvBJ8fO90qqrZjrDEW2Pbn/1aiR+q2gd1YaWPO+f5szjoxcVReoIRTAi
 kCkhWHZae3dVZuI57XdzzPVOV/8Xz0RxqSHM59HInurBEmCIwEA9M1sXq Q==;
X-CSE-ConnectionGUID: nBnfpz/TTaCGOdpUUnaV9g==
X-CSE-MsgGUID: MUaBZNozQZWmpQ5ebfF6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4381909"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4381909"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 08:58:24 -0800
X-CSE-ConnectionGUID: wc1YbE0eRAS7BEVLwihSlw==
X-CSE-MsgGUID: uMvtTE6kTs25LVgHUfqX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12062797"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 08:58:23 -0800
Date: Tue, 24 Nov 2026 17:58:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Felix Kuehling <felix.kuehling@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [PATCH i-g-t] tests/gem_mmap_offset: Accept partial read in
 oob-read
Message-ID: <afhttabxnvseuecu6ul45fspncolrinn62rfqbomsmxytgo6zl@ldk5dzyd27sf>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, igt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 Felix Kuehling <felix.kuehling@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Lorenzo Stoakes <ljs@kernel.org>
References: <20261123211018.12339-1-david@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,
On 2026-11-23 at 22:10:18 +0100, David Hildenbrand (Arm) wrote:
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
--------------------------------- ^

Should this be 2*4096? Also buffer size will need an adjustment.
If yes, maybe better to create a new subtest like oob-read-8k
so old one will be unchanged.

Regards,
Kamil

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
