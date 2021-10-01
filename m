Return-Path: <SRS0=cmqZ=OV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339CBC433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 20:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB83C619F9
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 20:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB83C619F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7946F3C2;
	Fri,  1 Oct 2021 20:30:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15AD86E558;
 Fri,  1 Oct 2021 20:30:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 00128A363C;
 Fri,  1 Oct 2021 20:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 01 Oct 2021 20:30:12 -0000
Message-ID: <163312021299.25583.11748335637960471999@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211001130107.1746-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211001130107.1746-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_DP_per-lane_drive_settings_prep_work_=28rev5=29?=
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

Series: drm/i915: DP per-lane drive settings prep work (rev5)
URL   : https://patchwork.freedesktop.org/series/95122/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
cf1c2f180fc0 drm/i915: Introduce has_iboost()
0331dcae40fa drm/i915: Introduce has_buf_trans_select()
950e7d78424f drm/i915: Generalize .set_signal_levels()
8a3167603dac drm/i915: Nuke useless .set_signal_levels() wrappers
6017d27895b9 drm/i915: De-wrapper bxt_ddi_phy_set_signal_levels()
d1164ebf7815 drm/i915: Hoover the level>=n_entries WARN into intel_ddi_level()
5679ad5a9eaa drm/i915: Nuke intel_ddi_hdmi_num_entries()
bec19dfada59 drm/i915: Pass the lane to intel_ddi_level()
2069bc33e7b8 drm/i915: Prepare link training for per-lane drive settings
-:96: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'train_set' - possible side-effects?
#96: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:423:
+#define _TRAIN_SET_VSWING_ARGS(train_set) \
+	((train_set) & DP_TRAIN_VOLTAGE_SWING_MASK) >> DP_TRAIN_VOLTAGE_SWING_SHIFT, \
+	(train_set) & DP_TRAIN_MAX_SWING_REACHED ? "(max)" : ""

-:99: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#99: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:426:
+#define TRAIN_SET_VSWING_ARGS(train_set) \
+	_TRAIN_SET_VSWING_ARGS((train_set)[0]), \
+	_TRAIN_SET_VSWING_ARGS((train_set)[1]), \
+	_TRAIN_SET_VSWING_ARGS((train_set)[2]), \
+	_TRAIN_SET_VSWING_ARGS((train_set)[3])

-:99: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'train_set' - possible side-effects?
#99: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:426:
+#define TRAIN_SET_VSWING_ARGS(train_set) \
+	_TRAIN_SET_VSWING_ARGS((train_set)[0]), \
+	_TRAIN_SET_VSWING_ARGS((train_set)[1]), \
+	_TRAIN_SET_VSWING_ARGS((train_set)[2]), \
+	_TRAIN_SET_VSWING_ARGS((train_set)[3])

-:104: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'train_set' - possible side-effects?
#104: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:431:
+#define _TRAIN_SET_PREEMPH_ARGS(train_set) \
+	((train_set) & DP_TRAIN_PRE_EMPHASIS_MASK) >> DP_TRAIN_PRE_EMPHASIS_SHIFT, \
+	(train_set) & DP_TRAIN_MAX_PRE_EMPHASIS_REACHED ? "(max)" : ""

-:107: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#107: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:434:
+#define TRAIN_SET_PREEMPH_ARGS(train_set) \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[0]), \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[1]), \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[2]), \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[3])

-:107: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'train_set' - possible side-effects?
#107: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:434:
+#define TRAIN_SET_PREEMPH_ARGS(train_set) \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[0]), \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[1]), \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[2]), \
+	_TRAIN_SET_PREEMPH_ARGS((train_set)[3])

total: 2 errors, 0 warnings, 4 checks, 111 lines checked
d90bc41ad089 drm/i915: Allow per-lane drive settings with LTTPRs


