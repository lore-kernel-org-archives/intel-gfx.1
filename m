Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB0606A334
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgkuo664
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11F410EF47;
	Mon, 16 Nov 2026 14:37:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251D110E665
 for <intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2026 01:44:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c4682977f9aso302168366b.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2026 17:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794620638; x=1795225438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
 b=Mgkuo664Kc+3FoLbPLfohgPkMkYSwge8DcAzrSxtpUw3aG4PAkt7zZdUAPr1OchCvI
 F5ps4O14wr6hmecGyGD+5tQPKHId2pmrruSfIGmyjZD5EbNV2zVtGfQvzSTmbGwWI/Un
 PgtnXnU/8YtfZoKVg0ZPpgFqyX+eckaI/UEc7qe6RGBKGfaUbpr6gXk7wOAUwxtkqCAv
 mceKMX4jGNq6b0y/MWhBbVsnNZoYoqnAfmrc0MkLEWkaokaVdv2bIyuZyJTEs//xdWOs
 vD3MK20+OhflObUxL3h7hxIPbHAFo66KyaEYUqwGiRTX+k9hx3np2up2lOPSdtXbtqeF
 lkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794620638; x=1795225438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
 b=wiWZOEe0reZSC3ZCFLA4sYWXN6NT9Ak0hL4gGIKeXjxUrVQ/xSlYnl4GMVh5f4SXfD
 AEoMPEAMUGsRd5SkM1Qz6YrmhRp683xbwohnujE6JD17V0+vf1jENeyqujmnGgMSSQ1i
 fOoTCyUaQPleUK/NO3S4GxshVRRZUE0EzZAyxyGwuT/WerFcUbuguJqBDauJnF3N21mq
 5XCzzYbSRDyWrSnNUu79FYkuu6TMhEC+sbPY0mZ3s949wzlp7iYDJDCrGElv/sHMMc2A
 do9Sf2vSCyIzJCCSmXhTcP2aV2DKnshZFmqQ/pAmkc0dlxptH8dS8eXR4VF+oee20HBC
 mSCw==
X-Gm-Message-State: APuU4Z+TVvZIcd6mJQc+4NnfcgCPzBN4TFl1V0dpd50ZquNY0qQZbCsP
 m8C+SUeRTpnTInImx+Zk2XLLZ/p8jjLHSg3OhMs0xjfHIN8qgetWC8N0pdDJ8troA68=
X-Gm-Gg: AYBFou2IUNxMG2zwDC+sQIfUjL3CBfLVwhdXEfBvgI2SxrnpQae3PUYZj58AC5sK/Wi
 RB5DWwK+1OMqluH7oRNkPREvdMgF9Gx5cYaMZlqL6bk2kdr93aTBVs/Z8uJRDcQhHwhDqh37SpW
 8Ymx291hnhKabeanRsAHeN6YpaWKd+KYblXXNJgs+nmHsdFDqV209kfjV315Q84+vL8Cag/shGv
 5VUp+1jLzw0naQbJhOkZytNRuHKB+eZDHuiXrQLVKoF6LzUtFz8CFwhSiQMdIRl35RFVnA9VV0C
 /mbR8FBqqta0jYreMHf5th6mrB+KT3RZ5yIuf7Zormu25dqMPxQKdktX/1ge74Ox4z/9juY386t
 /1ROlRthyphvknvoVy9ob1dOaL8VpFHY+1vXrc66ymTW7fWq/tOnzN/N/rYyIDy8/UT4qfdpwi6
 YQbToiY/K+mk042ddRmwIJ197rPfHdJIHdsnITyQITIgJWFNBZkeOFnO5T+8qLvOI1O/E5+34ts
 EblRWTOCJ8qj7eFAOqTQPtbpt+oKOvdyWjX0ie2JiqflHRgWIQcSptQf1Yh0jgcqwvzVjOta7ix
 UWIOSnlvXpOZPPbkwf8U+1bSieCuviwVOHzYwubhFWL25vnQhU7puyIH1n4ATiHtl9TEU7c2Blx
 Hu44kIMXQ6CL3CKnmOFnjEmA=
X-Received: by 2002:a17:907:7b85:b0:c46:a72:e0c3 with SMTP id
 a640c23a62f3a-c5096398905mr356309566b.16.1794620638353; 
 Fri, 13 Nov 2026 17:43:58 -0800 (PST)
Received: from SMOK.angora-ide.ts.net
 (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 17:43:58 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ElXreno <elxreno@gmail.com>
Subject: [PATCH 2/7] drm/i915/vrr: Fix the pixel clock overflow in the vmax
 computation
Date: Sat, 14 Nov 2026 04:43:30 +0300
Message-ID: <20261114014335.2132756-3-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114014335.2132756-1-elxreno@gmail.com>
References: <20261114014335.2132756-1-elxreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:25 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_vrr_compute_vmax() multiplies crtc_clock, which is in kHz, by
1000 in a signed int. A 3840x2400@240 timing has a 2342.4 MHz pixel
clock, so the product overflows, the quotient turns negative and vmax
is clamped to crtc_vtotal. vmin then equals vmax and VRR is never
enabled for the mode, although it is within the range of the panel.

Do the multiplication in 64 bits.

No Fixes tag: intel_vrr_compute_vmax() is only called for a mode
within the VRR range, such a pixel clock needs the joiner, and
intel_vrr_compute_config() takes joined modes out of the range so
far.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e59345bd1d33..a5a5d11380a4 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -416,8 +416,8 @@ int intel_vrr_compute_vmax(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int vmax;
 
-	vmax = adjusted_mode->crtc_clock * 1000 /
-		(adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
+	vmax = div_u64(mul_u32_u32(adjusted_mode->crtc_clock, 1000),
+		       adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
 	vmax = max_t(int, vmax, adjusted_mode->crtc_vtotal);
 
 	return vmax;
-- 
2.56.0

