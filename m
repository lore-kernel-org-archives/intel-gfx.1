Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ADFC433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Apr 2022 09:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6910E7FC;
	Thu,  7 Apr 2022 09:15:40 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C537D10E656;
 Thu,  7 Apr 2022 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322938; x=1680858938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JMsibKSc8UGw4kGTSdh4I0s6w2YjnLgecEdqszYwy8k=;
 b=MfzMtX8i3s0hxb4yKg0UIVW2xCiwbNecMU8XraLv6cpSSx0LUrSK0LDi
 BUxNopcDpzNV8tFtJD4oMjv6wC6VsDgPxPNWdeXgIVP+KTHVhQMRvaOTC
 1c7+sEvcwo3u+LUb/JTU8Odp+wUOfYgX+GbmE8u1HooaEYjXtohrH+tHy
 82Z/5a5xucyFTxKYRemYGGFSJQuOQ8iPRp3vpkXZ9gSTzTDu7nJSmJwZK
 PzuV5DCsT2TfFoVwfawpI0AidyIgodck8kswcClGgdW+EeGWKSn+mgRig
 Hh0H8MdMmzVLlgti0sYHfUsOR7II9zdltXTVy5LHWuMijZh/F1154jLDl g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="260108705"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="260108705"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="588734796"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Date: Thu,  7 Apr 2022 12:14:36 +0300
Message-Id: <e4c78887af517793280973c8b364040acd601f68.1649322799.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 10/12] drm/edid: drop extra local var
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We don't need override as a variable for anything.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6fa17084af02..767639364bd9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2102,11 +2102,11 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 {
 	enum edid_block_status status;
 	int j, invalid_blocks = 0;
-	struct edid *edid, *new, *override;
+	struct edid *edid, *new;
 
-	override = drm_get_override_edid(connector);
-	if (override)
-		return override;
+	edid = drm_get_override_edid(connector);
+	if (edid)
+		return edid;
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid)
-- 
2.30.2

