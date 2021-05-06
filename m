Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E34C43460
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 17:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67766610A7
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 17:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67766610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC746ECD9;
	Thu,  6 May 2021 17:13:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8D06ECC0;
 Thu,  6 May 2021 17:13:05 +0000 (UTC)
IronPort-SDR: pjNtO04uiHJy0daqWTyXXb+llSkJaEEU5cyygNL3C/jQEZ2gilvxfChsAk/LKGVyV7NAAo/PTR
 u3i8pVNOri7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198613099"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198613099"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:04 -0700
IronPort-SDR: 3Ud4ju2uzQxiazIXh40LP959sdaEPnA2fvD3oYMo75YZ79fxVtPedrXRwFk+BCbhDjayPBWNCi
 jL7elafD0efA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="622533944"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu,  6 May 2021 10:30:44 -0700
Message-Id: <20210506173049.72503-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 0/5] GuC submission / DRM scheduler
 integration plan + new uAPI
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
Cc: carl.zhang@intel.com, jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Subject and patches say it all.

Initial post of GuC submission patches, detailed in patch 1, coming
shortly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (5):
  drm/doc/rfc: i915 GuC submission / DRM scheduler integration plan
  drm/doc/rfc: i915 new parallel submission uAPI plan
  drm/i915: Expose logical engine instance to user
  drm/i915: Introduce 'set parallel submit' extension
  drm/i915: Update execbuf IOCTL to accept N BBs

 Documentation/gpu/rfc/i915_scheduler.rst | 122 ++++++++++++++++++
 Documentation/gpu/rfc/index.rst          |   4 +
 include/uapi/drm/i915_drm.h              | 154 ++++++++++++++++++++++-
 3 files changed, 278 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
