Return-Path: <SRS0=c41V=KQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D616C04FF3
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 23:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBCC1613EE
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 23:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBCC1613EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4060C6F924;
	Fri, 21 May 2021 23:12:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 240736F924;
 Fri, 21 May 2021 23:12:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 01AD5A7DFB;
 Fri, 21 May 2021 23:12:48 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 21 May 2021 23:12:48 -0000
Message-ID: <162163876897.6037.16894114373589899960@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210521230114.2563-1-anusha.srivatsa@intel.com>
In-Reply-To: <20210521230114.2563-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Pipe_DMC_Support?=
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

Series: Pipe DMC Support
URL   : https://patchwork.freedesktop.org/series/90445/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a8b7ab0262fe drm/i915/dmc: s/DRM_ERROR/drm_err
-:80: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#80: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:487:
 	if (!dmc->dmc_payload) {
+		drm_err(&i915->drm, "Memory allocation failed for dmc payload\n");

total: 0 errors, 1 warnings, 0 checks, 140 lines checked
f6d008702d42 drm/i915/dmc: Add intel_dmc_has_payload() helper
75977e83820a drm/i915/dmc: Move struct intel_dmc to intel_dmc.h
3af09944a9b8 drm/i915/dmc: Introduce DMC_FW_MAIN
3123bc3537b1 drm/i915/xelpd: Pipe A DMC plugging
-:39: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:587:
+		   intel_de_read(dev_priv, DMC_PROGRAM(dmc->dmc_info[DMC_FW_MAIN].start_mmioaddr, 0)));

-:54: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:965:
+				     DMC_PROGRAM(dev_priv->dmc.dmc_info[DMC_FW_MAIN].start_mmioaddr, 0)),

-:147: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#147: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:387:
+				drm_notice(&i915->drm, "Invalid firmware id: %d\n", fw_info[i].dmc_id);

total: 0 errors, 3 warnings, 0 checks, 263 lines checked
25192ad69b25 drm/i915/adl_p: Pipe B DMC Support
7faebf7b9853 drm/i915/adl_p: Load DMC


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
