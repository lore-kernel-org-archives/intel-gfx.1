Return-Path: <SRS0=Vy2F=QG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28720C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Nov 2021 06:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D76C761353
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Nov 2021 06:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D76C761353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6340C6EAC5;
	Fri, 19 Nov 2021 06:33:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196D6EAB7
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Nov 2021 06:33:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="214395491"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="214395491"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 22:31:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="473442769"
Received: from syerakon-mobl1.amr.corp.intel.com (HELO
 mtolakan-mobl1.intel.com) ([10.209.29.12])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 22:31:51 -0800
From: Madhumitha Tolakanahalli Pradeep
 <madhumitha.tolakanahalli.pradeep@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 18 Nov 2021 22:31:27 -0800
Message-Id: <20211119063128.67366-1-madhumitha.tolakanahalli.pradeep@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/1] Bump DMC version on ADL-P to v2.14
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Adding PR for CI to pick the firmware,

The following changes since commit f5d519563ac9d2d1f382a817aae5ec5473811ac8:

  linux-firmware: Update AMD cpu microcode (2021-11-15 12:49:19 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware adlp_dmc_v2.14

for you to fetch changes up to dd81b8ccf199693e382596eb785cffde9db217c6:

  i915: Add DMC firmware v2.14 for ADL-P (2021-11-17 17:49:57 -0800)

----------------------------------------------------------------
Madhumitha Tolakanahalli Pradeep (1):
      i915: Add DMC firmware v2.14 for ADL-P

 WHENCE                    |   3 +++
 i915/adlp_dmc_ver2_14.bin | Bin 0 -> 77300 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 i915/adlp_dmc_ver2_14.bin


Madhumitha Tolakanahalli Pradeep (1):
  drm/i915/dmc: Update DMC to v2.14 on ADL-P

 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.33.1

