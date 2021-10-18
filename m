Return-Path: <SRS0=La7M=PG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB18EC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Oct 2021 11:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B5DA60EE5
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Oct 2021 11:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B5DA60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FAF6E9E7;
	Mon, 18 Oct 2021 11:50:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A46E9E7
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Oct 2021 11:50:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="291700284"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="291700284"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 04:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="443380045"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 18 Oct 2021 04:50:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Oct 2021 14:50:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
Date: Mon, 18 Oct 2021 14:50:22 +0300
Message-Id: <20211018115030.3547-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018115030.3547-1-ville.syrjala@linux.intel.com>
References: <20211018115030.3547-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/9] drm/i915: Reject planar formats when doing
 async flips
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Async flips are only capable of changing PLANE_SURF, hence we
they can't easily be used with planar formats.

Older platforms could require updating AUX_DIST as well, which
is not possible. We'd have to make sure AUX_DIST doesn't change
before allowing the async flip through. If we could get async
flips with CCS then that might be interesting, but since the hw
doesn't allow async flips with CCS I don't see much point in
allowing this for planar formats either. No one renders their
game content in YUV anyway.

icl+ could in theory do this I suppose since each color plane
has its own PLANE_SURF register, but I don't know if there is
some magic to guarantee that both the Y and UV plane would
async flip synchronously if you will. Ie. beyond just a clean
tear we'd potentially get some kind of weird tear with some
random mix of luma and chroma from the old and new frames.

So let's just say no to async flips when scanning out planar
formats.

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ce5d6633029a..8bb87e839f4a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8884,6 +8884,12 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
 			return -EINVAL;
 		}
 
+		if (new_plane_state->hw.fb->format->num_planes > 1) {
+			drm_dbg_kms(&i915->drm,
+				    "Planar formats not supported with async flips\n");
+			return -EINVAL;
+		}
+
 		if (old_plane_state->view.color_plane[0].stride !=
 		    new_plane_state->view.color_plane[0].stride) {
 			drm_dbg_kms(&i915->drm, "Stride cannot be changed in async flip\n");
-- 
2.32.0

