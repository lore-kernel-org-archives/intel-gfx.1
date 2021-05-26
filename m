Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B39AC2B9F7
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 05:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9ED9610A0
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 05:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9ED9610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EFE6E47B;
	Wed, 26 May 2021 05:26:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F0C6E48C
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 May 2021 05:26:41 +0000 (UTC)
IronPort-SDR: A982W6oFWhpbtbutx82KVvoWUd2GqWBO1kG0j4ThAI+1JHHPI4wTrhkiSvl/I8uB2Hnr2FYGER
 N/7YOoPgxEfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182024459"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="182024459"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 22:26:38 -0700
IronPort-SDR: 4AEUsPh1N+jVFg3JOrSBHK9uTlmxh0av/NIjlWwGSvSmwEH1K5aQ4I7MAh7uQeqy2ITusqfpFB
 jaK/p0HZn29g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="630589092"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga006.fm.intel.com with ESMTP; 25 May 2021 22:26:36 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org,
	mahesh.meena@intel.com
Date: Wed, 26 May 2021 10:47:09 +0530
Message-Id: <20210526051710.332081-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH V2 0/1] drm/i915/gt: Introduce timeslicing for
 userspace
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Test-with: 20210524124806.241439-1-tejaskumarx.surendrakumar.upadhyay@intel.com

Tejas Upadhyay (1):
  drm/i915/gt: Declare when we enabled timeslicing

 drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
 include/uapi/drm/i915_drm.h                 | 1 +
 2 files changed, 2 insertions(+)

-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
