Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEA3C54E71
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Mar 2024 04:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE0710EE4C;
	Fri, 22 Mar 2024 04:27:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6FF10EE4C;
 Fri, 22 Mar 2024 04:27:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Enable_Adaptive_Sync?=
 =?utf-8?q?_SDP_Support_for_DP_=28rev31=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 22 Mar 2024 04:27:39 -0000
Message-ID: <171108165912.940819.7329372329471804105@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322031157.3823909-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240322031157.3823909-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable Adaptive Sync SDP Support for DP (rev31)
URL   : https://patchwork.freedesktop.org/series/126829/
State : warning

== Summary ==

Error: dim checkpatch failed
218f7e3c8c89 drm/dp: Add support to indicate if sink supports AS SDP
-:14: WARNING:BAD_SIGN_OFF: Duplicate signature
#14: 
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
e6308245ce63 drm: Add Adaptive Sync SDP logging
4f72966b4abb drm/i915/display: Add crtc state dump for Adaptive Sync SDP
d06d48bcb2fa drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
25875d279a9d drm/i915/dp: Add wrapper function to check AS SDP
b29503e62ebb drm/i915/display: Compute AS SDP parameters
38dc42687334 drm/i915/display: Add state checker for Adaptive Sync SDP
-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#72: FILE: drivers/gpu/drm/i915/display/intel_display.c:5156:
+#define PIPE_CONF_CHECK_DP_AS_SDP(name) do { \
+	if (!intel_compare_dp_as_sdp(&current_config->infoframes.name, \
+				      &pipe_config->infoframes.name)) { \
+		pipe_config_dp_as_sdp_mismatch(dev_priv, fastset, __stringify(name), \
+						&current_config->infoframes.name, \
+						&pipe_config->infoframes.name); \
+		ret = false; \
+	} \
+} while (0)

total: 0 errors, 0 warnings, 1 checks, 70 lines checked
da5bf1e47310 drm/i915/display: Compute vrr_vsync params
-:26: WARNING:TYPO_SPELLING: 'befor' may be misspelled - perhaps 'before'?
#26: 
- Add TRANS_VRR_VSYNC befor enabling VRR as per bspec. (Ankit)
                      ^^^^^

total: 0 errors, 1 warnings, 0 checks, 102 lines checked
f6563ac3df8f drm/i915/display: Read/Write Adaptive Sync SDP


