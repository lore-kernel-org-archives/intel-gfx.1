Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24588606A323
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 12:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPZTv46D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758810F235;
	Mon,  9 Nov 2026 12:30:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024E710F23A
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227417; x=1825763417;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nyq7O2tDgngYFGYGOMugnJk+pEOiFhRgvlFpBYNvLxA=;
 b=HPZTv46DNU5HbBs+y+LeG9Diny43lHyJJGnUY1P4RpiQCB+rG+ioecmf
 U+AorfbuvYdsy5EfDl7wdrB9zcK9cMIr1SYrDbJ9xvHM2O2VSwvHsi3FR
 72AI9CIZt1uI+p1Cl0cOvl7fXrryeVCxybKMw1EkTHt/Xt3ODIRnsiN4Z
 XsdqehAaHwp27qMwMmibBb5ugMYEsQLv0HJ7GpfJmfU8kj/EwmByXXNth
 5aEAbbO1EYkidTCbikCcf4Xfpfk0HP5HgCNtLU5Hgt1oJ+EiUZRzez6Ts
 /Me/VBh+oCk2qnZo6imEEsO+GAFEzl+Bp7D9OHd5bN5rRdvDBf6u2JXxa Q==;
X-CSE-ConnectionGUID: MXcXw9ZrQUCna4bFKsryKQ==
X-CSE-MsgGUID: RtXKvyEuQseu3nCvxqo1bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2863606"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2863606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:16 -0800
X-CSE-ConnectionGUID: 9cJJrNbDSTyMqKaC+DSm9w==
X-CSE-MsgGUID: MSDhay3BRMyR8cR+FX1tWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8013226"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915/irq: Micro optimize gen8/gen11 irq handlers
Date: Mon,  9 Nov 2026 14:30:09 +0200
Message-ID: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Micro optimize the gen8/gen11 irq handlers a bit by checking the
GT interrupt bits in the main irq handler. This also makes the structure
for calling the sub handlers a bit more uniform, which is nice.

Ville Syrjälä (3):
  drm/i915/irq: Don't call gen8_gt_irq_handler() needlessly
  drm/i915/irq: Don't call gen11_gt_irq_handler() needlessly
  drm/i915/irq: Check the master bit outside gen11_gu_misc_irq_ack()

 drivers/gpu/drm/i915/gt/intel_gt_irq.h |  3 +++
 drivers/gpu/drm/i915/i915_irq.c        | 25 +++++++++++++------------
 2 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.56.0

