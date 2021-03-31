Return-Path: <SRS0=tUI/=I5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BE6C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 09:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B42619BB
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 09:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B42619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63436EA0E;
	Wed, 31 Mar 2021 09:12:55 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1576EA0C;
 Wed, 31 Mar 2021 09:12:53 +0000 (UTC)
IronPort-SDR: KKy74OoWlklbRrAcz5IJnuqXjWthOGCGdczMlWFPUl9FdS1dUoCBigI/AsnfbBq5dlWFej/cIF
 JrBS7nK8zrlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191988106"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="191988106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 02:12:52 -0700
IronPort-SDR: LH7Bamurd0cCXe5wd6anhEquhl2dTjZLRggx9uh/kBoI8aNxu5eyHwi5nUIfVXc1ispCX9hyiN
 S77fbb4kkVyw==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418578459"
Received: from jlowe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.218])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 02:12:49 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 Mar 2021 10:12:41 +0100
Message-Id: <20210331091241.2566311-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Document how to use JSON
 output
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

Put a note on how to use JSON output into the man page.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/100
---
 man/intel_gpu_top.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index f6d74852558b..94fdc6520fd3 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -81,6 +81,11 @@ Filter types: ::
     pci      pci:[vendor=%04x/name][,device=%04x][,card=%d]
              vendor is hex number or vendor name
 
+JSON OUTPUT
+===========
+
+To parse the JSON as output by the tool the consumer should wrap its entirety into square brackets ([ ]). This will make each sample point an JSON array element and will avoid "Multiple root elements" JSON validation error.
+
 LIMITATIONS
 ===========
 
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
