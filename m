Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE15C677F1
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Jan 2023 12:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061E10E53B;
	Tue, 17 Jan 2023 12:33:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5169410E53B
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Jan 2023 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673958809; x=1705494809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omWvjjnN1mqMCeNdQcy/+YYH8w+eJTxUUE+cZSmrWK8=;
 b=h7TXXdl7bhSyBCJcdbQv2xYPPaKWbnJqR0nvN9qgPW3pLMlEpEp6XINP
 9kjua/W9GskqQldegm78qf+EG3G95HQUS/NVON6uo/GxfKjDaI2STKTBL
 kMfyCGQ4nt7hKDKrMfWIQnh11FqEquUMplBsIXmTS5qfG7xjXJQ/9v0Uk
 iwJZ4ZxmIU41hPld1u3E1tTYCSi6y4YoyhYvBmlzZV+dQDVtn+Knh8cfr
 ksLroH9NWvoVWudQs1sd3igrDxqe5fkG2uP2xWmLBoWfY1yWdzwqsN9gO
 ih8JdUJBlBfL5vrELyjhCkoskYNKdQnllJBAqIQMjVygEJtncQZfWbWlV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387034140"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="387034140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:33:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="636856881"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="636856881"
Received: from vishvend-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.14.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:33:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Jan 2023 14:33:05 +0200
Message-Id: <cover.1673958757.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/4] drm/i915: GMCH refactoring
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
Cc: jani.nikula@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Let's see if this sticks.

Jani Nikula (4):
  drm/i915: add gmch substruct to struct drm_i915_private
  drm/i915/gmch: split out soc/intel_gmch
  drm/i915/gmch: mass rename dev_priv to i915
  drm/i915/gmch: move VGA set state to GMCH code

 drivers/gpu/drm/i915/Makefile             |   1 +
 drivers/gpu/drm/i915/display/intel_vga.c  |  32 +---
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c |   2 +-
 drivers/gpu/drm/i915/i915_driver.c        | 145 +-----------------
 drivers/gpu/drm/i915/i915_drv.h           |  10 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c     | 171 ++++++++++++++++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h     |  18 +++
 7 files changed, 204 insertions(+), 175 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.c
 create mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.h

-- 
2.34.1

