Return-Path: <SRS0=yQCO=KD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336FBC433B4
	for <intel-gfx@archiver.kernel.org>; Sat,  8 May 2021 02:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F75610A2
	for <intel-gfx@archiver.kernel.org>; Sat,  8 May 2021 02:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F75610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4902A6E833;
	Sat,  8 May 2021 02:28:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5A46E832
 for <intel-gfx@lists.freedesktop.org>; Sat,  8 May 2021 02:28:32 +0000 (UTC)
IronPort-SDR: XpXrbZsKyNFmELmf9x/PHJ0PgnHJUGbYSv9QyurY/McTI6oNswH+PIH1WFtn/RfZTmJdTzmcW9
 J+cekBZbpdRg==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="284317030"
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="284317030"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 19:28:30 -0700
IronPort-SDR: 2yKk32H8RlmgTMZTE+pYEP5W6IIHc1BzKqmHrgmSb3r8IJYQSvpgsEpmZEf3ysCJjNHx3q6hfh
 UqDRoSeCX9cg==
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="533910160"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 19:28:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  7 May 2021 19:28:12 -0700
Message-Id: <20210508022820.780227-41-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210508022820.780227-1-matthew.d.roper@intel.com>
References: <20210508022820.780227-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 40/48] drm/i915/bigjoiner: Avoid
 dsc_compute_config for uncompressed bigjoiner
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

From: Animesh Manna <animesh.manna@intel.com>

For uncompressed big joiner DSC engine will not be used so will avoid
compute config of DSC.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Clinton Taylor <Clinton.A.Taylor@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 92d4c5ab32d7..a1a472ffef6d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1371,9 +1371,13 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	 */
 	ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config, &limits);
 
-	/* enable compression if the mode doesn't fit available BW */
+	/*
+	 * Pipe joiner needs compression upto display12 due to BW limitation. DG2
+	 * onwards pipe joiner can be enabled without compression.
+	 */
 	drm_dbg_kms(&i915->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
-	if (ret || intel_dp->force_dsc_en || pipe_config->bigjoiner) {
+	if (ret || intel_dp->force_dsc_en || (DISPLAY_VER(i915) < 13 &&
+					      pipe_config->bigjoiner)) {
 		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
 						  conn_state, &limits);
 		if (ret < 0)
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
