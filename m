Return-Path: <SRS0=eaB6=PN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB83C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 13:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5FA60F46
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 13:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F5FA60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8CF89F24;
	Mon, 25 Oct 2021 13:49:25 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401789F08;
 Mon, 25 Oct 2021 13:49:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="210434817"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="210434817"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 06:49:23 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="446237645"
Received: from vadimmik-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 06:49:19 -0700
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Date: Mon, 25 Oct 2021 16:49:07 +0300
Message-Id: <20211025134907.20078-1-joonas.lahtinen@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] MAINTAINERS: Add Tvrtko as drm/i915
 co-maintainer
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

Add Tvrtko Ursulin as a co-maintainer for drm/i915 driver.
Tvrtko will bring added bandwidth and focus to the GT/GEM domain
(drm-intel-gt-next).

This will help with the increased driver maintenance efforts, allows
alternating the drm-intel-gt-next pull requests and also should increase
the coverage for the maintenance in general.

Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98aa1f55ed41..07553156a1c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9361,6 +9361,7 @@ INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
+M:	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
 L:	intel-gfx@lists.freedesktop.org
 S:	Supported
 W:	https://01.org/linuxgraphics/
-- 
2.31.1

