Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD017C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Nov 2022 21:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A64B10E0CB;
	Tue, 22 Nov 2022 21:52:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85AEC10E0CB;
 Tue, 22 Nov 2022 21:51:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7DE1AA010C;
 Tue, 22 Nov 2022 21:51:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Date: Tue, 22 Nov 2022 21:51:57 -0000
Message-ID: <166915391748.2187.7411243752965629803@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221122200915.680629-1-John.C.Harrison@Intel.com>
In-Reply-To: <20221122200915.680629-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_More_GuC_firmware_version_improvements?=
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

Series: More GuC firmware version improvements
URL   : https://patchwork.freedesktop.org/series/111218/
State : warning

== Summary ==

Error: dim checkpatch failed
f3a008949a16 drm/i915/uc: Rationalise delimiters in filename macros
460dbd43f21f drm/i915/uc: More refactoring of UC version numbers
-:220: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#220: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:118:
+#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)

total: 0 errors, 0 warnings, 1 checks, 190 lines checked
60bcf6584e54 drm/i915/guc: Use GuC submission API version number
-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#40: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:279:
+#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)

total: 0 errors, 0 warnings, 1 checks, 221 lines checked


