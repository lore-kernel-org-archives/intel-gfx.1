Return-Path: <SRS0=HRyj=KW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FBCC47089
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 02:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2155360E08
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 02:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2155360E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C106EDF2;
	Thu, 27 May 2021 02:55:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A67566E02C;
 Thu, 27 May 2021 02:55:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9E9AFA8836;
 Thu, 27 May 2021 02:55:52 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Thu, 27 May 2021 02:55:52 -0000
Message-ID: <162208415261.12240.15875004252313488908@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210526220853.4550-1-anusha.srivatsa@intel.com>
In-Reply-To: <20210526220853.4550-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Pipe_DMC_Support_=28rev3=29?=
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

Series: Pipe DMC Support (rev3)
URL   : https://patchwork.freedesktop.org/series/90445/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
4cd719dde218 drm/i915/dmc: s/DRM_ERROR/drm_err
45f377900c6c drm/i915/dmc: Add intel_dmc_has_payload() helper
d03d3a511e95 drm/i915/dmc: Move struct intel_dmc to intel_dmc.h
82bbb3402681 drm/i915/dmc: Introduce DMC_FW_MAIN
2ece624e32bb xdrm/i915/xelpd: Pipe A DMC plugging
-:42: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:587:
+		   intel_de_read(dev_priv, DMC_PROGRAM(dmc->dmc_info[DMC_FW_MAIN].start_mmioaddr, 0)));

-:57: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:963:
+				     DMC_PROGRAM(dev_priv->dmc.dmc_info[DMC_FW_MAIN].start_mmioaddr, 0)),

-:150: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#150: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:387:
+				drm_notice(&i915->drm, "Invalid firmware id: %d\n", fw_info[i].dmc_id);

total: 0 errors, 3 warnings, 0 checks, 268 lines checked
e1e57716af49 drm/i915/adl_p: Pipe B DMC Support
91612389f911 drm/i915/adl_p: Load DMC


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
