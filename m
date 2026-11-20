Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D8606A334
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MjOD5vuI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63E112AF5;
	Fri, 20 Nov 2026 15:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D248112AF5
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795187395; x=1826723395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AakqgHMFbxgSNvU1jGnNdEv2Hr1KuLKyMTH40xLS95Q=;
 b=MjOD5vuIDRs37pb2Hrd5HPYw3DQe2vHDcf+R+ycXyl/Fmt+StL17Ggth
 /QLUk0363qI9CSXeuYRjrAM81AlkUyZrunShdQzdHqeguIj5TzGploF3K
 8lPzUDljftpICEUk1bjMogD/WyESegnjpmadVbJtz1c0WqxwwRbiufrwB
 AveNlorV+Q6PhJP5DEJk0wAXKj9/KNudE0bP+VPPNpo4AYMwLWzcw+okc
 P5iRjBXIDrdwOR1v/DD4L279gzj7sMW5o4I+uz/LNC0qD47wThrPB6mZW
 tA/yIHgMWw9CwJ/gfiO7GSIa+mdwmPC/X1ZRVS6mp4flz814HKnObyCFV Q==;
X-CSE-ConnectionGUID: xhFIeMPPQ7uikb1Hon1cfQ==
X-CSE-MsgGUID: mQYzpeXZTbiNMP4G94ZVdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3912159"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3912159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:09:54 -0800
X-CSE-ConnectionGUID: M/lFBPAMRKWGIO8ahonWBw==
X-CSE-MsgGUID: zKGjVez3RhmNj94M4ym3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11072665"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 kvehmane-desk1.ger.corp.intel.com) ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:09:52 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org, tiwai@suse.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	kai.vehmanen@linux.intel.com
Subject: [PATCH v2 2/2] ALSA: hda: intel: Remove unused free_on_error from
 azx_probe_continue()
Date: Fri, 20 Nov 2026 17:09:37 +0200
Message-ID: <20261120150937.2187228-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
References: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
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
work") changed azx_probe_work() to pass false for the free_on_error
argument of azx_probe_continue(), and left freeing the card to
azx_remove(). That was the only caller that passed true, so the
argument is now always false and the code freeing the card on error is
dead.

Remove the argument and the dead code.

No functional change.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/controllers/intel.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1f754f04eea8..acca8bb9ef0b 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1184,7 +1184,7 @@ static const struct dev_pm_ops azx_pm = {
 };
 
 
-static int azx_probe_continue(struct azx *chip, bool free_on_error);
+static int azx_probe_continue(struct azx *chip);
 
 #ifdef SUPPORT_VGA_SWITCHEROO
 static struct pci_dev *get_bound_vga(struct pci_dev *pci);
@@ -1211,7 +1211,7 @@ static void azx_vs_set_state(struct pci_dev *pci,
 		if (!disabled) {
 			dev_info(chip->card->dev,
 				 "Start delayed initialization\n");
-			if (azx_probe_continue(chip, false) < 0) {
+			if (azx_probe_continue(chip) < 0) {
 				hda->init_failed = 1;
 				dev_err(chip->card->dev, "initialization error\n");
 			}
@@ -1739,7 +1739,7 @@ static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
 
-	if (azx_probe_continue(&hda->chip, false) < 0) {
+	if (azx_probe_continue(&hda->chip) < 0) {
 		hda->init_failed = 1;
 		complete_all(&hda->probe_wait);
 		snd_card_disconnect(hda->chip.card);
@@ -2362,7 +2362,7 @@ static const unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
 	[AZX_DRIVER_TERA] = 1,
 };
 
-static int azx_probe_continue(struct azx *chip, bool free_on_error)
+static int azx_probe_continue(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct hdac_bus *bus = azx_bus(chip);
@@ -2458,10 +2458,6 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 	if (err < 0) {
 		if (hda->vga_switcheroo_registered)
 			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
-		if (free_on_error) {
-			pci_set_drvdata(pci, NULL);
-			snd_card_free(chip->card);
-		}
 		return err;
 	}
 
-- 
2.43.0

