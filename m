Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6725CC432BE
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 14:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 189F861073
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 14:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 189F861073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8141A6E226;
	Wed, 25 Aug 2021 14:24:34 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB5A6E169;
 Wed, 25 Aug 2021 09:13:16 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id t190so26297324qke.7;
 Wed, 25 Aug 2021 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nDYYa36hmcU1+52wobsB0AhnmKTAEQPCAuaFYGhNwag=;
 b=SigNZmWDlT3HALfmvWtNmd97JzvjZOFZ1sFfu8VwFxV0o1Ft09eRB3CXup/ympRhDz
 CREkW69WIOqc1+MPVFzBDiD1E8V+8FoSX/pwppdEl4dul6VWdTG6PtRBGm+ClZnks507
 IjJQ5tfiOQwhHwiuctxAKaX0HMA8mwu5tY+qeNl2ZugHKaezFgpU/PFL4Ew5EoZ/hY2u
 HGfFrL/e9VVPfl167mlzWrcWpCtT67gQ17lBSfKtMNEhm1jl3qdZGSMaWPmin6Zu7uTg
 ERQej76GKc6IAim0BiCwbDwy/JIs82uhSpu1bKTr8tRgDNvXt867PbYhWriftlC5toUv
 PISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nDYYa36hmcU1+52wobsB0AhnmKTAEQPCAuaFYGhNwag=;
 b=HVcTloby8T0avbKHGezAtLf58WY+bcD33tiaBzXHS0PjlwB5sGUgMAU91LCVNEgNhm
 rHZ84XFB6N+ci+biOuVKYvjW/8Au0xSrVAev+7ypJtgW6gAgkbMJrbz8uCbJQpKl+NfY
 ACiwy6n2ITm/Gmp/j5VZi+h1mSMjU5Xtpg+ufMAV60FEM7vMqd4LJurEMiz2ZXUyAXgz
 zSd1y6V107YWXl6MzcQGya+X9KRSwn1eCmeX5BeB7bX+cikn7S2YNQVl96Y7F02o7SHg
 dQ1+jpSzn0ydidGqd13ja5KefW2eP64GHarqotejcllkUFZYStw77yw7Cwb+c7e7GTmU
 4dtg==
X-Gm-Message-State: AOAM530x+YDrypqgxvRAeMaCt0oFdzHF3Pi3LBEJT6+ilUZV2uty4Gji
 RcXyP6bTa+G/MLEvLEFsP4Y=
X-Google-Smtp-Source: ABdhPJwTq98JPs/lXojj4EXvm3vcKzzdaq5QuTVHNP8eI+gMqNvVexdp9Dg0kH1paqW0QoTX6T1LLw==
X-Received: by 2002:a37:741:: with SMTP id 62mr31809496qkh.490.1629882796020; 
 Wed, 25 Aug 2021 02:13:16 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id a22sm9824878qtw.59.2021.08.25.02.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 02:13:15 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Date: Wed, 25 Aug 2021 02:13:01 -0700
Message-Id: <20210825091301.71544-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 14:24:33 +0000
Subject: [Intel-gfx] [PATCH linux-next] drm/i915: remove duplicate include
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Clean up the following includecheck warning:

./drivers/gpu/drm/i915/selftests/mock_region.c: drm/ttm/ttm_placement.h
is included more than once.

No functional change.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/i915/selftests/mock_region.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index efa86df..7579300 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -6,8 +6,6 @@
 #include <drm/ttm/ttm_placement.h>
 #include <linux/scatterlist.h>
 
-#include <drm/ttm/ttm_placement.h>
-
 #include "gem/i915_gem_region.h"
 #include "intel_memory_region.h"
 #include "intel_region_ttm.h"
-- 
1.8.3.1


