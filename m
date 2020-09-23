Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D3CC2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 08:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4BA235FC
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 08:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C4BA235FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFC96E8FE;
	Wed, 23 Sep 2020 08:25:04 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435016E8FE
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2020 08:25:03 +0000 (UTC)
IronPort-SDR: Fw6GiucD++5cTxjUIiB2S18FSXiS+Gf7NeI1Zp+rz+hKBlwqp92O/7eI4epgkinDATPDlUnMLv
 BNH5o17RHjpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="245665489"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="245665489"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 01:25:02 -0700
IronPort-SDR: c69CPbhHbaW6CFG5k4sYFGERkZKm4vUfxhAVHLVdHPx9PaUBysZ1v335ADtqtZj3YHfGwZ29Tj
 /HPukx3NHlJA==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="511562993"
Received: from bravinar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.9.250])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 01:25:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20200922134426.9840-1-vandita.kulkarni@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200922134426.9840-1-vandita.kulkarni@intel.com>
Date: Wed, 23 Sep 2020 11:25:13 +0300
Message-ID: <87lfh0rjbq.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [V13 0/5] Add support for mipi dsi cmd mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 22 Sep 2020, Vandita Kulkarni <vandita.kulkarni@intel.com> wrote:
> This series contain interrupt handling part of cmd mode.
> Configuration patches were merged already.
>
> v10: Address the review comments on patch 3 and 4
> v11: fix compilation issue introduced in v10
> v12: fix check patch errors on patch 3
> v13: Use sw vblank counter (Ville)

Ville, I'd merge this unless you have further comments.

BR,
Jani.


>
> Vandita Kulkarni (5):
>   drm/i915/dsi: Add details about TE in get_config
>   i915/dsi: Configure TE interrupt for cmd mode
>   drm/i915/dsi: Add TE handler for dsi cmd mode.
>   drm/i915/dsi: Initiate fame request in cmd mode
>   drm/i915/dsi: Enable software vblank counter
>
>  drivers/gpu/drm/i915/display/icl_dsi.c       |  56 +++++++--
>  drivers/gpu/drm/i915/display/intel_display.c |  21 ++++
>  drivers/gpu/drm/i915/display/intel_dsi.h     |   1 +
>  drivers/gpu/drm/i915/i915_irq.c              | 119 ++++++++++++++++++-
>  4 files changed, 183 insertions(+), 14 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
