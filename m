Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7073FD6CFA4
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jan 2026 21:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE33E10E15A;
	Thu, 22 Jan 2026 21:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebVHQiIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E9B10E15A
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Jan 2026 21:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769117982; x=1800653982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aNJKxQSDAxbZ9NWgeTcg3QiYTvMHI0KJ/zZkDQ6BC4E=;
 b=ebVHQiIMNb7yEdRc8WVeulB7lb633uYQVKvKWEr3iPaIpK4at77BPXhd
 GQKmrjm8PKhxyPhucD5mOKnh1CfIEJgbFMbOHqDP27piuuURscGXngDUG
 lXulKBHNTMsxgt9OSAVBvS5b+GD35ZRtLixdvX5kR5J+sq5L2kYRAZ/kU
 VjgLiDvm06lh+mjZl0KKxCn7a5Ty0TH0/rBki3y7ECArcoyGAUxnXmUBn
 Mr+/OtYF0yolEx6lqco7y5LHN+suEp1KvOsSg9c5kl+OvK1fvVi/B2M3q
 /7zWkrOFfvZsgB1/bDd4JgNoGRgePqwJehKZWkXcwp9I9ypn7+923+tA1 A==;
X-CSE-ConnectionGUID: J/8j0OXrSxuihUpc6NDLxQ==
X-CSE-MsgGUID: +k16RIaPT2utsfsSWN1okA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81741979"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81741979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:39:41 -0800
X-CSE-ConnectionGUID: LTuuAgeJTFKLOMI7ESJpxw==
X-CSE-MsgGUID: 2e1RY4W8T6yDEbtdv1NQoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206438291"
Received: from dut4086lnl.fm.intel.com ([10.105.8.127])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:39:41 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] drm/i915/display: PORT_NONE is not valid
Date: Thu, 22 Jan 2026 21:39:41 +0000
Message-ID: <20260122213940.64352-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Static analysis issue:

In assert_port_valid, add a check to ensure port != PORT_NONE, as that
is not a valid port.  The check must be explicit to prevent a bad bit
shift operation in the general case via short-circuiting.  It's not
likely this will ever come up in a real use case, but it's at least
worth guarding against.

It would probably also be pertinent to modify the behavior of the
port_name function to correctly print PORT_NONE in this case, as
currently the port would be reported as 'port @' by the debugger.  But
that should be done separately, and given port_name is mostly just a
debug printing helper function anyways, fixing it is a low priority.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7491e00e3858..250f31bb5938 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7828,7 +7828,8 @@ static bool intel_ddi_crt_present(struct intel_display *display)
 
 bool assert_port_valid(struct intel_display *display, enum port port)
 {
-	return !drm_WARN(display->drm, !(DISPLAY_RUNTIME_INFO(display)->port_mask & BIT(port)),
+	return !drm_WARN(display->drm,
+			 !(port < 0 || DISPLAY_RUNTIME_INFO(display)->port_mask & BIT(port)),
 			 "Platform does not support port %c\n", port_name(port));
 }
 
-- 
2.43.0

