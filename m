Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BB606A32A
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1cZ8BAy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708A610E92E;
	Fri, 20 Nov 2026 15:09:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C40910E92E
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795187390; x=1826723390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3uEq/yeA/wwdctuFS/86vAc6NcGb/c9yTvaj5wnmBoo=;
 b=D1cZ8BAyMDts7UO7BJmZIzjjz9nj8mA2lQdNUHntCeWZGMmOrgWZO2YR
 snArPOexS89qUm2LeiV69e3nzFeotxEGyx4EYqPbGjS7IDzHXM8zadBus
 6Ct9WCtU+/lBfAziQLLKOpwu5Zk7wH9nVLIWjSH9x6cHZ38Zabxazzhxj
 ucB0/mKnldBhD/yUUArA/ZjAoAHp1E5ptNlbkX93IrVVkGy3qpqTUtsvf
 Cz5MRtmBZ0C7A1rxe4wVA7+aqGm/llcQaZp6v+4wnnMff3FeH75EWp67G
 7EVneGCdpepsc9upUb4150vsqiCBJHdoSMr78tULQJ8bwBZcRNbYaTLwZ Q==;
X-CSE-ConnectionGUID: dUFVuIpwS/yY3a3za5uc2Q==
X-CSE-MsgGUID: 0X8SUn9VStm/kJu5yH4DGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3912144"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3912144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:09:49 -0800
X-CSE-ConnectionGUID: XrUIkjlPTGKBYK1BaHkl3A==
X-CSE-MsgGUID: 2QrbhMYSTmW+l9FKasNX2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11072662"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 kvehmane-desk1.ger.corp.intel.com) ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:09:47 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org, tiwai@suse.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, kai.vehmanen@linux.intel.com,
 Michal Grzelak <michal.grzelak@intel.com>
Subject: [PATCH v2 1/2] ALSA: hda: intel: Release i915 power also when delayed
 probe fails
Date: Fri, 20 Nov 2026 17:09:36 +0200
Message-ID: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe
work") stopped freeing the card from azx_probe_work() when the delayed
probe fails, and only disconnects it, leaving the free to azx_remove().
This avoids the double free, but the resources that were released by
the card free via azx_free() are now kept until the PCI device is
unbound. In particular the display power reference stay held, blocking
runtime suspend for i915/xe.

Release the display power in the azx_probe_continue() work in all cases.
This power reference is only taken for the purpose of the display codec
probe. If the display codec probe was successful, it will have taken its
own reference. In case of systems with the HDA controller on GPU side
(hda->need_i915_power), functionality is same as before - we have to
keep power.

Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
Reported-by: Michal Grzelak <michal.grzelak@intel.com>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17751
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---

Notes for V2:
 - Reduced the scope of change based sashikobot comments. In this version,
   only drop the display power reference taken for probing and do the change
   in in probe_continue(). Leave all the rest to azx_remove().
 - Add a second patch to remove unused code left after commit fbaccb1b19c7

 sound/hda/controllers/intel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 5a7dd69955d4..1f754f04eea8 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2452,6 +2452,9 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 	}
 
 out_free:
+	if (!hda->need_i915_power)
+		display_power(chip, false);
+
 	if (err < 0) {
 		if (hda->vga_switcheroo_registered)
 			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
@@ -2462,8 +2465,6 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 		return err;
 	}
 
-	if (!hda->need_i915_power)
-		display_power(chip, false);
 	complete_all(&hda->probe_wait);
 	to_hda_bus(bus)->bus_probing = 0;
 	hda->probe_retry = 0;

base-commit: 1afd6b7547b2ff0824e91fdf269bbd089f767a5d
-- 
2.43.0

