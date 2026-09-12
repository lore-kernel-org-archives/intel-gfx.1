Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A3C88E6A
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2026 00:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B0710EA9C;
	Mon, 14 Sep 2026 00:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="newOX2Qt";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3669710E483
 for <intel-gfx@lists.freedesktop.org>; Sat, 12 Sep 2026 07:29:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49e6deb520eso3511645e9.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 12 Sep 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789198188; x=1789802988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PXc+4SKfKNKk/rs+2uET25nPCHn0nrmdn1gdEMSeqW8=;
 b=newOX2Qt0GWvn8kt16iHhxAAJ22kU2F9R+Ylfpy5KIsh15j6pFtejwS4R3BRaco+T3
 ZpLZ46OOWruGH9tfxoMKl4DfZBaQrAP/UgHng8LOcfK57DGiMDlUFtwe9EI6OQvBeWvZ
 wgFUqcDFQP4dK1115YUgy+dDYbheEbJwxPPJem+bKNbCHdTIQoopIGXwCBU65K8grkKn
 WC7tuGQgZl5X8WnkY3YW53qRXc68ff49skKwqGkuAwxZXGPKiQDV0O1vYAyTjIwnon5/
 A7RySWmwAovKus2zuqMVOb513NhUYl/ZmNSog98o21sL4GKhJrev49ZdT6N3zOR0vrpz
 FZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789198188; x=1789802988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PXc+4SKfKNKk/rs+2uET25nPCHn0nrmdn1gdEMSeqW8=;
 b=exqq7y8WGYYQYyoukV2xHy7hY5O0g9asBJ8gVYunvgB29l0m/YKgwBgPzWDXWZO+DM
 WT7Qf8U/VqkxS8lrkPTW9BnLaCRYImz9U/UgOaEi+KHMERo5pG3QOS2h1ymSlV8i2fPM
 r+HOZSPyc1Xy+NeeSxM0wXGpXearxt+oEG+6Hxd68sFPrUJHmOVrPPqlqf4NQq7AcJay
 hX8Fy8hgpyCq5cW5M0tWUIwA85txTTYXVld0oBy91a+nkvLUnX9Q3OQ4xyKtL48SLS1Q
 YF7XBgQhcQQjziWplTG8AL0pCJNrEvYbsXTvdNRAp3Cme2A+5XFVVzlvVvXK1eK2pZN0
 xjmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcExWnk3+Ix1wJOuBRpxtzlnCSvSHc9AbSOLnYLi73r72tgQv3EZOj2a2pfQOstuMMExQ76jVBpH4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kiu6ra73WEwXArltVEVJO6QoQu9DI46JCkQjx/1kcSDO0sfjVt
 ycvIvy82STXfXPe6GnK9Gmli8BvohkJmkTAVaQmJpxLhYEZkjLgp2auj
X-Gm-Gg: AYBFou2ryGB5pw1LNsimU8ZR+G1IqJ8wxCC1AKjQFPkYqh+fb7JE25Qd9yspE6IfkBh
 8RZub6eN/Y646aahxBWG3M1wUGFunkGifjEzGdWGRvGSK0rbq5jvJpJtHZ/V5t9B3V5esy0VvO3
 pmd1LeDEC75DEGWt+mEl1/z3MsQ6wzpNTmN4pQUpTj9wmFuRgK6rPxRInH0p7ttslHh+FDbEctp
 dD5wpes2qjcc7ID5KxHw0o4B2dRcBf4l1rkjPAKS4Dp3oJOLGAZDZX3dijm/chfAy6GcoecipuO
 IoEbpBXDW6iVS1qXNirTC9jaED5y4ORhYLygkcyBgvxEUxfZ/T3mAU3U6FXeR0GjCqtZrilJA3H
 a7yngueyh2iAcnVV0hy7324T/NUl1Wdml+bD9AIiCJHWp972sg7z/DpfEEnu0+Uh0VOu9jUCbNw
 KNH0/qT3/C2nQrBs7FEqkdma1O+fRiCu4yyme+BgAUjzYEpUJ1HgjV6Qj5cTi0R5yOehD1DfUaJ
 BCa0U29AMZhtgcoZuCx65tlC+rpsKo8hLBR3FlaKd5zkGm1vsRnRSGn8hf5VStz7IGx8RKx7btx
 rsvPYOYWK8y9QQkowBDRQy6Ps7ulK5V2FrZh34EZR3V3SDQWq5QTTAK0YwsAiHWf9h5bQmbp7Bp
 1Zk2lVqY=
X-Received: by 2002:a05:600c:4714:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-49e61988b9emr84737275e9.10.1789198188447; 
 Sat, 12 Sep 2026 00:29:48 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de.
 [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e6499d57bsm171373105e9.3.2026.09.12.00.29.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Sep 2026 00:29:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: Fix DPLL reserve and release references in
 kernel-doc
Date: Sat, 12 Sep 2026 09:29:46 +0200
Message-Id: <20260912072946.50769-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Sep 2026 00:33:38 +0000
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

The intel_dpll_state documentation still uses the former reservation and
release helper names. Update the references to intel_dpll_reserve() and
intel_dpll_release().

Fixes: 2b3b9a8faf56 ("drm/i915/dpll: Move away from using shared dpll")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index d408ccf6f9025667177e411e5c2cef72cc30aae9..cec6208fa7535ba77c203999bc75b3c077a94a5d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -302,7 +302,7 @@ struct intel_dpll_hw_state {
  * future state which would be applied by an atomic mode set (stored in
  * a struct &intel_atomic_state).
  *
- * See also intel_reserve_shared_dplls() and intel_release_shared_dplls().
+ * See also intel_dpll_reserve() and intel_dpll_release().
  */
 struct intel_dpll_state {
 	/**
-- 
2.39.5 (Apple Git-154)

