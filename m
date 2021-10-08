Return-Path: <SRS0=3Vrl=O4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D253C433FE
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9B161029
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD9B161029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1168E6E0D4;
	Fri,  8 Oct 2021 14:09:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8C876E0D2;
 Fri,  8 Oct 2021 14:09:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C0825A7DFC;
 Fri,  8 Oct 2021 14:09:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Das, Nirmoy" <nirmoy.das@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 08 Oct 2021 14:09:30 -0000
Message-ID: <163370217075.16849.12172816744949524243@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211008091704.27094-1-nirmoy.das@amd.com>
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/5=5D_dri=3A_cleanup_debugfs_error?=
 =?utf-8?q?_handling?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/5] dri: cleanup debugfs error handling
URL   : https://patchwork.freedesktop.org/series/95602/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
59b65376d0a0 dri: cleanup debugfs error handling
-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: drivers/gpu/drm/drm_debugfs.c:210:
+void drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)

-:56: CHECK:LINE_SPACING: Please don't use multiple blank lines
#56: FILE: drivers/gpu/drm/drm_debugfs.c:227:
+
+

-:148: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#148: FILE: drivers/gpu/drm/drm_internal.h:195:
+static inline void drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				   struct dentry *root)

total: 0 errors, 0 warnings, 3 checks, 112 lines checked
0ba632f15232 drm/i915: check dri root before debugfs init
348cf9dba853 drm/radeon: check dri root before debugfs init
55b24b7a29aa drm/armada: check dri/crtc root before debugfs init
6f112fc8a5fd drm/tegra: check root dentry before debugfs init


