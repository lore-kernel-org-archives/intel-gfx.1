Return-Path: <SRS0=maCC=IV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F35C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 18:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6B76191D
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 18:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6B76191D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D59789C68;
	Tue, 23 Mar 2021 18:00:52 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613A89C68
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Mar 2021 18:00:51 +0000 (UTC)
IronPort-SDR: kHlw9QE7NxcE04GllstWg9fUhLCTEjO1/YC+8CTxem1f15kWL3cWm7G9ofnuTrgv5E0/0dXlJ0
 zCNF9ougsm8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="178100948"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="178100948"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 11:00:49 -0700
IronPort-SDR: mjeSbxkgMJkQB9wmofLjCAZVLH9KSKGcRv8vn7g782BBeB6rfHzcu5segPbSG6gHsdOtl4oKkL
 PC95jI8cTkrA==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="441810266"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 11:00:48 -0700
Date: Tue, 23 Mar 2021 11:00:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20210323180047.GV3422723@mdroper-desk1.amr.corp.intel.com>
References: <YFkJLCzqK65y5Vfl@intel.com>
 <20210322233840.4056851-1-matthew.d.roper@intel.com>
 <YFokpaRM8yCqRJlF@intel.com>
 <20210323172734.GU3422723@mdroper-desk1.amr.corp.intel.com>
 <YFooKuVqPeZrLWM3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFooKuVqPeZrLWM3@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 6/6] drm/i915/display: Simplify GLK
 display version tests
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
Cc: intel-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 07:40:58PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 23, 2021 at 10:27:34AM -0700, Matt Roper wrote:
> > On Tue, Mar 23, 2021 at 07:25:57PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Mar 22, 2021 at 04:38:40PM -0700, Matt Roper wrote:
> > > > GLK has always been a bit of a special case since it reports INTEL_=
GEN()
> > > > as 9, but has version 10 display IP.  Now we can properly represent=
 the
> > > > display version as 10 and simplify the display generation tests
> > > > throughout the display code.
> > > > =

> > > > Aside from manually adding the version to the glk_info structure, t=
he
> > > > rest of this patch is generated with a Coccinelle semantic patch.  =
Note
> > > > that we also need to switch any code that matches gen10 today but *=
not*
> > > > GLK to be CNL-specific:
> > > > =

> > > >         @@ expression dev_priv; @@
> > > >         - DISPLAY_VER(dev_priv) > 9
> > > >         + DISPLAY_VER(dev_priv) >=3D 10
> > > > =

> > > >         @@ expression dev_priv, E; @@
> > > >         (
> > > >         - DISPLAY_VER(dev_priv) >=3D 10 && E
> > > >         + (DISPLAY_VER(dev_priv) >=3D 11 || IS_CANNONLAKE(dev_priv)=
) && E
> > > >         |
> > > >         - DISPLAY_VER(dev_priv) >=3D 10
> > > >         + DISPLAY_VER(dev_priv) >=3D 11 || IS_CANNONLAKE(dev_priv)
> > > >         |
> > > >         - IS_DISPLAY_RANGE(dev_priv, 10, E)
> > > >         + IS_DISPLAY_RANGE(dev_priv, 11, E) || IS_CANNONLAKE(dev_pr=
iv)
> > > >         )
> > > > =

> > > >         @@ expression dev_priv, E, E2; @@
> > > >         (
> > > >         - (IS_CANNONLAKE(dev_priv) || IS_GEMINILAKE(dev_priv))
> > > >         + IS_DISPLAY_VER(dev_priv, 10)
> > > >         |
> > > >         - E || IS_CANNONLAKE(dev_priv) || IS_GEMINILAKE(dev_priv)
> > > >         + E || IS_DISPLAY_VER(dev_priv, 10)
> > > >         |
> > > >         - (IS_GEMINILAKE(dev_priv) || IS_CANNONLAKE(dev_priv))
> > > >         + IS_DISPLAY_VER(dev_priv, 10)
> > > >         |
> > > >         - IS_GEMINILAKE(dev_priv) || E || IS_CANNONLAKE(dev_priv)
> > > >         + E || IS_DISPLAY_VER(dev_priv, 10)
> > > >         |
> > > >         - E || IS_GEMINILAKE(dev_priv) || E2 || IS_CANNONLAKE(dev_p=
riv)
> > > >         + E || E2 || IS_DISPLAY_VER(dev_priv, 10)
> > > >         |
> > > >         - (IS_DISPLAY_VER(dev_priv, 10) || IS_GEMINILAKE(dev_priv))
> > > >         + IS_DISPLAY_VER(dev_priv, 10)
> > > >         |
> > > >         - (IS_GEMINILAKE(dev_priv) || IS_DISPLAY_VER(dev_priv, 10))
> > > >         + IS_DISPLAY_VER(dev_priv, 10)
> > > >         )
> > > > =

