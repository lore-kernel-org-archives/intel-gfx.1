Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE37C4167B
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Nov 2022 00:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD59F10E3F8;
	Wed, 30 Nov 2022 00:40:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50C8A10E3F8;
 Wed, 30 Nov 2022 00:40:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 49FCDAA01E;
 Wed, 30 Nov 2022 00:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Date: Wed, 30 Nov 2022 00:40:26 -0000
Message-ID: <166976882629.2863.17995849562320968305@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221129232031.3401386-1-John.C.Harrison@Intel.com>
In-Reply-To: <20221129232031.3401386-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_More_GuC_firmware_version_improvements_=28rev3=29?=
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

Series: More GuC firmware version improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/111218/
State : warning

== Summary ==

Error: dim checkpatch failed
3f13a32ca07b drm/i915/uc: Rationalise delimiters in filename macros
71c8b8a09a71 drm/i915/uc: More refactoring of UC version numbers
-:221: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#221: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:118:
+#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)

total: 0 errors, 0 warnings, 1 checks, 190 lines checked
1392a4d51287 drm/i915/guc: Use GuC submission API version number
-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#41: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:279:
+#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)

total: 0 errors, 0 warnings, 1 checks, 271 lines checked


