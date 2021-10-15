Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A5BC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 07:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE0C611BD
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 07:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDE0C611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE7D6E223;
	Fri, 15 Oct 2021 07:16:30 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43D16E223
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 07:16:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227760061"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="227760061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 00:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="481605441"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 15 Oct 2021 00:16:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 10:16:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
	Jani Nikula <jani.nikula@intel.com>
Date: Fri, 15 Oct 2021 10:16:16 +0300
Message-Id: <20211015071625.593-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/9] drm/i915: Move PCH modeset code into its
 own file
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Let's move the PCH modeset stuff into its own file and provide
a clean api for the higher level modeset code to use.

Not quite sure about the file name though. Ideas welcome.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Ville Syrjälä (9):
  drm/i915: Move PCH refclok stuff into its own file
  drm/i915: Move PCH modeset code to its own file
  drm/i915: Clean up the {ilk,lpt}_pch_enable() calling convention
  drm/i915: Move LPT PCH readout code
  drm/i915: Extract ilk_pch_get_config()
  drm/i915: Move iCLKIP readout to the pch code
  drm/i915: Introduce ilk_pch_disable() and ilk_pch_post_disable()
  drm/i915: Move intel_ddi_fdi_post_disable() to fdi code
  drm/i915: Introduce lpt_pch_disable()

 drivers/gpu/drm/i915/Makefile                 |    2 +
 drivers/gpu/drm/i915/display/intel_crt.c      |   13 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   44 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |    1 +
 drivers/gpu/drm/i915/display/intel_display.c  | 1032 +----------------
 drivers/gpu/drm/i915/display/intel_display.h  |   14 +-
 .../drm/i915/display/intel_display_power.c    |    1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |    1 +
 drivers/gpu/drm/i915/display/intel_fdi.c      |  136 +--
 drivers/gpu/drm/i915/display/intel_fdi.h      |    2 +-
 .../gpu/drm/i915/display/intel_pch_display.c  |  501 ++++++++
 .../gpu/drm/i915/display/intel_pch_display.h  |   27 +
 .../gpu/drm/i915/display/intel_pch_refclk.c   |  648 +++++++++++
 .../gpu/drm/i915/display/intel_pch_refclk.h   |   21 +
 drivers/gpu/drm/i915/i915_drv.c               |    1 +
 15 files changed, 1269 insertions(+), 1175 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.h

-- 
2.32.0

