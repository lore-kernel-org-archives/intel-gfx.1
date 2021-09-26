Return-Path: <SRS0=KaZY=OQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5CBC433F5
	for <intel-gfx@archiver.kernel.org>; Sun, 26 Sep 2021 18:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59615611EF
	for <intel-gfx@archiver.kernel.org>; Sun, 26 Sep 2021 18:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59615611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25BB89D61;
	Sun, 26 Sep 2021 18:46:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B959989D43
 for <intel-gfx@lists.freedesktop.org>; Sun, 26 Sep 2021 18:45:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="203855840"
X-IronPort-AV: E=Sophos;i="5.85,324,1624345200"; d="scan'208";a="203855840"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2021 11:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,324,1624345200"; d="scan'208";a="456013382"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga002.jf.intel.com with ESMTP; 26 Sep 2021 11:45:56 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.154.207])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 18QIjsYo013937; Sun, 26 Sep 2021 19:45:55 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 26 Sep 2021 20:45:42 +0200
Message-Id: <20210926184545.1407-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210926184545.1407-1-michal.wajdeczko@intel.com>
References: <20210926184545.1407-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [CI v2 1/4] drm/i915/guc: Verify result from CTB
 (de)register action
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

In commit b839a869dfc9 ("drm/i915/guc: Add support for data
reporting in GuC responses") we missed the hypothetical case
that GuC might return positive non-zero value as success data.

While that would be lucky treated as error case, and at the
end will result in reporting valid -EIO, in the meantime this
value will be passed to ERR_PTR that could be misleading.

v2: rebased

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 20c710a74498..c39abb010181 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -168,12 +168,15 @@ static int guc_action_register_ct_buffer(struct intel_guc *guc, u32 type,
 		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
 		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
 	};
+	int ret;
 
 	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
 	GEM_BUG_ON(size % SZ_4K);
 
 	/* CT registration must go over MMIO */
-	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+	ret = intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+
+	return ret > 0 ? -EPROTO : ret;
 }
 
 static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
@@ -201,11 +204,14 @@ static int guc_action_deregister_ct_buffer(struct intel_guc *guc, u32 type)
 		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
 		FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
 	};
+	int ret;
 
 	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
 
 	/* CT deregistration must go over MMIO */
-	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+	ret = intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+
+	return ret > 0 ? -EPROTO : ret;
 }
 
 static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
-- 
2.25.1

