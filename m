Return-Path: <SRS0=r//I=NS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F00C432BE
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Aug 2021 13:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431EA60F4F
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Aug 2021 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 431EA60F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6E46E933;
	Fri, 27 Aug 2021 13:08:39 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563B26E933
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Aug 2021 13:08:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="281672282"
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="281672282"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 06:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="644191162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 27 Aug 2021 06:08:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 27 Aug 2021 06:08:37 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 27 Aug 2021 06:08:35 -0700
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.010;
 Fri, 27 Aug 2021 18:38:33 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Weinehall <david.weinehall@linux.intel.com>,
 "Tangudu, Tilak" <tilak.tangudu@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>
Thread-Topic: [Intel-gfx] [PATCH 3/4] drm/i915: Enable runtime pm autosuspend
 by default
Thread-Index: AQHXmcUSU/ox5/UR+UuHwDDzhgb/+6uHTrfQ
Date: Fri, 27 Aug 2021 13:08:33 +0000
Message-ID: <6f9b48c62f874181bd01848106144f67@intel.com>
References: <20210825152233.2151037-1-rodrigo.vivi@intel.com>
 <20210825152233.2151037-3-rodrigo.vivi@intel.com>
In-Reply-To: <20210825152233.2151037-3-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Enable runtime pm autosuspend
 by default
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ro=
drigo
> Vivi
> Sent: Wednesday, August 25, 2021 8:53 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Daniel Vetter
> <daniel.vetter@ffwll.ch>; David Weinehall <david.weinehall@linux.intel.co=
m>;
> Tangudu, Tilak <tilak.tangudu@intel.com>; Deak, Imre <imre.deak@intel.com=
>
> Subject: [Intel-gfx] [PATCH 3/4] drm/i915: Enable runtime pm autosuspend =
by
> default
>=20
> Let's enable runtime pm autosuspend by default everywhere.
>=20
> But at this time let's not touch the autosuspend_delay time, what caused =
some
> regression on our previous attempt.
>=20
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Weinehall <david.weinehall@linux.intel.com>
> Cc: Tilak Tangudu <tilak.tangudu@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c
> b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index f28b5bab61b4..8f052bd4f58c 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -605,6 +605,8 @@ void intel_runtime_pm_enable(struct intel_runtime_pm
> *rpm)
>  		pm_runtime_use_autosuspend(kdev);
>  	}
>=20
> +	pm_runtime_allow(kdev);
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> +
>  	/*
>  	 * The core calls the driver load handler with an RPM reference held.
>  	 * We drop that here and will reacquire it during unloading in
> --
> 2.31.1

