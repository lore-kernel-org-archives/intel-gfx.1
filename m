Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12020606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2IQgXn4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49F010EE89;
	Mon, 26 Oct 2026 11:53:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F8310EE86
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Oct 2026 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015631; x=1824551631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gLARSEMVqoMtYbqNkMrhJSTDSlxVDVJoRsFklvTWmyk=;
 b=W2IQgXn497OO/yWm1S/VoZNZjUrzHBv3zd1YGbm1v1LoK+vn45jA0Af5
 Vba1wwtPCtWIA3tjcIcd8I6+D/Eyk3jx5uws6njs7Y00KjGf8yHECOFMb
 O71k1veFstJyPk4sm7ipho+o+XuyUZ3xQsfaVHRmWqBdTfb0NRkjDZodM
 fpV9Rvs1sNAFhd6dWLMGKmL7P9spr8EfON25fZzoF0CxEdEWKPLuFjqrP
 fHcIKHG7mMuz1sfmhp6uGnHRZNXkTG4lRF23QSIFU95KaNPvjgFw3q++7
 2fAAmW/n9dTX/hoHXGSaCJEwACu89NyBO6SGV2L35S22ptalhmYQX8H+d A==;
X-CSE-ConnectionGUID: 5lfJZ/uYTGa+wMpDPPXX6Q==
X-CSE-MsgGUID: rWLSd2dmQruWQWqqeddmOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1579615"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1579615"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:51 -0700
X-CSE-ConnectionGUID: eaBMzrM+ROa3YINSTzHUmQ==
X-CSE-MsgGUID: VdOE8C/UQh6yZPMhKwhVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4232191"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 3/3] drm/i915/scaler: return -EINVAL instead of -1
Date: Mon, 26 Oct 2026 12:53:29 +0100
Message-ID: <20261026115329.2343954-4-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261026115329.2343954-1-michal.grzelak@linux.intel.com>
References: <20261026115329.2343954-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Scaler allocation fails returning -1 which equates to -EPERM. Return
-EINVAL instead. Apply for skl_pipe_scaler_get_hw_state() as well.

v2->v3
- strip Fixes: trailer for cleanups (Jani)

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 0cfa5b7564ba8..c339fdd6936fa 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -351,7 +351,7 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 		return scaler_id;
 	}
 
-	return -1;
+	return -EINVAL;
 }
 
 static void
@@ -848,7 +848,7 @@ static int skl_pipe_scaler_get_hw_state(struct intel_crtc_state *crtc_state)
 			return scaler_id;
 	}
 
-	return -1;
+	return -EINVAL;
 }
 
 void
-- 
2.45.2

