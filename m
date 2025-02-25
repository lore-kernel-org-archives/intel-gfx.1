Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8831C021B2
	for <intel-gfx@archiver.kernel.org>; Tue, 25 Feb 2025 09:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5262010E5D6;
	Tue, 25 Feb 2025 09:17:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2410E5D6;
 Tue, 25 Feb 2025 09:17:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Expose_modifiers/for?=
 =?utf-8?q?mats_supported_by_async_flips_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 25 Feb 2025 09:17:06 -0000
Message-ID: <174047502687.1911171.5036221167582258710@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
In-Reply-To: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev7)
URL   : https://patchwork.freedesktop.org/series/140935/
State : warning

== Summary ==

Error: dim checkpatch failed
080bab9db88a drm/plane: Add new plane property IN_FORMATS_ASYNC
-:103: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#103: FILE: include/drm/drm_plane.h:567:
+					   uint32_t format, uint64_t modifier);

total: 0 errors, 0 warnings, 1 checks, 62 lines checked
4c74f8ffe286 drm/plane: modify create_in_formats to accommodate async
-:33: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#33: FILE: drivers/gpu/drm/drm_plane.c:198:
+						       bool (*format_mod_supported)(struct drm_plane *plane,

-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/drm_plane.c:199:
+						       bool (*format_mod_supported)(struct drm_plane *plane,
+						       u32 format,

total: 0 errors, 1 warnings, 1 checks, 72 lines checked
f89e95062661 drm/i915/display: Add i915 hook for format_mod_supported_async
-:137: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#137: FILE: drivers/gpu/drm/i915/display/intel_display.c:6192:
+		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
+		    new_plane_state->hw.fb->modifier)) {

total: 0 errors, 0 warnings, 1 checks, 139 lines checked


