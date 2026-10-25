Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62147606A320
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2026 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sFQkuUGq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69D010F4CF;
	Tue, 27 Oct 2026 13:16:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A43810E115
 for <intel-gfx@lists.freedesktop.org>; Sun, 25 Oct 2026 11:32:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a1df4c0966so13253835e9.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 25 Oct 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792927939; x=1793532739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KwZRNYaRjnJQ3q//ESU6BdTNHHFJgWcA5paXgJ8+8F4=;
 b=sFQkuUGq8LMkFfhqqDwhoL59GIbS+yWJjHaXn+TWEoB87X8qhQPdoryv1TvOfBpaJ1
 Bzj6+RuYeEqpiYnro960PZrabSOphbJbRqCuvIGOj+qzUh6kuvLuTl5CcZzzfzi67r/y
 2UGSSWPlJKV+Wm6euy7+RETQKOMkN++O6aNOZ5gzjNozhDwvuCLiyJqCxjbns6qB3N2N
 G4+VTdxASJUyDM4d3VnqKJ2jCt+qU+9x4QhFoxBCirtiT1TfL0FtjpN5igOlS10cjfnb
 dB9T5rkeIA+Z30SxJzdWevl/mKQa4MlvllVrB0/NRpdT13QPi6UvAoLjjsdrtiOUDo2Q
 QfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792927939; x=1793532739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KwZRNYaRjnJQ3q//ESU6BdTNHHFJgWcA5paXgJ8+8F4=;
 b=m+HzHhac0ne8Bk+RtnUiz/s1c4PkLWFIY6QkFh+qtI9M/8ns35Rn56alfUiDefipq/
 gAcdoMhrQ6fA76gf07yMXCSNixWifrf4yd5BhoHkhOv8ccnBkaveaIzMTtvqryh20Ihk
 Ky1SDgeK8yWepor6HTwgu23ZIoo14AgKpCRoXKb71KH8DBq4RLmaV2KZ4zo4UB+XalMt
 IMilsIsc4U6qFp1R4lVcvahsDm/WVc0snL4UCgw4FpBqBMd6SRZw8/48u9p/jDvCvzce
 bmTUmeUiuPmkmqvE/EorffkXFtghgri4P9ZY2ognkqTwC/+fMGq1TKG0St2q++75ACRz
 1DSQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtFTzpS6TWYTzqyZBNGkYasc6YhLbYLLrOBS7cJ/om1bjPDiwUY2VRkfSGLYIAq6V51OWcwtqlIT4=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJUyU3x0yaZl9L/68Izymz2tUuWTCMCiIjJFLKc7K/qqqwazhEu
 QXsk0Cyjf7piBxXRvfWS4PreydySL/e+O+1dr9ictTLg9ue/qB97T00E
X-Gm-Gg: AYBFou2qSf/H8xTGqi5opFw3BQ7tRdsMQj+qD4ttHi2ajVNs4+et2JZLdp4N+2N5pJl
 wb1XjRzWebAFoUuBu4NUswpW7AJ9xGTVdyNPg7xQHI2LyvBrYHW6dPQDVlkdT5UKD7Xcx1+NtKR
 B9zFoiWVJTvlXQds01FZgSeEh4fTw9zXMrQ+vK9Qv/7Gk2NF5kDH/lh+MGgLQBtf7ntJWDC8uSx
 c8jmfhvi/pu9A9qxTtcCw9pROQKCvZQo2xepv4DKnkYTkKAQmWmvlgpmN08ttJyDwhLq5DKvzWY
 z5BMKExlXwySoNRkhEYMSaz1Y/SxX7eNLgivBlxZM6LT46CPZJoV21/aq64yqdJV9ebMfO+WZwI
 /0pYnHRYajcHR5Evx72XXgQn7O9iWbj8Rvema/s7nXfECoi+q3FvPMqTN4wuBNkKFl5J/YqT7HY
 e7EzXjD9hpNVmA4KDejHiuLC+KGySjPixGpu1KqHup5zItvS8lnx3iVjLTvbRWW0ziGQ1hu7Qq6
 IsJBXU05zX0icfFPwlyO14k3b8DpP7KxFPfQDomzbgfEdNz9CkbLpPvnBc6PqWz
X-Received: by 2002:a05:600c:19c9:b0:49f:ffa2:1c72 with SMTP id
 5b1f17b1804b1-4a35ae90d8emr76649695e9.11.1792927939411; 
 Sun, 25 Oct 2026 04:32:19 -0700 (PDT)
Received: from fedora ([2a02:587:85d4:400:553e:11c0:d5ab:5792])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0aa097sm129609655e9.3.2026.10.25.04.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 04:32:18 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mail@taterr.org
Subject: [PATCH] drm/i915/dp: Remove redundant link capabilities reset
Date: Sun, 25 Oct 2026 13:32:00 +0200
Message-ID: <20261025113200.25097-1-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Oct 2026 13:16:21 +0000
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_dp_link_caps_update(reset=true) is already called prior to intel_dp_reset_link_params(), making the explicit call to intel_dp_link_caps_reset() redundant. Remove it as requested by the existing TODO comment to clean up the link parameter reset flow.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8c0d9381471..0e753824bc28 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3674,17 +3674,10 @@ void intel_dp_set_link_params(struct intel_dp *intel_dp,
 
 void intel_dp_reset_link_params(struct intel_dp *intel_dp)
 {
-	/*
-	 * TODO: Remove the following reset of link capabilities, as
-	 * this isn't needed after intel_dp_link_caps_update(reset=true)
-	 * was called.
-	 */
-	intel_dp_link_caps_reset(intel_dp->link.caps);
-	intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
-
-	intel_dp->link.mst_probed_lane_count = 0;
-	intel_dp->link.mst_probed_rate = 0;
-	intel_dp_link_training_reset(intel_dp->link.training);
+       intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
+       intel_dp->link.mst_probed_lane_count = 0;
+       intel_dp->link.mst_probed_rate = 0;
+       intel_dp_link_training_reset(intel_dp->link.training);
 }
 
 /* Enable backlight PWM and backlight PP control. */
-- 
2.56.0

