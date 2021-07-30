Return-Path: <SRS0=bte8=MW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA461C4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 20:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86CE660EB2
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 20:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86CE660EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A2B6F47C;
	Fri, 30 Jul 2021 20:31:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4A9D6F47C;
 Fri, 30 Jul 2021 20:31:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9CC36A7DFB;
 Fri, 30 Jul 2021 20:31:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 30 Jul 2021 20:31:03 -0000
Message-ID: <162767706361.583.938733388361951900@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210730202119.23810-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20210730202119.23810-1-vinay.belgaumkar@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/guc/slpc=3A_Enable_GuC_based_power_management_feat?=
 =?utf-8?q?ures_=28rev4=29?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/guc/slpc: Enable GuC based power management features (rev4)
URL   : https://patchwork.freedesktop.org/series/93026/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
8fae42887a4e drm/i915/guc/slpc: Initial definitions for SLPC
-:77: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#77: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
0f547d696791 drm/i915/guc/slpc: Gate Host RPS when SLPC is enabled
c69d7f1dd232 drm/i915/guc/slpc: Adding SLPC communication interfaces
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:271: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#271: FILE: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h:233:
+#define HOST2GUC_PC_SLPC_REQUEST_MSG_N_EVENT_DATA_N	GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 1 warnings, 1 checks, 276 lines checked
5440b25b17a1 drm/i915/guc/slpc: Allocate, initialize and release SLPC
de4219f71486 drm/i915/guc/slpc: Enable SLPC and add related H2G events
131306f42919 drm/i915/guc/slpc: Remove BUG_ON in guc_submission_disable
e691b626bcee drm/i915/guc/slpc: Add methods to set min/max frequency
ceb4ed85d8f8 drm/i915/guc/slpc: Add get max/min freq hooks
3a2e114f13ff drm/i915/guc/slpc: Add debugfs for SLPC info
dc3e37f84481 drm/i915/guc/slpc: Enable ARAT timer interrupt
530c47730a0d drm/i915/guc/slpc: Cache platform frequency limits
54f6ba8db318 drm/i915/guc/slpc: Sysfs hooks for SLPC
26c4fefbf08d drm/i915/guc/slpc: Add SLPC selftest
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 322 lines checked
e5ab6462774d drm/i915/guc/rc: Setup and enable GuCRC feature
-:163: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#163: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 234 lines checked


