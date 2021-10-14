Return-Path: <SRS0=d1l9=PC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58520C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 15:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F59560C41
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 15:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F59560C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8B76EB68;
	Thu, 14 Oct 2021 15:02:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF946EB68
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Oct 2021 15:02:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226463263"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="226463263"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:01:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="527619697"
Received: from stadju-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.34.223])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:01:29 -0700
Date: Thu, 14 Oct 2021 08:01:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <20211014150129.u6aj6q6t64tnlcnw@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <cover.1634207064.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1634207064.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915: intel sbi/pcode cleanup
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

On Thu, Oct 14, 2021 at 01:28:56PM +0300, Jani Nikula wrote:
>Split out the sbi and pcode code to separate files.
>
>There's potential for follow-up work that's not included here:
>
>- vlv_sideband, intel_sbi and intel_pcode all use
>  i915->sb_lock. Technically it's fine, but the appearance is confusing.
>
>- The pcode function naming could use some cleanup.
>
>- Slightly unrelated, all the functions in intel_display.c using
>  intel_sbi should be moved out of intel_display.c as a group.
>
>
>BR,
>Jani.
>
>Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>

series is


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks for cleaning that up.

Lucas De Marchi

>Jani Nikula (2):
>  drm/i915: split out intel_pcode.[ch] to separate file
>  drm/i915: rename intel_sideband.[ch] to intel_sbi.[ch]
>
> drivers/gpu/drm/i915/Makefile                 |  3 +-
> drivers/gpu/drm/i915/display/intel_bw.c       |  2 +-
> drivers/gpu/drm/i915/display/intel_cdclk.c    |  2 +-
> drivers/gpu/drm/i915/display/intel_display.c  |  5 +-
> .../drm/i915/display/intel_display_power.c    |  2 +-
> drivers/gpu/drm/i915/display/intel_fdi.c      |  2 +-
> drivers/gpu/drm/i915/display/intel_hdcp.c     |  6 +-
> drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
> drivers/gpu/drm/i915/gt/intel_llc.c           |  2 +-
> drivers/gpu/drm/i915/gt/intel_rc6.c           |  2 +-
> drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
> drivers/gpu/drm/i915/i915_drv.c               |  2 +-
> drivers/gpu/drm/i915/intel_dram.c             |  2 +-
> .../i915/{intel_sideband.c => intel_pcode.c}  | 91 +------------------
> .../i915/{intel_sideband.h => intel_pcode.h}  | 19 ++--
> drivers/gpu/drm/i915/intel_pm.c               |  2 +-
> drivers/gpu/drm/i915/intel_sbi.c              | 73 +++++++++++++++
> drivers/gpu/drm/i915/intel_sbi.h              | 23 +++++
> 18 files changed, 124 insertions(+), 118 deletions(-)
> rename drivers/gpu/drm/i915/{intel_sideband.c => intel_pcode.c} (69%)
> rename drivers/gpu/drm/i915/{intel_sideband.h => intel_pcode.h} (63%)
> create mode 100644 drivers/gpu/drm/i915/intel_sbi.c
> create mode 100644 drivers/gpu/drm/i915/intel_sbi.h
>
>-- 
>2.30.2
>
