Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050C3C07CA9
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Nov 2023 11:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9452210E4EB;
	Tue, 28 Nov 2023 11:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE76210E4ED
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Nov 2023 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701172316; x=1732708316;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=V+HyPnjdaSNkkX4XSVNMPNnTLRL6sd6JCYN1fY+KCQk=;
 b=MILvmrRESfnsokUqlRXXG5TWM6ylz0rK2NxWkhQdQhWFvarcYXLy4Br6
 Dn8WofhVFC9MrNWu4/58cVcT9FtuPIMOb2MXrGZi77ZmEbVaLyuU0m1ym
 ZRPOfmeWoGfvCKNVGj1ZQFVIzV7jtR0hU7W+q4KpCEySg69y1pCjDIOAT
 2ZADDY/w8hm/qWNJxY0giXf2/9QEpo+ZLwWn9TnqSuoWQoOB2hX4vthTL
 Oeg9qPGI5SmQSg+p4BwuHw9BPEUu3UdO9ra8Jyrp9G5Ul7eoGqhz9pdDj
 hlimRcnioK3v/Qr8msa73SqIn4Hh+Ni99MbYbnyB6enOkGT9RnykPJmvg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459411604"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="459411604"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 03:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="761907449"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="761907449"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 28 Nov 2023 03:51:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Nov 2023 13:51:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 28 Nov 2023 13:51:35 +0200
Message-ID: <20231128115138.13238-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128115138.13238-1-ville.syrjala@linux.intel.com>
References: <20231128115138.13238-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: Fix voltage_level for
 cdclk==480MHz
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

Allow MTL to use voltage level 1 for 480MHz cdclk,
instead of the voltage level 2 that it's currently using.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 6f0a050ad663..f6446102490d 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3512,7 +3512,7 @@ static const struct intel_cdclk_funcs mtl_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
-	.calc_voltage_level = tgl_calc_voltage_level,
+	.calc_voltage_level = rplu_calc_voltage_level,
 };
 
 static const struct intel_cdclk_funcs rplu_cdclk_funcs = {
-- 
2.41.0

