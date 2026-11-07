Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A3606A31C
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k344ZHXr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8903610F325;
	Mon,  9 Nov 2026 13:57:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208010E134
 for <intel-gfx@lists.freedesktop.org>; Sat,  7 Nov 2026 23:06:38 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3b09c07b3d2so44777a91.3
 for <intel-gfx@lists.freedesktop.org>; Sat, 07 Nov 2026 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794092798; x=1794697598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:from:content-language
 :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UQnzYFxAOJKkpWtTfKgcH4cjgDxirCXKastrMn3uBO8=;
 b=k344ZHXreU9nECQaU2LzVCLKVDzXkRzk1mZpJ5v3Dbr4ecOE8NQBw4SQVMPOJswJ3a
 aDs5S4+XuQP/mrRGVq6CRTVPTrdFYnUTwCHaRPcKrC/u28zTFUjNpszGFZhBPfX9fu1a
 k8uoywDd7M6JBnirXRqaoZZZ2Ud33piOpPeWBDqn5FvccUZdJqExI+5a/wpEMlK3FeRo
 8sXmiwZYj4GT/qeTGKNT95cwXvYRWRH6nB/CfCWlxFM6g13B8+XL6lk/No+BzgeSCrFb
 ru6HTeKNjGGHf7dt9z6Evwxx3t7faXCXhh/aDwJWbFeJ1MwF2/KWu2wvG4UPwbqJR/U4
 10KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794092798; x=1794697598;
 h=content-transfer-encoding:content-type:from:content-language
 :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UQnzYFxAOJKkpWtTfKgcH4cjgDxirCXKastrMn3uBO8=;
 b=YWP4lHfYdMhwNaVdzYKjHWmr0l8PurlitMiX6UB0HIqVR/Y4PIcDSORZTlGzzYNKB5
 oEHfc75yC7Hxf3VfRFY2W4u/TlOgSTeQQuRrAG6zpGozkznVbbivkIxfrPj3st5SJRWA
 Jb3rfDy1Bz4CxcRdgDYqBXGg1fukZrsD4JdPxvIdIKq5JPkhaDG+iaNY3UDElICFgg9z
 6fFn7a2ql+uAtzY+OskoqNcmVraNHjAX78nOkuKgTQ7SnqGFYREArrYSma9A9kpKp1bK
 9nuSlfK3Q+ySVHyqplQDjl8w51inYiAiusO64Wwey/p6+4QHgALbo3/qMW1S4H+DZz9a
 4y/Q==
X-Gm-Message-State: APuU4Z8IqwlDSMwmqfu9sY2IMaP6Lk7Gor8Hx1PEbwtG19uQHoyCKc1G
 Nabu4OVN7owXkgUjE+l8aguL88zrP84LL/HGPBnVEoJ5D42Trkmo5CSymYyzD4zD
X-Gm-Gg: AYBFou0rc1Okwv4yTImul3lAp4OgPHc/0upnNMLWDkvIlUZkYZKHyAUc1YLG7/b/3PY
 XiiGmSXhzV8+Sb+qx+4GGkwoR6Hy4qY/sWdpZUjg30uudFuQhMvfhtJmUFinuZc8YiZUza07qNo
 5UqDohO69xTulUfTA+ek93oTpfyVpFP6ePLUpjmJkWtKFB1166hcUpIRDMTGudyjVp1lUTuAAq7
 YjbAvng8yqnw25dz0g7mX3TyYrs/GxNgD/Bfhdcvn7KW51cnaIxhjytABAnJ8IndnfybG9TxFTY
 wb8A2Fkc1o/caT/81NDfUACOTTm8yRDUxYKL/Qio5c3obdSnH9r/03+gT+rZ6HxsWFeR10SjQla
 ujbJAz52xHj1+2072NQG+E2el7+QmVMhcMCfOPCeLbnIuzGVe4Py5W0bfSkTSg8Krmgdixw+Amz
 0xWwrULYURjoThsWaz8hqtanxNxk9GjIiclWEL3PXheZlw5UVEALrtw//eQ/RaFoq4idX91wuKo
 YR+QzEoCSRDU8S/d2SW0JAyGX7uSLAfTr2H4xsNMKBWEgRPMHFsfsbmk9618loBNp0Ip06NUbmX
 eUTme7GRB1ezHNiQtFmzP3whYhcuRaFHwMM4axcu3jFhH3AwDf9BFbkS6ZgoBHlw6CSHx0nOxbC
 rK7au7Viv8XmZf8dNw4S68kM8Pvs=
X-Received: by 2002:a17:90b:3eca:b0:3ae:2969:903f with SMTP id
 98e67ed59e1d1-3b0db70517amr6641261a91.45.1794092797901; 
 Sat, 07 Nov 2026 15:06:37 -0800 (PST)
Received: from ?IPV6:2001:569:7d38:200:979:7485:a7c:55d1?
 ([2001:569:7d38:200:979:7485:a7c:55d1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b1058d3310sm4614213a91.15.2026.11.07.15.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2026 15:06:36 -0800 (PST)
Message-ID: <5fe58549-2d21-4ecd-b4a2-f02b1bb90e30@gmail.com>
Date: Sat, 7 Nov 2026 16:06:36 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/fbdev: Preserve visible size when reusing BIOS fb
Content-Language: en-US
From: Zheyu Shen <arsdragonfly@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:35 +0000
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When reusing the BIOS framebuffer, intel_fbdev_driver_fbdev_probe()
overwrites sizes->fb_width and sizes->fb_height with the framebuffer's
dimensions. These become the visible fbdev resolution.

If the BIOS framebuffer is larger than the mode selected by the fbdev
client, fbcon consequently uses more rows and columns than are visible,
leaving console output outside the scanned-out area.

This occurs on a Broxton ZimaBlade 7700 with an MPI5001 panel connected
through DP-2 via PCON. The firmware provides a 1280x1024 framebuffer,
while i915 selects the panel's preferred 800x480 mode.

Keep the visible size requested by the fb helper. The larger BIOS
framebuffer is still reused, with its dimensions exposed through
xres_virtual and yres_virtual. This matches the fresh-allocation path,
which also preserves the requested visible size.

Boot-tested on the affected hardware: console output now displays
correctly while the virtual framebuffer remains 1280x1024.

Claude (claude-opus-5-5) assisted with patch preparation. Copilot assisted
with commit-message preparation, building, deployment, and validation.

Fixes: d978ef14456a ("drm/i915: Wrap the preallocated BIOS framebuffer and preserve for KMS fbcon v12")
Cc: stable@vger.kernel.org

Signed-off-by: Zheyu Shen <arsdragonfly@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 219ee17de3f6..5c043172a35c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -324,8 +324,6 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	} else {
 		drm_dbg_kms(display->drm, "re-using BIOS fb\n");
 		prealloc = true;
-		sizes->fb_width = fb->base.width;
-		sizes->fb_height = fb->base.height;
 	}
 
 	obj = intel_fb_bo(&fb->base);
-- 
2.56.0

