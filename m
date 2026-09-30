Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF6ECA5FCD
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 13:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356F810F41D;
	Wed, 30 Sep 2026 13:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="BRvzRBTL";
	dkim-atps=neutral
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com
 [74.125.229.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6833710E16F
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 01:03:42 +0000 (UTC)
Received: by mail-dy2-f42.google.com with SMTP id
 5a478bee46e88-3411e0ace58so6131316eec.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790730222; x=1791335022;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tqnoWOKNgk3yU/myXUZ7ovtM9FCChQAXvuNXrnvE3KI=;
 b=BRvzRBTLoVmBW9wNjdP67oKkMMNl/8+GJRkcFl/Ho1BUlF2eaiLDS+6qTJ/gbu3U7V
 joDVPqCV4eCsnVrcxBRl0bmo5sqv/ZsRDbGd8NWvrn49Q2/63toYfjN4kh5BjhSkD+RF
 1lf3SfPx6maRY1qL1cv9l97/5GmhPuXaz5hea99w3ct4xa6yohb3nFN8hQHNL/1b+u0+
 g/yNdtlZwQrkQPpwia479OQ1rWrl0ARIXOnPWO9r2aGBGJNedZPOkFtOsq4JmWackysE
 IyPqkJon726MN/vEYbd4vRk7cvG0N//4eeJwO9V0ptf8Ru2/J22O+8rQeJsYfcpd7Gcz
 lPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790730222; x=1791335022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tqnoWOKNgk3yU/myXUZ7ovtM9FCChQAXvuNXrnvE3KI=;
 b=fx66tLJTsbmA8RYD2hq83fPjQ4NviSN1N6Xii3/8asg8Zad3etWHjttsWPG2z1ayQo
 xr8KPqtdoFq/qcq46nPhkaKIpAikr6IT59eP2MMU+d9e641GetzbuJ6W862HKf168glM
 FsiiAWMbxr0+o8OOLs3XX2gIiwB8egkQZdReIfPMn/g+G3xrjZ+8rpHl4GGn2DJjqlVH
 Snb91XyrdZoMnSKk9s2syVDblnKs4in9HxOgnS2oUorcvO4ii7MemSTtS873Hjsq+DLe
 OqrYHtCftXPcPQiexAcJa3K0PXGeOJPiipYJSo15k0vTOsw45sNX3HRJszj2T9/4YCmI
 FDZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzyDxsJMpJCHbG/OVxO9Ku8rYucIPb8CmCMM/Lr4XsK6bjPtMuHC0tDdYo3bnIcfEOB24EZ1Wy0Vuo=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIEmuy3bPO2o2WepAwGVp3frZI3Kcq3ED1dk2A+VUNGzpNPnlWI
 pJCPkcLsj7yWzq01RS8TIgLMii82V6fiRlERYhAlPSYvkY6PUcPkHEmx6FApXPh6EQE=
X-Gm-Gg: AYBFou0JYoogAK0N+srw3JumAieX2lgxlr2h+hhPaSoxfNLotJkYcPvVLQX+OWGfMgy
 fe1XiYw1sQ2LdQj1wugb0ghT58BacnYhRP0Nv7Y0Q7YNoQ2GuBNr5sK54uMr8Imf/9DvgPaUpSv
 WFvW3XvYZyerKAuaJ5Wpb6QhR5xaSVD/J0K1Ie4lQZB3M+ondNg/55Dqs1ZklzuhJ9aaQFcokvF
 Q++jiCPTS+BDrEo+Jpyi46FnUQiaow4uiyOp/qpakUyroJThxP8HGxnRIE/wYeR6gMrMHGdyogn
 wwI0D1YEZd7VVvfYrPvWR6UoO6cf5uXsKqHxD3JZ+2LWUSgGhfmeS/m2uf857fmcJvN4mc6GlUC
 pLqJ8OizlX7n+xTJb63IwFfjFwG4ZB+h2q36it4wwKo/I7PvoHnbZ/Ss9/aIvFIlchIz+QSDpQE
 78gqj8631vw2RB+NeaDv2l7b4nhum72ZoyISePagJ5N+fxLz6aR6hqjI5zRVSCrAqOIpAnYn16P
 Xn/pSzaG++70lUcdYte9nD+1r+BRquXJVRVxmMRgySqzwqMFt4Y91YCXsh1/LFO/kiKgnkErcdU
 T8GFSg==
X-Received: by 2002:a05:7301:a24:b0:33b:bfb7:31cc with SMTP id
 5a478bee46e88-34c66c0725bmr997520eec.16.1790730221429; 
 Tue, 29 Sep 2026 18:03:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Sep 2026 18:03:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 2/2] drm/i915/hdcp: Add encoder check in
 hdcp2_get_capability
Date: Tue, 29 Sep 2026 21:03:21 -0400
Message-ID: <20260930010323.93999-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930010323.93999-1-artem@trailofbits.com>
References: <20260930010323.93999-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Sep 2026 13:49:08 +0000
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit d34f4f058edf1235c103ca9c921dc54820d14d40 ]

Add encoder check in intel_hdcp2_get_capability to avoid
null pointer error.

[ Backport to 6.6.y: this tree predates the later intel_connector
  conversion, so the unsafe intel_attached_dig_port() call is still in
  intel_hdcp2_capable() rather than the DP and HDMI shims.
  Put the same encoder guard before that common dereference and return
  false through the bool API when no encoder is attached. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-3-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
CVE: CVE-2024-53050
Upstream: d34f4f058edf1235c103ca9c921dc54820d14d40
Backport: guard the common 6.6.y bool helper because the later DP/HDMI
split is not present in this tree.
Review: https://lore.kernel.org/r/2026-09-29-daily-reply-0012-re-i915-hdcp-encoder-check-v2-6-6@kernel.org

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f7987fb90bb1..89e378f71d67 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -168,11 +168,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 /* Is HDCP2.2 capable on Platform and Sink */
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	bool capable = false;
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	/* I915 support for HDCP2.2 */
 	if (!hdcp->hdcp2_supported)
 		return false;
-- 
2.39.5
