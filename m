Return-Path: <SRS0=2Jy7=I6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6652C433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 11:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974AB60FDC
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 11:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 974AB60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA7B6EC8F;
	Thu,  1 Apr 2021 11:43:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247066EC8F;
 Thu,  1 Apr 2021 11:43:25 +0000 (UTC)
IronPort-SDR: Bn660K8U8R0ST65nXnOjw8hhjGjGXfujHCF3dQVOHQ7pKph9RfGB93iq8VGjzh7E/9mOYTqmZu
 8ErEXrQfDC1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="189994271"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="189994271"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 04:43:24 -0700
IronPort-SDR: a0WW0T/LNraY11fdyiqfSylmJb8Dc5lBuv7PRht6QvHm0OAAA7n3/L+gZhp6cgSYkGTX8r2G3K
 j/8eVpCfYHeg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="377676442"
Received: from shaneken-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.146])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 04:43:23 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Apr 2021 12:43:16 +0100
Message-Id: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] gem_watchdog: Fix autotools build
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Correcting a brain malfunction while typing in Makefile.sources.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/Makefile.sources | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index e992285fedc5..194df8e27dd0 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -464,7 +464,7 @@ TESTS_progs += gem_wait
 gem_wait_SOURCES = i915/gem_wait.c
 
 TESTS_progs += gem_watchdog
-gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
+gem_watchdog_SOURCES = i915/gem_watchdog.c
 
 TESTS_progs += gem_workarounds
 gem_workarounds_SOURCES = i915/gem_workarounds.c
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
