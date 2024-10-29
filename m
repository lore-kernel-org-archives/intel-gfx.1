Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7D6D3A670
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Oct 2024 17:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E11410E3A6;
	Tue, 29 Oct 2024 17:14:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C34810E6B0;
 Tue, 29 Oct 2024 17:14:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/gsc=3A_ARL-?=
 =?utf-8?q?H_and_ARL-U_need_a_newer_GSC_FW=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Oct 2024 17:14:10 -0000
Message-ID: <173022205050.1359138.10243266696321675626@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028233132.149745-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241028233132.149745-1-daniele.ceraolospurio@intel.com>
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

Series: drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.
URL   : https://patchwork.freedesktop.org/series/140620/
State : warning

== Summary ==

Error: dim checkpatch failed
a2f1e2c2a443 drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.
-:183: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#183: FILE: include/drm/intel/pciids.h:768:
+#define INTEL_ARL_H_IDS(MACRO__, ...) \
 	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__)

-:183: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#183: FILE: include/drm/intel/pciids.h:768:
+#define INTEL_ARL_H_IDS(MACRO__, ...) \
 	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__)

-:190: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#190: FILE: include/drm/intel/pciids.h:775:
+#define INTEL_ARL_S_IDS(MACRO__, ...) \
 	MACRO__(0x7D67, ## __VA_ARGS__), \
 	MACRO__(0xB640, ## __VA_ARGS__)

-:190: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#190: FILE: include/drm/intel/pciids.h:775:
+#define INTEL_ARL_S_IDS(MACRO__, ...) \
 	MACRO__(0x7D67, ## __VA_ARGS__), \
 	MACRO__(0xB640, ## __VA_ARGS__)

-:195: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#195: FILE: include/drm/intel/pciids.h:779:
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	INTEL_ARL_H_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_U_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)

-:195: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#195: FILE: include/drm/intel/pciids.h:779:
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	INTEL_ARL_H_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_U_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)

total: 3 errors, 0 warnings, 3 checks, 156 lines checked


