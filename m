Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9F5C43334
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jul 2022 17:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D8718B7AB;
	Tue, 19 Jul 2022 17:27:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6108B9EC
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jul 2022 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658251651; x=1689787651;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PlJADfXolkqsoIZ/zRDyjPiZ9G1DK3U19gqUdV+VKLg=;
 b=EPTYEZLLG/xfQD1cpOgsPvfcbd4LLDV7JC5aiJXpqAMwI/yB98bUAtrC
 g2grfhF93kFDC/fgfQn+e2DiCJlvKeaOv3nBKlL9MOLJZcFkNQerorIWv
 SRjCoPOdDMRG8M531s37FRShOa2/So6dc2J0ILIH4Gc/Z126tcBLBPFHv
 4F+uKoO76XlTNAukHI7x9sMTWWSbscberckyj4AhQ2rSqDha0gxksZ9hI
 hWLOFtddY077d0zPXfpN/gUp5lpWpalwlCoBByDkSBXToJOZVdQ72r6tY
 EeZegN0B15O/fC7of5dVZB7Lmp+rjjocYMWQ3BCWenJgNSUHz73fX4NKF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="287705302"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="287705302"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 10:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="547995556"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 19 Jul 2022 10:27:30 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 19 Jul 2022 10:28:24 -0700
Message-Id: <20220719172825.3155696-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [Intel-gfx 0/1] drm/i915/guc: Remove more GuC error
 capture noise
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

This series removes unnecessary drm_warns that gets built
when CONFIG_DRM_I915_DEBUG_GUC is set.

Alan Previn (1):
  drm/i915/guc: Remove more GuC-Err-Cap noise

 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 8 --------
 1 file changed, 8 deletions(-)


base-commit: 8342f0dc591389ddc341617f8208c18f462e0b24
-- 
2.25.1

