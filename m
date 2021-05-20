Return-Path: <SRS0=a6yN=KP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD4BC433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 15:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546E060FE7
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 15:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546E060FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2A36F49F;
	Thu, 20 May 2021 15:20:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD2BD6F49A;
 Thu, 20 May 2021 15:20:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA396A41FB;
 Thu, 20 May 2021 15:20:25 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 20 May 2021 15:20:25 -0000
Message-ID: <162152402566.11675.17956174950142179781@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Core_TTM_changes_for_i915_TTM_enabling?=
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

Series: Core TTM changes for i915 TTM enabling
URL   : https://patchwork.freedesktop.org/series/90373/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
6eeb4e1f8ab7 drm/ttm: Add a generic TTM memcpy move for page-based iomem
-:70: CHECK:ARCH_DEFINES: architecture specific defines should be avoided
#70: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:83:
+#if defined(__i386__) || defined(__x86_64__)

total: 0 errors, 0 warnings, 1 checks, 639 lines checked
369fe8e04f41 drm, drm/i915: Move the memcpy_from_wc functionality to core drm
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
rename from drivers/gpu/drm/i915/i915_memcpy.c

total: 0 errors, 1 warnings, 0 checks, 372 lines checked
884af268552d drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
71cc65c1ff0f drm/ttm: Document and optimize ttm_bo_pipeline_gutting()
76e47a2ed2d1 drm/ttm, drm/amdgpu: Allow the driver some control over swapping


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
