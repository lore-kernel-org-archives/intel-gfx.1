Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B006C79FAA
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E8310EDE2;
	Tue,  8 Sep 2026 23:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEIzM/rt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87F510E0E7
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909805; x=1820445805;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ceg5WLf4J1AxQ2/i38RcecsJsjZZGKBGFHcDwEWDR8E=;
 b=bEIzM/rteec8dvlwDGRUgqsZtnBxft/3w3nQs6lSLiSOZ/IdEu/t678x
 PzsRBn4b5eXMldgfhVJSxiiLq4VRW/YIlO24dW+YCMt79E2gPzI1abIUO
 01a080rfoW4ucd4ejNNQ3u/FZeSqI8WzGwsq6uTae9WEjlss0owcDxhbP
 Yj2zCbXxR9lrsHLmNUuKIW3SvRrWf7YlocZSthpnK8/cG3Smrn6EQaUKG
 IlF7TYyrjzI3b9IJGztNufXZnkPT4DOdENjDGyJvbm1xamjFO0vp1JsL/
 KjztuTsi3i5pbw5hvByXP5gjP9tZzYBXtF9C/DHNYurlrb+fsx/3XNDjo A==;
X-CSE-ConnectionGUID: k615wh+AQBiBKVuS1AnRhw==
X-CSE-MsgGUID: gs+aswmESEqNbi9fWWyhtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93191024"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="93191024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:23:25 -0700
X-CSE-ConnectionGUID: SlebW26KS9WZH/Vb71LMUA==
X-CSE-MsgGUID: OhRHPOWWRWeheu/K+2Ca+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="271131582"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:23:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH 0/2] Some error handling improvements in GuC
Date: Tue,  8 Sep 2026 16:23:24 -0700
Message-ID: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
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

Fix some issues found in static analysis.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/i915/guc: Range check GuC-provided engine class and instance
  drm/i915/guc: Reject unsolicited deregister-done G2H

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

-- 
2.53.0

