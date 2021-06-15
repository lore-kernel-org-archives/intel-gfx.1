Return-Path: <SRS0=PnqF=LJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5935FC48BDF
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 03:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5F561059
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 03:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5F561059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614946E202;
	Tue, 15 Jun 2021 03:48:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 366F36E200;
 Tue, 15 Jun 2021 03:48:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2627FA9A43;
 Tue, 15 Jun 2021 03:48:16 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 15 Jun 2021 03:48:16 -0000
Message-ID: <162372889612.8816.11496487793828220698@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210615033433.1574397-1-matthew.d.roper@intel.com>
In-Reply-To: <20210615033433.1574397-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Explicity_steer_l3bank_multicast_reads_when_necessary?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Explicity steer l3bank multicast reads when necessary
URL   : https://patchwork.freedesktop.org/series/91485/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
16715f8678e5 drm/i915: extract steered reg access to common function
-:89: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#89: FILE: drivers/gpu/drm/i915/intel_uncore.c:2296:
+	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);

total: 0 errors, 0 warnings, 1 checks, 120 lines checked
3707583bbcf3 drm/i915: Add GT support for multiple types of multicast steering
-:159: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#159: FILE: drivers/gpu/drm/i915/gt/intel_gt_types.h:35:
+       u32 start;$

-:160: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#160: FILE: drivers/gpu/drm/i915/gt/intel_gt_types.h:36:
+       u32 end;$

total: 0 errors, 2 warnings, 0 checks, 214 lines checked
ee481231a00b drm/i915: Add support for explicit L3BANK steering
-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/i915/gt/intel_gt.c:87:
+       { 0x00B100, 0x00B3FF },$

-:29: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#29: FILE: drivers/gpu/drm/i915/gt/intel_gt.c:88:
+       { 0xFFFFFF, 0xFFFFFF }, /* terminating entry */$

total: 0 errors, 2 warnings, 0 checks, 169 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
