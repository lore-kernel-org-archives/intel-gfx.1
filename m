Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADD0C47077
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Jan 2024 13:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D8010E2FA;
	Tue, 16 Jan 2024 13:08:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C07710E542;
 Tue, 16 Jan 2024 13:08:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_New_DRM_properties_f?=
 =?utf-8?q?or_output_color_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andri Yngvason" <andri@yngvason.is>
Date: Tue, 16 Jan 2024 13:08:15 -0000
Message-ID: <170541049531.502239.11092937844618362140@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240115160554.720247-1-andri@yngvason.is>
In-Reply-To: <20240115160554.720247-1-andri@yngvason.is>
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

Series: New DRM properties for output color format
URL   : https://patchwork.freedesktop.org/series/128826/
State : warning

== Summary ==

Error: dim checkpatch failed
73e5d5241200 drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
-:35: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#35: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5578:
 	if (drm_mode_is_420_only(info, mode_in)
+			|| (drm_mode_is_420_also(info, mode_in) && aconnector->force_yuv420_output))

total: 0 errors, 0 warnings, 1 checks, 12 lines checked
bfe7e92f2b36 drm/uAPI: Add "force color format" drm property as setting for userspace
0ee65f6d9c49 drm/amd/display: Add handling for new "force color format" property
-:11: WARNING:BAD_SIGN_OFF: 'Co-developed-by:' is the preferred signature form
#11: 
Co-Developed-by: Andri Yngvason <andri@yngvason.is>

-:28: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#28: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5578:
+	if (connector_state
+			&& (connector_state->force_color_format == DRM_COLOR_FORMAT_YCBCR420

-:29: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#29: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5579:
+			&& (connector_state->force_color_format == DRM_COLOR_FORMAT_YCBCR420
+			|| aconnector->force_yuv420_output) && drm_mode_is_420(info, mode_in))

-:34: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#34: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5582:
+	else if (connector_state
+			&& connector_state->force_color_format == DRM_COLOR_FORMAT_YCBCR444

-:35: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#35: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5583:
+			&& connector_state->force_color_format == DRM_COLOR_FORMAT_YCBCR444
+			&& connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)

-:39: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#39: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5586:
+	else if (connector_state
+			&& connector_state->force_color_format == DRM_COLOR_FORMAT_RGB444

-:40: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#40: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5587:
+			&& connector_state->force_color_format == DRM_COLOR_FORMAT_RGB444
+			&& !drm_mode_is_420_only(info, mode_in))

-:51: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#51: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:5598:
+		else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
+				&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)

-:70: WARNING:LINE_SPACING: Missing a blank line after declarations
#70: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6713:
+	enum dc_pixel_encoding encoding = PIXEL_ENCODING_UNDEFINED;
+	switch (drm_state->force_color_format) {

total: 0 errors, 2 warnings, 7 checks, 101 lines checked
e847a2e61678 drm/i915/display: Add handling for new "force color format" property
-:11: WARNING:BAD_SIGN_OFF: 'Co-developed-by:' is the preferred signature form
#11: 
Co-Developed-by: Andri Yngvason <andri@yngvason.is>

total: 0 errors, 1 warnings, 0 checks, 136 lines checked


