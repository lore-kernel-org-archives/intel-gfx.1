Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A77DC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Feb 2022 16:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6E810E5EE;
	Thu, 24 Feb 2022 16:53:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDB710E5EE
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Feb 2022 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645721604; x=1677257604;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sOpjhwSpigkrIHYQWIVDLn5hDbH9Sc/n/HSQXBAp7NM=;
 b=Qz9FV1cJjN2SCjTczfSO0a+fc6yCWxz6ysjnoYu6i2WzriL++FxeV8ng
 nhrKmfv5r9Ei49YJVstXi1v3x5lrp9rNC/zUFs7eqzkUfjNrQJh/cssN+
 a9iZ7mp4jHX6+w5gzoTpJ18ZdpPuhFTAMUkoMsVEWKLBIbV/1/TKw4yo9
 B5LZxZzK/5/Qd2eazMeOWYZqjPo2FH+R+rKIqg2QOr0E8cz4mKQlXx4zr
 PxFKEOFn6LDZ5ml22FZKuUmZ0EKttpn7hplTqn6NLFaQ5F1kRAK30Vk4n
 AaOx9ahkQlSyReubv90IuTmgnXM8W0wnlJ6HwzFnBucUY0WrW9Yl4tTl3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252475779"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252475779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 08:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="548827470"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 24 Feb 2022 08:51:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 24 Feb 2022 18:51:09 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Feb 2022 18:51:01 +0200
Message-Id: <20220224165103.15682-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224165103.15682-1-ville.syrjala@linux.intel.com>
References: <20220224165103.15682-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/4] drm/i915: Make ilk+ pfit regiser unlocked
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

The ilk+ panel fitter register are sitting nicely on their own
cacheline, so no need for global serialization via uncore.lock.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7bf24df20b14..705f23be409c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1114,13 +1114,13 @@ static void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)
 	 * e.g. x201.
 	 */
 	if (IS_IVYBRIDGE(dev_priv) || IS_HASWELL(dev_priv))
-		intel_de_write(dev_priv, PF_CTL(pipe), PF_ENABLE |
-			       PF_FILTER_MED_3x3 | PF_PIPE_SEL_IVB(pipe));
+		intel_de_write_fw(dev_priv, PF_CTL(pipe), PF_ENABLE |
+				  PF_FILTER_MED_3x3 | PF_PIPE_SEL_IVB(pipe));
 	else
-		intel_de_write(dev_priv, PF_CTL(pipe), PF_ENABLE |
-			       PF_FILTER_MED_3x3);
-	intel_de_write(dev_priv, PF_WIN_POS(pipe), x << 16 | y);
-	intel_de_write(dev_priv, PF_WIN_SZ(pipe), width << 16 | height);
+		intel_de_write_fw(dev_priv, PF_CTL(pipe), PF_ENABLE |
+				  PF_FILTER_MED_3x3);
+	intel_de_write_fw(dev_priv, PF_WIN_POS(pipe), x << 16 | y);
+	intel_de_write_fw(dev_priv, PF_WIN_SZ(pipe), width << 16 | height);
 }
 
 static void intel_crtc_dpms_overlay_disable(struct intel_crtc *crtc)
@@ -2022,9 +2022,9 @@ void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 	if (!old_crtc_state->pch_pfit.enabled)
 		return;
 
-	intel_de_write(dev_priv, PF_CTL(pipe), 0);
-	intel_de_write(dev_priv, PF_WIN_POS(pipe), 0);
-	intel_de_write(dev_priv, PF_WIN_SZ(pipe), 0);
+	intel_de_write_fw(dev_priv, PF_CTL(pipe), 0);
+	intel_de_write_fw(dev_priv, PF_WIN_POS(pipe), 0);
+	intel_de_write_fw(dev_priv, PF_WIN_SZ(pipe), 0);
 }
 
 static void ilk_crtc_disable(struct intel_atomic_state *state,
-- 
2.34.1

