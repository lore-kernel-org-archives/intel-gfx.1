Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A9CF483DE
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B494510E55E;
	Mon, 23 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf6siehN";
	dkim-atps=neutral
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2110EC20
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:25:10 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-45f053b7b90so1445183b6e.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408310; x=1774013110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxHe4+DOmq20FSC3herHJvg5metbXtBJFuJ219tBZ0M=;
 b=Xf6siehNjFLZmeEgQQjXRyZVc6onqF1TTF0KANSL+iqu1ysJM/IcBVie0OhbepNZgD
 JIVWUUgJQ3u/d3nm4jFrBp9UcD6aA5PTkHPMbUTh//17JBrKPPWftJ8PKzNo3ZyUv7de
 Fd1VN3FR6n0Q1p6Az/4Oo9YCfm1ie7xFbsLaNtTr6MlxwRerxmfevrDwGEErEcfnSbtD
 y0DRjv8zS6+DgKKjzJ/ZrlJebW2YNHhGAhFo3e6HQrb/tzxhQdQ/r4MeQdjX6aDQVNkG
 Pw+/iz5idWPoJ3Y6+o5j3xedMJCycXyoikbhYygCvfU4UZoOWvmu3bWK6CYwUB8+LPV+
 WF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408310; x=1774013110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BxHe4+DOmq20FSC3herHJvg5metbXtBJFuJ219tBZ0M=;
 b=qKPxAdaHNM1ZxLKQoZ1PBzrO/CPNZ/HZptlzEa2/2H7qb3KLWpGhxu1aOC+Urf4Ho7
 Adnn2XMXAusX0IpHaJt2fu7vWxiXC9cjwQfajy1FJlLv2bjHNuUtE+CgDWGkvw+/t42q
 xIkluHw1k96nuqyl6lbo56fPaiYsIc4dCsLNO0I4v2pgqiBnZLPnBNHsdBviOwMi3l2d
 CzV0Ku8/1KMb2htuYz9RIpIyz3d65y8iQmQiNxrIrPH8pNTtn8O/KRBV9F7sRrt5S1tU
 MPI4sFi2bIjExVoL9I0vqluEJY+LTbAJqmCzGAauAkem0GypeKUh2owoyx4UEjSfYG3Q
 3ekQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIT7vS2Z1Ih9Bgp1BJHhZ0lwn+CnbuJbBHhFJpUZ+mvdtJxdIjADvfHOgzc4GtKC0nEL54rQHAw4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVogK6FrevaK/8y4mxPYNi397MzqU2CYL6gSW2Hn+80CsemU/k
 MvKOQzXKWVhxWrAr5OZPYsvviSi5dFANW0ValKNKjIBsYKJ7b4/TtMn1
X-Gm-Gg: ATEYQzwaCdJX9u4BZxNov9dAd2cmNPrwQ+Tz7CClYZhr318uGM40hG+DN8l6CJWGnGR
 L3hfD7H/WxCI5T9Q+z96AluTfSVztr1+eEIrhncOt7xOOSepYr14QFGkOqKENQxepWbGXyE2oy2
 HUWqMYLAP0GxosV+zsn84sxYjaCcc6UhprS8PVV118gbUgg6qzv1DUtJNiky7hbKpHpTBC0diyL
 Ox6wZa+CfMSo9ASkTS1L58/LVckPn1QjDJQhJmo8ARVx1+GkB1gmvBzc6veGWMhVG0yICNAAse6
 FKnmJ/Gp3mUP0SetaDJze2C748wnRsjG9/vN/ykjBre4p61xJyUM/nIXqoZGUiHJKQVJHoSPyYL
 YtT4XPjPRCRsjV0F9xBYWfsGbRj58/9DNTYLBqVX1p1s+zEvnB61K9esAHXjlvJ5h+SNOyAS5AD
 x/phd6Jziq5fffAGQpC4wid9OqJoC+Aucyl9ke3tK6hwncdrwm
X-Received: by 2002:a05:6808:118e:b0:467:268d:31cc with SMTP id
 5614622812f47-46757144050mr1803892b6e.26.1773408310188; 
 Fri, 13 Mar 2026 06:25:10 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:25:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 65/65] drm_vblank: use dyndbg's static-key to avoid
 flag-check
Date: Fri, 13 Mar 2026 07:20:30 -0600
Message-ID: <20260313132103.2529746-66-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:03:24 +0000
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

drm_crtc_vblank_helper_get_vblank_timestamp_internal() is called about
~100 times per sec, on a single display. It currently calls
drm_debug_enabled(DRM_UT_VBL) to avoid doing ktime_to_timespec64()
conversions when the debug logging is disabled.

When CONFIG_DRM_USE_DYNAMIC_DEBUG=Y, the drm_debug_enabled() is
redundant, because the following drm_dbg_vbl() already carries a
static-key optimization.

So move the ktime conversions into the drm_dbg_vbl() argument list,
then they are guarded natively by the static key. This avoids the
double-check entirely.

TBD: if CONFIG_DRM_USE_DYNAMIC_DEBUG=N, this does the ktime
conversions unconditionally, so this might not be prudent (yet).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_vblank.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f78bf37f1e0a..0dac7eec2066 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -803,15 +803,11 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	 */
 	*vblank_time = ktime_sub_ns(etime, delta_ns);
 
-	if (!drm_debug_enabled(DRM_UT_VBL))
-		return true;
-
-	ts_etime = ktime_to_timespec64(etime);
-	ts_vblank_time = ktime_to_timespec64(*vblank_time);
-
 	drm_dbg_vbl(dev,
 		    "crtc %u : v p(%d,%d)@ %ptSp -> %ptSp [e %d us, %d rep]\n",
-		    pipe, hpos, vpos, &ts_etime, &ts_vblank_time,
+		    pipe, hpos, vpos,
+		    (ts_etime = ktime_to_timespec64(etime), &ts_etime),
+		    (ts_vblank_time = ktime_to_timespec64(*vblank_time), &ts_vblank_time),
 		    duration_ns / 1000, i);
 
 	return true;
-- 
2.53.0

