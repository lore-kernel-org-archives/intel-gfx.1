Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6684C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 16:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6FD64E98
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 16:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6FD64E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32876E91F;
	Thu, 18 Mar 2021 16:24:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C106E91E;
 Thu, 18 Mar 2021 16:24:12 +0000 (UTC)
IronPort-SDR: m1Plev6ru0lwuRGx0WmuSUJWtvyWAvLnit/p75JeP5ILLUMyfgMe+QeF2EilW5RDeXI/loRE68
 oTmQQxJEKzyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="189760733"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="189760733"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 09:24:11 -0700
IronPort-SDR: hSd8OnjXHRDIFYhGsO+OFh2xxDxhBMjcXpCt7jjZx4/msTuPZlv9lI3X9fksAMXFt1asfVbrRc
 ZRZMi3cl1eHg==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413149649"
Received: from syeghiay-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.51.182])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 09:24:10 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 18 Mar 2021 16:23:57 +0000
Message-Id: <20210318162400.2065097-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 0/3] Default fence expiration test
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

See patch 2.

Tvrtko Ursulin (3):
  lib: Add helper for reading modparam values
  tests/i915: Default fence expiry test
  tests/i915/gem_watchdog: Exercise long rendering chains

 lib/igt_params.c          |  26 ++
 lib/igt_params.h          |   2 +
 tests/Makefile.sources    |   3 +
 tests/i915/gem_watchdog.c | 686 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 718 insertions(+)
 create mode 100644 tests/i915/gem_watchdog.c

-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
