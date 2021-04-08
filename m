Return-Path: <SRS0=u9zS=JF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502CBC43461
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 04:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D4EF6113E
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 04:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D4EF6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE5F6E9FC;
	Thu,  8 Apr 2021 04:52:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D81E6E9F1
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Apr 2021 04:52:40 +0000 (UTC)
IronPort-SDR: ca40DoJfvsLKTmcIvcX5O9e1A+xJj9KQGO6rNRbAJga0gx3OB7WUM1xaZj47MJnkavBxsqAsfM
 AFWYp4HqRR1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193573102"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="193573102"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 21:52:38 -0700
IronPort-SDR: 5N0rG4ud5PKX5Ab85qtIP6BS4U56OKcISoqM/knXsy7s62ufupS/numcS/yA1G1vXPEK8qyhnG
 T450qV16TfNg==
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="422064244"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 21:52:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  7 Apr 2021 21:52:25 -0700
Message-Id: <20210408045227.985408-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210408045227.985408-1-lucas.demarchi@intel.com>
References: <20210408045227.985408-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 10/12] drm/i915/display: use DISPLAY_VER() on
 remaining users
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

Commit 989634fb49ad ("drm/i915/audio: set HDA link parameters in driver")
added INTEL_GEN() in the display code, where it should actually be using
DISPLAY_VER(). Switch to the new macro.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 9671c8f6e892..9fe3a25710b8 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -1309,7 +1309,7 @@ static void i915_audio_component_init(struct drm_i915_private *dev_priv)
 	if (DISPLAY_VER(dev_priv) >= 9) {
 		aud_freq_init = intel_de_read(dev_priv, AUD_FREQ_CNTRL);
 
-		if (INTEL_GEN(dev_priv) >= 12)
+		if (DISPLAY_VER(dev_priv) >= 12)
 			aud_freq = AUD_FREQ_GEN12;
 		else
 			aud_freq = aud_freq_init;
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
