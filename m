Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52017E7D0AF
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Sep 2023 22:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9110E058;
	Thu, 21 Sep 2023 22:08:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B8810E058
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Sep 2023 22:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695334122; x=1726870122;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UO0dGfNeJ0qh+0VmTG/F5YUkvncNDQVAbCiMwgPz3W8=;
 b=am/FTf8kvlm7g6K8WCObtDySofSPsdOJL7S3IrPmQkLLZPsEYTgWdhdk
 oyKKI14kcPGHRBpzDhV0ng2kEu1WMTKAlfWeATnlRsw9EUa5WuPnpYWL+
 V3DGNh+PzoSwLg8PhONfTjS94ESGihNrqHiXVqOZhZxK4A4ftVVMsGkD1
 39SqZ6pkeh4JV67GD9NSu4rHhFVEGNPFpGPhMCeNi0feNBb/eacrrVtFk
 97fqRLB8j0L3L27vlBdtk0N51adbHbCIHhcQGaJTl7uiFCgONTOYN196r
 uJPYMLbnzFIpyb1hllFmCru1e4pLMqf/qV0yt4RweqS7Umk60LjG3uWRy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="466981742"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="466981742"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 15:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994274516"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="994274516"
Received: from mrfeleox-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.102])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 15:08:16 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	gustavo.sousa@intel.com
Date: Thu, 21 Sep 2023 19:08:03 -0300
Message-ID: <20230921220804.58265-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/1] [CI] Test MTL DMC v2.17
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

The following changes since commit 3672ccab9237315db2f3a28a47f8ac1062a5a35e:

  Merge branch 'mlimonci/fix-merge-requests-ci' into 'main' (2023-09-18 20:19:32 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware CI-dmc-mtl_2.17

for you to fetch changes up to db0c03d05a48b6b29205cf4d4f22192c69fe8d1a:

  [CI] MTL DMC v2.17 (2023-09-21 09:13:52 -0300)

----------------------------------------------------------------
Gustavo Sousa (1):
      [CI] MTL DMC v2.17

 i915/mtl_dmc_ver2_17.bin | Bin 0 -> 52508 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 i915/mtl_dmc_ver2_17.bin
