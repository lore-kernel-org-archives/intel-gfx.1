Return-Path: <SRS0=BQGL=OY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07781C433EF
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Oct 2021 14:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E4761222
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Oct 2021 14:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1E4761222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DDE6E9D6;
	Mon,  4 Oct 2021 14:37:29 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7250E6E9D6
 for <intel-gfx@lists.freedesktop.org>; Mon,  4 Oct 2021 14:37:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311656950"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="311656950"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="622301477"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 04 Oct 2021 07:33:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 17:33:47 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  4 Oct 2021 17:33:41 +0300
Message-Id: <20211004143341.29673-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004143341.29673-1-ville.syrjala@linux.intel.com>
References: <20211004143341.29673-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/fbc: Don't nuke manually around
 flips
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Apparently we have discovered another way to hit the dreaded
top of screen FBC corruption on GLK. Previously we thought it
was limited to some combination of FBC nuke+disable+plane update
during the same frame, for which we have the extra vblank wait
as a workaround. But looks like it can somehow be hit even
without the FBC disable.

Skipping the extra manual nuke immediately after page flips seems
to cure this. The manual nuke shouldn't be needed anyway since the
flip itself will already cause a nuke. I suppose this means it might
still be possible to hit this if you mix page flips and frontbuffer
rendering in clever ways, but at least it's a bit less likely now.

v2: Rebase

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index ef2f1ece4a89..d909402bd151 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -458,11 +458,13 @@ static void intel_fbc_activate(struct drm_i915_private *dev_priv)
 
 	trace_intel_fbc_activate(fbc->crtc);
 
+	intel_fbc_hw_activate(dev_priv);
+
+	if (!fbc->active)
+		intel_fbc_recompress(dev_priv);
+
 	fbc->active = true;
 	fbc->activated = true;
-
-	intel_fbc_hw_activate(dev_priv);
-	intel_fbc_recompress(dev_priv);
 }
 
 static void intel_fbc_deactivate(struct drm_i915_private *dev_priv,
-- 
2.32.0

