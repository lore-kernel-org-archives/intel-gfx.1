Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C63FA373E
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Oct 2022 17:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D1B10E605;
	Wed, 26 Oct 2022 17:02:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1310E609
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Oct 2022 17:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666803723; x=1698339723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4EzEuXoU2ZIi7qF+uZ+wgrBhmLfLX7eDLNqjGa8SfKk=;
 b=LOzvruOgjM5NZ5TzvwniiG+Gptv/QUehiLUjxtpwCXhdyTBb/YdrHuhg
 knqIj99c0cVy4NIDdlvzVeKuAij9hKxQsxqIP8iz53Ne2YYDXKYd6kAC0
 4077K/r/uFWuUWgqPHoYGgNaK1sD40mlZIp/2FCBvNgqFN54bOY5XbiUy
 51eIaWedqyLQw0rV7f81zWJqQfvZ+mAGHayZGHQVcUJC+ip4ezIE1rqTT
 In8feJcn4gqEqporerXsTsccx5ioP3qBrmOPg84L4mNMy9GcwIfjjrfRj
 aDDlrRsFiRh7USQACWLPVinUVo6WzcCVq9L4dOYUotYWWpveIODXfsVrt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334624825"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="334624825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 10:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="632090435"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="632090435"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 26 Oct 2022 10:01:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Oct 2022 20:01:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 26 Oct 2022 20:01:37 +0300
Message-Id: <20221026170150.2654-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221026170150.2654-1-ville.syrjala@linux.intel.com>
References: <20221026170150.2654-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 02/15] drm/i915/audio: Nuke leftover
 ROUNDING_FACTOR
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
Cc: Takashi Iwai <tiwai@suse.de>, Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remove some leftovers I missed in commit
2dd43144e824 ("drm/i915: Streamline the artihmetic")

Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index aa70b3f075c3..c6e7cecc6690 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -626,8 +626,6 @@ static void enable_audio_dsc_wa(struct intel_encoder *encoder,
 	intel_de_write(i915, AUD_CONFIG_BE, val);
 }
 
-#undef ROUNDING_FACTOR
-
 static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct drm_connector_state *conn_state)
-- 
2.37.4

