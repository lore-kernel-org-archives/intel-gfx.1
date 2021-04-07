Return-Path: <SRS0=LPwG=JE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355EDC433ED
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Apr 2021 12:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DECCB61260
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Apr 2021 12:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DECCB61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E272891D6;
	Wed,  7 Apr 2021 12:23:28 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13239891D6
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Apr 2021 12:23:27 +0000 (UTC)
IronPort-SDR: eK82O1DtRi3cqvVxocSdGErjtywxyOqHHl/WSIwZfA9ogbmSN0DeqNbxdjIKyYzDzViNv5zxEW
 pyA2fmTWLchg==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="254630834"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="254630834"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 05:23:26 -0700
IronPort-SDR: EVUBtt3Tizwi9cAo/RgfWkVXBkrRABuRN464VG8eU4NE9HDJf7fisIKPbeSihWYbmF0FVbtL3/
 TyvrfRQcBjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="449099301"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2021 05:23:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5435412A; Wed,  7 Apr 2021 15:23:40 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org
Date: Wed,  7 Apr 2021 15:23:37 +0300
Message-Id: <20210407122337.77493-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v1 1/1] drm/i915: Include only needed headers in
 ascii85.h
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

The ascii85.h is user of exactly two headers, i.e. math.h and types.h.
There is no need to carry on entire kernel.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/ascii85.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/ascii85.h b/include/linux/ascii85.h
index 4cc40201273e..83ad775ad0aa 100644
--- a/include/linux/ascii85.h
+++ b/include/linux/ascii85.h
@@ -8,7 +8,8 @@
 #ifndef _ASCII85_H_
 #define _ASCII85_H_
 
-#include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/types.h>
 
 #define ASCII85_BUFSZ 6
 
-- 
2.30.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
