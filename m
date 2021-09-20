Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58501C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 19:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD2061107
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 19:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AD2061107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1C16E83C;
	Mon, 20 Sep 2021 19:51:57 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE46E519
 for <intel-gfx@lists.freedesktop.org>; Mon, 20 Sep 2021 14:12:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b15so50041176lfe.7
 for <intel-gfx@lists.freedesktop.org>; Mon, 20 Sep 2021 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/V7PO4oKi+Cdn3boVLzzbggsDJhCE3vfiLfp0i9c8rA=;
 b=JuQc1D7eggnCJORwmJNKVRhuCGoZrE608OuQeEreGHUosyUeSjKhdov70YzPFDmRge
 BsfU0v9yrOoDCHoepSExTAJsQbbJ1AtekwYK3Cj31xc850uEuYHsL/WI6nUVj4RdKd5k
 Tl0KQyQeoBqeG+aMQ9vmSc1Np4p245bj1ALUQF/Z5vwxSH/G+vMuQO/WN2Oi3hJ65EA9
 1ehEIevF8wNc+M4IT4+xRjQ0pcEwy+8dpbRGcRIpYWEq0iOI5iQqwAog+ae4CsOkgeTV
 zxjtEVgie3Si+z/wGD8iiMQAQv+JoxNSXGHYiDNxuVghWQwG0qqontIfVMLA0jUSBfVp
 1a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/V7PO4oKi+Cdn3boVLzzbggsDJhCE3vfiLfp0i9c8rA=;
 b=BphJSodw4BRPIAhgPmmnNPBz8NYY1w/729X2DT2BC6YGPrWMM6ksZuH/POVNQxPtJO
 8BaWbdhJhPdPVHeLLB387JX4ZQ4OBQ1s6BNN8gdlmKWQlw/JAS1CBpSSWhGm6Zb3JitW
 okHX+hXgEvGnPVq6OHS2QWHiKKdMfBH1UB5JbcNfopUQcGHJSQczmYfKPdQ0vnfN48Y6
 KI7MLWjOnRI81mUDNaxsbYtFyTkDCVbct91TFtQteSInvq2nMVqMngFxg6ZiA92zmsfe
 HXreGOkbAEpxEttOpm/XKq1ugR+bK3qN+7dYu1cOd6PGI3Ge1ryWYvk8O91nzfxlZiTU
 vB9g==
X-Gm-Message-State: AOAM530AxYArBPqWxyR+a0mdOmkX9TRvzSq6SHjGmgyg3msnPjdNdUqm
 AaPEU86oFL0VQKuneAe7QYWl2Q==
X-Google-Smtp-Source: ABdhPJw3fSrrEgjePCdoFq/02ePMQn26eyLTxe8tnNccEoy/DKbaqGEAhKjOZq/GbDQMuJEKrGiUtg==
X-Received: by 2002:a05:6512:118c:: with SMTP id
 g12mr18941294lfr.143.1632147091114; 
 Mon, 20 Sep 2021 07:11:31 -0700 (PDT)
Received: from lmajczak1-l.roam.corp.google.com ([83.142.187.84])
 by smtp.gmail.com with ESMTPSA id a6sm1389505lfs.160.2021.09.20.07.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:11:30 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Jose Roberto de Souza <jose.souza@intel.com>,
 Shawn C Lee <shawn.c.lee@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 upstream@semihalf.com, Lukasz Majczak <lma@semihalf.com>,
 stable@vger.kernel.org
Date: Mon, 20 Sep 2021 16:11:01 +0200
Message-Id: <20210920141101.194959-1-lma@semihalf.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Sep 2021 19:51:54 +0000
Subject: [Intel-gfx] [PATCH v1] drm/i915/bdb: Fix version check
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

With patch "drm/i915/vbt: Fix backlight parsing for VBT 234+"
the size of bdb_lfp_backlight_data structure has been increased,
causing if-statement in the parse_lfp_backlight function
that comapres this structure size to the one retrieved from BDB,
always to fail for older revisions.
This patch fixes it by comparing a total size of all fileds from
the structure (present before the change) with the value gathered from BDB.
Tested on Chromebook Pixelbook (Nocturne) (reports bdb->version = 221)

Cc: <stable@vger.kernel.org> # 5.4+
Tested-by: Lukasz Majczak <lma@semihalf.com>
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 4 +++-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3c25926092de..052a19b455d1 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -452,7 +452,9 @@ parse_lfp_backlight(struct drm_i915_private *i915,
 
 	i915->vbt.backlight.type = INTEL_BACKLIGHT_DISPLAY_DDI;
 	if (bdb->version >= 191 &&
-	    get_blocksize(backlight_data) >= sizeof(*backlight_data)) {
+	    get_blocksize(backlight_data) >= (sizeof(backlight_data->entry_size) +
+					      sizeof(backlight_data->data) +
+					      sizeof(backlight_data->level))) {
 		const struct lfp_backlight_control_method *method;
 
 		method = &backlight_data->backlight_control[panel_type];
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 330077c2e588..fff456bf8783 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -814,6 +814,11 @@ struct lfp_brightness_level {
 	u16 reserved;
 } __packed;
 
+/*
+ * Changing struct bdb_lfp_backlight_data might affect its
+ * size comparation to the value hold in BDB.
+ * (e.g. in parse_lfp_backlight())
+ */
 struct bdb_lfp_backlight_data {
 	u8 entry_size;
 	struct lfp_backlight_data_entry data[16];
-- 
2.33.0.464.g1972c5931b-goog

