Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9720C432BE
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 12:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 612C161A52
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 12:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 612C161A52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F616E883;
	Tue, 27 Jul 2021 12:10:46 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245836E4AB
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a80-20020a1c98530000b0290245467f26a4so2204618wme.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiDTKh8DNOhbwBce61iq5CGtRilbbuE9UNuHZ6HhVL0=;
 b=cOQVX5C3T1KmMGo8NPBlovcwKRMSGfUCil140q8sXoifee3Sl+QU0Vwga0SVQAS+At
 YLBuoYWz46xi9r9bny9sTqT0PAx3dF2mSfD/5hKAewYSdSE9wf2M88e9Zn82F2wEfgRZ
 wyzdwaw3bmV38tU/nS6Ohy2khWbesIqSxTbbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiDTKh8DNOhbwBce61iq5CGtRilbbuE9UNuHZ6HhVL0=;
 b=SSSMTsbBFsWJqkMph1MtoGEWZZzKQOx8Xad3BDDPd2BpMm9q3Q+NMWVC1fgyxvfbf+
 3YTmgCqIgBvd/D8gC0A2VvDINlf0TH3mJN8BjOGdOK8pi0No+KGKfNVT9VGU9lX8YBJv
 K9JXcg0Kxuxb4+Lyxfhq8J+Nb7lZGP8XliMFH/Y23XHD0B3dhJ0Eevpvd8mxcPSixoRW
 2oqHIZULsZZxbvd4QtyIk2YmhSa6oziTssWv5tp+5zmLNSvXzfMaR+h81+F6m526kmIf
 Civ7L3ARrPTpWDy1ap/PEjkNzpRpVAnLO+XVxtETCWz7HTgIb5Sdp0OprcCkKsTOB+27
 Hbuw==
X-Gm-Message-State: AOAM531KZZphp5C+D7u8CI+rBbJeabN+bd1R9TXMjmBME2My27eyUysm
 VwBOjIdAvNmx609zxq09YKnzbUz+Tl3IRg==
X-Google-Smtp-Source: ABdhPJxp+Q/ktPBo6GzEOYrWnpBFMlBC3/yNZurQF3GhvbX5jLGJYVm9DNakRussrlLFTOT1w1KdGQ==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr3943757wmj.0.1627387843562;
 Tue, 27 Jul 2021 05:10:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Tue, 27 Jul 2021 14:10:27 +0200
Message-Id: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 01/11] drm/i915: Check for nomodeset in
 i915_init() first
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

When modesetting (aka the full pci driver, which has nothing to do
with disable_display option, which just gives you the full pci driver
without the display driver) is disabled, we load nothing and do
nothing.

So move that check first, for a bit of orderliness. With Jason's
module init/exit table this now becomes trivial.

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index f28206484552..eb520fcb32e4 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1293,9 +1293,9 @@ static const struct {
    int (*init)(void);
    void (*exit)(void);
 } init_funcs[] = {
+	{ i915_check_nomodeset, NULL },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
-	{ i915_check_nomodeset, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
 	{ i915_register_pci_driver, i915_unregister_pci_driver },
 	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
