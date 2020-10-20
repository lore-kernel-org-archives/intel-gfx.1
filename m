Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC3FC4363A
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 13:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B9622240
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B9622240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D156ECB1;
	Tue, 20 Oct 2020 13:57:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6631A6ECB1;
 Tue, 20 Oct 2020 13:57:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5E2C7A008A;
 Tue, 20 Oct 2020 13:57:01 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 20 Oct 2020 13:57:01 -0000
Message-ID: <160320222138.24449.16459113903312071992@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201020133906.23710-1-anshuman.gupta@intel.com>
In-Reply-To: <20201020133906.23710-1-anshuman.gupta@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_HDCP_2=2E2_DP_MST_Support_=28rev4=29?=
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

Series: HDCP 2.2 DP MST Support (rev4)
URL   : https://patchwork.freedesktop.org/series/81538/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a4d3a9ec3849 drm/i915/hdcp: Update CP property in update_pipe
2018cc25b202 drm/i915/hotplug: Handle CP_IRQ for DP-MST
11bcba39ffde drm/i915/hdcp: DP MST transcoder for link and stream
aba9f25aea66 drm/i915/hdcp: Move HDCP enc status timeout to header
-:13: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 7e90e8d0c0ea ("drm/i915: Increase timeout for Encrypt status change")'
#13: 
Related: 7e90e8d0c0ea ("drm/i915: Increase timeout for Encrypt

total: 1 errors, 0 warnings, 0 checks, 47 lines checked
ae925c693494 drm/i915/hdcp: HDCP stream encryption support
a79629da8f04 drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
5621415e6d6e drm/i915/hdcp: Pass dig_port to intel_hdcp_init
39ed7e61c0e9 drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
69bf14c05085 misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
d3fd32def329 drm/hdcp: Max MST content streams
c25e6261d34e drm/i915/hdcp: mst streams support in hdcp port_data
9590fecf06d5 drm/i915/hdcp: Pass connector to check_2_2_link
e0a0c5f3814d drm/i915/hdcp: Add HDCP 2.2 stream register
8786d421d43c drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
351b313c2199 drm/i915/hdcp: Enable HDCP 2.2 MST support


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
