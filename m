Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8FCC88E59
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2026 15:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280A10F67C;
	Fri, 11 Sep 2026 15:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="NPb8/BYk";
	dkim-atps=neutral
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1859C10F672
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 15:05:15 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843c2790ccso617848f8f.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1789139113; x=1789743913; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XKohTBQhTvhy9wNz0LcPmFyXDw2Vls36EVI0PSYF1LE=;
 b=NPb8/BYkUodTGTeY7I5dHXluoueXv6VmrdfdYyxfSOA6fmmoZ366LbfKANrE2W1lWX
 U+oPjE3b+v3PFXNsvONWxgNFi3Ntrcrc3FNHvgd7BBRX2wOMnf5LZWtnBGpttcE1ZwO+
 3h9KnfeyBM+ie2xnrsGjrQknJHUUHZ6loILTJlwvtKLMW447zyGriamcDBu26kh7uQSy
 N7sEIFlq75DVKfEvV85QV0QEcAgvUtRKmAV1PhGWky69LKv2puu/MNp/u2x6bstVXhwq
 dDTwx4gK1ife6MVXcKr0goBVcLWAoQ8fAChAyChGgYii3Cp6iGnPHq8cB43BZqK6nEqh
 g8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139113; x=1789743913;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XKohTBQhTvhy9wNz0LcPmFyXDw2Vls36EVI0PSYF1LE=;
 b=X2AXSHNz+/8zt3QRVkaijSqA7AYBPOEgjjLkKELHXfb3t/rQR2p9rLlC77s/q18364
 hokdLa3Wm3Cu1ceW6s6mQizgW6MypgAFqsssNFKWSg/l15CUqCjiHBjt8EFO+us7yOjM
 s59FeGy57LT2sm5Q53fUbxIbAKg9o4EHl+ZuYzF0maTrE8PtJE8oTePDaBMMwh2ySq9S
 XM9URlSXeRVHzbZwOrEXOpDSXzb9npSC7d9CrVJcbee80UfJtoWTqRzJOaKXAsGynSlF
 hkfJv38u76syj6wax/9e0hA2YgsQqWaJQTd7fkFwDuxbur0WQVddcFO3ItfCMwtJ4SEJ
 /8bQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVlsHKhOpqb4ZrzoVwHZQYiqf8/4dqUeSMiwgnUhRbUwJwOu0ntVLTiH4tCzU5WkGJxXhf0o56NZA=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lr3qUKFNrfwhMQkvDdu8EfXxBOCdY462xdz/1FY3NA/HmgOa9b
 TELhWo4uc6XUgXmFu+3C0+mulQuCs3hRw8Np4rs8gcZhMXvEiXF9lOnbI/3cIS6Sg+4=
X-Gm-Gg: AYBFou3K1w0KIoy/My9937I71akCEHVbgJkFdbbxPiWVsS3wWMBl9As5Y9OKtbR4E7m
 pbDbRIwvDuRC8HGAGQq8uaaIhB9uplbGsBMci/j63VrD1+7tAUDtpSEy2HbxE6JHDcqihu8Ph1M
 gmT1AqrGUfGqChrXmbhz2uHtUTxHWHsPbhAhazBlT+ihWP4fYDG5MzRk6Vzg4N8vDH4Nj2jI4x1
 CZjrfiHJyqsoIoipwrPgvB16tzh0qGNEloiPmXxSEL6Uz+dUmGfgBu+gB1FPh8+mCLtjNPUlGLV
 R4B97rcuBVbO/OmgUmvtJyI673LJcbqoIt/i0uX9IHLn34ANotKnXlWlpUKhrp/NoqfGMbkmcCC
 vv36kVPlAMLdPU2liG9pzELK2VmTlO+ehmYGlc/YfMF6UjMcuw2YgqrBkYsjyqLiAQJwWUu4Uxp
 xWGrX6DPk+rtCQG9zCMFpAk6zCbDCEXFKrCkkuAcdrTS0FwGrGCgePsQ9OsBMlqMJKYfrMnh0GT
 SQkyQ==
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id
 5b1f17b1804b1-49e66922810mr55050755e9.2.1789139113470; 
 Fri, 11 Sep 2026 08:05:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 08:05:12 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/i915: Include error-injection.h for
 ALLOW_ERROR_INJECTION()
Date: Fri, 11 Sep 2026 17:04:04 +0200
Message-ID: <20260911-module-include-error_injection-v1-4-5da895d8c84d@suse.com>
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

Several drivers/gpu/drm/i915/*.c files use ALLOW_ERROR_INJECTION(), which
is defined in asm-generic/error-injection.h. They currently rely on this
header being included indirectly through linux/module.h ->
linux/error-injection.h.

Add the missing includes in preparation for removing the
linux/error-injection.h include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 drivers/gpu/drm/i915/display/intel_connector.c      | 1 +
 drivers/gpu/drm/i915/display/intel_display_driver.c | 1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c           | 1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                  | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c           | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c               | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c            | 1 +
 drivers/gpu/drm/i915/i915_driver.c                  | 1 +
 drivers/gpu/drm/i915/i915_pci.c                     | 2 ++
 drivers/gpu/drm/i915/intel_uncore.c                 | 1 +
 10 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 7ef9338d67ab..a287884c0045 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -23,6 +23,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/error-injection.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 70d112fd4287..204810a11e46 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -7,6 +7,7 @@
  * details here.
  */
 
+#include <linux/error-injection.h>
 #include <linux/vga_switcheroo.h>
 #include <acpi/video.h>
 #include <drm/display/drm_dp_mst_helper.h>
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c0fd349a4600..2c3bc7b67c0d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -3,6 +3,7 @@
  * Copyright © 2016 Intel Corporation
  */
 
+#include <linux/error-injection.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_print.h>
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 5c7f862f7100..2f0e1cb5578c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/error-injection.h>
+
 #include <drm/drm_managed.h>
 #include <drm/intel/intel-gtt.h>
 #include <drm/intel/intel_gmd_interrupt_regs.h>
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 1c455d84bf9d..091aa33f624a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/circ_buf.h>
+#include <linux/error-injection.h>
 #include <linux/ktime.h>
 #include <linux/string_helpers.h>
 #include <linux/time64.h>
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index bd07c72a66fc..d367a897c86b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -3,6 +3,7 @@
  * Copyright © 2016-2019 Intel Corporation
  */
 
+#include <linux/error-injection.h>
 #include <linux/string_helpers.h>
 
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 7fac97fe30a6..d7c731fe972b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/error-injection.h>
 #include <linux/firmware.h>
 #include <linux/highmem.h>
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce6d20958320..aeb7b24c81c8 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -30,6 +30,7 @@
 #include <linux/aperture.h>
 #include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/error-injection.h>
 #include <linux/module.h>
 #include <linux/oom.h>
 #include <linux/pci.h>
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 2f03f95945f1..84a7dc6ab5db 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -22,6 +22,8 @@
  *
  */
 
+#include <linux/error-injection.h>
+
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
 #include <drm/intel/pci_config.h>
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 170e83a8c9fc..e360e4f9d9a2 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -21,6 +21,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <linux/error-injection.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_managed.h>

-- 
2.55.0
