Return-Path: <SRS0=QorL=KJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A43C433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 23:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6149D6143C
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 23:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6149D6143C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9A16E5A9;
	Fri, 14 May 2021 23:07:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E6B06E51A;
 Fri, 14 May 2021 23:07:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 37D85A7DFB;
 Fri, 14 May 2021 23:07:38 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 14 May 2021 23:07:38 -0000
Message-ID: <162103365820.21339.8356711395526280506@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210514225739.24201-1-anusha.srivatsa@intel.com>
In-Reply-To: <20210514225739.24201-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Rename_all_CSR_references_to_DMC_=28rev2=29?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Rename all CSR references to DMC (rev2)
URL   : https://patchwork.freedesktop.org/series/90043/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2614b89575a3 drm/i915/dmc: s/intel_csr/intel_dmc
-:355: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!dmc->fw_path"
#355: FILE: drivers/gpu/drm/i915/display/intel_csr.c:759:
+	if (dmc->fw_path == NULL) {

-:423: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "dmc->dmc_payload"
#423: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:545:
+	seq_printf(m, "fw loaded: %s\n", yesno(dmc->dmc_payload != NULL));

-:666: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "dmc->dmc_payload"
#666: FILE: drivers/gpu/drm/i915/i915_gpu_error.c:795:
+			   yesno(dmc->dmc_payload != NULL));

total: 0 errors, 0 warnings, 3 checks, 600 lines checked
3e0bf49df52a drm/i915/dmc: s/HAS_CSR/HAS_DMC
bf305a360075 drm/i915/dmc: Rename macro names containing csr
1c8af2ef23f0 drm/i915/dmc: Rename functions names having "csr"
9a0374d7e50f drm/i915/dmc: s/intel_csr.c/intel_dmc.c and s/intel_csr.h/intel_dmc.h
-:99: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#99: 
rename from drivers/gpu/drm/i915/display/intel_csr.c

total: 0 errors, 1 warnings, 0 checks, 97 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