> > > >         @@ expression dev_priv; @@
> > > >         - (IS_DISPLAY_VER(dev_priv, 9) && !IS_GEMINILAKE(dev_priv))
> > > >         + IS_DISPLAY_VER(dev_priv, 9)
> > > > =

> > > >         @@ expression dev_priv; @@
> > > >         (
> > > >         - !(DISPLAY_VER(dev_priv) >=3D 11 || IS_DISPLAY_VER(dev_pri=
v, 10))
> > > >         + DISPLAY_VER(dev_priv) < 10
> > > >         |
> > > >         - (DISPLAY_VER(dev_priv) >=3D 11 || IS_DISPLAY_VER(dev_priv=
, 10))
> > > >         + DISPLAY_VER(dev_priv) >=3D 10
> > > >         )
> > > > =

> > > >         @@ expression dev_priv, E; @@
> > > >         - E || DISPLAY_VER(dev_priv) >=3D 11 || IS_DISPLAY_VER(dev_=
priv, 10)
> > > >         + E || DISPLAY_VER(dev_priv) >=3D 10
> > > > =

> > > >         @@ expression dev_priv, E; @@
> > > >         - (IS_DISPLAY_RANGE(dev_priv, 11, E) || IS_DISPLAY_VER(dev_=
priv, 10))
> > > >         + IS_DISPLAY_RANGE(dev_priv, 10, E)
> > > > =

> > > >         @@ expression dev_priv; @@
> > > >         (
> > > >         - DISPLAY_VER(dev_priv) >=3D 11 || IS_CANNONLAKE(dev_priv) =
|| IS_GEN9_LP(dev_priv)
> > > >         + DISPLAY_VER(dev_priv) >=3D 10 || IS_GEN9_LP(dev_priv)
> > > >         |
> > > >         - IS_GEN9_LP(dev_priv) || DISPLAY_VER(dev_priv) >=3D 11 || =
IS_CANNONLAKE(dev_priv)
> > > >         + IS_GEN9_LP(dev_priv) || DISPLAY_VER(dev_priv) >=3D 10
> > > >         )
> > > > =

> > > >         @@ expression dev_priv, E; @@
> > > >         - !(DISPLAY_VER(dev_priv) >=3D E)
> > > >         + DISPLAY_VER(dev_priv) < E
> > > > =

> > > > v2:
> > > >  - Convert gen10 conditions that don't include GLK into CNL conditi=
ons.
> > > >    (Ville)
> > > > =

> > > > v3:
> > > >  - Rework coccinelle rules so that "ver>=3D10" turns into "ver>=3D1=
1||is_cnl." (Ville)
> > > > =

> > > > v3.1:
> > > >  - Manually re-add the ".display.version =3D 10" to glk_info after
> > > >    regenerating patch via Coccinelle.
> > > > =

> > > > v4:
> > > >  - Also apply cocci rules to intel_pm.c and i915_irq.c!  (CI)
> > > =

> > > Ugh. One thing that occurred to me when looking at i915_irq.c is that
> > > IS_GEN9_LP() is now maybe broken on glk? So seems to me all uses of
> > > IS_GEN9_LP() need to be reviewed and potentially changed.
> > =

> > Broken how?  That macro still uses the gen/gt version instead of the
> > display number, so I think it still behaves the same as before?
> =

> Oh you're not changng it to to use display ver? I guess it still kinda
> works then. But it's going to be pretty confusing to use that for
> display stuff now. Ie. we should probably stop using it.

That macro is used throughout the driver (including non-display code),
so I don't think we'd want to re-define it.  But you're right that we
probably should eliminate the places where it gets used in the display
code (since the graphics gen shouldn't matter); I'll do that as a
follow-up series.


Matt

> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
