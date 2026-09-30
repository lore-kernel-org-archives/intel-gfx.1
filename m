Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D2EC9830E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 05:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7B510F189;
	Wed, 30 Sep 2026 05:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjShMRNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A08D10F189
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790745639; x=1822281639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3SO/iAMPk4Rc21++nG57m3zvtnLil3LrBna/LkHo+fc=;
 b=YjShMRNcvfGGO07tTsVXXjKl2U6rUVB3mZos8aVO4aC8R8K3g08yY7ZG
 vwx9WDi6bQ9SGbJ/th+HvIYr2kuyYireN9pSoO3QPb6+FWelbDQXs0BJL
 UQTOTzhhgQr304oPVkiz8a9kQIhm1HLlD2Anl7bjxYk87Zkkd7yTiK4cU
 CZ9hD1JvSGsa7K8bFm9PNsx/2AWywm48EuvloXJ4174K+uIMd4sKXyPwo
 ZUOCatwTBrzJ1/SveILZz13t8K8/0I5m0l1HrndZdQxPD3ff13UzTcPD8
 +ZQDEvbghamT4MKaq8s4AtNQvYfnvaMAGPgj3+SY9HYHZGHa90Uf0p3p+ Q==;
X-CSE-ConnectionGUID: I8mM87+WT12an+fzgFZcLw==
X-CSE-MsgGUID: 0EwPvRc5SaWeuBUmKCNcPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94187499"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="94187499"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:20:38 -0700
X-CSE-ConnectionGUID: 8LmmMZKkR36n7BPUyQ78iw==
X-CSE-MsgGUID: s7z6yPjnR52hTThKxHyLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275614868"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by orviesa009.jf.intel.com with ESMTP; 29 Sep 2026 22:20:37 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/1] drm/xe/oa: Zero OA buffer at allocation
Date: Wed, 30 Sep 2026 11:02:01 +0530
Message-ID: <20260930053202.2232908-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Zero the OA buffer immediately after allocation because kernel BO pages
are not guaranteed to be initialized. This prevents stale data exposure
through mmap and fixes the xe_oa tail-address-wrap test.

Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
Assisted-by: GitHub Copilot
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Bommu Krishnaiah (1):
  drm/xe/oa: Zero OA buffer at allocation

 drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.0

