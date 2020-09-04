Return-Path: <SRS0=Or3b=CQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE3DC10DAA
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2020 00:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F1D2080A
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2020 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F1D2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5D689DA2;
	Mon,  7 Sep 2020 00:55:53 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14166E0D9;
 Mon,  7 Sep 2020 00:55:50 +0000 (UTC)
IronPort-SDR: lwIUDKdEsd8mLcaQVAru2WpGosuH/huhQU7CO8Lgxhs5x0Ia5+3Hq2ZcSqdRbf8x/nBj/BDrSi
 uT9zdphqVUVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157950648"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157950648"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:55:50 -0700
IronPort-SDR: Hpju70l4EwiJ20n9CRcGMcGJBwO0nU2mZDS+srXDgBRZ0BAzeNmv3pFICT+2DSwzLBdx+WkCQC
 zCjFVJgKlBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479443970"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:55:47 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Sat,  5 Sep 2020 00:21:41 +0800
Message-Id: <1599236505-9086-9-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
Subject: [Intel-gfx] [PATCH v1 08/12] drm/i915/gvt: GVTg handle guest
 shared_page setup
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
Cc: chris@chris-wilson.co.uk, zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

GVTg implemented guest shared_page register operation and read and write
shared_page functionality based on hypervisor read and write functionality.

the shared_page_gpa was passed from guest driver through PVINFO
shared_page_gpa register.

Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h      |  9 ++++++--
 drivers/gpu/drm/i915/gvt/handlers.c | 20 +++++++++++++++++
 drivers/gpu/drm/i915/gvt/vgpu.c     | 43 +++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 31d8a2bcc..d635313 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -214,6 +214,8 @@ struct intel_vgpu {
 
 	u32 scan_nonprivbb;
 	u32 pv_caps;
+	u64 shared_page_gpa;
+	bool shared_page_enabled;
 };
 
 static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
@@ -536,7 +538,7 @@ static inline u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar)
 static inline bool intel_vgpu_enabled_pv_cap(struct intel_vgpu *vgpu,
 		enum pv_caps cap)
 {
-	return (vgpu->pv_caps & cap);
+	return vgpu->shared_page_enabled && (vgpu->pv_caps & cap);
 }
 
 void intel_vgpu_clean_opregion(struct intel_vgpu *vgpu);
@@ -692,7 +694,10 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
 void intel_gvt_debugfs_init(struct intel_gvt *gvt);
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
-
+int intel_gvt_read_shared_page(struct intel_vgpu *vgpu,
+		unsigned int offset, void *buf, unsigned long len);
+int intel_gvt_write_shared_page(struct intel_vgpu *vgpu,
+		unsigned int offset, void *buf, unsigned long len);
 
 #include "trace.h"
 #include "mpt.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index bfea065..295e43a 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1204,6 +1204,8 @@ static int pvinfo_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 	case 0x78010:	/* vgt_caps */
 	case 0x7881c:
 	case _vgtif_reg(pv_caps):
+	case _vgtif_reg(shared_page_gpa):
+	case _vgtif_reg(shared_page_gpa) + 4:
 		break;
 	default:
 		invalid_read = true;
@@ -1221,6 +1223,9 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 	enum intel_gvt_gtt_type root_entry_type = GTT_TYPE_PPGTT_ROOT_L4_ENTRY;
 	struct intel_vgpu_mm *mm;
 	u64 *pdps;
+	unsigned long gpa, gfn;
+	u16 ver_major = PV_MAJOR;
+	u16 ver_minor = PV_MINOR;
 
 	pdps = (u64 *)&vgpu_vreg64_t(vgpu, vgtif_reg(pdp[0]));
 
@@ -1234,6 +1239,19 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
 	case VGT_G2V_PPGTT_L3_PAGE_TABLE_DESTROY:
 	case VGT_G2V_PPGTT_L4_PAGE_TABLE_DESTROY:
 		return intel_vgpu_put_ppgtt_mm(vgpu, pdps);
