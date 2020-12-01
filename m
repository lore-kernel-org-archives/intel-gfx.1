Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DF3C64E7A
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 18:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A7F20870
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 18:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27A7F20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D3F6E554;
	Tue,  1 Dec 2020 18:30:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E040D6E842
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 18:30:31 +0000 (UTC)
IronPort-SDR: 1JOxMCQH5I21B2nSIgJu+hQ2NWb02oE7BJl4KigNeWq1a1dtgDr2E9QoLyb7q1PNEpmwUpnsFR
 fN7x+BDJvh5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234487926"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="234487926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 10:30:28 -0800
IronPort-SDR: TprUFmMufNn9aT65hiGDHFb1/hVVhjftpxzy3iMGHtAuJyAXdxcFa6gmI07SaSV08SYvqciIcM
 Bu6gunM/d6CQ==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="405220259"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 10:30:26 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  2 Dec 2020 00:34:04 +0530
Message-Id: <20201201190406.1752-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [v6 0/2] Re-enable FBC on TGL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

FBC was disabled on TGL due to random underruns. It has
been determined that FBC will not work reliably with PSR2.
This series re-enables fbc along with taking care of the
PSR2 limitations for TGL.

Bspec: 50422 HSD: 14010260002

v2: Addressed review comments and added bspec links

v3: Addressed Ville's review comments

v4: Change the WA as per Jose's recommendation.

v5: Addressed Jose's review comments.

v6: Added Jose and Ville RB's. Fixed a minor review
comment.

Uma Shankar (2):
  drm/i915/display/tgl: Disable FBC with PSR2
  Revert "drm/i915/display/fbc: Disable fbc by default on TGL"

 drivers/gpu/drm/i915/display/intel_fbc.c | 19 ++++++++++++-------
 drivers/gpu/drm/i915/i915_drv.h          |  1 +
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
