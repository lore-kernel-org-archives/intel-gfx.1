Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A693C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 30 May 2022 08:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E379E10E304;
	Mon, 30 May 2022 08:44:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCA9310E304;
 Mon, 30 May 2022 08:44:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C585BAADD6;
 Mon, 30 May 2022 08:44:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hsin-Yi Wang" <hsinyi@chromium.org>
Date: Mon, 30 May 2022 08:44:06 -0000
Message-ID: <165390024678.17900.3899042545011534357@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220530081910.3947168-1-hsinyi@chromium.org>
In-Reply-To: <20220530081910.3947168-1-hsinyi@chromium.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Separate_panel_orientation_property_creating_and_value_sett?=
 =?utf-8?q?ing_=28rev2=29?=
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

Series: Separate panel orientation property creating and value setting (rev2)
URL   : https://patchwork.freedesktop.org/series/101530/
State : warning

== Summary ==

Error: dim checkpatch failed
bf8654ee2da6 gpu: drm: separate panel orientation property creating and value setting
-:130: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#130: FILE: drivers/gpu/drm/drm_connector.c:2389:
+ * ^Icreate the connector's panel orientation property$

-:141: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#141: FILE: drivers/gpu/drm/drm_connector.c:2400:
+int drm_connector_init_panel_orientation_property(

-:147: ERROR:SPACING: space required before the open parenthesis '('
#147: FILE: drivers/gpu/drm/drm_connector.c:2406:
+	if(dev->mode_config.panel_orientation_property)

-:151: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#151: FILE: drivers/gpu/drm/drm_connector.c:2410:
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
+			"panel orientation",

-:176: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#176: FILE: include/drm/drm_connector.h:1805:
+int drm_connector_init_panel_orientation_property(

total: 1 errors, 1 warnings, 3 checks, 99 lines checked
fb63fbb19c0d drm/mediatek: init panel orientation property
24e07972d2f3 drm/msm: init panel orientation property
205b521cb9de arm64: dts: mt8183: Add panel rotation


