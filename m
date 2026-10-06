Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5462BCA6001
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2026 14:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA81F10E187;
	Tue,  6 Oct 2026 14:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAph0kYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF35310E187;
 Tue,  6 Oct 2026 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791296846; x=1822832846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vOisMCBpIVF71mz1epqwZ6zu5BUewVSRbOLJtz4WBa8=;
 b=SAph0kYMjSkCSLoOsNgTGQgLM53+apGN499h7B5dkPlQpMPORKtCFyt9
 ZSHJ23Wu5bQVL8hQZbGJW63sejF7+mIcUtG1H0Brvm+zz1LirIjRpSP0B
 kStSUbsjR/s94n9bU+8MDyRNQ6KHus2cGOO/3NEPlUZsT/jvQIdtDggwJ
 WCTlZ3anJ8GBuJKdYIC4DmuV/Zu9TfYkw1eX8UrE6ujB2rOG6nvH3tH4j
 tfk715i5I6eDWmV3Tj+VP0f1m5RIh4ZebR9UK7rzvaGZGX3NW7v500VLz
 PUBGuLZc22EJf5XNqZ7PITPkzI4JdE0ZiBJMjozoTsSfZ7PWS2Cx/3CbE A==;
X-CSE-ConnectionGUID: MSAOq9N3TGq+GNTbc4U9pg==
X-CSE-MsgGUID: J6kTF1kdSoGHb4ghlhpCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="40338"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="40338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:27:22 -0700
X-CSE-ConnectionGUID: Jogz9JikRvyH3+h669u0lw==
X-CSE-MsgGUID: pQlpHmalRQ+iXpBK32O3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273533775"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:27:20 -0700
Date: Tue, 6 Oct 2026 16:27:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/gem_close_race: Skip offset
 probing without full-ppgtt
Message-ID: <20261006142718.nzikm7la5pql3phi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
 <7tycj7qmuxox256zwdz57uictfkg4fdufzvkfnwg3z4wrujnmd@oi6lpt7yhtz5>
 <5fc31c9b0fd3e9fc469102b726174e165bec8161.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fc31c9b0fd3e9fc469102b726174e165bec8161.camel@linux.intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Janusz,
On 2026-09-25 at 11:47:41 +0200, Janusz Krzysztofik wrote:
> Hi Zbyszek,
> 
> Thanks for looking at this.
> 
> On Fri, 2026-09-25 at 10:40 +0200, Zbigniew Kempczyński wrote:
> > On Thu, Sep 24, 2026 at 05:24:18PM +0200, Janusz Krzysztofik wrote:
> > > gem_close_race computed exec_addr/data_addr via
> > > gem_detect_safe_start_offset() and gem_detect_safe_alignment()
> > > whenever the kernel disallowed relocations, without checking ppgtt
> > > mode. Those helpers exist solely to bootstrap intel_allocator and are
> > > meaningless without full-ppgtt, since the kernel can't see the ranges
> > > intel_allocator considers reserved and may hand them out to other
> > > users, as already acknowledged by __intel_bb_create() which enforces
> > > relocations and skips the allocator entirely in that case.
> > > 
> > > Require gem_uses_full_ppgtt() as well before enabling the softpin
> > > path, mirroring __intel_bb_create()'s logic, and skip the probing
> > > calls otherwise so the existing relocation fallback is used.
> > > 
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Assisted-by: GitHub Copilot (Claude Sonnet 5)

Applied, thanks!


Regards,
Kamil

> > > ---
> > >  tests/intel/gem_close_race.c | 19 ++++++++++++++-----
> > >  1 file changed, 14 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> > > index b2688774d7..ff2877f67e 100644
> > > --- a/tests/intel/gem_close_race.c
> > > +++ b/tests/intel/gem_close_race.c
> > > @@ -348,11 +348,20 @@ int igt_main()
> > >  
> > >  		devid = intel_get_drm_devid(fd);
> > >  		has_64bit_relocations = intel_gen(devid) >= 8;
> > > -		has_softpin = !gem_has_relocations(fd);
> > > -		exec_addr = gem_detect_safe_start_offset(fd);
> > > -		data_addr = gem_detect_safe_alignment(fd);
> > > -		exec_addr = max_t(exec_addr, exec_addr, data_addr);
> > > -		data_addr += exec_addr;
> > > +		/*
> > > +		 * Without full-ppgtt the kernel can't see the ranges the
> > > +		 * detected offsets are meant to reserve and may hand them
> > > +		 * out to other users, so pinning at a detected offset isn't
> > > +		 * meaningful; fall back to relocations in that case, same
> > > +		 * as __intel_bb_create() does.
> > > +		 */
> > > +		has_softpin = !gem_has_relocations(fd) && gem_uses_full_ppgtt(fd);
> > 
> > Which platforms don't have relocations and are not using full ppgtt?
> 
> Correct, today all configurations without relocations also expose full
> PPGTT, so the added check does not currently change runtime behavior.
> However, the purpose of the check is not to distinguish existing platforms.
> The probing helpers are conceptually valid only with full PPGTT, as they
> rely on allocator-managed address space reservations being respected by the
> kernel. Therefore I would prefer to keep the explicit gem_uses_full_ppgtt()
> requirement to document that dependency and to keep the code aligned with
> the logic already described in __intel_bb_create().  The condition is
> intentionally expressing the semantic requirement of the helpers, not
> distinguishing currently known hardware configurations.
> 
> Thanks,
> Janusz
> 
> > 
> > --
> > Zbigniew
> > 
> > > +		if (has_softpin) {
> > > +			exec_addr = gem_detect_safe_start_offset(fd);
> > > +			data_addr = gem_detect_safe_alignment(fd);
> > > +			exec_addr = max_t(exec_addr, exec_addr, data_addr);
> > > +			data_addr += exec_addr;
> > > +		}
> > >  
> > >  		gpu_count = igt_device_filter_count();
> > >  
> > > -- 
> > > 2.55.0
> > > 
