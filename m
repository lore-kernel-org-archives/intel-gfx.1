Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57533606A326
	for <intel-gfx@archiver.kernel.org>; Sun,  8 Nov 2026 19:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBNyqRFU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF0910E189;
	Sun,  8 Nov 2026 19:00:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBB610E1B7
 for <intel-gfx@lists.freedesktop.org>; Sun,  8 Nov 2026 18:59:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8b612fd74e1so51191b3a.0
 for <intel-gfx@lists.freedesktop.org>; Sun, 08 Nov 2026 10:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794164398; x=1794769198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:from:content-language
 :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UQnzYFxAOJKkpWtTfKgcH4cjgDxirCXKastrMn3uBO8=;
 b=sBNyqRFUeBR2WOUbsPnLlvByYCZ4FJFz8sh0dB0yn9SQ+5o900qEWrkmAuFxQLJHb3
 noDUtqtYzmtFSlHkqT2Y3GzwYC5GhQvrZNQR0utRtJnCJJ4LNCtOgjFWITCtZ19JS02X
 msetf8H3zYwX3zlYKcr4SpqnRAZHlA8rD2hPQMMAjRlxEzTFxgwQqbQkosAX2E16wZRU
 CgyEOpuLI3oPkR+qmhleocN3eJzdnuikX2XLlI7uTKsACwut7WgCuXGaNs40CWPtH06u
 UK5DjUFHQ0kR6rkxifdcnQWmedUK5IKaSocxZXVc37HxZuVgdymtI+OOFelAedoYvlsn
 uRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794164398; x=1794769198;
 h=content-transfer-encoding:content-type:from:content-language
 :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UQnzYFxAOJKkpWtTfKgcH4cjgDxirCXKastrMn3uBO8=;
 b=s7azAf7w10LR5susw0mSurCG2ITvl2zacBwlfHDpqbtdvsVOG22/dJri8wSc2hDb6l
 CdEesSpAGmd2mJQGZntbsFEwpRX4EwF8Ndbqui1PQbLd44xE/+pg5FYz+6koe+356u7X
 amrGT+MtjXzsBRuoQAzHh3q6ta6Z6shldIeyPT8XIhGU1Y5WIgxU5BxRZpzQLyriNg6v
 TG21LmQpKAHsCwE3UCvfDHtMfTEu42y9AehYIOAbKDpwXpbOHO/2YInPn8xsaNebzRYC
 PZ0TJfaw4F5CUxhzO1w9SjmkqKtaIGdlKopITU1331NKLD2mgesMWxR38t7qe2e9yZUP
 lpzg==
X-Gm-Message-State: APuU4Z8rutiinA+yolUBAlCHn0ctSgmhbUS4xiGc4FSmt17uKF1aCGo8
 1qcdK5I7YuAMpOuAIjt7GwhUN980pjr6aTfh0Th7N116Gd2g7lpsFwwM9eKZO7U/CQo=
X-Gm-Gg: AYBFou0OanDrapipbdXbBiniV3swg8Rr+cpo8C6VbVIIm5Xd/sEg/QVN+bsW+NyHgdy
 jt64+kSnseyqzuV3tpyg3EM2P6gPXSemsNlQPgS+twzo2eXLE1C10dh0SC3kMubXhaxvP612WaN
 EIieKEoASgtWLhGpyII79lhnfUrFCc8adkUeMFqX5iDmEpG095HwjO+ml/0TYw69161nkRn2sPT
 Iuyl9zFZBHvJxe+XUQGjlxQpRvJUtoNqRlGe7Zc20T+SFAWVybBW+nvhyMUMlYmvo+oznv+muGc
 TjwUh2TXG8+L5QFES+M9LIBbZvr5yncpZPX0pVwj8ZBhv/e1+CjCh5HYeTvfDz7LxiwRrL9jOOP
 BMFvHynSFrq81CRO2AWx+cDnBb0+414PZ3FTz43vaj2IeZ7Szb6JcR7AkAtfxrMo23Bwf+y2ZAK
 D7KaQjjGC/SiL+WtodLDvCPC6/zMMKG9oiAsUV4lT3ayHxs9Qfl7Rs5Tt7bw7o8cQBVosRAxPTM
 RU/QJL+O+IKAAWbSYJHJ2PKBLvzMprHeSTlQkkhphaeZYhAgzIXd8r9dh/R5n6NbqAUGhsr//j2
 vmm5qpwf5J4Q8Z2j6SSOmx95Ks29ETh/hNBOorIrbnf5LqmZnPAaJ2l4jeIk3ZpZXiTsUm1Jiih
 40GRgE6rBbCLE2Kdan8gL8//4yCI=
X-Received: by 2002:a05:6a21:387:b0:3de:b95:d50f with SMTP id
 adf61e73a8af0-3eed3325c6dmr1872479637.24.1794164398328; 
 Sun, 08 Nov 2026 10:59:58 -0800 (PST)
Received: from ?IPV6:2001:569:7d38:200:979:7485:a7c:55d1?
 ([2001:569:7d38:200:979:7485:a7c:55d1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b646bd4430sm621609b3a.5.2026.11.08.10.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2026 10:59:57 -0800 (PST)
Message-ID: <e1823bda-ff83-4e9e-8e81-b2d0ea5c05ac@gmail.com>
Date: Sun, 8 Nov 2026 11:59:56 -0700
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
	autolearn=ham autolearn_force=no version=4.0.1
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

