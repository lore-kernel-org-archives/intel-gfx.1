Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E20FC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Mar 2022 22:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D810EB4F;
	Wed, 30 Mar 2022 22:18:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 632A510E8EF;
 Wed, 30 Mar 2022 22:18:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 55591A00E8;
 Wed, 30 Mar 2022 22:18:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Date: Wed, 30 Mar 2022 22:18:03 -0000
Message-ID: <164867868334.8654.5244644218923357087@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220330215311.21849-1-matthew.s.atwood@intel.com>
In-Reply-To: <20220330215311.21849-1-matthew.s.atwood@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/uapi=3A_Add_DRM=5FI915=5FQUERY=5FGEOMETRY=5FSUBSLI?=
 =?utf-8?q?CES_=28rev4=29?=
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

Series: drm/i915/uapi: Add DRM_I915_QUERY_GEOMETRY_SUBSLICES (rev4)
URL   : https://patchwork.freedesktop.org/series/101219/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
6f3dde840f67 drm/i915/uapi: Add DRM_I915_QUERY_GEOMETRY_SUBSLICES
-:133: CHECK:SPACING: No space is necessary after a cast
#133: FILE: drivers/gpu/drm/i915/i915_query.c:111:
+	engine = intel_engine_lookup_user(i915, (u8) classinstance.engine_class,

-:134: CHECK:SPACING: No space is necessary after a cast
#134: FILE: drivers/gpu/drm/i915/i915_query.c:112:
+					  (u8) classinstance.engine_instance);

total: 0 errors, 0 warnings, 2 checks, 177 lines checked


