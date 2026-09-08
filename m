Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E1BC79FA1
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11BD10E1C2;
	Tue,  8 Sep 2026 23:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjrwiQ7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617110E1C2
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909318; x=1820445318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKEf1M9m6iSd7vEEP9wbsHSJp6ckihlXsZyEJ8Z6QSE=;
 b=OjrwiQ7/voih9yFj9TFI+wW2qI88jlPTe9Rn7wiq4Lnwz1pKXR45y8pU
 LscbY6jutJHhW+86HfL0l4T/bXT/UG9oO7zYkN4sKh+7iuzBynK+MFqLU
 ACiaptm6CIqYVEkY8vxkYGcRx0BVm5gGqQP54M79vdD0FL5MxH3MHLDXz
 ijuCWFm3asVoC+y6tMHtd/DQQTig+LzMzDU/L7K48zMfLHetG49G9adXB
 67CxfYqcP3YRkSPGIbkQ/JiWRDkvS7JnOAIQTcYG9s5xKFbDKLrRqFaSC
 x8M0iG34fuR+/CTBRvxbrmAVbl3sMQ57+8OoBe7v2GbidwfsVhCfYySNE A==;
X-CSE-ConnectionGUID: L86UmQ6IRuOI9PNFBzeQ1g==
X-CSE-MsgGUID: ymPna19GQUWX345iOuah+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89530149"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89530149"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:15:18 -0700
X-CSE-ConnectionGUID: IV5B5F+STyCHyO0vFBx6tA==
X-CSE-MsgGUID: v+q/OrD0S+eAyKxvMrMKLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="273092678"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:15:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/2] Minor fixes to OA in i915
Date: Tue,  8 Sep 2026 16:15:12 -0700
Message-ID: <20260908231511.1217426-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
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

Fix 2 issues captured by static analysis to make the OA code more robust.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/i915/perf: Enable the stream before installing its fd
  drm/i915/perf: Remove sysfs group on OA config idr_alloc() failure

 drivers/gpu/drm/i915/i915_perf.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0

