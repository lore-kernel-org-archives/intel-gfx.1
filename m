Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C73C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Feb 2022 18:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1294C10E25C;
	Wed, 16 Feb 2022 18:02:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33CF410E25C;
 Wed, 16 Feb 2022 18:02:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 30606AA0EA;
 Wed, 16 Feb 2022 18:02:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 16 Feb 2022 18:02:22 -0000
Message-ID: <164503454216.16093.12309596181464474632@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220215122957.2755529-1-jani.nikula@intel.com>
In-Reply-To: <20220215122957.2755529-1-jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C1/2=5D_drm/i915/fbdev=3A_add_i?=
 =?utf-8?q?ntel=5Ffbdev=5Fframebuffer=28=29_helper?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/2] drm/i915/fbdev: add intel_fbdev_framebuffer() helper
URL   : https://patchwork.freedesktop.org/series/100170/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b96b00c05a02 drm/i915/fbdev: add intel_fbdev_framebuffer() helper
-:81: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#81: FILE: drivers/gpu/drm/i915/display/intel_fbdev.h:54:
 }
+static inline struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
1bdb72ef0401 drm/i915/fbdev: hide struct intel_fbdev in intel_fbdev.c


