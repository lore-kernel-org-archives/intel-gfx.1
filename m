Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110A4C433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jul 2022 00:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23610E354;
	Thu,  7 Jul 2022 00:31:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46FE10E1F6
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jul 2022 00:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657153902; x=1688689902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1IRYj92c7iA6j6jg622/o9mYiJZMzLF8IolL7w+kzVs=;
 b=hGk6kvAWvKU7P5HK4fuea4K0pa0mO2xtErCyI7eZVez5YjWl0KyqwDfw
 6bEo7fJX27FFEsPq89sL/AqbHeCZnNIrqEpsinN5VgrKKSBkrFWcsdOEn
 VHzXwEUhmTQ/NWW/MYyuMDU+qDJSsfSKaTSiJQTeO/sCZBKgh896w4FoP
 U+bpBEpU9c91JfMj+2yBIUk3hcNvRzoBV3Balj9Z/oc90UO56sk7WYE26
 stKRxTWTxcyt0m/StsmoO7RYZWSfAPBKCjn4QTXaljJra0N+XOLcNXIlT
 eDdfBxBNbP/u/zHvekkfMLj7Ocu8+2B5+D25Ta0KIsFbh7zh+z/W0KKuM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="370216162"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="370216162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 17:31:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="661174391"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 17:31:25 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  6 Jul 2022 17:31:05 -0700
Message-Id: <20220707003107.2533184-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/2] i915: Introduce Meteorlake
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Meteorlake is a new client platform following RPL S. Meteorlake
introduces version 14 for Display, version 13 Media and version
12.70 for Graphics.

This is the basic platform definition series to introduce Meteorlake.

Radhakrishna Sripada (2):
  drm/i915/mtl: Add MeteorLake platform info
  drm/i915/mtl: Add MeteorLake PCI IDs

 drivers/gpu/drm/i915/i915_drv.h          |  5 +++++
 drivers/gpu/drm/i915/i915_pci.c          | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_device_info.c | 15 ++++++++++++++
 drivers/gpu/drm/i915/intel_device_info.h |  5 +++++
 include/drm/i915_pciids.h                | 19 +++++++++++++++++
 5 files changed, 70 insertions(+)

-- 
2.25.1

