Return-Path: <SRS0=Dys0=IH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AAFC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 13:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F74860249
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 13:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F74860249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9C6E8FB;
	Tue,  9 Mar 2021 13:54:31 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58F36E8F8;
 Tue,  9 Mar 2021 13:54:30 +0000 (UTC)
IronPort-SDR: +H60CmI7t/Vb1Pl6Wg9IGOmWnGKxcnYhbc9KUXKPrk8pcGMGavWLAnq+nKU3zzb1Y+3m/iZELF
 RNRToCBCB2qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="249612595"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="249612595"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:29 -0800
IronPort-SDR: 5Cf3GPmtKNDmgPWeGCENASff79NB0aApTTI3t+181YBfQYNn8gpjAMcnfKrptnjd53IvE+fjsp
 D93Z0j0gVg+g==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="409740896"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Date: Tue,  9 Mar 2021 15:54:08 +0200
Message-Id: <cover.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC v1 0/6] drm/edid: overhaul displayid iterator
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Iterating DisplayID is overcomplicated as it is, and it's not getting
easier when we eventually add support for DisplayID from DDC 0xA4
instead of EDID extensions. Prepare by abstracting the complexities away
from EDID code.

Untested, let's see what our CI thinks. ;)


Jani Nikula (6):
  drm/edid: make a number of functions, parameters and variables const
  drm/displayid: add separate drm_displayid.c
  drm/displayid: add new displayid section/block iterators
  drm/edid: use the new displayid iterator for detailed modes
  drm/edid: use the new displayid iterator for finding CEA extension
  drm/edid: use the new displayid iterator for tile info

 drivers/gpu/drm/Makefile        |   2 +-
 drivers/gpu/drm/drm_displayid.c | 133 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_edid.c      | 171 +++++++-------------------------
 include/drm/drm_displayid.h     |  28 ++++--
 include/drm/drm_edid.h          |   3 +
 5 files changed, 196 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_displayid.c

-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
