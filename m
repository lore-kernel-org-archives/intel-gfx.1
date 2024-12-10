Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E4E77180
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Dec 2024 14:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C4C10E3AF;
	Tue, 10 Dec 2024 14:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZOdvt6b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBDC10E3AF
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Dec 2024 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733839385; x=1765375385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=59RTjz9II8mYwKK1U6RTFjSYXz3qUvbXaSvhG30bjJo=;
 b=jZOdvt6bcXDVY9v5XLNnTsP+pOcpouaa4yjbiRxEPMpsnZzRs1v3Th3e
 2cPswa5LWbXlenXmoWnubPxYJlQKwBKlKoDXnOeGo65NOuHql7TViDYV0
 /pOzjr4JYej09s14d8dD2Ywgy8tgCsG3n6eiD8WNJ9lBkoTcSb8XoNmkd
 VvKWRb9KLAiHaDCIfWRRPTsWfZbbHEu6cBiii/d6y3/77jXTObmhPdZUv
 PCRsmCCxOi/Xw+xKWUNetLOpra3gUfi6X+ei3OddMB/jpnlMVG/aZ7C0P
 jfoCD9VU7nVJ9PFUECJEtq5KRiEFb8RLkHiTq8iMPVxfvXnAaGrKwOvf4 g==;
X-CSE-ConnectionGUID: yaxgB88kRsOsNu+zqHfVqQ==
X-CSE-MsgGUID: OQne9siTTaasenKUx75Fug==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34320055"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34320055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:02:48 -0800
X-CSE-ConnectionGUID: 8KYJjHjvS3K9LlZ4OfZIOw==
X-CSE-MsgGUID: sswJcxrmRLq35wmoPkgYHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="96234581"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:02:46 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 0/1] Expose dsc sink max slice count via debugfs
Date: Tue, 10 Dec 2024 19:35:42 +0530
Message-Id: <20241210140543.2117692-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Expose dsc sink max slice count via i915_dsc_fec_support debugfs.
This debugfs entry is required in cases, where sink doesn't support
minimum of 8 slices in case of ultrajoiner and minimum of 4 slices
in case of big joiner.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
Test-with: 20241210135322.2117541-1-swati2.sharma@intel.com

Swati Sharma (1):
  drm/i915/dsc: Expose dsc sink max slice count via debugfs

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.25.1

