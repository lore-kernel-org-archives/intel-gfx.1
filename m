Return-Path: <SRS0=fLoR=NZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEC5C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 11:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F89F6101A
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 11:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F89F6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23316E86C;
	Fri,  3 Sep 2021 11:04:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A786E86C
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Sep 2021 11:04:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="241673921"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="241673921"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 04:04:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="533984579"
Received: from oliviapo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.32.143])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 04:04:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jose.souza@intel.com, ankit.k.nautiyal@intel.com
In-Reply-To: <cover.1630512523.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630512523.git.jani.nikula@intel.com>
Date: Fri, 03 Sep 2021 14:04:02 +0300
Message-ID: <87v93h9azh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm/i915/bios: remove vbt
 ddi_port_info caching
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

On Wed, 01 Sep 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://patchwork.freedesktop.org/series/93957/ with the CI issues
> fixed (fingers crossed!).

Jos=C3=A9, I'd like to get an ack from you on this before applying. I know
it's bound conflict with your in flight series. Thoughts?

BR,
Jani.

>
> BR,
> Jani.
>
> Jani Nikula (7):
>   drm/i915/bios: use hdmi level shift directly from child data
>   drm/i915/bios: use max tmds clock directly from child data
>   drm/i915/bios: use dp max link rate directly from child data
>   drm/i915/bios: use alternate aux channel directly from child data
>   drm/i915/bios: move ddc pin mapping code next to ddc pin sanitize
>   drm/i915/bios: use ddc pin directly from child data
>   drm/i915/bios: get rid of vbt ddi_port_info
>
>  drivers/gpu/drm/i915/display/intel_bios.c | 372 +++++++++++-----------
>  drivers/gpu/drm/i915/i915_drv.h           |  18 +-
>  2 files changed, 187 insertions(+), 203 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
