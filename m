Return-Path: <SRS0=xVQy=L2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2611C11F68
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Jul 2021 10:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A431D613F3
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Jul 2021 10:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A431D613F3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F746E0AF;
	Fri,  2 Jul 2021 10:08:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BB0E6E0AF;
 Fri,  2 Jul 2021 10:08:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6589CA9932;
 Fri,  2 Jul 2021 10:08:04 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: venkata.sai.patnana@intel.com
Date: Fri, 02 Jul 2021 10:08:04 -0000
Message-ID: <162522048441.22029.13181506111896228242@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210702091043.14368-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210702091043.14368-1-venkata.sai.patnana@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/display/dsc=3A_Set_BPP_in_the_kernel_=28rev5=29?=
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

Series: drm/i915/display/dsc: Set BPP in the kernel (rev5)
URL   : https://patchwork.freedesktop.org/series/91917/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
31d490bc229f drm/i915/display/dsc: Add Per connector debugfs node for DSC BPP enable
-:64: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#64: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:2421:
+static ssize_t i915_dsc_bpp_support_write(struct file *file,
+						const char __user *ubuf,

-:110: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#110: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:2467:
+static int i915_dsc_bpp_support_open(struct inode *inode,
+					   struct file *file)

-:139: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#139: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:2526:
+		debugfs_create_file("i915_dsc_bpp_support", S_IRUGO,

total: 0 errors, 1 warnings, 2 checks, 120 lines checked
2523c215fa2c drm/i915/display/dsc: Set BPP in the kernel
-:26: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#26: FILE: drivers/gpu/drm/i915/display/intel_dp.c:1246:
+			drm_dbg_kms(&dev_priv->drm,
+				"DSC BPP forced to %d", intel_dp->force_dsc_bpp);

-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/gpu/drm/i915/display/intel_dp.c:1251:
+				min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
+				pipe_config->pipe_bpp);

-:47: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#47: FILE: drivers/gpu/drm/i915/display/intel_dp.c:1284:
+			pipe_config->dsc.compressed_bpp = min_t(u16,
 							       dsc_max_output_bpp >> 4,

total: 0 errors, 0 warnings, 3 checks, 43 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
