Return-Path: <SRS0=Us6R=MC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393F5C07E9B
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 07:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D558D6135C
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 07:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D558D6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784D06EB0B;
	Sat, 10 Jul 2021 07:30:34 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E006EB0B;
 Sat, 10 Jul 2021 07:30:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="196994781"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="196994781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 00:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="411507818"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 10 Jul 2021 00:30:27 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m27RS-000FT4-MO; Sat, 10 Jul 2021 07:30:26 +0000
Date: Sat, 10 Jul 2021 15:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20210710073013.GA6770@5abf3d7615d3>
References: <20210710012026.19705-15-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210710012026.19705-15-vinay.belgaumkar@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Intel-gfx] [RFC PATCH] drm/i915/guc/slpc:
 intel_rps_read_punit_req() can be static
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
Cc: kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gt/intel_rps.c:1969:5: warning: symbol 'intel_rps_read_punit_req' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_rps.c:1978:5: warning: symbol 'intel_rps_get_req' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 intel_rps.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 88ffc5d90730a..a78af6b0babea 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1966,7 +1966,7 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 	return freq;
 }
 
-u32 intel_rps_read_punit_req(struct intel_rps *rps)
+static u32 intel_rps_read_punit_req(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
@@ -1975,7 +1975,7 @@ u32 intel_rps_read_punit_req(struct intel_rps *rps)
 	return pureq;
 }
 
-u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq)
+static u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq)
 {
 	u32 req = pureq >> GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
