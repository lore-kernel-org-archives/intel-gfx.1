Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F124CC9830D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 09:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8830A10E18F;
	Fri, 25 Sep 2026 09:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkNJoUo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A810E18F;
 Fri, 25 Sep 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790329671; x=1821865671;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7jCyDsrImsgxQCCxRXav0zNRPkXp5ZKmOJfPy8JyXis=;
 b=MkNJoUo6YqQEhnlR+1tcZDBq/dAJsLAMmmgaYMM1coDSwqkncNAPBt6q
 UNESjWwr4WJHzl71lKcJg2AIT+Asl7QwKH3cSlBKD/abr7ebSmS/l0WNB
 S43o3ZpjgU0sZpjZSm7NHglBvmYxkZy1iFz9qDcVIJY7xeTVi9HgEELHE
 NG34JXEp1tU8QF87BOZqFLRScdTAyAiTglaLUbb/j7x2W81dFUyxUDOqi
 nTM7ZINqvehdEEiZpxGza3auC+63OJQeyEopgpB18uOYiuucv8xUBfado
 dNcNmc8M9gRdqoXNoRjogWmN8j2pLPMr20I1mOsAT/ZG4sVmLO5/G3Y5A w==;
X-CSE-ConnectionGUID: sczIzrBKQnWC6gihnwLRzA==
X-CSE-MsgGUID: oMBDORvqSaqNodgjz/9uQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="112898719"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="112898719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:47:48 -0700
X-CSE-ConnectionGUID: c5zxOml7TgyI35+NdD8hHw==
X-CSE-MsgGUID: VRQtCCQrSFCc43z1aFvcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="303800610"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.67])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:47:44 -0700
Message-ID: <5fc31c9b0fd3e9fc469102b726174e165bec8161.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/gem_close_race: Skip offset
 probing without full-ppgtt
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Kamil
 Konieczny <kamil.konieczny@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Krzysztof Karas	 <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,  Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Date: Fri, 25 Sep 2026 11:47:41 +0200
In-Reply-To: <7tycj7qmuxox256zwdz57uictfkg4fdufzvkfnwg3z4wrujnmd@oi6lpt7yhtz5>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
 <7tycj7qmuxox256zwdz57uictfkg4fdufzvkfnwg3z4wrujnmd@oi6lpt7yhtz5>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
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

Hi Zbyszek,

Thanks for looking at this.

On Fri, 2026-09-25 at 10:40 +0200, Zbigniew Kempczy=C5=84ski wrote:
> On Thu, Sep 24, 2026 at 05:24:18PM +0200, Janusz Krzysztofik wrote:
> > gem_close_race computed exec_addr/data_addr via
> > gem_detect_safe_start_offset() and gem_detect_safe_alignment()
> > whenever the kernel disallowed relocations, without checking ppgtt
> > mode. Those helpers exist solely to bootstrap intel_allocator and are
> > meaningless without full-ppgtt, since the kernel can't see the ranges
> > intel_allocator considers reserved and may hand them out to other
> > users, as already acknowledged by __intel_bb_create() which enforces
> > relocations and skips the allocator entirely in that case.
> >=20
> > Require gem_uses_full_ppgtt() as well before enabling the softpin
> > path, mirroring __intel_bb_create()'s logic, and skip the probing
> > calls otherwise so the existing relocation fallback is used.
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Assisted-by: GitHub Copilot (Claude Sonnet 5)
> > ---
> >  tests/intel/gem_close_race.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.=
c
> > index b2688774d7..ff2877f67e 100644
> > --- a/tests/intel/gem_close_race.c
> > +++ b/tests/intel/gem_close_race.c
> > @@ -348,11 +348,20 @@ int igt_main()
> > =20
> >  		devid =3D intel_get_drm_devid(fd);
> >  		has_64bit_relocations =3D intel_gen(devid) >=3D 8;
> > -		has_softpin =3D !gem_has_relocations(fd);
> > -		exec_addr =3D gem_detect_safe_start_offset(fd);
> > -		data_addr =3D gem_detect_safe_alignment(fd);
> > -		exec_addr =3D max_t(exec_addr, exec_addr, data_addr);
> > -		data_addr +=3D exec_addr;
> > +		/*
> > +		 * Without full-ppgtt the kernel can't see the ranges the
> > +		 * detected offsets are meant to reserve and may hand them
> > +		 * out to other users, so pinning at a detected offset isn't
> > +		 * meaningful; fall back to relocations in that case, same
> > +		 * as __intel_bb_create() does.
> > +		 */
> > +		has_softpin =3D !gem_has_relocations(fd) && gem_uses_full_ppgtt(fd);
>=20
> Which platforms don't have relocations and are not using full ppgtt?

Correct, today all configurations without relocations also expose full
PPGTT, so the added check does not currently change runtime behavior.
However, the purpose of the check is not to distinguish existing platforms.
The probing helpers are conceptually valid only with full PPGTT, as they
rely on allocator-managed address space reservations being respected by the
kernel. Therefore I would prefer to keep the explicit gem_uses_full_ppgtt()
requirement to document that dependency and to keep the code aligned with
the logic already described in __intel_bb_create().  The condition is
intentionally expressing the semantic requirement of the helpers, not
distinguishing currently known hardware configurations.

Thanks,
Janusz

>=20
> --
> Zbigniew
>=20
> > +		if (has_softpin) {
> > +			exec_addr =3D gem_detect_safe_start_offset(fd);
> > +			data_addr =3D gem_detect_safe_alignment(fd);
> > +			exec_addr =3D max_t(exec_addr, exec_addr, data_addr);
> > +			data_addr +=3D exec_addr;
> > +		}
> > =20
> >  		gpu_count =3D igt_device_filter_count();
> > =20
> > --=20
> > 2.55.0
> >=20
