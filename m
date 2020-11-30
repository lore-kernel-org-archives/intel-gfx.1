Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B80BC64E8A
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 21:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7442084C
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 21:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7442084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57C06E8AC;
	Mon, 30 Nov 2020 21:22:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346B66E8B4
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 21:22:05 +0000 (UTC)
IronPort-SDR: pbiCGeOlYpuI4dxi2p0YtOPmwNDgKbyjezWNbTLSKS6BFvep6HZS+tOf2UhtJD6tJMMff/aYFx
 eQ0nDpNtkaJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="257424723"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="257424723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 13:22:04 -0800
IronPort-SDR: VQeY4AG/Gf8AxddrPefRqJCqI1rSIrJrZ2+iNMmKurqsgqOUqitEY8Zt86wLvCHS7r+4KpW+xt
 OEtn3Ro77xxw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="480810519"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 13:22:03 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 23:21:52 +0200
Message-Id: <20201130212200.2811939-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130212200.2811939-1-imre.deak@intel.com>
References: <20201130212200.2811939-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/9] drm/i915: Use CRTC index consistently
 during getting/putting CRTC power domains
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The for_each_oldnew_intel_crtc_in_state() iterator index does match
crtc->pipe, but using the same thing as array index when getting and
putting CRTC power domains makes things clearer.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ba26545392bc..d812d7ae5e65 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -16376,8 +16376,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		intel_post_plane_update(state, crtc);
 
-		if (put_domains[i])
-			modeset_put_power_domains(dev_priv, put_domains[i]);
+		if (put_domains[crtc->pipe])
+			modeset_put_power_domains(dev_priv, put_domains[crtc->pipe]);
 
 		intel_modeset_verify_crtc(crtc, state, old_crtc_state, new_crtc_state);
 
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
