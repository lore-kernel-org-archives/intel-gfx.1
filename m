Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9608EC4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 15:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEA3610C8
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AEA3610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015E56E3A0;
	Wed, 25 Aug 2021 15:58:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5958C6E3A0
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 15:58:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281266570"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="281266570"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 08:57:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="536416436"
Received: from vcheppax-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.255.37.222])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 08:57:48 -0700
Date: Wed, 25 Aug 2021 11:57:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YSZoeifxuEFP2Mlt@intel.com>
References: <20210825005840.170796-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210825005840.170796-1-jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/8] Drop frontbuffer rendering support
 from Skylake and newer
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

On Tue, Aug 24, 2021 at 05:58:32PM -0700, José Roberto de Souza wrote:
> This will break some IGT tests, here(https://patchwork.freedesktop.org/series/93764/)

Yeap, it broke. We need to fix that before we can really merge this.

> I fixed the ones part of fast-feedback test list but probably there
> will be more tests needing fix.
> 
> v2:
> - dropped a "drm/damage_helper" patch
> - new patch renaming all DRRS functions to intel_drrs_*()
> - enabling PSR support for display 9, it was left disabled as mistake
> - returning in frontbuffer functions to not set fb_tracking.busy/flip_bits
> 
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> José Roberto de Souza (8):
>   drm/i915/display: Drop PSR support from HSW and BDW
>   drm/i915/display: Move DRRS code its own file
>   drm/i915/display: Renaming DRRS functions to intel_drrs_*()
>   drm/i915/display: Some code improvements and code style fixes for DRRS
>   drm/i915/display: Share code between intel_drrs_flush and
>     intel_drrs_invalidate
>   drm/i915/display: Prepare DRRS for frontbuffer rendering drop
>   drm/i915/display/skl+: Drop frontbuffer rendering support
>   drm/i915/display: Drop PSR frontbuffer rendering support
> 
>  Documentation/gpu/i915.rst                    |  25 +-
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   7 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   2 +
>  .../drm/i915/display/intel_display_debugfs.c  |   9 +-
>  .../drm/i915/display/intel_display_types.h    |   2 -
>  drivers/gpu/drm/i915/display/intel_dp.c       | 473 +-----------------
>  drivers/gpu/drm/i915/display/intel_dp.h       |  11 -
>  drivers/gpu/drm/i915/display/intel_drrs.c     | 450 +++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_drrs.h     |  36 ++
>  drivers/gpu/drm/i915/display/intel_fb.c       |   8 +-
>  .../gpu/drm/i915/display/intel_frontbuffer.c  |  25 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      | 283 ++---------
>  drivers/gpu/drm/i915/display/intel_psr.h      |   8 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   4 +-
>  drivers/gpu/drm/i915/i915_irq.c               |  16 -
>  drivers/gpu/drm/i915/i915_pci.c               |   4 +-
>  drivers/gpu/drm/i915/i915_reg.h               |  21 +-
>  19 files changed, 581 insertions(+), 810 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_drrs.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_drrs.h
> 
> -- 
> 2.33.0
> 
