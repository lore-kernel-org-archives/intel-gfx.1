Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A6DC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22AEE610D0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22AEE610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8DD6E426;
	Thu, 21 Oct 2021 10:11:08 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11306E3EC
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Oct 2021 10:11:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="315200654"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="315200654"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 03:11:00 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="495065073"
Received: from hdelagas-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.44.189])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 03:10:57 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jose.souza@intel.com,
	mika.kahola@intel.com,
	wan-gyeong.mun@intel.com
Date: Thu, 21 Oct 2021 13:10:24 +0300
Message-Id: <20211021101024.13112-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021101024.13112-1-jouni.hogander@intel.com>
References: <20211021101024.13112-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] Revert "drm/i915/display/psr: Do full fetch
 when handling multi-planar formats"
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

This reverts commit 1f61f0655b95d5b89589390e6f83c4a61d9b1e8d.

Now we are supporting selective fetch for biplanar formats. We can revert WA
patch which forced using full fetch for biplanar formats.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 469bf95178f3..65282a545dbf 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1571,9 +1571,6 @@ static void intel_psr2_sel_fetch_pipe_alignment(const struct intel_crtc_state *c
  * also planes are not updated if they have a negative X
  * position so for now doing a full update in this cases
  *
- * TODO: We are missing multi-planar formats handling, until it is
- * implemented it will send full frame updates.
- *
  * Plane scaling and rotation is not supported by selective fetch and both
  * properties can change without a modeset, so need to be check at every
  * atomic commmit.
@@ -1583,7 +1580,6 @@ static bool psr2_sel_fetch_plane_state_supported(const struct intel_plane_state
 	if (plane_state->uapi.dst.y1 < 0 ||
 	    plane_state->uapi.dst.x1 < 0 ||
 	    plane_state->scaler_id >= 0 ||
-	    plane_state->hw.fb->format->num_planes > 1 ||
 	    plane_state->uapi.rotation != DRM_MODE_ROTATE_0)
 		return false;
 
-- 
2.25.1

