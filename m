Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F301CF483C7
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDA410E553;
	Mon, 23 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmNTlo02";
	dkim-atps=neutral
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2410EC0E
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:17 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-46701f2077cso2599816b6e.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408256; x=1774013056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26vMP3nfkpOdAIVisqGbQnZnw5iiyCO+aaCVYuAOEzg=;
 b=WmNTlo02SCBpoSToy/6YiubusBXVTTjAKS2GiPGp4uAeFePbVPdIPs8Hv1pF7u8ocA
 5ZOI48Ea/8GL4U+x6fCBUbpJ9847PoYXtl25EjbSEwoKgGYbZkzd6o33XHjsq+uHMVYE
 uFsrjtQDxkOwuIpODyW4ONx5pMEvKeM74PAiVpnnhLj+ZIYtRoIEnqGL/8d69eNuXyYb
 cLfVPs6rAacPNDHzpVbVphebvLF5rYWtgRZFtEVMh9rwoeBcySu9mAAtQkDFlaYTvarB
 No8wqECDfv0LVqUwEU4Y+roUlORNxIBVnTY5L4okV/lHA7rDfyzcS2Cf/TFIf43w7B9N
 RdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408256; x=1774013056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=26vMP3nfkpOdAIVisqGbQnZnw5iiyCO+aaCVYuAOEzg=;
 b=rCAbBs9O4+8xIeKeznQXTQVxcN/e63Ryi+fABL3TOcc5mwAk6SgEV+EZU2J7RcJ3aW
 0ZqJTqW+TWyUL0df5uHf9rAw3dZ+pqRqAC5DgFdIl+42viK/IH6GeNDA+GHSXW/md1Eu
 TltwIgk2QUnUMtYR7LYggZWxOxBm+IwWJJ+JkXWmkpIG8RODTFUAX285ZlkI/pNNUgPE
 j7AT587YM2mwduz31c7fEAcLPN9rRDX5LzEomanR+6Ncnj1azjaIrPi+KWRpc2+Sr1hA
 PNIK0HgK4n/ie3mGe9Amkv0dNS/hGZ/9iyOcP7My7Xyh1sUQw0TrCg1r4gHxfaf+fAo8
 o8lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTvvzdPIuJlZhQjpyE5Tx9fSA64KFR8cEmtn6+kS2YDvouXjKoMCfHaopPALEIHxKPMBCccNNudSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmxts703Es9T2wYw1uv0yome5UgW12RipskBXru1ybXpk2yl9D
 DiGABPVjMkkQt6Vep2yLAoWvEpOb88A+TzJuyraOk/wembIw0PzreGcq
X-Gm-Gg: ATEYQzwgu/ehZNyzz+gKPkfjwW7UzxHVJS4XdlZmfddIVrfYJ5HhLWS4wrZ1Tf3w2LH
 NPYLmjmYf/iVZVtooRPWcR3SEJ3b4PMaWAk+Rp1eBbJyvEzlAsAetWtH7izZRsaL6KbYZ4+kyv9
 OR2SPjnFNaCvEOJxJxCtWVhDilh3Wa/TvG81D0kIxnIv0Qw1ZiARNg4LQ6KLTQd2HPccrtZbjZN
 nhN7kWtL9gxjGsAp8diAziPDVPBrlCoerYz7/Ss4dvC4OCIzLRmp1vfmGDWKk7ZY9Z4hrBYdxaK
 a/1xy4gTf9NPinzFkZnWLhT/CrLOQK3BOhs+wZd5m3VoPiAig1q+yN/KQuEuVv75++mrnuJbkiq
 F6JUnP9BNexxxOIPQOyM+KGD9jhmZNGgtvUsEvg6K3dNSu3TlSkYCiKaAk3Lr2tdFFs+xbSW6wl
 mnLch1fZQJslzjmPDPyWpQ56fd+gRl79uDh2znfV3VfUT3rnuh
X-Received: by 2002:a05:6808:118e:b0:45f:103c:2478 with SMTP id
 5614622812f47-4674329caf4mr3963254b6e.30.1773408256475; 
 Fri, 13 Mar 2026 06:24:16 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:16 -0700 (PDT)
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
Subject: [PATCH v11 37/65] drm-print: modernize an archaic comment
Date: Fri, 13 Mar 2026 07:20:02 -0600
Message-ID: <20260313132103.2529746-38-jim.cromie@gmail.com>
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

In the year 2025 it is no longer noteworthy that drm.debug logging is
adjustable at runtime, via sysfs node.  Simplify the statement.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 94064ec6c229..c3df2f3f47d8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -89,10 +89,9 @@ extern unsigned long __drm_debug;
  *  - ...
  *  - drm.debug=0x1ff will enable all messages
  *
- * An interesting feature is that it's possible to enable verbose logging at
- * run-time by echoing the debug value in its sysfs node::
+ * You can also alter the logged categories at run-time:
  *
- *   # echo 0xf > /sys/module/drm/parameters/debug
+ *   #> echo 0xf > /sys/module/drm/parameters/debug
  *
  */
 enum drm_debug_category {
-- 
2.53.0

