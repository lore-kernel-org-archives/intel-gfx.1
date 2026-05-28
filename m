Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000CECD6E43
	for <intel-gfx@archiver.kernel.org>; Thu, 28 May 2026 23:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1E110F6D5;
	Thu, 28 May 2026 23:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=poorly.run header.i=@poorly.run header.b="H7DeJtmS";
	dkim-atps=neutral
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202E010F6D4
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 May 2026 23:08:23 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7dd3f176f84so7910317b3.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 May 2026 16:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1780009702; x=1780614502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sN66wXnuf6IgvNfIu/oqHRce6wGXmhGXpBXVMToPfVY=;
 b=H7DeJtmSdgjYcYGFEG4W0E/2jM5nWRCtItczFDddM2uSl5RyQPAJSaAREkkIjpGHFy
 /jyK/kKfzZ6ysvdLIcRuZ52svHrs3e6Tbz6LoT+FBu91uQ7S2UZ2okK85tGxTUC7bYnh
 bYQOpo/o+RriTaPLBJj8Hh8iQWGa1KAs/zmUOvl5Yj2sH1VECJK5wxKzqvKfIRQl1U55
 7VEDqd/zfPVttdojnkdCB4O2itOGnzywI5wygh+lDdoceWSU9Zsk9dA+d6FwQJulTZ7z
 neUsTcZGGp2PK9fW+V6verbLXRqqnwmRgGeRlcZyeyyyXd97sRYlRcjVQU++E/ER8t8C
 xvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780009702; x=1780614502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sN66wXnuf6IgvNfIu/oqHRce6wGXmhGXpBXVMToPfVY=;
 b=iEc58QOurAaqY+nLuo/RC/u4PmtC8bxsN57SFgecm552mJPzSiDygLuka1R0iuXssE
 Kxz/M1DtcdvP0wjvFt4jjwtCY7vnX4FdmPEqK1QcjFmbiyFxz6XTNMkbVU9AvG62LIQu
 VmjUb82Z9jMpPsJt8eA7QyD+WhAcrtOyWHCE25vLy7tiqX16vIAq6CwaEkcxINIDtWwe
 k0J+2YiJKAyhUUsEsm4Hbax49BtWrgTtpbGcBDVIpLVc604Iarh3aWQ1yJeXeTnJgpsx
 Vwg8dHwEaLqQAiSMST7HLUWFHRlv1oe1Ty1fsc1YoO18MjRvYFNrlEL99e98HUxoo4LZ
 r96A==
X-Gm-Message-State: AOJu0YyxFxzEQaIrvOa9VKWwaOVfaK9b0GtVTVuRfKvkt/eZHRCKnEJI
 nag14Of8rUJ9KvptmeYaG/FKsehmjZBGqChLnLXliwNUf7Jwv4srBDykk3579n8BLNLP/5auQbm
 MGT461Yc=
X-Gm-Gg: Acq92OGxZAvb4QQJLtnThpozUHN7gRV0/i9z0ecqthE71/ATtfC78RfiI/fypZ3lSXW
 PRopPSxqB6lRXhQIjB1WryyH/DePH6pVy+cAFObqaC5krwaBy4ixIIcPahi9LxurRNNUI4kEUjp
 rV2mEJgtNMdvEMzxPW9xfXg2438uhigxll/jPkrZt82m9iTnRE1rrRZIp9afGvGO/VCFtozsFMZ
 0U5NCyx92eSfjGrfjXMe7sQFBpgixma3uWpqo/j16VD9g/hi/Dp516rVCmh/LlBKQLWTOyEdFi4
 SU0Cc6fwAdnLxUnnUD0WJ2V2Lrvsu/vQ9NG1xUEZEA++tqGjqHrQiP0yYWDCDXV4zwh+544/sWa
 KZVjjXIBMdF8OaUelQN/e7mQWKomuPD72kJLt5jgYCTEFHQIqc9ICGxwpnF3Xr+bx8XpQ3BPrcl
 nkQN7HunRM6Vs3LcwWfuNCGyN07747I/uitO7V2n8LvgLxECwKvGVSL0XyTyOcTMd5YAmCYTtrI
 qJO
X-Received: by 2002:a05:690c:6288:b0:7dc:7b3:6326 with SMTP id
 00721157ae682-7de4bd19fc1mr2454467b3.33.1780009702204; 
 Thu, 28 May 2026 16:08:22 -0700 (PDT)
Received: from localhost (182.221.85.34.bc.googleusercontent.com.
 [34.85.221.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7de6757e963sm167097b3.1.2026.05.28.16.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 16:08:21 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 chaitanya.kumar.borah@intel.com
Cc: Sean Paul <seanpaul@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/color: Fix step discontinuity in Pre-CSC
 Gamma LUT
Date: Thu, 28 May 2026 19:07:47 -0400
Message-ID: <20260528230817.2455072-2-sean@poorly.run>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
In-Reply-To: <20260528230817.2455072-1-sean@poorly.run>
References: <20260528230817.2455072-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sean Paul <seanpaul@google.com>

Clamp Segment 2 to the last user-provided LUT entry value instead of
hardcoding it to 1.0 (1 << 24) to fix a step discontinuity.

Signed-off-by: Sean Paul <seanpaul@google.com>
Link: https://lore.kernel.org/intel-gfx/20260521180143.2143262-1-sean@poorly.run/ #v1
Link: https://lore.kernel.org/intel-gfx/20260525135730.1122696-2-sean@poorly.run/ #v2

Changes in v2:
- Split out into separate patches for pre/post csc fixes
- Dropped loop bounds fix in favor of [1]
Changes in v3:
- Fix stale commit message

[1]- https://lore.kernel.org/r/20260519075245.383864-1-pranay.samala@intel.com
---
 drivers/gpu/drm/i915/display/intel_color.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 7185f3628dcf..458508bcf1f4 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3968,6 +3968,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	enum plane_id plane = to_intel_plane(state->plane)->id;
 	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
 	u32 i, lut_size;
+	u32 lut_val = 1 << 24;
 
 	if (icl_is_hdr_plane(display, plane)) {
 		lut_size = 128;
@@ -3978,7 +3979,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 
 		if (pre_csc_lut) {
 			for (i = 0; i < lut_size; i++) {
-				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+				lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
 
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
@@ -3990,7 +3991,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 			do {
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
+						   lut_val);
 			} while (i++ < 130);
 		} else {
 			for (i = 0; i < lut_size; i++) {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

