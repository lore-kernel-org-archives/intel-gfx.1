Return-Path: <SRS0=wI8T=LB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0D7C47082
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 18:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB40B60233
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 18:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB40B60233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EFA6E97D;
	Mon,  7 Jun 2021 18:05:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4349C6E97D;
 Mon,  7 Jun 2021 18:05:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3AFD7A0019;
 Mon,  7 Jun 2021 18:05:15 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 07 Jun 2021 18:05:15 -0000
Message-ID: <162308911523.2774.15342805397277452008@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210607180356.165785-1-matthew.brost@intel.com>
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Update_firmware_to_v62=2E0=2E0?=
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

Series: Update firmware to v62.0.0
URL   : https://patchwork.freedesktop.org/series/91106/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5735522498b2 drm/i915/guc: Introduce unified HXG messages
067ec8d0b970 drm/i915/guc: Update MMIO based communication
c3c36fc8703e drm/i915/guc: Update CTB response status definition
4239eebfa25e drm/i915/guc: Support per context scheduling policies
fed4d47fabb2 drm/i915/guc: Add flag for mark broken CTB
98f39fdfdab9 drm/i915/guc: New definition of the CTB descriptor
f8e5520d648c drm/i915/guc: New definition of the CTB registration action
-:55: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#55: FILE: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h:40:
+ *  +---+-------+--------------------------------------------------------------+
+*

-:56: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#56: FILE: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h:41:
+*
+ *  +---+-------+--------------------------------------------------------------+

-:75: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#75: FILE: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h:60:
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn

-:107: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#107: FILE: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h:92:
+ *  +---+-------+--------------------------------------------------------------+
+*

-:108: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#108: FILE: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h:93:
+*
+ *  +---+-------+--------------------------------------------------------------+

total: 0 errors, 4 warnings, 1 checks, 261 lines checked
fe305e722d41 drm/i915/guc: New CTB based communication
4143260c8c99 drm/i915/doc: Include GuC ABI documentation
65b657159e48 drm/i915/guc: Kill guc_clients.ct_pool
1fcb4faa9a92 drm/i915/guc: Kill ads.client_info
14d7602095b1 drm/i915/guc: Unified GuC log
1998c178877b drm/i915/guc: Update firmware to v62.0.0
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
