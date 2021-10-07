Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA48C433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 21:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F2060FDC
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 21:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5F2060FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111806F4D4;
	Thu,  7 Oct 2021 21:01:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34E366E03C;
 Thu,  7 Oct 2021 21:01:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2CD03A363C;
 Thu,  7 Oct 2021 21:01:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Fernando Ramos" <greenfoo@u92.eu>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 07 Oct 2021 21:01:48 -0000
Message-ID: <163364050815.5186.4268812458613280009@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211007193755.29579-1-greenfoo@u92.eu>
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLlNQQVJTRTogd2FybmluZyBmb3Ig?=
 =?utf-8?q?drm=3A_cleanup=3A_Use_DRM=5FMODESET=5FLOCK=5FALL=5F*_helpers?=
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

Series: drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers
URL   : https://patchwork.freedesktop.org/series/95578/
State : warning

== Summary ==

$ dim sparse --fast origin/drm-tip
Sparse version: v0.6.2
Fast mode used, each commit won't be checked separately.
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
-                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:28:
-                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:28:
-                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:28:
-                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:28:
+                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:30:
+                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:30:
+                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:30:
+                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:30:


