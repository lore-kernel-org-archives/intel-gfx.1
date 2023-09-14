Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A2DEEAA6A
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Sep 2023 19:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF5510E59E;
	Thu, 14 Sep 2023 19:27:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4BF10E597
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Sep 2023 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694719632; x=1726255632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mYuO9rLdRx7p2UofzOpLe3By82pOI+xmB5k2rJdfcp4=;
 b=AG2oyXf3n0mSzJbEsj9JQpRfKlb4qbiS/oC5/64RcXrywFPOlBU5TY1F
 E3l+03mc7GwNauFBGPrTBpza12enifLHWx2uyjZLcef1lsE1gZLnbBT9X
 kQ9kz6jvHJn5FPDDQpEZhmGZdQ6KroV6iKoQsjjiSUb8kEuie65FtSM1F
 9IUwrOqeOWj0p1PSpU96LE9ZdtfdTLIGH9O99Ao79BtcCIbNiaj53v+X+
 U787iSNsjiGxKHA3ZXIxEGWiIkhQvfxgjTBZGNCG3CZfspRjaDkQ8Zp3e
 hQ5aUEA2XK6DheYmFWzzoG9x1r90za4CNg77PLN0Z4zlWhvZgX07jUhwW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465421783"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="465421783"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779790628"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779790628"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:11 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 14 Sep 2023 22:26:56 +0300
Message-Id: <20230914192659.757475-23-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230914192659.757475-1-imre.deak@intel.com>
References: <20230914192659.757475-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 22/25] drm/i915/dp_mst: Add missing DSC
 compression disabling
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

Add the missing DSC compression disabling step for MST streams,
similarly to how this is done for SST outputs.

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index a38a0e6da01bf..b2ac29a157fbd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -646,6 +646,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 
 	intel_ddi_disable_transcoder_func(old_crtc_state);
 
+	intel_dsc_disable(old_crtc_state);
+
 	if (DISPLAY_VER(dev_priv) >= 9)
 		skl_scaler_disable(old_crtc_state);
 	else
-- 
2.37.2

