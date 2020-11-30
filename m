Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08D8C64E8A
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 09:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D36B20809
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 09:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D36B20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9966E43D;
	Mon, 30 Nov 2020 09:31:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667136E40A
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 09:31:02 +0000 (UTC)
IronPort-SDR: xFtSH/tlJBAVaRhKjE8hD5x23zIlgpJpIs0DxhBOgSA43koJ979w12luAsXb/1qfD/Gdw9c0rN
 IAwKA94vHGoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="257314888"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="257314888"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 01:31:02 -0800
IronPort-SDR: Z7GgltN4bb+GBVtJQwqzig3y8rLTrTDXFS6XMmtzqvz+3dRAzVQqWBLEGq+QqIu1iIF4KCd/r+
 VrlOmgIcJ9QA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="367055058"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 01:31:00 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 14:46:46 +0530
Message-Id: <20201130091646.25576-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130091646.25576-1-anshuman.gupta@intel.com>
References: <20201130091646.25576-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 2/2] drm/i915/display: Protect pipe_update against
 dc3co exit
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

At usual case DC3CO exit happen automatically by DMC f/w whenever
PSR2 clears idle. This happens smoothly by DMC f/w to work with flips.
But there are certain scenario where DC3CO  Disallowed by driver
asynchronous with flips. In such scenario display engine could
be already in DC3CO state and driver has disallowed it,
It initiates DC3CO exit sequence in DMC f/w which requires a
dc3co exit delay of 200us in driver.
It requires to protect intel_pipe_update_{update_end} with
dc3co exit delay.

Cc: Imre Deak <imre.deak@intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ba26545392bc..3b81b98c0daf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -15924,6 +15924,8 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	else
 		intel_fbc_enable(state, crtc);
 
+	/* Protect intel_pipe_update_{start,end} with power_domians lock */
+	mutex_lock(&dev_priv->power_domains.lock);
 	/* Perform vblank evasion around commit operation */
 	intel_pipe_update_start(new_crtc_state);
 
@@ -15935,6 +15937,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 		i9xx_update_planes_on_crtc(state, crtc);
 
 	intel_pipe_update_end(new_crtc_state);
+	mutex_unlock(&dev_prive->power_domains.lock);
 
 	/*
 	 * We usually enable FIFO underrun interrupts as part of the
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
