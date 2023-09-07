Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D2AEE14D3
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Sep 2023 03:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384110E74E;
	Thu,  7 Sep 2023 03:06:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 53BFC10E74E;
 Thu,  7 Sep 2023 03:06:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4A39DAADE4;
 Thu,  7 Sep 2023 03:06:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 07 Sep 2023 03:06:34 -0000
Message-ID: <169405599427.17903.1146902557484625695@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907002032.81587-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230907002032.81587-1-alan.previn.teres.alexis@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv1=2C1/1=5D_drm/i915/pxp=3A_Add_drm?=
 =?utf-8?q?=5Fdbgs_for_critical_PXP_events=2E?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v1,1/1] drm/i915/pxp: Add drm_dbgs for critical PXP events.
URL   : https://patchwork.freedesktop.org/series/123370/
State : warning

== Summary ==

Error: dim checkpatch failed
5dcdd6c035e0 drm/i915/pxp: Add drm_dbgs for critical PXP events.
-:59: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/pxp/intel_pxp.c:422:
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: explicit %s failed on readiness with %d", __func__, ret);

-:77: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/pxp/intel_pxp_irq.c:43:
+		pxp->session_events |= PXP_TERMINATION_REQUEST | PXP_INVAL_REQUIRED | PXP_EVENT_TYPE_IRQ;

-:96: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#96: FILE: drivers/gpu/drm/i915/pxp/intel_pxp_session.c:141:
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: %s to create arb_session after invalidation", __func__);

total: 0 errors, 3 warnings, 0 checks, 83 lines checked


