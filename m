Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3AAC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 13:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EE5208E4
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 13:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EE5208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5B6EAB8;
	Fri, 31 Jul 2020 13:46:00 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EA96EAB4
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 13:45:59 +0000 (UTC)
IronPort-SDR: NEID8y6ZuoDwWAPGYVh7jK0avQs95NoYMDIMzI/cXx5zckF+hZY0uR5OWmqf7zomYU2hhAU2Ze
 rSJDomAdFSEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="216227532"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="216227532"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 06:45:59 -0700
IronPort-SDR: R4zYBjT1YmRLqQv6AbD8W/0TTvaReraEw/sa6Owoo9kpnbG6KwWhSdZJC6/JZPmjkzjmyGrVz2
 b+pF5I5uRPKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="273205779"
Received: from fmihut-mobl1.ger.corp.intel.com (HELO delly.ger.corp.intel.com)
 ([10.252.59.1])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2020 06:45:58 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 31 Jul 2020 16:45:50 +0300
Message-Id: <20200731134553.156492-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/3] drm/i915: timeline semaphore support
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

Hi all,

Reviewed series, just getting a CI run with the CI.

Cheers,

Test-with: 20200731134120.156288-1-lionel.g.landwerlin@intel.com

Lionel Landwerlin (3):
  drm/i915: introduce a mechanism to extend execbuf2
  drm/i915: add syncobj timeline support
  drm/i915: peel dma-fence-chains wait fences

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 333 +++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.c               |   3 +-
 drivers/gpu/drm/i915/i915_getparam.c          |   1 +
 include/uapi/drm/i915_drm.h                   |  65 +++-
 4 files changed, 342 insertions(+), 60 deletions(-)

--
2.28.0
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
