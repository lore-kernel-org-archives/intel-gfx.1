Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A3606A326
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmgCwYA7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13910E4AA;
	Tue, 24 Nov 2026 18:35:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1E10E4AA
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795545340; x=1827081340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Fn9y6E+F34gq1OoIAPdTBv34J+sVz89GTcta0vnyCU=;
 b=cmgCwYA7ii286SkxSakQy23tHeJMyKVS4pqgB2Xt9F4/Z26QIvWQZdjD
 I0KezVsvgQXp5nAaBBFCnEuKg77iCKGIo0C+Tx8c7d4SEMoWvBzBaWYuI
 tWeiUrvZIP+fUGnMc150jnwS1ZEFNBePObFYHdwRKLW2C0h0SdTv3pusX
 E0kC6UwSLJLk19eBWfC8Yd5ekzBkYWz9ahFiGX6QhQaqge9J7QyKh7xYk
 vat01HXgMoaYlnJ5aW6O4+qd+0fz40xXHqaB3kDngnhZPHJRVIgYNcQ7W
 erv5D7ullc/oqpzFCExtMuFbWQmPYGzDKxQEYZ0x1uUxo8hozpi9f/cAd g==;
X-CSE-ConnectionGUID: Mr/OT+lbTuinR8n5EtM6QA==
X-CSE-MsgGUID: flMSeNDzQDqI932CLxV0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4254481"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4254481"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 10:14:13 -0800
X-CSE-ConnectionGUID: 8ndY3KRMS8KBVvWWNsmOjw==
X-CSE-MsgGUID: X7aC6GV1RYm/nHAzWgDHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11928472"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 10:14:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/2] drm/i915/uncore: hide uncore forcewake iterators
Date: Tue, 24 Nov 2026 20:14:05 +0200
Message-ID: <20261124181405.1669126-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124181405.1669126-1-jani.nikula@intel.com>
References: <20261124181405.1669126-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are no users of for_each_fw_domain_masked() and
for_each_fw_domain() left outside of intel_uncore.c. Hide them from the
rest of the driver.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 8 ++++++++
 drivers/gpu/drm/i915/intel_uncore.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 02f6000b203e..cefcec468963 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -42,6 +42,14 @@
 #define FORCEWAKE_ACK_TIMEOUT_MS 50
 #define GT_FIFO_TIMEOUT_MS	 10
 
+/* Iterate over initialised fw domains */
+#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
+	for (tmp__ = (mask__); tmp__ ;) \
+		for_each_if(domain__ = (uncore__)->fw_domain[__mask_next_bit(tmp__)])
+
+#define for_each_fw_domain(domain__, uncore__, tmp__) \
+	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, tmp__)
+
 struct intel_uncore *to_intel_uncore(struct drm_device *drm)
 {
 	return &to_i915(drm)->uncore;
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index d5de6a172ff3..1819c9430181 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -175,14 +175,6 @@ struct intel_uncore {
 	unsigned int user_forcewake_count;
 };
 
-/* Iterate over initialised fw domains */
-#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
-	for (tmp__ = (mask__); tmp__ ;) \
-		for_each_if(domain__ = (uncore__)->fw_domain[__mask_next_bit(tmp__)])
-
-#define for_each_fw_domain(domain__, uncore__, tmp__) \
-	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, tmp__)
-
 static inline bool
 intel_uncore_has_forcewake(const struct intel_uncore *uncore)
 {
-- 
2.47.3

