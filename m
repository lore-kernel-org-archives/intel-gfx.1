Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9D2CA5FE9
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FB710FA2B;
	Fri,  2 Oct 2026 20:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="ErPMe3zF";
	dkim-atps=neutral
Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com
 [74.125.229.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664DF10E686
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2026 19:40:38 +0000 (UTC)
Received: by mail-dl2-f40.google.com with SMTP id
 a92af1059eb24-14f381f0424so797915c88.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 02 Oct 2026 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790970038; x=1791574838;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cik4OmGCLcSffV9aIni80ba9p8veycKB8eAV/ioP5eU=;
 b=ErPMe3zFoNPj71oqQZxaOfkvJcPEeqdNIs83wW1Mp2UPFzOEMpQzva9J4DvEvjYgnk
 VRgtK0hoKuZrWe0h0V9op6b1jF6mxbQOUQ3ntMpcrA1+J7Ck0P07nenXVKywf+ZZXDnY
 GqSQp8IeFDpj/Dwd723RnneFm4mKEUnQuey0rPdwkXQ4Bx/nMjiaEDCBzD0y9KLZT/oa
 b8Qp46VGjC/BQf9dfpNHOu5cELqSJOe+aW95/WtIjekL4mNHBhA/0KWWPJxPJTjjewXo
 +T4z+NCCMRH1oZUJTKGYwExNnq4YGIXf7+UtgxoE2y8eAZYy+Urzj056pGI9hvD/bFlw
 5IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790970038; x=1791574838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cik4OmGCLcSffV9aIni80ba9p8veycKB8eAV/ioP5eU=;
 b=ZEPDvon+XqZTWCyVJNUNfNIGImQINRnwfpUgMoz2V1F8/Ho7kRRmfkBikQR+Mdjryo
 jsr/OnrHRvI5D7P2nP1Q3C7MicxA8rvg/O0qi+h2rujq2wZxnqptDBHDWN/ldxrqGBe2
 Cg1b2atp8f1GDa4zT5uqFHVslvyyzxn0wthvHDaD2ReeBzATT7BDGIe4iqz8BalBnd0z
 rHXrOP6EhpQPqVU3DACgKnKiPpn6ctvThOjToUVhR+/HqRNpiRh7+SMDyaaJgl268gxg
 2xuTrImCbZ65q+WzPTrUr19rVvFZ6PxUqHOkBH1SLEjwhwZPelAHvRAROVjC7ZES+cir
 E6iQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXs2xRd+5C+32bk15AiAwDodYZS0ob1Kjl+BWsSYI7YHgp9L6KKUqe4OFRO0TxEAz447HMPlqXeUk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mBTHtDaMV0jhFdaMg2xujLPKaYYnwRkuyP0XDVTF/saTtCOKVV
 H/+Sa1umWhBBqftYX/uXQTqZ+poMt1yvk/PkzSUOVjCvUfO68nXOfhaDXuump28TzDM=
X-Gm-Gg: AYBFou026UFeZHbrPSRWHCeDTnojJdVka/XAmCmOsxwjgqc2R23l8KtQzZFcBgjfxMQ
 77Q7JqKd5A/Xj8ayEEb2d9RSOtF/TtftN6/wOOeHaVlhJz7TvST8Ni67aMmsB++r8g1NsmeMmGg
 3MgXMYgZFlXeHOTkg6LmyIprQzBAL7BItKWk/oDFuJJpcLlLuAoTxkQb/7pL5vpkF77Krk1YsXa
 kaq5ntT0bnA1XPxjZdKnTK9wqCP+f3kII8OkzTTbr+rYKMnusjPo2kclqBMtJRIfq/+I1d7Nb3N
 u4lE3yK0G3KQ4+opclGV2OibaZdOxNOW6x73ZO9X110lVt/SYuwGLGze7UwcGVejy/LEmrGX6Al
 iSasqKV7rT2eg/u92gsJWssapM4c9LHDqurPMTa7WszX/ZH+SnN4CUPzO1UJ0Y8ZDkDHJqqxAdg
 IBcXPDRDvvoxy5s87Ya1FYFuyZLF7L2y9YNtDR33Ml+fjyJN8c86mmbGenF9mBj1ZaEmNYy1Fja
 h6NAMmUnOlTdg775qs6EhECNXB0jbTvgPeAzEkaWtSFWEyaQkhvIA2FsAxJ/sv5xWgad0iVo+ca
 mUI2YA==
X-Received: by 2002:a05:701b:2096:10b0:143:2719:566e with SMTP id
 a92af1059eb24-14f5d3b9a1fmr3905150c88.42.1790970037645; 
 Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
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
Subject: [PATCH 6.1.y 2/2] drm/i915/hdcp: Add encoder check in
 hdcp2_get_capability
Date: Fri,  2 Oct 2026 15:40:27 -0400
Message-ID: <20261002194030.20489-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002194030.20489-1-artem@trailofbits.com>
References: <20261002194030.20489-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:45:17 +0000
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

[ Backport to 6.1.y: upstream adds the check in the DP shim's
  intel_dp_hdcp2_get_capability(), which does not exist here. This tree
  predates the intel_connector conversion of the shims: its
  intel_dp_hdcp2_capable() takes a digital port, and the
  intel_attached_dig_port() lookup is still done in the common
  intel_hdcp2_capable() helper. Put the same encoder guard there, before
  that lookup, and return false through the bool API when no encoder is
  attached. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-3-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53050. It adds the same encoder check to the
HDCP2.2 capability query, which the debugfs path calls right after the
HDCP1.4 one.

The 6.6.y backport went out as the same 2-patch series and has been
picked up for 6.6.y. The fix is already present in 6.12.y, 6.18.y, and
7.2.y, but not in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53050
Upstream: d34f4f058edf1235c103ca9c921dc54820d14d40

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 507721c94f2fdd..d31c1f1f0e5074 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -208,11 +208,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 /* Is HDCP2.2 capable on Platform and Sink */
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
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

