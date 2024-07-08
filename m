Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594FFC3271E
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Jul 2024 21:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C9D10E41F;
	Mon,  8 Jul 2024 21:52:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC59910E41F;
 Mon,  8 Jul 2024 21:52:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/GuC=3A_use_?=
 =?utf-8?q?MTL_GuC_from_the_CI_folder?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 08 Jul 2024 21:52:55 -0000
Message-ID: <172047557583.67618.12855072339408986546@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708204045.1951795-1-julia.filipchuk@intel.com>
In-Reply-To: <20240708204045.1951795-1-julia.filipchuk@intel.com>
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

Series: drm/i915/GuC: use MTL GuC from the CI folder
URL   : https://patchwork.freedesktop.org/series/135868/
State : warning

== Summary ==

Error: dim checkpatch failed
63551d1cbade drm/i915/GuC: use MTL GuC from the CI folder
-:20: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#20: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:91:
+	fw_def(METEORLAKE,   0, guc_maj(../intel-ci/i915/mtl,  70, 12, 1)) \
 	                                  ^

-:20: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#20: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:91:
+	fw_def(METEORLAKE,   0, guc_maj(../intel-ci/i915/mtl,  70, 12, 1)) \
 	                                        ^

-:20: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#20: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:91:
+	fw_def(METEORLAKE,   0, guc_maj(../intel-ci/i915/mtl,  70, 12, 1)) \
 	                                           ^

-:20: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#20: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:91:
+	fw_def(METEORLAKE,   0, guc_maj(../intel-ci/i915/mtl,  70, 12, 1)) \
 	                                                ^

total: 0 errors, 0 warnings, 4 checks, 8 lines checked


