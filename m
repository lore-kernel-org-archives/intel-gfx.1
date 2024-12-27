Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F9FE7718F
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Dec 2024 11:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7465210E39B;
	Fri, 27 Dec 2024 11:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edcnYWb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9395D10E39B
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Dec 2024 11:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735298145; x=1766834145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LhJu/YU5TDaAfS0aJ9mpiCjRZCa/Z095NllMATeCkpE=;
 b=edcnYWb856sIRQg8SD7eM3Tl5D+p9iNPL2XYALgZ6F6rWkw4F6dwjuew
 jyzyiO93K1ioUVg8atWJsskBGXY9k6jiuJOlnDp/D5F2t1oi6PP4ajl/+
 ppWsJL9XKKqAWOpdkxPelO6JmazcKTFQUbxosK3rdp6xrCnbUa8VI1duE
 mbg9wcp8s6zSq6EmgmzsMVuDvYAm3tFozLU0XMjsHrclVhxzq1f3e7yop
 FQfGjKBKEFWuL3JirjlY5JO4Y200V0RL5xupcnxs/QBcgjVp+WKVng74e
 2UVbUu9AmRTLrDEUjVh0Hvc/IIOs7kqEmu9akoN+6NmG2ewbQj3EwPYq+ g==;
X-CSE-ConnectionGUID: 0F2XmMgiRFe57gmNq7qOsQ==
X-CSE-MsgGUID: HirGeN/7TZWfG6HoLgdlDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61079903"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; d="scan'208";a="61079903"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 03:15:44 -0800
X-CSE-ConnectionGUID: AA/QCuU9QoSXdaDVS4tRjA==
X-CSE-MsgGUID: L48tv61DQ0WINHoLkI7CIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; d="scan'208";a="100260248"
Received: from singhapo-super-server.iind.intel.com ([10.145.169.90])
 by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 03:15:43 -0800
From: apoorva.singh@intel.com
To: intel-gfx@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/i915/gt: Prevent uninitialized pointer reads
Date: Fri, 27 Dec 2024 16:59:20 +0530
Message-Id: <20241227112920.1547592-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Initialize rq to NULL to prevent uninitialized pointer reads.

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index ca460cee4f8b..1bf7b88d9a9d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -262,7 +262,7 @@ static int clear(struct intel_migrate *migrate,
 {
 	struct drm_i915_private *i915 = migrate->context->engine->i915;
 	struct drm_i915_gem_object *obj;
-	struct i915_request *rq;
+	struct i915_request *rq = NULL;
 	struct i915_gem_ww_ctx ww;
 	u32 *vaddr, val = 0;
 	bool ccs_cap = false;
-- 
2.34.1

