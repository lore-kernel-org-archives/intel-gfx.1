Return-Path: <SRS0=F+1B=LC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4ACC47082
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 07:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BEE861184
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 07:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BEE861184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11626EACC;
	Tue,  8 Jun 2021 07:21:19 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF176EACB;
 Tue,  8 Jun 2021 07:21:18 +0000 (UTC)
IronPort-SDR: nXvhiuoCziL2qaIIwe14kv1xwEVc5kswODrfLBOTuLfgjQjPFA4yrUiQNAVBruJXAPfee+9jwU
 Mpb6FgJKOc4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191897738"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="191897738"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:21:17 -0700
IronPort-SDR: TSQvUf7fd3TkgJH5iU3MAoI/TKAHh+xbFDYD8s3owjeNgkoj7hP42Nb/l8GUHvd3LaQNDsFVk+
 LjIfLMDbedxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="476500786"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2021 00:21:13 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Tue,  8 Jun 2021 12:41:59 +0530
Message-Id: <1623136321-16514-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622812262-16592-1-git-send-email-vidya.srinivas@intel.com>
References: <1622812262-16592-1-git-send-email-vidya.srinivas@intel.com>
Subject: [Intel-gfx] [PATCH i-g-t 0/2] Disable gamma in degamma subtests
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
Cc: markyacoub@chromium.org, charlton.lin@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This patch series disables gamma in degamma subtest which is missing.
It compares CRC between (linear degamma + solid colors) and (max
degamma + gradient colors). Patch also cleans up degamma before
exiting degamma test and cleans up gamma before exiting gamma
test. Changes are done for both kms_color and kms_color_chamelium.

Vidya Srinivas (2):
  tests/kms_color: Disable gamma in degamma tests
  tests/kms_color_chamelium: Disable gamma in degamma tests

 tests/kms_color.c           | 14 +++++++-------
 tests/kms_color_chamelium.c | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
