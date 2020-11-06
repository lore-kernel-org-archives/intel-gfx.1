Return-Path: <SRS0=j43y=EM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4F2C388F7
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 01:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E610020759
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 01:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E610020759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C56E87F;
	Fri,  6 Nov 2020 01:17:22 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD906E87F
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Nov 2020 01:17:21 +0000 (UTC)
IronPort-SDR: VPZUectu1rPcALOfH68ivSnPn+OlLQQrgAgp92Fni3ho9OZ0nC7L+dQNo4/ef5lElbBcaRc4nw
 4tyGNikEFJvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="166895716"
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; d="scan'208";a="166895716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 17:17:21 -0800
IronPort-SDR: eq/bjxSKoWFY4pmMjIHvmsrXcxrEql75ievwWtOOO7fjd5wPBxIRweipp4fUewuvtkO6Bdph5g
 RHYBjcpbn9zQ==
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; d="scan'208";a="529635017"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 17:17:20 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  5 Nov 2020 17:18:42 -0800
Message-Id: <20201106011842.36203-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Correctly set SFC capability for
 video engines
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

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

SFC capability of video engines is not set correctly because i915
is testing for incorrect bits.

Fixes: c5d3e39caa45 ("drm/i915: Engine discovery query")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3fb52fac0d5d..0b31670343f5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -372,7 +372,8 @@ static void __setup_engine_capabilities(struct intel_engine_cs *engine)
 		 * instances.
 		 */
 		if ((INTEL_GEN(i915) >= 11 &&
-		     engine->gt->info.vdbox_sfc_access & engine->mask) ||
+		     (engine->gt->info.vdbox_sfc_access &
+		      BIT(engine->instance))) ||
 		    (INTEL_GEN(i915) >= 9 && engine->instance == 0))
 			engine->uabi_capabilities |=
 				I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC;
-- 
2.24.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
