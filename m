Return-Path: <SRS0=KaZY=OQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105C3C433EF
	for <intel-gfx@archiver.kernel.org>; Sun, 26 Sep 2021 18:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E25261205
	for <intel-gfx@archiver.kernel.org>; Sun, 26 Sep 2021 18:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E25261205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C968689D42;
	Sun, 26 Sep 2021 18:45:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B9489D42
 for <intel-gfx@lists.freedesktop.org>; Sun, 26 Sep 2021 18:45:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="224395812"
X-IronPort-AV: E=Sophos;i="5.85,324,1624345200"; d="scan'208";a="224395812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2021 11:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,324,1624345200"; d="scan'208";a="437486435"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga003.jf.intel.com with ESMTP; 26 Sep 2021 11:45:56 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.154.207])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 18QIjsYn013937; Sun, 26 Sep 2021 19:45:55 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 26 Sep 2021 20:45:41 +0200
Message-Id: <20210926184545.1407-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [CI v2 0/4] drm/i915/guc: Improve CTB error handling
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

There was a gap in handling MMIO result from CTB (de)registration
and while fixing it improve some other error reports.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

v2: collect latest CI results

Michal Wajdeczko (4):
  drm/i915/guc: Verify result from CTB (de)register action
  drm/i915/guc: Print error name on CTB (de)registration failure
  drm/i915/guc: Print error name on CTB send failure
  drm/i915/guc: Move and improve error message for missed CTB reply

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 30 ++++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

-- 
2.25.1

