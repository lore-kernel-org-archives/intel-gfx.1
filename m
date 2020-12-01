Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13A4C64E90
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 320A122249
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 320A122249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8216E96B;
	Tue,  1 Dec 2020 23:34:49 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54136E96C
 for <Intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 23:34:48 +0000 (UTC)
IronPort-SDR: mS7skscEjEZCozZ5+jIPp3IYbRLBmNq4rNtjknMY2a8aJ12uFLOe40K4C1BhZ4CxFvrpbWtScu
 KiZ46t3d9tUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234530809"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="234530809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 15:34:48 -0800
IronPort-SDR: HQNwu86XqGqJ4HAOQyP1d7Zov+hLIJFhq/uIFgdc7SffxnVlYC8d97Q1QuCrLOAkgcWbnM/fKq
 VnY8vxDPP7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="537745399"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2020 15:34:45 -0800
From: "Huang, Sean Z" <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Tue,  1 Dec 2020 15:33:55 -0800
Message-Id: <20201201233411.21858-11-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201233411.21858-1-sean.z.huang@intel.com>
References: <20201201233411.21858-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [RFC-v3 10/26] drm/i915/pxp: Implement ioctl action to
 set session in play
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

With this ioctl action, user space driver can set the session in
state "session in play", after dirver reserved the session slot/id
from driver, and sent the TEE commands to activate the
corresponding hardware session. Session state "session in play"
means this session is ready for secure playback.

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c    |  4 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_sm.c | 69 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_sm.h |  2 +
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index d0d126205b12..91ace0f49b5f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -53,6 +53,10 @@ int i915_pxp_ops_ioctl(struct drm_device *dev, void *data, struct drm_file *drmf
 				pxp_info.sm_status = ret;
 				ret = 0;
 			}
+		} else if (params->req_session_state == PXP_SM_REQ_SESSION_IN_PLAY) {
+			ret = pxp_sm_mark_protected_session_in_play(i915, params->session_type,
+								    params->pxp_tag);
+
 		} else {
 			ret = -EINVAL;
 			goto end;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
index e4218083f7ec..b69f5f8bf238 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
@@ -41,6 +41,18 @@ static int pxp_reg_write(struct drm_i915_private *i915, u32 offset, u32 regval)
 	return 0;
 }
 
+static int pxp_get_session_index(struct drm_i915_private *i915, u32 pxp_tag,
+				 int *session_index_out, int *session_type_out)
+{
+	if (!session_index_out || !session_type_out)
+		return -EINVAL;
+
+	*session_type_out = (pxp_tag & SESSION_TYPE_MASK) ? SESSION_TYPE_TYPE1 : SESSION_TYPE_TYPE0;
+	*session_index_out = pxp_tag & SESSION_ID_MASK;
+
+	return 0;
+}
+
 static u8 pxp_get_session_id(int session_index, int session_type)
 {
 	u8 session_id = session_index & SESSION_ID_MASK;
@@ -445,6 +457,63 @@ int intel_pxp_sm_reserve_session(struct drm_i915_private *i915, struct drm_file
 	return ret;
 }
 
+/**
+ * pxp_sm_mark_protected_session_in_play - To put an reserved protected session to "in_play" state
+ * @i915: i915 device handle.
+ * @session_type: Type of the session to be updated. One of enum pxp_session_types.
+ * @session_id: Session id identifier of the protected session.
+ *
+ * Return: status. 0 means update is successful.
+ */
+int pxp_sm_mark_protected_session_in_play(struct drm_i915_private *i915, int session_type,
+					  u32 session_id)
+{
+	int ret;
+	int session_index;
+	int session_type_in_id;
+	struct pxp_protected_session *current_session;
+
+	ret = pxp_get_session_index(i915, session_id, &session_index, &session_type_in_id);
+	if (ret) {
+		drm_err(&i915->drm, "Failed to pxp_get_session_index\n");
+		return ret;
+	}
+
+	if (session_type != session_type_in_id) {
+		drm_err(&i915->drm, "Failed to session_type and session_type_in_id don't match\n");
+		return -EINVAL;
+	}
+
+	lockdep_assert_held(&i915->pxp.ctx->ctx_mutex);
+
+	switch (session_type) {
+	case SESSION_TYPE_TYPE0:
+		list_for_each_entry(current_session, &i915->pxp.ctx->active_pxp_type0_sessions,
+				    session_list) {
+			if (current_session->session_index == session_index) {
+				current_session->session_is_in_play = true;
+				return 0;
+			}
+		}
+		break;
+	case SESSION_TYPE_TYPE1:
+		list_for_each_entry(current_session, &i915->pxp.ctx->active_pxp_type1_sessions,
+				    session_list) {
+			if (current_session->session_index == session_index) {
+				current_session->session_is_in_play = true;
+				return 0;
+			}
+		}
+		break;
+	default:
+		/* invalid session type */
+		return -EINVAL;
+	}
+
+	drm_err(&i915->drm, "Failed to %s couldn't find active session\n", __func__);
+	return -EINVAL;
+}
+
 int pxp_sm_set_kcr_init_reg(struct drm_i915_private *i915)
 {
 	int ret;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h
index 5fcf63f804f8..90f7d74cacdf 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h
@@ -87,6 +87,8 @@ struct pxp_protected_session {
 int intel_pxp_sm_reserve_session(struct drm_i915_private *i915, struct drm_file *drmfile,
 				 int context_id, int session_type, int protection_mode,
 				 u32 *pxp_tag);
+int pxp_sm_mark_protected_session_in_play(struct drm_i915_private *i915, int session_type,
+					  u32 session_id);
 int pxp_sm_set_kcr_init_reg(struct drm_i915_private *i915);
 
 #endif /* __INTEL_PXP_SM_H__ */
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
