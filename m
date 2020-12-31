Return-Path: <SRS0=ZZZP=GD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B242C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 31 Dec 2020 19:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12CA422242
	for <intel-gfx@archiver.kernel.org>; Thu, 31 Dec 2020 19:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12CA422242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D7C89B42;
	Thu, 31 Dec 2020 19:11:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81D589B42
 for <intel-gfx@lists.freedesktop.org>; Thu, 31 Dec 2020 19:11:12 +0000 (UTC)
IronPort-SDR: tI9bxvIlmGcu7F614u+NEhBF4JzvKzJc8V+1y38ZTyYnG4L9T5HTfMfwB+ULbGkEba2ZiCVitn
 NeSX6jwSEDrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9851"; a="175955210"
X-IronPort-AV: E=Sophos;i="5.78,464,1599548400"; d="scan'208";a="175955210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 11:11:11 -0800
IronPort-SDR: ny2dPAQjsG6vKTW6KKGKZjyhQf6nRc5lzZvNNbWUTf445U55br4S3tgUYIRHj4ontIzxfA3tik
 sAyfuD4eud9A==
X-IronPort-AV: E=Sophos;i="5.78,464,1599548400"; d="scan'208";a="348358938"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 11:11:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 31 Dec 2020 11:11:03 -0800
Message-Id: <20201231191103.854519-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Clarify error message on failed
 workaround
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Let's modify the "workaround lost" error message slightly to make it
more clear what the various numbers represent.  Also, the 'expected'
value needs to be &'d with wa->read so that it doesn't include the mask
bits for masked registers (those bits are write-only in the hardware and
will usually always read out as 0's).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 42d320e68b60..b0e3a5ba0320 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1383,9 +1383,9 @@ static bool
 wa_verify(const struct i915_wa *wa, u32 cur, const char *name, const char *from)
 {
 	if ((cur ^ wa->set) & wa->read) {
-		DRM_ERROR("%s workaround lost on %s! (%x=%x/%x, expected %x)\n",
+		DRM_ERROR("%s workaround lost on %s! (reg[%x]=0x%x, relevant bits were 0x%x vs expected 0x%x)\n",
 			  name, from, i915_mmio_reg_offset(wa->reg),
-			  cur, cur & wa->read, wa->set);
+			  cur, cur & wa->read, wa->set & wa->read);
 
 		return false;
 	}
-- 
2.24.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
