Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C64C4708A
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 14:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64882613D3
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 14:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64882613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE88E6ED8F;
	Wed, 26 May 2021 14:15:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526A6ED74;
 Wed, 26 May 2021 14:15:40 +0000 (UTC)
IronPort-SDR: StluCb+EMcEoVFYod2JLAVhdL6u7eu79aSYvjEMscxIQeAVVyGz75rUoo8HWlDOK6ej/VNv7+0
 N4bitXdLDifg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660666"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:23 -0700
IronPort-SDR: WhY2rwh71IMvB8AzD8ZwUIVqKNac3qIBNmivhC/i/ju0nlhk/LTCTHV/dB28QRJFOJ/2u2AoDI
 KNvidS28YxWg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206464"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:21 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed, 26 May 2021 15:14:55 +0100
Message-Id: <20210526141456.2334192-12-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 11/12] drm/i915/selftests: Remove redundant
 set-to-gtt-domain before batch submission
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

In construction the rpcs_query batch we know that it is device coherent
and ready for execution, the set-to-gtt-domain here is redudant.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 3d8d5f242e34..eed5be597eee 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -954,8 +954,6 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
 	err = i915_gem_object_lock(obj, &ww);
 	if (!err)
 		err = i915_gem_object_lock(rpcs, &ww);
-	if (!err)
-		err = i915_gem_object_set_to_gtt_domain(obj, false);
 	if (!err)
 		err = i915_vma_pin_ww(vma, &ww, 0, 0, PIN_USER);
 	if (err)
-- 
2.30.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
