Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F78EC88E72
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 12:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1E910EE67;
	Thu, 17 Sep 2026 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="XrnN/ayq";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF2B10E2D3
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2026 21:18:33 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so2451825e9.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2026 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789593512;
 x=1790198312; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8c7Lrwf6LLYMTB0zxM6IKxndmvRTeS9nJzIt6c8lINU=;
 b=XrnN/ayq1WTDX10IsxxPHPFBuqBGLVubeyJDRItcR29CKupXRZnu4Vx3FAKnhYQFek
 +i+zCQs+5/WT8gAp6zo7pw2Kujz7apN0cvXSF5GJDLKzC+0Nkbtpe/rehGhkJnAjBvI7
 PznlHj3Q07qwL7YGvja3SZLtdn1k3JbI86MbGZy1Ssc7kRMXB8uh+gFGJTsTw5/u+/HD
 NVNteJAICcoQBTtjAHWYQFLhmg0RCvELiYKQlRfMkkOBmRPIIO1GRAV7svkL56g4UyQB
 upaJg1PNquMludcjRv9EZfZfzKt6H1rC4F44rprQ9PzlO4/+sSE+w0xKE7pyu1M9YAr4
 CnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789593512; x=1790198312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8c7Lrwf6LLYMTB0zxM6IKxndmvRTeS9nJzIt6c8lINU=;
 b=nwOag+W8duJHn5q4tfdeZQCzW8fLCJHZLKjH5lpuF34USDptPOayTvT1nqyaaIXBWm
 qFSgeqj6ceF6QnbdDnlsVGxtV/PqoPKEqJWjqHmzPM0g3yd5eQlVzJWr0pJ5R2AOi6vA
 PKJGd13CVrUBtG91wgzR00boLrXyOWCuWz6NI7uaedscLgl9IJiEEuj9nXDr6+T9FKER
 t4QtgSG0xTNzcj4GI5sRGGCDHzX7xpf/EQhjsfnP0ncw0rlgSbd86Xt23GLgddD3mT1H
 l0u17GoETCCFvgCgCH5nxEtZjW4LWtfOg6IdA8lxSIS5HcE4PSgeQ8ss8U+DLERNkd7h
 Lt0g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwaCaSUnbWAOgD4RzQKr6ATYib+okFsUD64WTLulNTJ39unk/7qKx+aIF9lUSuIeZJ+KYXf0RAI6gk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nk9R1i7Tdv8K0j0iSwEORPOhXgbfKLcGzpf6WSrj6q6PELLJ5k
 nvso4xX4jqqN/hK1oGY4xzFh2nqvzp62HQgjhEzs0dY6rbcJ7iR6qLtuFLYxIND58WGV13uJN5e
 /euIzLQ==
X-Gm-Gg: AYBFou3S33rVYLdUFvMg1M3JPJF/8/s57coGaPe9/Ai+fo55lmRLfm3+A5P5m+1MQC8
 nFFSDwl1dWHT7ujL9xvRNR+UcUaOFxuNUfhIYDsJfgZNf+/x3i+ASpV+wypNfmNE9ulYHmtM7g4
 Da6EGa+qRjAlMokGkR0cT99NmR3MpWNUioDhQaQL80pVw0e3A5jdiCRrQa7hfiVTDaJDvuaJtwr
 7wnBVdzqUrAONkwaYmNHAaqZSCSjeC+dIXjZfxumIwZ1fAL7qH/ik1ukA3Ga4Lp/liaCkQCxCC0
 4HA3kBK4PX4q4Q1ULKpRRsXOcFajqjWUMmueGWZfIMByTDHfsm9utXQlg5ZovkKoVfdYO1hjoU1
 U04IDwIXn7PRNp+f5R3fd9p8xr3Yd/iwnbNxlwFbxnJDq08yT/mTUjSoRDkDVuUgLy5G0hHW6zg
 f3sETSe5utailCJCwWfkdyEvOFhzfu/w0Niq18AnlI7dF84VN8d3mN9odDIVmI5jjrQVBRBfdb9
 M0I6995si8TmAr/32Uy1WvT0w==
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id
 5b1f17b1804b1-49ebb4297c4mr52763795e9.24.1789593511641; 
 Wed, 16 Sep 2026 14:18:31 -0700 (PDT)
Received: from horizon ([217.155.46.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbbd83e39sm46567695e9.4.2026.09.16.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 14:18:31 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/drrs: Ignore sync polarity when matching modes
Date: Wed, 16 Sep 2026 22:18:30 +0100
Message-ID: <6436114aa461b08bf0abddadf2c091c45dc81075.1789593508.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Sep 2026 12:16:01 +0000
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

Some panels advertise DRRS modes with matching timings but different sync
polarities. is_alt_drrs_mode() currently includes DRM_MODE_MATCH_FLAGS and
rejects such pairs.

Commit 2bd0db4b3f0b ("drm/i915: Allow panel fixed modes to have differing
sync polarities") already made is_alt_fixed_mode() ignore H/V sync polarity
because panels can declare alternate modes with different values and
Windows/GOP accepts them. Apply the same rule when matching DRRS modes.
Continue to require matching timings, 3D flags, and all other mode flags.

Tested: BOE NE160QAM-NZ1 (3840x2400); DRRS reached low refresh.
Tested: Huawei 23040676 (2520x1680); DRRS reached low refresh.
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 81e638d0c7b3..e79c51a1c33c 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -144,10 +144,13 @@ intel_panel_fixed_mode(struct intel_connector *connector,
 static bool is_alt_drrs_mode(const struct drm_display_mode *mode,
 			     const struct drm_display_mode *preferred_mode)
 {
+	u32 sync_flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC |
+		DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC;
+
 	return drm_mode_match(mode, preferred_mode,
 			      DRM_MODE_MATCH_TIMINGS |
-			      DRM_MODE_MATCH_FLAGS |
 			      DRM_MODE_MATCH_3D_FLAGS) &&
+		(mode->flags & ~sync_flags) == (preferred_mode->flags & ~sync_flags) &&
 		mode->clock != preferred_mode->clock;
 }
 
