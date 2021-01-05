Return-Path: <SRS0=Zd9y=GI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D85FC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 23:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6DA22E00
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 23:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A6DA22E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE8B6E106;
	Tue,  5 Jan 2021 23:21:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6216E106
 for <intel-gfx@lists.freedesktop.org>; Tue,  5 Jan 2021 23:21:18 +0000 (UTC)
IronPort-SDR: /Sr/uvJzUpVluRJYTdm/QshJWddK8LMmFENwRvTqQ99ECCUgQrD4PNHeXR3zGu7b3tnmabYjv3
 Fm54MZU5F1Zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="177296723"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; d="scan'208";a="177296723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 15:21:18 -0800
IronPort-SDR: a6cFC1sRiwha5ywGlv9n4H9vfBZQJywLA9SHo4x4iObuidlpu+q4j+TP8CFUWmLmwYLz9lp/Au
 /NM47+7TNlEQ==
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; d="scan'208";a="565617187"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 15:21:17 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  5 Jan 2021 15:19:44 -0800
Message-Id: <20210105231947.31235-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105231947.31235-1-daniele.ceraolospurio@intel.com>
References: <20210105231947.31235-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/5] drm/i915/guc: do not dump execlists state
 with GuC submission
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

GuC owns the execlists state and the context IDs used for submission, so
the status of the ports and the CSB entries are not something we control
or can decode from the i915 side, therefore we can avoid dumping it. A
follow-up patch will also stop setting the csb pointers when using GuC
submission.

GuC dumps all the required events in the GuC logs when verbosity is set
high enough.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1847d3c2ea99..f62303bf80b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1470,7 +1470,9 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
 		drm_printf(m, "\tIPEHR: 0x%08x\n", ENGINE_READ(engine, IPEHR));
 	}
 
-	if (HAS_EXECLISTS(dev_priv)) {
+	if (intel_engine_in_guc_submission_mode(engine)) {
+		/* nothing to print yet */
+	} else if (HAS_EXECLISTS(dev_priv)) {
 		struct i915_request * const *port, *rq;
 		const u32 *hws =
 			&engine->status_page.addr[I915_HWS_CSB_BUF0_INDEX];
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
