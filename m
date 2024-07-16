Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EBFC3DA49
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Jul 2024 10:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1F10E624;
	Tue, 16 Jul 2024 10:10:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A570710E624;
 Tue, 16 Jul 2024 10:10:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_series_starting_with?=
 =?utf-8?q?_=5B1/2=5D_drm/buddy=3A_Add_start_address_support_to_trim_functio?=
 =?utf-8?q?n?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 16 Jul 2024 10:10:51 -0000
Message-ID: <172112465167.234184.5523087584255715902@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716094349.338529-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20240716094349.338529-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [1/2] drm/buddy: Add start address support to trim function
URL   : https://patchwork.freedesktop.org/series/136137/
State : warning

== Summary ==

Error: dim checkpatch failed
d143949697f3 drm/buddy: Add start address support to trim function
9606cdd4fe51 drm/amdgpu: Add address alignment support to DCC buffers
-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'adev' - possible side-effects?
#56: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h:368:
+#define amdgpu_gmc_get_dcc_alignment(adev) ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)))

total: 0 errors, 0 warnings, 1 checks, 96 lines checked


