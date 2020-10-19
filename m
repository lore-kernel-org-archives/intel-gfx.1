Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAD5C433E7
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 11:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B7D22263
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B7D22263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1616E914;
	Mon, 19 Oct 2020 11:10:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDA066E914;
 Mon, 19 Oct 2020 11:10:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E6568A0019;
 Mon, 19 Oct 2020 11:10:58 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Mon, 19 Oct 2020 11:10:58 -0000
Message-ID: <160310585891.32022.14359145056665930681@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201014045252.13608-1-anshuman.gupta@intel.com>
In-Reply-To: <20201014045252.13608-1-anshuman.gupta@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_HDCP_2=2E2_DP_MST_Support_=28rev3=29?=
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

Series: HDCP 2.2 DP MST Support (rev3)
URL   : https://patchwork.freedesktop.org/series/81538/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d159760a4a56 drm/i915/hdcp: Update CP property in update_pipe
e2cb41b29aef drm/i915/hotplug: Handle CP_IRQ for DP-MST
a3760c25fe05 drm/i915/hdcp: DP MST transcoder for link and stream
cbd9c3a4e52a drm/i915/hdcp: Move HDCP enc status timeout to header
-:13: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 7e90e8d0c0ea ("drm/i915: Increase timeout for Encrypt status change")'
#13: 
Related: 7e90e8d0c0ea ("drm/i915: Increase timeout for Encrypt

total: 1 errors, 0 warnings, 0 checks, 47 lines checked
4eb24e191127 drm/i915/hdcp: HDCP stream encryption support
b3989e70aca4 drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
6b28dbb7e514 drm/i915/hdcp: Pass dig_port to intel_hdcp_init
5c581b2656f3 drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
314fe93f46f3 drm/i915/hdcp: mst streams support in hdcp port_data
72ebe4518d5f drm/i915/hdcp: Pass connector to check_2_2_link
d98518fe6e4c drm/i915/hdcp: Add HDCP 2.2 stream register
b1bde86ff7ea drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
f2b5ebaa2bd3 drm/i915/hdcp: Enable HDCP 2.2 MST support


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
