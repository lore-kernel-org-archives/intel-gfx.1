Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D319C3271E
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2850210E381;
	Mon,  8 Jul 2024 19:50:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFD010E084;
 Mon,  8 Jul 2024 19:50:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dp=3A_Fix_L?=
 =?utf-8?q?TTPR_detection_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 08 Jul 2024 19:50:57 -0000
Message-ID: <172046825751.67326.3996244160980654456@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708190029.271247-1-imre.deak@intel.com>
In-Reply-To: <20240708190029.271247-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix LTTPR detection (rev2)
URL   : https://patchwork.freedesktop.org/series/135711/
State : warning

== Summary ==

Error: dim checkpatch failed
4e62b18eccf3 drm/i915/dp: Reset intel_dp->link_trained before retraining the link
72525945c7e8 drm/i915/dp: Don't switch the LTTPR mode on an active link
86a6a12e5839 drm/i915/dp: Reset cached LTTPR count if number of LTTPRs is unsupported
604c782156dc drm/i915/dp: Keep cached LTTPR mode up-to-date
5e86b1909291 drm/dp: Add helper to dump an LTTPR PHY descriptor
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
[1] https://lore.kernel.org/all/20240703155937.1674856-5-imre.deak@intel.com

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
569f5a0978ff drm/i915/dp: Dump the LTTPR PHY descriptors


