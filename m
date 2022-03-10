Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5FFC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Mar 2022 14:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0910E855;
	Thu, 10 Mar 2022 14:57:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 362DE10E855;
 Thu, 10 Mar 2022 14:57:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 33FD5A7DFB;
 Thu, 10 Mar 2022 14:57:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lee Shawn C" <shawn.c.lee@intel.com>
Date: Thu, 10 Mar 2022 14:57:09 -0000
Message-ID: <164692422918.17008.16064885386040394691@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220310145424.32643-1-shawn.c.lee@intel.com>
In-Reply-To: <20220310145424.32643-1-shawn.c.lee@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_enhanced_edid_driver_compatibility?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: enhanced edid driver compatibility
URL   : https://patchwork.freedesktop.org/series/101241/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a6ac1723dd25 drm/edid: seek for available CEA block from specific EDID block index
426e5a856c6d drm/edid: parse multiple CEA extension block
34060e19ea5e drm/edid: read HF-EEODB ext block
5e47f1e4e336 drm/edid: parse HF-EEODB CEA extension block
-:48: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!edid"
#48: FILE: drivers/gpu/drm/drm_edid.c:3369:
+	if (edid == NULL || edid->extensions == 0 || *ext_index >= ext_blk_num)

total: 0 errors, 0 warnings, 1 checks, 145 lines checked
bed5ef6e025a drm/edid: check for HF-SCDB block


