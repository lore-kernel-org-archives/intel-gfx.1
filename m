Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34757C433FE
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Oct 2022 11:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4025710E48E;
	Wed,  5 Oct 2022 11:16:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A410E48E
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Oct 2022 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664968576; x=1696504576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Di24TIUdNIuQInmqw8gR8kEGzfWfjldA+ml2CyMivvE=;
 b=VQm2LeMF3J+e5ulPNufyOOTKMefTHdjdxUziRsdLadVK59P+a3MJSsbS
 O+SD+yxEhokcPejNfNSE66zimv0tdD/awczpAirn9I3pDpx96yZlXt4bB
 FvtZBPpQTAMJsrznTvFfgjl7xC1jqH6h6Uw+dQrTGVBOw5MszwYpMiLsn
 ARUHlI7JhmpusjIwwOYTkazc1iLWk10jEHJZPwjNWCiVgaczPZLzeBVpV
 aHJv/7apSIumRfkwmlvtTdRv+n5YFloW/vWl+hDeHzmpz3Ps1+QCZLvfs
 Wa005AatJUshsGvAu9VBfQtm5UEZlS1oHMlpv4Yz01DpxktpEGjy8m7rQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="329547441"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="329547441"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 04:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="601981985"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="601981985"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2022 04:16:14 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  5 Oct 2022 14:11:58 +0300
Message-Id: <20221005111158.3022387-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Ensure dbuf state is defined
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

Ensure that the new dbuf state is not null. If so, throw
an error, discontinue to allocate ddb and return.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index d58e667016e4..4ecf3b43d6d2 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -638,6 +638,9 @@ skl_crtc_allocate_ddb(struct intel_atomic_state *state, struct intel_crtc *crtc)
 	u32 start, end;
 	int ret;
 
+	if (IS_ERR(new_dbuf_state))
+		return PTR_ERR(new_dbuf_state);
+
 	if (new_dbuf_state->weight[pipe] == 0) {
 		skl_ddb_entry_init(&new_dbuf_state->ddb[pipe], 0, 0);
 		goto out;
-- 
2.34.1

