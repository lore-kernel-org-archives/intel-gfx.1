Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6AFC982D8
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 23:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A244910E4A4;
	Fri, 18 Sep 2026 23:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Km8zgHsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A0310E4A4
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 23:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789774750; x=1821310750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d1ajMW11K+Rgwq3IJMgPLgy0MFq2FMhJLVJL4/YnvO4=;
 b=Km8zgHsHjB5udzzpe9B+yTElOuZmaZoMmD9F8cd06DkSuhgDT/fGkBww
 V0+Gcve3+e55YGhc5QiXIR83HqlywYCylDn/Tm0BbskxrdHCN6MCmIZ69
 Ml1UbS/eptn8T3aRA8KLz9YZcDp9Sdzma1JTHT8DSp/ttTwDpSJfJWbxb
 ePxqlG6+6NErGlrWjHsAmCflDi9vd0xIUmUB928vUjKouQZwhQ9FPQ4HZ
 9zPA9sHs2Dn7mzPq/ZeIYh05ymkvyRSJsb02hZdZ1Cnle2hHGsk3MpvZG
 0py6ePAUYtxGbill6z6ZjH06wVJ8yDcnOoVoTJoYpBsl5kk8bXiUFiJUG w==;
X-CSE-ConnectionGUID: I7US3VI0Sh6S9Sx5Tjsc5Q==
X-CSE-MsgGUID: lmxxUYcdRpCPlAB8D9ZE/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100978199"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="100978199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 16:39:10 -0700
X-CSE-ConnectionGUID: INtWuQ8fRCiGgLcOa4W6BQ==
X-CSE-MsgGUID: gWuSbSnfTZm147pqtg/Mug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="298072241"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 16:39:08 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v3 0/1] SKL_DSSM / DE_CAP cleanup, pt. 1
Date: Sat, 19 Sep 2026 01:25:09 +0200
Message-ID: <20260918232510.3583453-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Resend of [1] with updated commit message. Decided to split cleanup
patch into separate series from fixes.

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260803214909.3076716-1-michal.grzelak@intel.com/

---
Changelog:
v2->v3
- s/fix/clean/ (Jani)

v1->v2
- s/REG_GENMASK/REG_FIELD_PREP/ (Jani)
- use either runtime info flag or display version check (Jani)
- don't initialize runtime info flag to 0 (Jani)

Michał Grzelak (1):
  drm/i915/display: clean SKL_DSSM register macros

 drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.45.2

