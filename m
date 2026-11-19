Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5499606A33E
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7ASEnWs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2710E10E820;
	Thu, 19 Nov 2026 10:58:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC1C10E820
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 10:58:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CCF161EAA;
 Thu, 19 Nov 2026 10:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B4D1F000C6;
 Thu, 19 Nov 2026 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795085916;
 bh=RdL4wvRd0jjxLxUZy+MXT2sJEoHjb/s8xdsYQFPaLaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=j7ASEnWsc7A5SbkSj0eyTB5P0rC8K/Fu3n0Y6CrLjKrtq9RR4+/Err9uSW1bExBmL
 2ROWbdre4wlWR3iIBVEM3nZfYhjvidF7LrpBrGWlWdd6GlqdzW387O4RFg2IXvofUs
 r6nuQp5UAVeByN+uxkQPcjpaXvyDHcjXivTlCRMBCsptbQqjGjn/07kN0eVP0kJ1eN
 AOUTlJ307ngdyczhHIIMjhBn3JUElBhrbbPKT3JWcUJ/SLskCoQdUN852JLtgoKHVY
 S6bFvEAcFIIwf56anyKReGLrZDAICio0aqoc04Cg3IY9sCNNh+FaT2Pij5O8DQ6bEn
 XAYfU9BXLZaFg==
Date: Thu, 19 Nov 2026 11:58:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, 
 intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 chris.p.wilson@intel.com, krzysztof.niemiec@intel.com
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
Message-ID: <av7WNeQtujfjHyWn@zenone.zhora.eu>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
 <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
 <DMZ4KGKCCK8A.2E0HP1AV6ZRQD@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMZ4KGKCCK8A.2E0HP1AV6ZRQD@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> index 09a08a91e610..bd5876da6449 100644
> >> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> @@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  	intel_wakeref_t wakeref;
> >>  	enum intel_engine_id id;
> >>  	struct igt_spinner spin;
> >> +	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
> >> +			    u64 offset, unsigned int pat_index, u32 flags);
> >>  	long max, count;
> >>  	void *tmp;
> >>  	u32 *crc;
> >> @@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  		i915_request_add(rq);
> >>  	}
> >>  
> >> +	insert_page = ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
> > The explanation in commit message focuses on the locking itself,
> > so changes to insert_page calling seem unrelated. Could you
> > split it into another patch or, if it is required for this part
> > to remain here, document it above?
> raw_insert_page is needed because the test now calls insert_page
> with error_mutex held. On Cherryview and on Broxton when VT-d is on,
> insert_page uses stop_machine(), which can cause a lockdep warning.
> 
> Should I send v7 with this added to the commit message, or can it be
> included during the merge?

no need! Please reply to this email with the new commit message.

Thanks,
Andi
