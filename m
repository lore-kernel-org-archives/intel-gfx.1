Return-Path: <SRS0=cmqZ=OV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B658C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 16:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CA861AE3
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 16:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42CA861AE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62A6EE5A;
	Fri,  1 Oct 2021 16:05:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526AC6EE5B;
 Fri,  1 Oct 2021 16:05:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="205632275"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="205632275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 09:03:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="521171584"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 09:03:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Fri,  1 Oct 2021 08:58:25 -0700
Message-Id: <20211001155825.6762-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Fix bug in user proto-context
 creation that leaked contexts
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

Set number of engines before attempting to create contexts so the
function free_engines can clean up properly. Also check return of
alloc_engines for NULL.

v2:
 (Tvrtko)
  - Send as stand alone patch
 (John Harrison)
  - Check for alloc_engines returning NULL
v3:
 (Checkpatch / Tvrtko)
  - Remove braces around single line if statement

Cc: Jason Ekstrand <jason@jlekstrand.net>
Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8208fd5b72c3..8c7ea6e56262 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -898,6 +898,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 	unsigned int n;
 
 	e = alloc_engines(num_engines);
+	if (!e)
+		return ERR_PTR(-ENOMEM);
+	e->num_engines = num_engines;
+
 	for (n = 0; n < num_engines; n++) {
 		struct intel_context *ce;
 		int ret;
@@ -931,7 +935,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 			goto free_engines;
 		}
 	}
-	e->num_engines = num_engines;
 
 	return e;
 
-- 
2.32.0

