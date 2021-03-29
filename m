Return-Path: <SRS0=5T5N=I3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F48CC433C1
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Mar 2021 12:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38FA61874
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Mar 2021 12:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38FA61874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC3F89F47;
	Mon, 29 Mar 2021 12:53:13 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E3389F47
 for <intel-gfx@lists.freedesktop.org>; Mon, 29 Mar 2021 12:53:11 +0000 (UTC)
IronPort-SDR: Nsp0ZBAp8WuUX/spz9nJP79pf7/W+iFNJMqsHpocLRmcNII5rfSJqiiYeBxA+E/2xuID5do1BL
 tGvh7Q0jvRsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="276703672"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="276703672"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 05:53:10 -0700
IronPort-SDR: U8Qh0Lwi7Y0YylPYkSl0CTSbGF+Uu4MXTwMHmo2BFrjN2KGFyiQLWxEzBNdzdhAbv6BzTACd+c
 ZEyrmmQYYy1g==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="417656328"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 05:53:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
In-Reply-To: <cover.1616764798.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1616764798.git.jani.nikula@intel.com>
Date: Mon, 29 Mar 2021 15:53:06 +0300
Message-ID: <877dlqp1e5.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v4 0/7] drm/i915: refactor KBL/TGL/ADLS
 stepping scheme
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

On Fri, 26 Mar 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> v4 of [1], minor tweaks to address review.
>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/87323/

Pushed to drm-intel-next, thanks for the reviews.

BR,
Jani.


>
>
> Jani Nikula (7):
>   drm/i915: split out stepping info to a new file
>   drm/i915: add new helpers for accessing stepping info
>   drm/i915: switch KBL to the new stepping scheme
>   drm/i915: switch TGL and ADL to the new stepping scheme
>   drm/i915: rename DISP_STEPPING->DISPLAY_STEP and GT_STEPPING->GT_STEP
>   drm/i915: rename disp_stepping->display_step and gt_stepping->gt_step
>   drm/i915: rename i915_rev_steppings->intel_step_info
>
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../drm/i915/display/intel_display_power.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |   4 +-
>  .../drm/i915/display/skl_universal_plane.c    |   2 +-
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |   2 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |  55 ++------
>  drivers/gpu/drm/i915/i915_drv.c               |   3 +-
>  drivers/gpu/drm/i915/i915_drv.h               | 122 +++++-------------
>  drivers/gpu/drm/i915/intel_device_info.c      |   2 +-
>  drivers/gpu/drm/i915/intel_device_info.h      |   4 +
>  drivers/gpu/drm/i915/intel_pm.c               |   6 +-
>  drivers/gpu/drm/i915/intel_step.c             | 106 +++++++++++++++
>  drivers/gpu/drm/i915/intel_step.h             |  40 ++++++
>  13 files changed, 202 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/intel_step.c
>  create mode 100644 drivers/gpu/drm/i915/intel_step.h

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
