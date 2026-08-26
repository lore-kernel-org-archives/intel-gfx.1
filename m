Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF0C61DBE
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 19:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82610E301;
	Wed, 26 Aug 2026 19:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lDPRqkIk";
	dkim-atps=neutral
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642D510E181
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 05:24:33 +0000 (UTC)
Received: by mail-pj2-f5.google.com with SMTP id
 d9443c01a7336-2d6fbdc8772so3059265ad.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 Aug 2026 22:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787721873; x=1788326673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2iIl3uA7kRHPn8Sz3ycjaBFmA0XngwesOSx8TRlbXC0=;
 b=lDPRqkIkxtVPTcEwoCLWB88kXsB3OikqGSyE6WlWTJ1wykSxCyolB/OHUGjjG5WZ51
 qpbYl7P3mCFYQMyIZ3PlFlHNF54DCHG1eXRrce+PSJOdzDBp1qx2As03HJtrUUoi7RNN
 akvGOwzu5S1qym20Ch1H9gfNZNEXRXDlTZhiy6LFMVuEAzp/YkFEvxEGUlAVR1POuzMn
 oE89CSKdccIZbHSclmWyPWBoAWQt7zJlrXj/ssIC1vGQ7TfENX30Kh9hu5k99GMAmBKq
 6G/zG15pXgVnpAyHhrC7Kliclh7ASTjZLPCGu4EyyBeyffqPJ7kt9K4X2AObnxOog7ww
 9Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787721873; x=1788326673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2iIl3uA7kRHPn8Sz3ycjaBFmA0XngwesOSx8TRlbXC0=;
 b=I5WHREPFD46AIr7dTCb0EmppcVcm6yp9QRTYlW08JAoVvB7i4o8wEnDpWvOVHOyW+S
 66GpE7liRWbA+UAigmqO86+7hEG+Hjk4w9tLZOha6dQ01FYimD+Ig9EdPJ3rgmhag409
 2igZhLiDfo8FSttLZQfkB5bir3TIZdOpn7tLx6z/uc45KEyJ7SQ8ESFxmjwSV2EOWwVY
 JpnXMAaif3mHwQIyKiJKBS4bGWC9vvLl/JnfLrcN7Fgm/1boPB+1lKQ1PKDc1CYBmrFu
 sMaiibi3mpGaXiCZrLTn7X1tVW3UktAH9++f/9Ik0zIQcvLge2+EY7IzShTe11/7TCt1
 9z+g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpumWK268x+kffYFpNcfnvYjZ27Pf9qZYyole+KDyHm0C+lkNKJmBCGJLsOS+bBnAA7CcBzQEv8jZg=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kYSALF+GN+rcUoMtyl62Ea4SSTC0cRLsKZby8qBgxflvAGBbJ2
 brTaFc7hiZk+U0fZO4P5f5Hr1QZx+np9841HdqyfXSoQJdyQu0sPMIPg
X-Gm-Gg: AR+sD10MTotjsYkZMSPEc8XN++6mk4AybRWQz63xVlhdU3T2Xnoh42gf7QJR1o3xL85
 QknnIH4lD52jqXbBYzTl3Gzg9yerLAyAUoIkpB65C1+Dt/NHiOm727aTq1ofeP1vCg/hozm9jzQ
 /IjeLPBP13IwfY6J8yc/vavoEirwnBbOKvH4oXfEJX+bSZpji/M4rXnVJhsH7PsnLJucdK0U4Fm
 oXhqgrBUzCcpZuHmK/FnCVgNEfL2uOMGCQt6z6K8fjeUngYLX+kJ3mL2cJ20UbuTzNCcTRsv61C
 2wHSPKySd3R9enp7PydkzmqNtn3XDaz0M2Cjwrmra9XciYAf/7l6Omh/y/QRcyA0HmavXQM8hGg
 ly8sNCEoJIoKrOrvbbeC4nNx4Duqly1YAdLO5RWkAUk6W4vvxpPsPgvRKAebhib0ZUAiQFWdGgk
 ybePWzlc1QD9mIKhH3mfEksnmwKyMrtUHoexbvziSrHS5k5tybSa9swHKfMSG/ruTlUu6F3XYwk
 fEdhKic9e4=
X-Received: by 2002:a05:6a20:a106:b0:3cd:602e:f8ab with SMTP id
 adf61e73a8af0-3cf7576bc90mr6714349637.4.1787721872732; 
 Tue, 25 Aug 2026 22:24:32 -0700 (PDT)
Received: from DESKTOP-BDFNLNM.localdomain ([27.63.245.244])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d8dc465sm4505557eec.24.2026.08.25.22.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 22:24:32 -0700 (PDT)
From: tarund18303@gmail.com
To: jani.nikula@linux.intel.com
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tarun-tarun143 <tarund18303@gmail.com>
Subject: [PATCH] drm/i915/dp: remove redundant link state check
Date: Wed, 26 Aug 2026 05:23:57 +0000
Message-ID: <20260826052357.10151-1-tarund18303@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Aug 2026 19:47:01 +0000
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

From: tarun-tarun143 <tarund18303@gmail.com>

The DP link state is checked and recovered through the encoder link
check work from the modeset and HPD paths.

The detect handler also used to queue the same link check work for
non-eDP sinks. This was added when link recovery was moved to the
encoder's check link state work, and the original change explicitly
left a TODO to remove the detect-time check once it became redundant.

Remove the detect-time link state check and rely on the existing link
recovery paths.

Signed-off-by: tarun-tarun143 <tarund18303@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 113d767e62e9..ffd39206b958 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6379,18 +6379,6 @@ intel_dp_detect(struct drm_connector *_connector,
 		status = connector_status_disconnected;
 		goto out_unset_edid;
 	}
-
-	/*
-	 * Some external monitors do not signal loss of link synchronization
-	 * with an IRQ_HPD, so force a link status check.
-	 *
-	 * TODO: this probably became redundant, so remove it: the link state
-	 * is rechecked/recovered now after modesets, where the loss of
-	 * synchronization tends to occur.
-	 */
-	if (!intel_dp_is_edp(intel_dp))
-		intel_dp_check_link_state(intel_dp);
-
 	/*
 	 * Clearing NACK and defer counts to get their exact values
 	 * while reading EDID which are required by Compliance tests
-- 
2.43.0