+	case VGT_G2V_SHARED_PAGE_REGISTER:
+		gpa = vgpu_vreg64_t(vgpu, vgtif_reg(shared_page_gpa));
+		gfn = gpa >> PAGE_SHIFT;
+		if (!intel_gvt_hypervisor_is_valid_gfn(vgpu, gfn)) {
+			vgpu_vreg_t(vgpu, vgtif_reg(pv_caps)) = 0;
+			return 0;
+		}
+		vgpu->shared_page_gpa = gpa;
+		vgpu->shared_page_enabled = true;
+
+		intel_gvt_write_shared_page(vgpu, 0, &ver_major, 2);
+		intel_gvt_write_shared_page(vgpu, 2, &ver_minor, 2);
+		break;
 	case VGT_G2V_EXECLIST_CONTEXT_CREATE:
 	case VGT_G2V_EXECLIST_CONTEXT_DESTROY:
 	case 1:	/* Remove this in guest driver. */
@@ -1290,6 +1308,8 @@ static int pvinfo_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	case _vgtif_reg(pdp[3].hi):
 	case _vgtif_reg(execlist_context_descriptor_lo):
 	case _vgtif_reg(execlist_context_descriptor_hi):
+	case _vgtif_reg(shared_page_gpa):
+	case _vgtif_reg(shared_page_gpa) + 4:
 		break;
 	case _vgtif_reg(rsv5[0])..._vgtif_reg(rsv5[3]):
 		invalid_write = true;
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 4867426..e9bc683 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -64,6 +64,8 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 	vgpu_vreg_t(vgpu, vgtif_reg(cursor_x_hot)) = UINT_MAX;
 	vgpu_vreg_t(vgpu, vgtif_reg(cursor_y_hot)) = UINT_MAX;
 
+	vgpu_vreg64_t(vgpu, vgtif_reg(shared_page_gpa)) = 0;
+
 	gvt_dbg_core("Populate PVINFO PAGE for vGPU %d\n", vgpu->id);
 	gvt_dbg_core("aperture base [GMADR] 0x%llx size 0x%llx\n",
 		vgpu_aperture_gmadr_base(vgpu), vgpu_aperture_sz(vgpu));
@@ -609,3 +611,44 @@ void intel_gvt_reset_vgpu(struct intel_vgpu *vgpu)
 	intel_gvt_reset_vgpu_locked(vgpu, true, 0);
 	mutex_unlock(&vgpu->vgpu_lock);
 }
+
+/**
+ * intel_gvt_read_shared_page - read content from shared page
+ */
+int intel_gvt_read_shared_page(struct intel_vgpu *vgpu,
+		unsigned int offset, void *buf, unsigned long len)
+{
+	int ret = -EINVAL;
+	unsigned long gpa;
+
+	if (offset >= PAGE_SIZE)
+		goto err;
+
+	gpa = vgpu->shared_page_gpa + offset;
+	ret = intel_gvt_hypervisor_read_gpa(vgpu, gpa, buf, len);
+	if (!ret)
+		return ret;
+err:
+	gvt_vgpu_err("read shared page (offset %x) failed", offset);
+	memset(buf, 0, len);
+	return ret;
+}
+
+int intel_gvt_write_shared_page(struct intel_vgpu *vgpu,
+		unsigned int offset, void *buf, unsigned long len)
+{
+	int ret = -EINVAL;
+	unsigned long gpa;
+
+	if (offset >= PAGE_SIZE)
+		goto err;
+
+	gpa = vgpu->shared_page_gpa + offset;
+	ret = intel_gvt_hypervisor_write_gpa(vgpu, gpa, buf, len);
+	if (!ret)
+		return ret;
+err:
+	gvt_vgpu_err("write shared page (offset %x) failed", offset);
+	memset(buf, 0, len);
+	return ret;
+}
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
