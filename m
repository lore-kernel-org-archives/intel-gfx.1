Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3740AC36008
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Mar 2025 16:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FB210E719;
	Wed, 26 Mar 2025 16:09:42 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B15B10E729;
 Wed, 26 Mar 2025 16:09:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_mtd=3A_add_driver_fo?=
 =?utf-8?q?r_Intel_discrete_graphics_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 26 Mar 2025 16:09:41 -0000
Message-ID: <174300538137.5929.15890530084126766210@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
In-Reply-To: <20250326152623.3897204-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics (rev7)
URL   : https://patchwork.freedesktop.org/series/140306/
State : warning

== Summary ==

Error: dim checkpatch failed
5a696b562b94 mtd: core: always create master device
a547710a3913 mtd: add driver for intel graphics non-volatile memory device
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 202 lines checked
f7c8c021e9e2 mtd: intel-dg: implement region enumeration
9e11cadfdcce mtd: intel-dg: implement access functions
f391936fe856 mtd: intel-dg: register with mtd
21605f9128be mtd: intel-dg: align 64bit read and write
9de54cc563a7 mtd: intel-dg: wake card on operations
23d50cc07f68 drm/i915/nvm: add nvm device for discrete graphics
-:96: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#96: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
7133bd3a2ce8 drm/i915/nvm: add support for access mode
26d059f7594e drm/xe/nvm: add on-die non-volatile memory device
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 212 lines checked
3f719027642f drm/xe/nvm: add support for access mode
b01595c0824d drm/xe/nvm: add support for non-posted erase
-:121: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#121: FILE: drivers/mtd/devices/mtd_intel_dg.c:392:
+			while (!(reg & NVM_NON_POSTED_ERASE_DONE) &&
+				++iter < NVM_NON_POSTED_ERASE_DONE_ITER) {

-:122: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#122: FILE: drivers/mtd/devices/mtd_intel_dg.c:393:
+				msleep(10);

total: 0 errors, 1 warnings, 1 checks, 150 lines checked


