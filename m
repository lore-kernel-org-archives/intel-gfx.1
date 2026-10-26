Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC45606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YLmYJiOu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982C310EE7F;
	Mon, 26 Oct 2026 11:53:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465F210EE7F
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Oct 2026 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015630; x=1824551630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxJ/yYPe3Yo0Nv0dzMs2tM6NINErHoaJ63DI+NSixXk=;
 b=YLmYJiOum+F8Dh8tZWrGHi1xCYiiZ8kDR4MuEnt516bhEYZKlZz7NwDJ
 rOcej20q6k0rfy8fqp9203wy3ieGtfBmXk6UVWqt/Ez97sOG7aO+hF2yx
 5M69TNdEe/sW8ao8Fyqh63NlqbB2x7N8b0DosK7Y2G0PpzCZ5ayaa/wRp
 1BTWAtVgimcRzVARE7VZTfuSwXhBxO4hkOsOOZam91wEWr03jcRZq1LB/
 tTX0nY3F44Qniwor5QWL57yRKeuRsUcxyvs2SNE3QX7c4JdxiQFqz20vQ
 BuUfX3AabkAWjr9WnBstJ6b/9rv7EfxthRmvQqSvW1R/iQMWeErlpcUe7 Q==;
X-CSE-ConnectionGUID: TB+ha4j7RIy3EEJSRuK2fw==
X-CSE-MsgGUID: 2VMS8a19Qi+SToK2y7d5/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1579611"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1579611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:49 -0700
X-CSE-ConnectionGUID: HReT4UZYQkSNjruY/Om0FA==
X-CSE-MsgGUID: lrmZDS5LSPO83h6b+K1Q/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4232185"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:47 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v3 2/3] drm/i915/scaler: s/i/scaler_id/
Date: Mon, 26 Oct 2026 12:53:28 +0100
Message-ID: <20261026115329.2343954-3-michal.grzelak@linux.intel.com>
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

Rename generic iterator into more descriptive one.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 4b456924fdef3..0cfa5b7564ba8 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -337,18 +337,18 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 				 bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
-	int i;
+	int scaler_id;
 
-	for (i = 0; i < crtc->num_scalers; i++) {
-		if (scaler_state->scalers[i].in_use)
+	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
+		if (scaler_state->scalers[scaler_id].in_use)
 			continue;
 
-		if (casf_scaler && !scaler_has_casf(display, i))
+		if (casf_scaler && !scaler_has_casf(display, scaler_id))
 			continue;
 
-		scaler_state->scalers[i].in_use = true;
+		scaler_state->scalers[scaler_id].in_use = true;
 
-		return i;
+		return scaler_id;
 	}
 
 	return -1;
-- 
2.45.2

