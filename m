Return-Path: <SRS0=ZV5I=PY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13CFC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Nov 2021 06:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1986120E
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Nov 2021 06:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A1986120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFBF6E086;
	Fri,  5 Nov 2021 06:45:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450016E086
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Nov 2021 06:45:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="229318477"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="229318477"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 23:45:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="600532251"
Received: from inechita-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 23:45:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  5 Nov 2021 07:44:39 +0100
Message-Id: <20211105064439.764336-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105064439.764336-1-thomas.hellstrom@linux.intel.com>
References: <20211105064439.764336-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 2/2] HAX: drm/i915/selftest: Temporarily
 avoid tainting the kernel on engine reset failure
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

The taint aborts the CI test runner.

v2: Comment out GEM_TRACE_DUMP() also active_request_put().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 8590419be4c6..65c5f965e36a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -884,7 +884,7 @@ static int active_request_put(struct i915_request *rq)
 			  rq->engine->name,
 			  rq->fence.context,
 			  rq->fence.seqno);
-		GEM_TRACE_DUMP();
+		/*GEM_TRACE_DUMP();*/
 
 		intel_gt_set_wedged(rq->engine->gt);
 		err = -EIO;
@@ -1111,8 +1111,9 @@ static int __igt_reset_engines(struct intel_gt *gt,
 					       rq->fence.seqno, rq->context->guc_id.id);
 					i915_request_put(rq);
 
-					GEM_TRACE_DUMP();
+					/* GEM_TRACE_DUMP(); */
 					intel_gt_set_wedged(gt);
+
 					err = -EIO;
 					goto restore;
 				}
-- 
2.31.1

