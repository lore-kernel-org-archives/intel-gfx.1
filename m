Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064FCC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 09:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC92660EE2
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 09:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC92660EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D010C6E237;
	Fri, 15 Oct 2021 09:16:56 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AFD6E237
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 09:16:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227774555"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="227774555"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 02:16:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="525379999"
Received: from rboyadji-mobl.amr.corp.intel.com (HELO rdvivi-mobl4.intel.com)
 ([10.213.161.67])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 02:16:54 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Date: Fri, 15 Oct 2021 05:16:50 -0400
Message-Id: <20211015091650.87270-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Don't propagate the gen split
 confusion further
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

There's no such thing as gen13. It is either display 13
or graphics 13. Don't propagate the gen12 confusion
further.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index da9055c3ebf0..1e221fbe37fd 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8263,7 +8263,7 @@ enum {
 
 /*
  * The below are numbered starting from "S1" on gen11/gen12, but starting
- * with gen13 display, the bspec switches to a 0-based numbering scheme
+ * with display 13, the bspec switches to a 0-based numbering scheme
  * (although the addresses stay the same so new S0 = old S1, new S1 = old S2).
  * We'll just use the 0-based numbering here for all platforms since it's the
  * way things will be named by the hardware team going forward, plus it's more
-- 
2.31.1

