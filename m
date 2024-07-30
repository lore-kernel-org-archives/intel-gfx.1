Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E14C3DA61
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Jul 2024 08:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9C910E216;
	Tue, 30 Jul 2024 08:51:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF07A10E132;
 Tue, 30 Jul 2024 08:51:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_Add_Wa?=
 =?utf-8?q?=5F14019789679_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 30 Jul 2024 08:51:04 -0000
Message-ID: <172232946471.427958.17866603723806975282@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730075220.3087411-1-nitin.r.gote@intel.com>
In-Reply-To: <20240730075220.3087411-1-nitin.r.gote@intel.com>
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

Series: drm/i915: Add Wa_14019789679 (rev2)
URL   : https://patchwork.freedesktop.org/series/136659/
State : warning

== Summary ==

Error: dim checkpatch failed
32190594967c drm/i915: Add Wa_14019789679
-:22: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                       ^

-:22: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                            ^

-:22: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                                 ^

-:22: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                                      ^

-:22: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                                           ^

-:22: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                                                ^

-:22: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                                                      ^

-:22: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#22: FILE: drivers/gpu/drm/i915/gt/intel_gpu_commands.h:223:
+#define CMD_3DSTATE_MESH_CONTROL ((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x77<<16)|(0x3))
                                                                           ^

-:36: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#36: FILE: drivers/gpu/drm/i915/gt/intel_workarounds.c:978:
+	if ((GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70) &&
+			GRAPHICS_VER_FULL(rq->i915) <= IP_VER(12, 74)) || IS_DG2(rq->i915))

-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/i915/gt/intel_workarounds.c:1014:
+	if ((GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70) &&
+			GRAPHICS_VER_FULL(rq->i915) <= IP_VER(12, 74)) || IS_DG2(rq->i915)) {

total: 0 errors, 0 warnings, 10 checks, 33 lines checked


