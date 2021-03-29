Return-Path: <SRS0=5T5N=I3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934FDC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Mar 2021 13:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0F761932
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Mar 2021 13:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0F761932
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFC789E32;
	Mon, 29 Mar 2021 13:37:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E91B89E15;
 Mon, 29 Mar 2021 13:37:31 +0000 (UTC)
IronPort-SDR: 6z5HU2KTQ1Y/coaum7u/TFpivtPz7x9yl6vQf3rLsV9nubY+VVP5dGREnIGBH7j8L84MdvDw8z
 nzNUxNklYqKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="171563750"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="171563750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:37:30 -0700
IronPort-SDR: VWc0uQkcY4UMzqpRhsV3HJqFDBMBCBxs68QuPiFGKHsMJEpWAmgUOEZIGFIUAlSK6odWsxouge
 HQHSz5BOhnzQ==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="417673305"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:37:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 29 Mar 2021 16:37:14 +0300
Message-Id: <cover.1617024940.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/8] drm/edid: overhaul displayid iterator
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

v2 of [1], addressing Ville's review comments, and adding a couple of
extra patches on top.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/87802/


Jani Nikula (8):
  drm/edid: make a number of functions, parameters and variables const
  drm/displayid: add separate drm_displayid.c
  drm/displayid: add new displayid section/block iterators
  drm/edid: use the new displayid iterator for detailed modes
  drm/edid: use the new displayid iterator for finding CEA extension
  drm/edid: use the new displayid iterator for tile info
  drm/displayid: allow data blocks with 0 payload length
  drm/displayid: rename displayid_hdr to displayid_header

 drivers/gpu/drm/Makefile        |   2 +-
 drivers/gpu/drm/drm_displayid.c | 132 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_edid.c      | 171 +++++++-------------------------
 include/drm/drm_displayid.h     |  30 ++++--
 include/drm/drm_edid.h          |   3 +
 5 files changed, 196 insertions(+), 142 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_displayid.c

-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
