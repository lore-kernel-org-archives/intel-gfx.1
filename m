Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0BCA5FAC
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8A110E96F;
	Tue, 29 Sep 2026 12:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="cyuIbM5N";
	dkim-atps=neutral
Received: from mail-dl2-f23.google.com (mail-dl2-f23.google.com
 [74.125.229.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE22310EC6F
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 03:17:33 +0000 (UTC)
Received: by mail-dl2-f23.google.com with SMTP id
 a92af1059eb24-144efd1ea76so2133463c88.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790651853; x=1791256653;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FsP2Z39yDHYgidPq7LJCuoklm/2VErUU9c6HnTD+Pa0=;
 b=cyuIbM5N25lc9nM9XWo+Qir6olmu9J8Kd/pL2X1BOfgpPkX4JguOF5xlXFWRz2mWzs
 U4HfxsG9Nc6BQ1OGyzty0DOnP7o2qha7yxC6z2voepWEHdGXcGj5wq5iwcSHuO+nonk4
 pdKFfMD+4WNgLVPY+GeTKIbDEyHYTxyK8OILFjpE3RY9r995195lPT/mcAqafvffwdOm
 oSTLR5ejfIUoDBnJc4Tzdd1jaUCuWlhBWLQBDwQ3/te0zV0Wpd91+FuiDwKI4AjunXoQ
 Oqjx3cvMGhT+APKkbTAFVOIELB0lOKGOvg16gejUOd6qXQTsTrIF+ecfec2kxqX2hm3P
 ax5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790651853; x=1791256653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FsP2Z39yDHYgidPq7LJCuoklm/2VErUU9c6HnTD+Pa0=;
 b=ZD4nGrDddA7joKpLwaoGRCnyYeNNko1xeIvA+IYBFspD03289RxMEKsSt2Yw1pVqVq
 dQGYz7Q8EK97Tk6Ssn3MIK4ebguCwNzthsjcRr6efb2BOBoGyHGGjz8ZU14KDlVXgrMZ
 y37eE7uFj5NTwixaSzAPzoY/mr/z1CjQxaz8t5+JaflGdQaMY9JFVlsoUSey5eXjwh5p
 C9kopcNXjfU9SUvJamOF0/f6MIKuCpTiz0JUygsIeVaF2pDhlnKWzWIZi9BHRJhHSZ3T
 ZmpbbSUms49OnSK6oTPQbKtu5ZkMgaYBNxElIac8bxuhMWzR62uP/lW5L4R0S6qVVg5n
 kL2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxr4cvb9z2vJ8VliOmt3Sj+WcR1RhOuM8ThtNF8hvGHXr3E0iM/vJs8B+Fq+gF5bPiWXuOLpvLV08M=@lists.freedesktop.org
X-Gm-Message-State: AFuF++m/YH0RK1xpraRKg6YVX0FC0SczEZL2ONSb2jNRKRF6iIFI6Oxy
 xyUXN4VuK4RpDf+HJzWHPz8by94umRWY3BhtrKIcUyP7BdrrsKLfAjLDhNDXM/AheXw=
X-Gm-Gg: AYBFou0OS3iglKfaQIVIm2acFiHpHAD8y8l8/+9EJG9vyoLKZ9CjxcYhsKcnBlBpsJ8
 59LavhF8uPL8QdznW/+Kj0VuI9dFStvX/iyuEdzJZCI8IK5Gq1wB9CG6zDgP+0ybNGsp2Tv19Qk
 3uRClAp+0uSJZnEKVUHGHCP/jrBxMUs21CQIKd+V/PoMEMw3YK0pYQVQUD5p056Ok5PmfgrMNhy
 KoR+OzUVx+8ZqtwPdKjgxxD1NWnO9QHn0FOYsEJDyCcm+XyvSMzWWM6YBLRvs+cs2ld7Z5njQbQ
 f4HxciV+DltaPxBAGS8ymO4pEZ4crUmMo4145C4+OhOiZB9WbypBBvk6LRReZY5nhW0Jf8GLELb
 yuCho02PaZz9gpJcRKnh09oEgdql27PKGV42rbgkMZakefyrjCARkc17iPUWYvr8qUxsPaTSDns
 uutUFqQDiwNX22/PYQSDxUsHmxvc5XpO57JYtky6x3OZeXShaiWco6u9zViqC2rSr/u4Ks03mvB
 NXzjqXmostgKIfxjW1zTo8yF/aBqRyLCuMhsb9TjNeTgwTY8+9Cy2cfPV3jumI4dyq27SMTZhpm
 cUaG4Q==
X-Received: by 2002:a05:701b:21c7:b0:143:46a6:b01f with SMTP id
 a92af1059eb24-146cfec8e21mr13180519c88.31.1790651852851; 
 Mon, 28 Sep 2026 20:17:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-145ad9e097fsm31321186c88.13.2026.09.28.20.17.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Sep 2026 20:17:32 -0700 (PDT)
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
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org
Subject: [PATCH 6.6.y] drm/i915/hdcp: Add encoder check in
 intel_hdcp_get_capability
Date: Mon, 28 Sep 2026 23:17:26 -0400
Message-ID: <20260929031728.88004-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Sep 2026 12:54:31 +0000
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

[ Upstream commit 31b42af516afa1e184d1a9f9dd4096c54044269a ]

Sometimes during hotplug scenario or suspend/resume scenario encoder is
not always initialized when intel_hdcp_get_capability add
a check to avoid kernel null pointer dereference.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-2-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-53051. It rejects the HDCP capability query
when hotplug or resume left the encoder unset.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The code change is identical to upstream.

Could you please queue it for 6.6.y?

CVE: CVE-2024-53051
Upstream: 31b42af516afa1e184d1a9f9dd4096c54044269a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f377c4484e1857..f7987fb90bb1ac 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -142,11 +142,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 /* Is HDCP1.4 capable on Platform and Sink */
 bool intel_hdcp_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
 	bool capable = false;
 	u8 bksv[5];
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	if (!shim)
 		return capable;
 
-- 
2.39.5

