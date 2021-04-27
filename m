Return-Path: <SRS0=nd+/=JY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4018EC433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 23:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC49B60720
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 23:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC49B60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1007A6EA06;
	Tue, 27 Apr 2021 23:09:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49C96EA00
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 23:09:54 +0000 (UTC)
IronPort-SDR: egpFXpMm8AdlrrTt54KX+IRvD/0i5AjEusBGG0gLuR29SYP5L6MXPlnjDtPgrZuOjE+C0hAyHR
 0ldTT/BV0bvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="217324845"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; d="scan'208";a="217324845"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 16:09:52 -0700
IronPort-SDR: pdkg+PKaM8WaUUng6o8UCEOcDssND9kFQnhUOP/QLJnpUx9rJlHvQVbn3Uhd0ppJjJLiXB9J1H
 NT8oWWTbdGCA==
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; d="scan'208";a="465663260"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 16:09:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Apr 2021 16:07:52 -0700
Message-Id: <20210427230756.2847495-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/4] Simplify intel_setup_outputs
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

First and second patches should be straightforward. Third patch is a
simplification for gen9+ since we are not supposed to check the straps
anymore and rely on VBT. Finally last patch may or may not make sense:
I'm trying to hide these hacks in intel_bios.c so we have a clean init
sequence.

Lucas De Marchi (4):
  drm/i915/display: move vbt check to intel_ddi_init()
  drm/i915/display: remove FIXME comment for intended feature
  drm/i915/display: remove strap checks from gen 9
  drm/i915/display: hide workaround for broken vbt in intel_bios.c

 drivers/gpu/drm/i915/display/intel_bios.c    | 15 ++++++
 drivers/gpu/drm/i915/display/intel_display.c | 54 +++++---------------
 2 files changed, 27 insertions(+), 42 deletions(-)

-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
