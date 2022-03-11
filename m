Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E504EC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Mar 2022 19:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A66110EA5A;
	Fri, 11 Mar 2022 19:34:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2EB10EA54;
 Fri, 11 Mar 2022 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647027244; x=1678563244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TTznBlx0fLe7ayQYszvRc8d8cmhrxl96mSHpeeAHajQ=;
 b=XOFmV2gdZoSwxPDVxp9idkHOylAZeoPy7b7xmpwvertVzqXBs189B0tz
 MHOgkaws/d6pw5KhyBBVzCol9pr/mBOVkL6xPPc/Ywd9d6bQkKw7+sTcS
 E7egaPGEWhY1yhkvAEBAZkGqhFWrD6RdHm73LoeyoPiE9Z1+8lnByJCTO
 NFD9BnpzW9ZYqE0NynNpA9Bk1Lt0VqnDNTGLoZWXrlgTMytPR9pS46UUi
 X3pTFqPk73xwfJ3ShFyIOuvQNx5Votw6k+Hu8IEbSobI9d3xnLJlzFQtW
 sr4kNSL1oD4tMsE/3AhU+Nc5evpXdCmk4NHMwNhvCfLcI4YF2c+DgI+Q7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="253202340"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="253202340"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 11:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514612105"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 11:34:02 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSl1W-0006zh-1c; Fri, 11 Mar 2022 19:34:02 +0000
Date: Sat, 12 Mar 2022 03:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Message-ID: <20220311193259.GA38493@573a85de5c97>
References: <20220311061543.153611-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311061543.153611-2-matthew.d.roper@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Intel-gfx] [RFC PATCH] drm/i915/xehp:
 intel_sseu_get_geometry_subslices() can be static
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gt/intel_sseu.c:59:5: warning: symbol 'intel_sseu_get_geometry_subslices' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 4d28458ab768d..99e31dcf3db06 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -56,7 +56,7 @@ u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
 	return _intel_sseu_get_subslices(sseu, sseu->subslice_mask, slice);
 }
 
-u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
+static u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
 {
 	return _intel_sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
 }
