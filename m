Return-Path: <SRS0=sv0W=IW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF33C433C1
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 11:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9CE619EE
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 11:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC9CE619EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979346E1E0;
	Wed, 24 Mar 2021 11:47:04 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760FC6E1E0;
 Wed, 24 Mar 2021 11:47:03 +0000 (UTC)
IronPort-SDR: S4bhsyZsaMwKFe5moHes0vcUQBEBtondP9ApDZBkt9ddUmGEgG3Q9LUbN0FxYA3mvuQJESUN9K
 RH+vx34wnnjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190714444"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190714444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:47:02 -0700
IronPort-SDR: 76afI7hrV4Ky4SaAbeVEM7plSN//Lnu1txliq+tf80VUNscKtB2bVqAzyQUaPJlHS+KTU6Xe6p
 C/YRSqnu4+2Q==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="442937995"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:47:00 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Wed, 24 Mar 2021 17:00:10 +0530
Message-Id: <20210324113012.7564-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/2] HDCP 2.2 DP errata
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
Cc: maarten.lankhorst@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

HDCP DP 2.2 errata is part of HDCP DP 2.3 specs
as well. 

Anshuman Gupta (2):
  drm/i915/hdcp: Add DP HDCP2.2 timeout to read entire msg
  drm/hdcp: DP HDCP2.2 errata LC_Send_L_Prime=16

 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 45 ++++++++++++++------
 include/drm/drm_hdcp.h                       |  5 ++-
 2 files changed, 36 insertions(+), 14 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
