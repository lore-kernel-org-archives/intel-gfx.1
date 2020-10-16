Return-Path: <SRS0=PmWI=DX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996D6C433E7
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2020 14:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DC1C20848
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2020 14:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DC1C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462478982D;
	Fri, 16 Oct 2020 14:08:17 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0078A8982D
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2020 14:08:15 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Oct 2020 16:08:11 +0200
Message-Id: <20201016140811.1546384-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016104444.1492028-27-maarten.lankhorst@linux.intel.com>
References: <20201016104444.1492028-27-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4.1] drm/i915: Make __engine_unpark()
 compatible with ww locking.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Take the ww lock around engine_unpark. Because of the
many many places where rpm is used, I chose the safest option
and used a trylock to opportunistically take this lock for
__engine_unpark.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 499b09cb4acf..417f83c37e6c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -27,12 +27,16 @@ static void dbg_poison_ce(struct intel_context *ce)
 		int type = i915_coherent_map_type(ce->engine->i915);
 		void *map;
 
+		if (!i915_gem_object_trylock(obj))
+			return;
+
 		map = i915_gem_object_pin_map(obj, type);
 		if (!IS_ERR(map)) {
 			memset(map, CONTEXT_REDZONE, obj->base.size);
 			i915_gem_object_flush_map(obj);
 			i915_gem_object_unpin_map(obj);
 		}
+		i915_gem_object_unlock(obj);
 	}
 }
 

base-commit: 81b3e62b50925378ee2eae07f011e34343f75d64
prerequisite-patch-id: 453c3fe559333daea47bc5d24171b32ae8483c2d
prerequisite-patch-id: 6aa67ee4ac551de5c9c3ce493e0d7c9c5624c1b5
prerequisite-patch-id: 11b4e693164e1efa866afa841f866fbffaf067ff
prerequisite-patch-id: 78c735ced4a180f54343b31aafde2fe22c259d19
prerequisite-patch-id: 7d4e280d1197ead2e3f90d10d0c38c4685bedd86
prerequisite-patch-id: 6db8468aba0d92cd5d67af028caebe4146b9f02e
prerequisite-patch-id: 6550921ad75aaa9ddd30db6a75878d06c13ab6bb
prerequisite-patch-id: 22027f95bb1ad425f804bc51d01fae2cb72f0433
prerequisite-patch-id: ab3ce338d896d0d616c5933b69c585335095326d
prerequisite-patch-id: 580e28da7a0e724c293eb5b36a35be0964554885
prerequisite-patch-id: d7a25f33f32bc6839d04a9d7b57a0d093d7928d6
prerequisite-patch-id: b3f6ac925fd9f3517e63b0595ce138fdd0196db2
prerequisite-patch-id: 609d83e906e26c4d9c0fb5ba29f66eec0234d11b
prerequisite-patch-id: e9ac8a9a4ca20c9d1bc8fb0212ac1fec99cb927e
prerequisite-patch-id: c52abbd3cb48e15343ea231561ab06d1dc5fce43
prerequisite-patch-id: fbd3c4bf0ea604f9ab30aa21f28fb26b953f8889
prerequisite-patch-id: d51e789c6ddc37cb65b6e49aaf567ba2a6168841
prerequisite-patch-id: 1e05b33595d37f01087a82f11344b0e3cca2580a
prerequisite-patch-id: 64151f1e9a5ae900c09322ef2bade0e1dad06568
prerequisite-patch-id: af71a3e75f28e0ee92721491b27f260500567d92
prerequisite-patch-id: 30c6b42d4bd39703a865ee9ebce41d986a803ce4
prerequisite-patch-id: 15a26c36a233ee3f738faa4a666b4f9c8749494d
prerequisite-patch-id: 9733d60910fb3e14ba5caa2eecc97a8c50592d7d
prerequisite-patch-id: b7b484c19e966041b39b7e3f089e9fb407c0b641
prerequisite-patch-id: dd2adee5d7c941363193ad4033f419ca8f535b69
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
