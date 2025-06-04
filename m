Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BC9C5B543
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Jun 2025 09:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEC510E7DB;
	Wed,  4 Jun 2025 09:25:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBE310E684;
 Wed,  4 Jun 2025 09:25:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/utils=3A_do?=
 =?utf-8?q?cument_range=5Foverflows*=28=29_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 04 Jun 2025 09:25:12 -0000
Message-ID: <174902911277.47446.15346687420045849374@1538d3639d33>
X-Patchwork-Hint: ignore
References: <202506021119.8FD6339F@keescook>
In-Reply-To: <202506021119.8FD6339F@keescook>
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

Series: drm/i915/utils: document range_overflows*() macros
URL   : https://patchwork.freedesktop.org/series/149826/
State : warning

== Summary ==

Error: dim checkpatch failed
d05f1fc137c3 drm/i915/utils: document range_overflows*() macros
-:20: CHECK:LINE_SPACING: Please don't use multiple blank lines
#20: FILE: drivers/gpu/drm/i915/i915_utils.h:70:
 
+

total: 0 errors, 0 warnings, 1 checks, 66 lines checked


