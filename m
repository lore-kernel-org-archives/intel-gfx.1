Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC6C3DA6D
	for <intel-gfx@archiver.kernel.org>; Mon, 19 May 2025 22:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC2B10E2CF;
	Mon, 19 May 2025 22:29:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9510E125;
 Mon, 19 May 2025 22:29:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm=3A_Create_an_app?=
 =?utf-8?q?_info_option_for_wedge_events_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 19 May 2025 22:29:17 -0000
Message-ID: <174769375718.1850.18056112398061522070@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519220333.101355-1-andrealmeid@igalia.com>
In-Reply-To: <20250519220333.101355-1-andrealmeid@igalia.com>
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

Series: drm: Create an app info option for wedge events (rev4)
URL   : https://patchwork.freedesktop.org/series/145638/
State : warning

== Summary ==

Error: dim checkpatch failed
5b8661caf057 drm: Create an app info option for wedge events
-:77: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#77: FILE: drivers/gpu/drm/drm_drv.c:564:
+	char *envp[] = { event_string, NULL, NULL, NULL };

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
859ab867da59 drm/doc: Add a section about "App information" for the wedge API
46431924b629 drm/amdgpu: Make use of drm_wedge_app_info


