Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2FC4332F
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Dec 2022 22:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCD410E13E;
	Mon, 12 Dec 2022 22:09:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6509D89EFF
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Dec 2022 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670882950; x=1702418950;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=psLQMBN9RJ6I6tkztN4fJna7e73DXB/nrcPlYsWXBSU=;
 b=TNZ9PIpSovWdspKwhnJrsJunFLi1llO6yOowdF/i3qlrfuFOWxhWGHdA
 9VQhmgc8E0VvQlEwGmpEq+S0SWgGlKuAN8Tib2mqKtOhBZ9uz5CL3KXEo
 smjjwa/uvOK7jkwLh5J0AtW1ZUS5zx3Va52/Dpx8+/9niqLIAA+ipcmTE
 DrGFsE3zTIEquaOGYqmtDwXncOutDoR7txGxgh1WVpIa79LZ13iiFtVPn
 mqyKCGoVZJ3/mvoB+9G05vtA5xQM9KbkTTVzqKZU56CZH4AIn+b5oHKxt
 YHSnnwKWB2nSKFTfgS/2ff009ZXunQ67UbmevfQ8r1MQu+ccjyF225VmW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="345031095"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="345031095"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 14:09:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="641882378"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="641882378"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 14:09:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Dec 2022 14:09:02 -0800
Message-Id: <20221212220902.1819159-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212220902.1819159-1-umesh.nerlige.ramappa@intel.com>
References: <20221212220902.1819159-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 4/4] drm/i915/mtl: Add OA support by enabling
 32 bit OAG formats for MTL
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

Without an entry in oa_init_supported_formats, OA will not be functional
in MTL. Enable OA support by enabling 32 bit OAG formats for MTL.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20228

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 41f6c0923ba5..824a34ec0b83 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4776,6 +4776,7 @@ static void oa_init_supported_formats(struct i915_perf *perf)
 		break;
 
 	case INTEL_DG2:
+	case INTEL_METEORLAKE:
 		oa_format_add(perf, I915_OAR_FORMAT_A32u40_A4u32_B8_C8);
 		oa_format_add(perf, I915_OA_FORMAT_A24u40_A14u32_B8_C8);
 		break;
-- 
2.38.1

