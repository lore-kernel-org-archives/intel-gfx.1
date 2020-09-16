Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B91C43461
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 01:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50BF20715
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 01:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50BF20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620C6E25A;
	Wed, 16 Sep 2020 01:02:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD676E25A
 for <Intel-GFX@lists.freedesktop.org>; Wed, 16 Sep 2020 01:02:43 +0000 (UTC)
IronPort-SDR: Y74cabpep5gk+VyP8QdIYO8jN/1NGYrHef/+XrMMIC/Pk0SI1R1Ri8Axcd/LzSBarkDhoXqaUt
 t4wagmjHWMDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="244210709"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="244210709"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 18:02:42 -0700
IronPort-SDR: X1pPxSQwdOwrGVUPYo0ESeTRGKC9vDbj9t7vm+Z567VIGLMkSKDqWDwyRZvZnjbmVs0cF3Jrei
 vn3OgUw07Lbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="507803827"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2020 18:02:42 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Date: Tue, 15 Sep 2020 18:02:42 -0700
Message-Id: <20200916010242.1994882-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI] PR for new v49.0.1 GuC binaries
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

The following changes since commit d5f9eea5a251d43412b07f5295d03e97b89ac4a5:

  wl18xx: update firmware file 8.9.0.0.83 (2020-09-01 08:07:59 -0400)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/drm/drm-firmware guc_v49

for you to fetch changes up to a5beba43fb3a2b91f4b9de244455351cb2625b6c:

  i915: Add GuC firmware v49.0.1 for all platforms (2020-09-15 17:51:55 -0700)

----------------------------------------------------------------
John Harrison (2):
      i915: Remove duplicate KBL DMC entry
      i915: Add GuC firmware v49.0.1 for all platforms

 WHENCE                  |  25 ++++++++++++++++++++++++-
 i915/bxt_guc_49.0.1.bin | Bin 0 -> 196224 bytes
 i915/cml_guc_49.0.1.bin | Bin 0 -> 197184 bytes
 i915/ehl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
 i915/glk_guc_49.0.1.bin | Bin 0 -> 196672 bytes
 i915/icl_guc_49.0.1.bin | Bin 0 -> 324160 bytes
 i915/kbl_guc_49.0.1.bin | Bin 0 -> 197184 bytes
 i915/skl_guc_49.0.1.bin | Bin 0 -> 196288 bytes
 i915/tgl_guc_49.0.1.bin | Bin 0 -> 321792 bytes
 9 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 i915/bxt_guc_49.0.1.bin
 create mode 100644 i915/cml_guc_49.0.1.bin
 create mode 100644 i915/ehl_guc_49.0.1.bin
 create mode 100644 i915/glk_guc_49.0.1.bin
 create mode 100644 i915/icl_guc_49.0.1.bin
 create mode 100644 i915/kbl_guc_49.0.1.bin
 create mode 100644 i915/skl_guc_49.0.1.bin
 create mode 100644 i915/tgl_guc_49.0.1.bin
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
