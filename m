Return-Path: <SRS0=mdfT=NA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4BEC4338F
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Aug 2021 19:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F9560C51
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Aug 2021 19:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64F9560C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A6F89D79;
	Mon,  9 Aug 2021 19:48:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C526E89CBC
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Aug 2021 19:48:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="236767261"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="236767261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:48:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="525431720"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:48:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Date: Mon,  9 Aug 2021 12:48:05 -0700
Message-Id: <20210809194805.3793060-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Free all DMC payloads
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

From: Chris Wilson <chris@chris-wilson.co.uk>

Free all the DMC payloads, not just DMC_MAIN.

unreferenced object 0xffff88ff32d4d800 (size 1024):
  comm "kworker/1:5", pid 701, jiffies 4294904239 (age 109.736s)
  hex dump (first 32 bytes):
    40 40 00 0c 03 00 00 00 00 00 00 00 00 00 00 00  @@..............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000ba9d0d95>] dmc_load_work_fn+0x34d/0x510 [i915]
    [<000000001049fcab>] process_one_work+0x261/0x550
    [<00000000eeb995ac>] worker_thread+0x49/0x3c0
    [<0000000021031dc3>] kthread+0x10b/0x140
    [<000000004a0f69ee>] ret_from_fork+0x1f/0x30
unreferenced object 0xffff88ff0bde4000 (size 1024):
  comm "kworker/0:3", pid 708, jiffies 4294904469 (age 108.816s)
  hex dump (first 32 bytes):
    40 40 00 0c 01 00 00 00 00 00 00 00 00 00 00 00  @@..............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000ba9d0d95>] dmc_load_work_fn+0x34d/0x510 [i915]
    [<000000001049fcab>] process_one_work+0x261/0x550
    [<00000000eeb995ac>] worker_thread+0x49/0x3c0
    [<0000000021031dc3>] kthread+0x10b/0x140
    [<000000004a0f69ee>] ret_from_fork+0x1f/0x30

Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 3c3c6cb5c0df..b3c8e1c450ef 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -805,11 +805,14 @@ void intel_dmc_ucode_resume(struct drm_i915_private *dev_priv)
  */
 void intel_dmc_ucode_fini(struct drm_i915_private *dev_priv)
 {
+	int id;
+
 	if (!HAS_DMC(dev_priv))
 		return;
 
 	intel_dmc_ucode_suspend(dev_priv);
 	drm_WARN_ON(&dev_priv->drm, dev_priv->dmc.wakeref);
 
-	kfree(dev_priv->dmc.dmc_info[DMC_FW_MAIN].payload);
+	for (id = 0; id < DMC_FW_MAX; id++)
+		kfree(dev_priv->dmc.dmc_info[id].payload);
 }
-- 
2.31.1

