Return-Path: <SRS0=x7Pm=FN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E095DC4167B
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 09:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F8123B77
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 09:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82F8123B77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17E589B27;
	Wed,  9 Dec 2020 09:34:52 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3089B27;
 Wed,  9 Dec 2020 09:34:51 +0000 (UTC)
IronPort-SDR: cuifdcYw8CWs53sCNG45E7fIbC6E6mgdycIoc3+xXxCAfPalKlQIIrMUJcQmCi291b0X52sVW+
 40MQvNj2qXJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="235646498"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="235646498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 01:34:50 -0800
IronPort-SDR: SlfBbmyl/JrvJg1nZtRgV8ahojN7+ZJRIEi5Ziwcyq+8lsSgHukOpHMJlLRn43+P8gATDTowPc
 Rx04X08oOUOQ==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="332870199"
Received: from mmarkowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.20.177])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 01:34:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1607429866.git.jani.nikula@intel.com>
Date: Wed, 09 Dec 2020 11:34:44 +0200
Message-ID: <87im9b9vbf.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 0/6] drm/dsc, drm/dp,
 and /drm/i915: rc model size updates
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 08 Dec 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> For whatever reason this old series was never merged. Please let's get
> this done.

Daniel, Maarten, may I have an ack to merge patches 1 and 4 via
drm-intel?

BR,
Jani.


>
> For i915 DP this still needs a patch to start using the model size from
> DPCD.
>
> BR,
> Jani.
>
> Jani Nikula (6):
>   drm/dsc: use rc_model_size from DSC config for PPS
>   drm/i915/dsc: configure hardware using specified rc_model_size
>   drm/i915/dsc: make rc_model_size an encoder defined value
>   drm/dsc: add helper for calculating rc buffer size from DPCD
>   drm/i915/bios: fill in DSC rc_model_size from VBT
>   drm/i915/dsi: use VBT data for rc_model_size
>
>  drivers/gpu/drm/drm_dsc.c                 | 30 +++++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_bios.c | 11 +++------
>  drivers/gpu/drm/i915/display/intel_dp.c   |  8 ++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c |  4 +--
>  include/drm/drm_dsc.h                     |  1 +
>  5 files changed, 41 insertions(+), 13 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
