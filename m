Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD12C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 14:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A8923118
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 14:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75A8923118
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CC16E5A4;
	Thu, 10 Dec 2020 14:37:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEA026E3F7;
 Thu, 10 Dec 2020 14:37:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E9D51A008A;
 Thu, 10 Dec 2020 14:37:02 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Saichandana S" <saichandana.s@intel.com>
Date: Thu, 10 Dec 2020 14:37:02 -0000
Message-ID: <160761102293.19120.4319876898583790037@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201210132853.1521-1-saichandana.s@intel.com>
In-Reply-To: <20201210132853.1521-1-saichandana.s@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/debugfs_=3A_PM=5FREQ_and_PM=5FRES_register_debugfs?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/debugfs : PM_REQ and PM_RES register debugfs
URL   : https://patchwork.freedesktop.org/series/84782/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b23f408141a8 drm/i915/debugfs : PM_REQ and PM_RES register debugfs
-:7: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
Display Engine.PM_RES register provides the value of the last PM response from

-:25: ERROR:CODE_INDENT: code indent should use tabs where possible
#25: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:564:
+        struct drm_i915_private *dev_priv = node_to_i915(m->private);$

-:25: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#25: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:564:
+        struct drm_i915_private *dev_priv = node_to_i915(m->private);$

-:26: ERROR:CODE_INDENT: code indent should use tabs where possible
#26: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:565:
+        struct intel_csr *csr = &dev_priv->csr;$

-:26: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#26: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:565:
+        struct intel_csr *csr = &dev_priv->csr;$

-:28: ERROR:CODE_INDENT: code indent should use tabs where possible
#28: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:567:
+        if (!HAS_CSR(dev_priv))$

-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:567:
+        if (!HAS_CSR(dev_priv))$

-:29: ERROR:CODE_INDENT: code indent should use tabs where possible
#29: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:568:
+                return -ENODEV;$

-:29: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#29: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:568:
+                return -ENODEV;$

-:31: ERROR:CODE_INDENT: code indent should use tabs where possible
#31: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:570:
+        if (!csr->dmc_payload)$

-:31: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#31: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:570:
+        if (!csr->dmc_payload)$

-:32: ERROR:CODE_INDENT: code indent should use tabs where possible
#32: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:571:
+                return 0;$

-:32: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#32: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:571:
+                return 0;$

-:34: ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:573:
+        seq_printf(m, "PM debug request 0 (0x45284) : 0x%x\n",$

-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:573:
+        seq_printf(m, "PM debug request 0 (0x45284) : 0x%x\n",$

-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:574:
+                        intel_de_read(dev_priv, PM_REQ_DBG_0));$

-:35: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#35: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:574:
+        seq_printf(m, "PM debug request 0 (0x45284) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_REQ_DBG_0));

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:574:
+                        intel_de_read(dev_priv, PM_REQ_DBG_0));$

-:36: ERROR:CODE_INDENT: code indent should use tabs where possible
#36: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:575:
+        seq_printf(m, "PM debug request 1 (0x45288) : 0x%x\n",$

-:36: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#36: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:575:
+        seq_printf(m, "PM debug request 1 (0x45288) : 0x%x\n",$

-:37: ERROR:CODE_INDENT: code indent should use tabs where possible
#37: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:576:
+                        intel_de_read(dev_priv, PM_REQ_DBG_1));$

-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:576:
+        seq_printf(m, "PM debug request 1 (0x45288) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_REQ_DBG_1));

-:37: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#37: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:576:
+                        intel_de_read(dev_priv, PM_REQ_DBG_1));$

-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:577:
+        seq_printf(m, "PM debug response 0 (0x4528C) : 0x%x\n",$

-:38: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#38: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:577:
+        seq_printf(m, "PM debug response 0 (0x4528C) : 0x%x\n",$

-:39: ERROR:CODE_INDENT: code indent should use tabs where possible
#39: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:578:
+                        intel_de_read(dev_priv, PM_RSP_DBG_0));$

-:39: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:578:
+        seq_printf(m, "PM debug response 0 (0x4528C) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_RSP_DBG_0));

-:39: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#39: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:578:
+                        intel_de_read(dev_priv, PM_RSP_DBG_0));$

-:40: ERROR:CODE_INDENT: code indent should use tabs where possible
#40: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:579:
+        seq_printf(m, "PM debug response 1 (0x45290) : 0x%x\n",$

-:40: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#40: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:579:
+        seq_printf(m, "PM debug response 1 (0x45290) : 0x%x\n",$

-:41: ERROR:CODE_INDENT: code indent should use tabs where possible
#41: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:580:
+                        intel_de_read(dev_priv, PM_RSP_DBG_1));$

-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:580:
+        seq_printf(m, "PM debug response 1 (0x45290) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_RSP_DBG_1));

-:41: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#41: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:580:
+                        intel_de_read(dev_priv, PM_RSP_DBG_1));$

-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:582:
+        return 0;$

-:43: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#43: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:582:
+        return 0;$

-:66: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#66: FILE: drivers/gpu/drm/i915/i915_reg.h:375:
+#define PM_REQ_DBG_1 ^I^I_MMIO(0x45288)$

-:67: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#67: FILE: drivers/gpu/drm/i915/i915_reg.h:376:
+#define PM_RSP_DBG_0 ^I^I_MMIO(0x4528C)$

-:68: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#68: FILE: drivers/gpu/drm/i915/i915_reg.h:377:
+#define PM_RSP_DBG_1 ^I^I_MMIO(0x45290)$

total: 15 errors, 19 warnings, 4 checks, 47 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
