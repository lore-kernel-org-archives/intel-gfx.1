Return-Path: <SRS0=nd+/=JY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49186C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 21:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F389F613D8
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 21:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F389F613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603906E9DF;
	Tue, 27 Apr 2021 21:49:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D766E9DE
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 21:49:21 +0000 (UTC)
IronPort-SDR: rgRlxJyuSjyE87j8vbnwvEYa5FlhQBUFjqkcGlksWYsrsNwtJOeahDxEO55rptxHOQ4yioaIr5
 vtBKxE80pz/w==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="183738207"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; d="scan'208";a="183738207"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 14:49:16 -0700
IronPort-SDR: /a6nDgcb/oSmxWRGUmvaHz9T8XAP+shWBfME0/Gi2Iha/CGTDYkNCspXhk7ih//QzNSPZWAqYl
 d502Wk8FehRg==
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; d="scan'208";a="429983708"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 14:49:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Apr 2021 14:49:12 -0700
Message-Id: <20210427214913.46956-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/1] Add support for querying engine cycles
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This is just a refresh of the earlier patch along with cover letter for the IGT
testing. The query provides the engine cs cycles counter.

v2: Use GRAPHICS_VER() instead of IG_GEN()

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Test-with: 20210421172046.65062-1-umesh.nerlige.ramappa@intel.com

Umesh Nerlige Ramappa (1):
  i915/query: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/i915/i915_query.c | 145 ++++++++++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       |  48 ++++++++++
 2 files changed, 193 insertions(+)

-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
