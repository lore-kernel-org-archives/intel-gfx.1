Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9E8C54EE9
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Sep 2022 00:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6210E79B;
	Wed, 14 Sep 2022 00:21:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C16410E795;
 Wed, 14 Sep 2022 00:20:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 83CCBAADD2;
 Wed, 14 Sep 2022 00:20:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 14 Sep 2022 00:20:53 -0000
Message-ID: <166311485353.30166.5340654261189599545@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
In-Reply-To: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_A_couple_of_if/else_ladder_refactors_=28rev2=29?=
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

Series: drm/i915: A couple of if/else ladder refactors (rev2)
URL   : https://patchwork.freedesktop.org/series/108315/
State : warning

== Summary ==

Error: dim checkpatch failed
93b4fe3050fe drm/i915: Invert if/else ladder for frequency read
-:120: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#120: FILE: drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c:139:
+		return f12_5_mhz;
+	} else {

total: 0 errors, 1 warnings, 0 checks, 114 lines checked
e41e92add5d0 drm/i915/gt: Extract per-platform function for frequency read
2ae37cd734be drm/i915: Invert if/else ladder for stolen init


