Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F043C54EED
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Jan 2023 18:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FBE10E0C3;
	Mon, 30 Jan 2023 18:17:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB6E10E0C3
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Jan 2023 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675102628; x=1706638628;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IVJtFAu/jmAqdBQoPlVTVZGfvyN5ipN76+6/+sCV8Bs=;
 b=bFbc9DCVgyutZTb24LcH/EQ80HWq8H7zJQvf+8z2f3S2KJsEf6gxgd5J
 +g+m1VZYF8G0Og6w5uZyZg4BwQgiBeMwHqwJPp094ccRjW9xeN+L8Q9si
 pwtFJ9SpIaPF0E4N0fIVwjYZ/17kNA1+ykJdkrMXHnEoPFeTnB9Pjmbhw
 tof2qyKBNjHxk5JweyC1yfILq0QnpFFaySVWIheLjlzhW/n2BSyfpFCEW
 ioSnYoKZaAM7yR+ZAsSLQj7keoDQAt7adyv6wKGeEa7f049TYzxuRDOSN
 6uJcjIutzh8kDC0QJtL4h+Wm5jvMvb1C6g6UyjvCSMOSga+O6ERZVmmjx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329745241"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="329745241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 10:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="752923565"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="752923565"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by FMSMGA003.fm.intel.com with SMTP; 30 Jan 2023 10:17:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 30 Jan 2023 20:17:01 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 30 Jan 2023 20:17:00 +0200
Message-Id: <20230130181701.29977-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/2] drm/i915: Include stepping informaiton in
 device info dump
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

Dump the stepping information alongside all the other device
info. Might avoid some guesswork when reading logs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 98769e5f2c3d..599c6d399de4 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -119,6 +119,11 @@ void intel_device_info_print(const struct intel_device_info *info,
 		drm_printf(p, "display version: %u\n",
 			   runtime->display.ip.ver);
 
+	drm_printf(p, "graphics stepping: %s\n", intel_step_name(runtime->step.graphics_step));
+	drm_printf(p, "media stepping: %s\n", intel_step_name(runtime->step.media_step));
+	drm_printf(p, "display stepping: %s\n", intel_step_name(runtime->step.display_step));
+	drm_printf(p, "base die stepping: %s\n", intel_step_name(runtime->step.basedie_step));
+
 	drm_printf(p, "gt: %d\n", info->gt);
 	drm_printf(p, "memory-regions: %x\n", runtime->memory_regions);
 	drm_printf(p, "page-sizes: %x\n", runtime->page_sizes);
-- 
2.39.1

