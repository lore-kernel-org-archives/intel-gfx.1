Return-Path: <SRS0=4MRd=OT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CC1C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 05:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E69860F4F
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 05:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E69860F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A556E170;
	Wed, 29 Sep 2021 05:48:22 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1F6E170
 for <intel-gfx@lists.freedesktop.org>; Wed, 29 Sep 2021 05:48:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="204354397"
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="204354397"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 22:48:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="554490439"
Received: from amelillo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.221.121])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 22:48:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20210923200109.4459-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210923200109.4459-1-ville.syrjala@linux.intel.com>
Date: Wed, 29 Sep 2021 08:47:57 +0300
Message-ID: <87fstovsoi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 0/6] drm/i915: Reject bogus modes with fixed
 mode panels
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

On Thu, 23 Sep 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Let's start to reject user modes whose refresh rate is
> nowhere near the actual fixed mode refresh rate we're
> going to use. ATM we're just flat out lying to the user.
>
> We'll also pimp the connector's mode list validation=20
> a bit.

On the series,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Ville Syrj=C3=A4l=C3=A4 (6):
>   drm/i915: Extract intel_panel_mode_valid()
>   drm/i915: Use intel_panel_mode_valid() for DSI/LVDS/DVO
>   drm/i915: Reject modes that don't match fixed_mode vrefresh
>   drm/i915: Introduce intel_panel_compute_config()
>   drm/i915: Reject user modes that don't match fixed mode's refresh rate
>   drm/i915: Drop pointless fixed_mode checks from dsi code
>
>  drivers/gpu/drm/i915/display/icl_dsi.c     |  7 ++--
>  drivers/gpu/drm/i915/display/intel_dp.c    | 13 ++++---
>  drivers/gpu/drm/i915/display/intel_dsi.c   | 16 ++++-----
>  drivers/gpu/drm/i915/display/intel_dvo.c   | 24 ++++++++-----
>  drivers/gpu/drm/i915/display/intel_lvds.c  | 15 ++++----
>  drivers/gpu/drm/i915/display/intel_panel.c | 41 ++++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_panel.h |  5 +++
>  drivers/gpu/drm/i915/display/intel_sdvo.c  | 21 ++++++-----
>  drivers/gpu/drm/i915/display/vlv_dsi.c     | 39 +++++++++-----------
>  9 files changed, 116 insertions(+), 65 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
