Return-Path: <SRS0=xpeQ=JU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC31C433ED
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Apr 2021 20:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C8B613C1
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Apr 2021 20:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C8B613C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033736EC41;
	Fri, 23 Apr 2021 20:29:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A56B6E182;
 Fri, 23 Apr 2021 20:29:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11A88A9A43;
 Fri, 23 Apr 2021 20:29:46 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nikola Cornij" <nikola.cornij@amd.com>
Date: Fri, 23 Apr 2021 20:29:46 -0000
Message-ID: <161920978604.2792.15162796896533270135@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210423200552.223110-1-nikola.cornij@amd.com>
In-Reply-To: <20210423200552.223110-1-nikola.cornij@amd.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/dp=5Fmst=3A_Use_the_correct_DPCD_space_in_Synaptics_qui?=
 =?utf-8?q?rk?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/dp_mst: Use the correct DPCD space in Synaptics quirk
URL   : https://patchwork.freedesktop.org/series/89431/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5c141a5364cc drm/dp_mst: Use the correct DPCD space in Synaptics quirk
-:48: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#48: FILE: drivers/gpu/drm/drm_dp_mst_topology.c:5896:
+		/* If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is set, the Extended Receiver Capability field has to be used */

-:59: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#59: FILE: drivers/gpu/drm/drm_dp_mst_topology.c:5907:
+			if (drm_dp_dpcd_read(port->mgr->aux, dpcd_caps_offset + DP_DOWNSTREAMPORT_PRESENT,

-:64: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#64: FILE: drivers/gpu/drm/drm_dp_mst_topology.c:5912:
+			if ((downstreamport & DP_DWN_STRM_PORT_PRESENT) &&
+			   ((downstreamport & DP_DWN_STRM_PORT_TYPE_MASK)

total: 0 errors, 2 warnings, 1 checks, 43 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
