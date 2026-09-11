Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7F9C88E58
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2026 15:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21C910F667;
	Fri, 11 Sep 2026 15:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="dEZ8uZxs";
	dkim-atps=neutral
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1EC10F663
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 15:05:10 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843c2790ccso617797f8f.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1789139109; x=1789743909; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KmDwdyq9Q0uxbSq8SDMOz/Ug4vndqaUQy+VL3xEV3E0=;
 b=dEZ8uZxs249XdRbgQv1/dP8lLP3TbJbzf3Vg0MEnMjzeFSwCDM9qednXZHo1Qu002Q
 r1V4cbUiV1ECQ6LOLJ93jwaYRKapaoSWjsfhW5sO7RQgDJwkj0Zc8CiAAZ8rWDNRc8b4
 PdCPqSIkEBkmjQkkZxEcpe5NtQ7gLbbyYRBlb09GCGlzoOzO2yM6OmzO1/NkLK35XebC
 UVUbnEG+tLkTaDO3dbrIVo6PLiLXRAMx6I+Px+19K+MnfTtm5alPjzyQsRD/K838YZM9
 rFVAOa2NqNo9KuyYbWCCKJGf/GUvaICDj5ukI1jt5f8+AABukBFjwSMYXYzknhlyxpUc
 DKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139109; x=1789743909;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KmDwdyq9Q0uxbSq8SDMOz/Ug4vndqaUQy+VL3xEV3E0=;
 b=CKIGwoquDgZEXYJ/bA7cazPlxFkntLGm8Q/tvRQpMbAn4zefm3KxvqaIDCf1HHfJDr
 Z8/H/z+E4NiNS8ZsBsYVWdxwrurnQ75XNrjuS4E76K9d9Br/5Lyn4J7htlIj+sL8EAIU
 w3eddDqsYPEyjFgp/sVL8IUyGdHMUjN3AY2j45+0QWLiufYYi9LJd/kFT2y0Phxxy36s
 gPSoBPFvsRsdjvjKhs4JH586sk+KmuSgYW2ewCz7AgwEpwr1GQbxaSokv5DjxIu17Tu4
 GzFH2rSk9ICXF9TvNjKu08VKBUa78ilgo8hz/exGLaivpeNkUm5ZT7Czq4OCLfBUpK6y
 qEbw==
X-Forwarded-Encrypted: i=1;
 AKwUvByJ/ORfbYjiEfcXvqd9+po82TM0R87+e1eXH3DTcvnSG9phZF6IZ7VUR5u+i4LcxjM9ke+Gtbd98G0=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mPc5ol/XKp/6O5Z0XVkPexc+0MYpEwt/wZKczusKoGklCdRyoK
 SMPl6Jozk8wP8+qH5Q912LLZIxPzpeJLodB9Uk/mVLWcLaY27u3v+ct6Qw0qcLGgoeA=
X-Gm-Gg: AYBFou1T21rS13qiu8aYmqcqy9i24ELgXCohDVmRgFabUebY8yB7sXlC3KfG9mi3fNM
 PLeUXKJ2mWAU2kAKW8Zf0BrnnqSf/SQsssvVFcmU5d0uzlFGHzxF3Yhx2NHNEH4BVckpWWzExHM
 bPBZNhxpaFTe3y+FOlN8EG9AGDRrrfyy/4sSl1+RPdc2CTJcTfFVis0jbXIdlsD1WzfTLgXtghK
 JTOmMJzerd/zLzTsWg49kofBe89NaFax1H8p48GDa19NafcHv+sHXdwYDY7EINGBUUUUytvMdaP
 wjRQvD6l9pCvICCsLP+olAEWk0dI2Oz4XnPzuHdGLcDXhc0n1QaUxQ3dm4fNAyEMuK9kkL9uOL2
 r6At/SmGkU1KGk21B1pgdJQ0Vf4eEI+AWkah2BCYMPhgb6jztRHzQ7BtDVcQdZ9Oae+Iw0LqhQQ
 pu49JzIdGBLcv+6umOMY3KAIJf/g6zPSraijHzObSwgsscbAu0uj2GO4WXESlWtYugi8scYw+xC
 h9qGw==
X-Received: by 2002:a05:6000:29d8:b0:486:f4b1:8c4a with SMTP id
 ffacd0b85a97d-486f4b18d31mr887113f8f.10.1789139109105; 
 Fri, 11 Sep 2026 08:05:09 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 08:05:08 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] block: Include error-injection.h for
 ALLOW_ERROR_INJECTION()
Date: Fri, 11 Sep 2026 17:04:01 +0200
Message-ID: <20260911-module-include-error_injection-v1-1-5da895d8c84d@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

block/blk-core.c uses ALLOW_ERROR_INJECTION(), which is defined in
asm-generic/error-injection.h. It currently relies on this header being
included indirectly through linux/module.h -> linux/error-injection.h.

Add the missing include in preparation for removing the
linux/error-injection.h include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 block/blk-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 196bccf27f58..324a2d1bb727 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -40,6 +40,7 @@
 #include <linux/part_stat.h>
 #include <linux/sched/sysctl.h>
 #include <linux/blk-crypto.h>
+#include <linux/error-injection.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/block.h>

-- 
2.55.0
