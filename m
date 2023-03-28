Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B5DC76196
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Mar 2023 09:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8891F10E466;
	Tue, 28 Mar 2023 09:31:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A306C10E81E
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Mar 2023 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679995862; x=1711531862;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lYn5KHSMdJus9xtpvBiEkjFQdniPB7zjgiweA/CFiFk=;
 b=h7P4BdHIBKCRIVwRPMoRxNELvYZ0MlnodG6UVcCXhdqTD9S36glaERaG
 1i8gKqsLnWK2wE6a4Fnum2yxT9fTyhI4897o+rbJ7J7CMjsWKhGWXfn/Y
 e2kxGda7z9u0yoegZlH/MA8/3QrKxzoJFGnR2AZgmkEklP2DNnblYbfiC
 sBk1iZYMwemxCpv3WJt3PNRKwPZ6QLIlIbZONts+ZV1it4AJhRRKazm7x
 LFeU87kelac5+ww+C4TYCwNgmGQeo56BpD54h3kJSaFgvoEHJpfHgLrVE
 yQCctlt/A2ONmfMFk29PuNP9H1oGkqiW8Q66zuIrkxxLzU2HOrmhOnK/r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="403129606"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="403129606"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 02:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="686343631"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="686343631"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 28 Mar 2023 02:31:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 12:30:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 28 Mar 2023 12:30:40 +0300
Message-Id: <20230328093042.7469-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328093042.7469-1-ville.syrjala@linux.intel.com>
References: <20230328093042.7469-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 6/8] drm/i915/psr: Add a FIXME for the PSR vs.
 AUX usage conflict
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We need to disable PSR when we are doing AUX by hand, otherwise
it's possible that the PSR hardware could be using the AUX CH
while we try to do our manual stuff. Add a FIXME for now.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index eb07dc5d8709..f313a2c2773d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -241,6 +241,11 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	intel_pps_check_power_unlocked(intel_dp);
 
+	/*
+	 * FIXME PSR should be disabled here to prevent
+	 * it using the same AUX CH simultaneously
+	 */
+
 	/* Try to wait for any previous AUX channel activity */
 	for (try = 0; try < 3; try++) {
 		status = intel_de_read_notrace(i915, ch_ctl);
-- 
2.39.2

