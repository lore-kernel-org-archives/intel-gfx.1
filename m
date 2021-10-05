Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4295DC433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 12:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035F461409
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 12:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 035F461409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E986E3E5;
	Tue,  5 Oct 2021 12:18:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 444096E3E5;
 Tue,  5 Oct 2021 12:18:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3C4D1A8169;
 Tue,  5 Oct 2021 12:18:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 05 Oct 2021 12:18:18 -0000
Message-ID: <163343629822.19281.5048553831091543791@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211004170535.4173-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211004170535.4173-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Improve_DP_link_training_further_=28rev4=29?=
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

Series: drm/i915: Improve DP link training further (rev4)
URL   : https://patchwork.freedesktop.org/series/95405/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
abef31c7b13c drm/i915: Tweak the DP "max vswing reached?" condition
b54d2483d9e1 drm/i915: Show LTTPR in the TPS debug print
5799665e91f9 drm/i915: Print the DP vswing adjustment request
-:25: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#25: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:349:
+#define TRAIN_REQ_VSWING_ARGS(link_status) \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 0), \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 1), \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 2), \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 3)

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'link_status' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:349:
+#define TRAIN_REQ_VSWING_ARGS(link_status) \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 0), \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 1), \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 2), \
+	_TRAIN_REQ_VSWING_ARGS(link_status, 3)

-:31: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:355:
+	(drm_dp_get_adjust_request_pre_emphasis((link_status), (lane)) >> DP_TRAIN_PRE_EMPHASIS_SHIFT)

-:32: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#32: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:356:
+#define TRAIN_REQ_PREEMPH_ARGS(link_status) \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 0), \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 1), \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 2), \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 3)

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'link_status' - possible side-effects?
#32: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:356:
+#define TRAIN_REQ_PREEMPH_ARGS(link_status) \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 0), \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 1), \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 2), \
+	_TRAIN_REQ_PREEMPH_ARGS(link_status, 3)

total: 2 errors, 1 warnings, 2 checks, 41 lines checked
189e1f80ff45 drm/i915: Pimp link training debug prints
2581f8d15990 drm/i915: Call intel_dp_dump_link_status() for CR failures


