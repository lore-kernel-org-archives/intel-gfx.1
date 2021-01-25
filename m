Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5139AC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 15:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87AD21707
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 15:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87AD21707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D55B6E241;
	Mon, 25 Jan 2021 15:53:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DD86E241
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 15:53:16 +0000 (UTC)
IronPort-SDR: ONb7b5AVHubJnzqcZwrmohKWL17pFBMQZW+nqklYmVYQ+cUyPqVG3t7NvwvxpdnqokpEqqWLnr
 UmjsweWauzbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="177176065"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="177176065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 07:53:16 -0800
IronPort-SDR: 4bRUq2R8ikrWIvXwIqIwMO60EYLCgPz1a8gOcMj2AL/nD5YC8FkwKFQEZ8n4N2ls+ru1lglG/Y
 EV8bTNUnLh5Q==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="504190127"
Received: from grassena-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.78])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 07:53:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 25 Jan 2021 17:52:31 +0200
Message-Id: <352c35e304863223a1400de6e9726b161c116e5f.1611589818.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1611589818.git.jani.nikula@intel.com>
References: <cover.1611589818.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 7/9] drm/i915/mso: add state check
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
Cc: jani.nikula@intel.com, Nischal Varide <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

For starters, we expect the state to be zero, as we don't enable MSO
anywhere.

Cc: Nischal Varide <nischal.varide@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7ec7d94b8cdb..73cb50aef260 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11315,6 +11315,10 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(dsc.dsc_split);
 	PIPE_CONF_CHECK_I(dsc.compressed_bpp);
 
+	PIPE_CONF_CHECK_BOOL(mso.enable);
+	PIPE_CONF_CHECK_I(mso.link_count);
+	PIPE_CONF_CHECK_I(mso.pixel_overlap);
+
 	PIPE_CONF_CHECK_I(mst_master_transcoder);
 
 #undef PIPE_CONF_CHECK_X
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
