Return-Path: <SRS0=La7M=PG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DE5C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Oct 2021 02:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0612561076
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Oct 2021 02:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0612561076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CE26E05D;
	Mon, 18 Oct 2021 02:37:42 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0326E05D
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Oct 2021 02:37:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="228431625"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="228431625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:37:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="529989324"
Received: from szeng-nuc.jf.intel.com ([10.165.21.212])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:37:40 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: srinivasan.s@intel.com, sudeep.dutt@intel.com, cq.tang@intel.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com
Date: Sun, 17 Oct 2021 20:42:56 -0700
Message-Id: <20211018034256.816113-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: Wait request to finish
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Caller of function igt_gpu_fill_dw assumes when this function
returns, the gpu command to fill dword is already finished.
Caller usually checks the GPU filling result immediately, see
the usage in function __igt_write_huge. If there is no wait,
when function igt_gpu_fill_dw returns, the GPU command is not
guaranteed to be finished. So wait for request to finish.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
index b35c1219c852..5fa595ed30b1 100644
--- a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
+++ b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
@@ -157,6 +157,7 @@ int igt_gpu_fill_dw(struct intel_context *ce,
 	if (err)
 		i915_request_set_error_once(rq, err);
 	i915_request_add(rq);
+	err = i915_request_wait(rq, 0, HZ/5);
 err_batch:
 	i915_vma_unpin_and_release(&batch, 0);
 	return err;
-- 
2.25.1

