Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDBCC636CC
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Feb 2023 22:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC6210E772;
	Mon, 13 Feb 2023 22:53:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD110E772
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Feb 2023 22:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676328814; x=1707864814;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=49GEOrzEwC24IS+h3KKBMy+56jALMgXnnnaBS3hA6ao=;
 b=f0kpgsIZkoFqu/0LcrbWyzDldYiPmPS+N8itNnAvKALFk8k3tsPpZY9S
 Co9m3gLCo96OX71r78zCObmdhLENttYoygW9zOcH9uGyolIPJHceDdGlz
 cpGhtd1fmfW2MfqNQXhYswDNz6XvZAZDk8O9BeLNFXE6x9F1Nl7gVa4KI
 iHfdcMzPt+ZcZXtAzVTDFxjaI4BHWw3tZEz/7K+nSsmBnQScYMpDIe+ln
 FOiPwiWKRSTnSANFlegwjTFDd50wmHqlquiMTsnvdkYTyM0Eddpfxje4C
 45MP0/vBrjuKPfAzVdAaV3rLY3i0EuT9LSOavsQvZbX0/U8/9p4eUDi5y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417237431"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="417237431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 14:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757766461"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="757766461"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by FMSMGA003.fm.intel.com with SMTP; 13 Feb 2023 14:53:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 00:53:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 14 Feb 2023 00:52:58 +0200
Message-Id: <20230213225258.2127-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213225258.2127-1-ville.syrjala@linux.intel.com>
References: <20230213225258.2127-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 12/12] drm/i915: Remove pointless register read
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

We just wrote the EDP transcoder's VTOTAL register a few lines
earlier, so instead of reading it back out again let's just
generate the same value for the transocder B/C register.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4210ede5e52e..894f3098d9be 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2891,8 +2891,8 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 	if (IS_HASWELL(dev_priv) && cpu_transcoder == TRANSCODER_EDP &&
 	    (pipe == PIPE_B || pipe == PIPE_C))
 		intel_de_write(dev_priv, TRANS_VTOTAL(pipe),
-			       intel_de_read(dev_priv, TRANS_VTOTAL(cpu_transcoder)));
-
+			       VACTIVE(crtc_vdisplay - 1) |
+			       VTOTAL(crtc_vtotal - 1));
 }
 
 static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
-- 
2.39.1

