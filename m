Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773C0E7717F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Dec 2024 12:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0710E089;
	Mon, 16 Dec 2024 12:21:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEEA10E07B;
 Mon, 16 Dec 2024 12:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm=3A_Constify_=27s?=
 =?utf-8?q?truct_bin=5Fattribute=27?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 16 Dec 2024 12:21:25 -0000
Message-ID: <173435168519.3275200.6779258653392171797@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
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

Series: drm: Constify 'struct bin_attribute'
URL   : https://patchwork.freedesktop.org/series/142646/
State : warning

== Summary ==

Error: dim checkpatch failed
fc4f080e12b3 drm/sysfs: Constify 'struct bin_attribute'
47acf9b40945 drm/lima: Constify 'struct bin_attribute'
0483c9f83c0f drm/i915: Constify 'struct bin_attribute'
a4d6fde699c9 drm/amdgpu: Constify 'struct bin_attribute'
-:113: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#113: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2066:
+static const BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,

total: 0 errors, 1 warnings, 0 checks, 103 lines checked
a858d1127204 drm/amd/display: Constify 'struct bin_attribute'


