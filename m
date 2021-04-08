Return-Path: <SRS0=u9zS=JF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C98C433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 08:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03119610A6
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 08:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03119610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A4E6EA29;
	Thu,  8 Apr 2021 08:32:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C036EA28;
 Thu,  8 Apr 2021 08:32:27 +0000 (UTC)
IronPort-SDR: hGqix1UWGB7qWYdvaJrFtBdjVC2uJ5Nu+0qWIA/7sUc2b7K05YdzVJsqSt6wvHdvNwSchDAHN+
 arx7gnN03wbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="172965294"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="172965294"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 01:32:27 -0700
IronPort-SDR: 8DjNouyYB1b7+rkxr0ZnRvBhOG94xW4LjHO3u30bvrHD6O/CHHvip9QM/1HiHiGcsBv7f7i2WW
 wxoJpzGSffkw==
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="458733472"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.1.187])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 01:32:25 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Apr 2021 10:31:57 +0200
Message-Id: <20210408083157.23014-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408083157.23014-1-janusz.krzysztofik@linux.intel.com>
References: <20210408083157.23014-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 2/2] intel-ci: Unblock
 core_hotunplug@*hot*bind* subtests
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Commit be529747d8ea ("intel-ci: Broaden core_hotunplug blacklist")
blamed issues triggered by hot variants[*] as responsible for random
failures in subsequently executed tests,

According to the issue history[*], last reported occurrences were
not related to core_hotunplug.  Remove *hot*bind* subtests from CI
blocklist.

[*] https://gitlab.freedesktop.org/drm/intel/-/issues/2644.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 33f92e37f..595fd0ca6 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -112,10 +112,10 @@ igt@.*@.*pipe-f($|-.*)
 # Temporary workarounds for CI-impacting bugs
 ###############################################
 
-# Currently fails and leaves the machine in a very bad state, and
-# causes coverage loss for other tests. IOMMU related.
-# https://gitlab.freedesktop.org/drm/intel/-/issues/2644
-igt@core_hotunplug@.*(hot|plug).*
+# *plug* subtests still fail and leave the
+# machine in a very bad state, causing coverage
+# loss for other tests.  IOMMU related.
+igt@core_hotunplug@.*plug.*
 
 # hangs several gens of hosts, and has no immediate fix
 igt@device_reset@reset-bound
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
