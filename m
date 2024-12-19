Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DB7E77184
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Dec 2024 13:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C281710ED05;
	Thu, 19 Dec 2024 13:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2HCHB70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042BB10ED07
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Dec 2024 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734613730; x=1766149730;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FoDAi0ZTti5fMIbv+nSTVN1sRU+3ABUR9ruD0scbGfY=;
 b=a2HCHB70iiQX/s7b0tSx0d/IjrB6Vjs9iYpOBak8Z6Qi+KDxBGG7hM32
 DxaCgz2F67pSas5p1a6+6BIpwVIgKVFInkAG8c2wQAv0JR1kemXmjMqHk
 c5V9aarzdMLmcTz/J1BJPBqzD0aMs7gtF6DgYCwZNdMmeT49tswUUBgHC
 IhLuuroa4bSGd7fAQ9ufJZRND7UzbAHsX9/cw1emIwo4y03d/bOoFzuMK
 3KyOk+bAawo3L4hPURCsTg+jfutXuM5pAEq9py2iqJ/rR/aN5h9ODhCLZ
 HhVsfJAArHZNKr6WGzUoRDyIl/7cFp25Nn2IqXbh/KB7fqwA0mIjHxfgu g==;
X-CSE-ConnectionGUID: gni+rPvKTTaHpQUC9VEcWw==
X-CSE-MsgGUID: 5gsqXwOFTFCUwlDRsLqdaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38798150"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="38798150"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 05:08:50 -0800
X-CSE-ConnectionGUID: RiiOZNXzTWK4mM/DD9hQ+Q==
X-CSE-MsgGUID: JILhYbvORQ+Pg9ezhtfCLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="98403326"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Dec 2024 05:08:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Dec 2024 15:08:47 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915/scaler: s/excdeed/exceed/
Date: Thu, 19 Dec 2024 15:08:26 +0200
Message-ID: <20241219130827.22830-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219130827.22830-1-ville.syrjala@linux.intel.com>
References: <20241219130827.22830-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix typo s/excdeed/exceed/

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index f6d76ef1a854..79739357162c 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -64,7 +64,7 @@ static u16 skl_scaler_calc_phase(int sub, int scale, bool chroma_cosited)
 	/*
 	 * Hardware initial phase limited to [-0.5:1.5].
 	 * Since the max hardware scale factor is 3.0, we
-	 * should never actually excdeed 1.0 here.
+	 * should never actually exceed 1.0 here.
 	 */
 	WARN_ON(phase < -0x8000 || phase > 0x18000);
 
-- 
2.45.2

