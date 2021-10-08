Return-Path: <SRS0=3Vrl=O4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E2BC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 16:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C646101E
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 16:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17C646101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897AC6E0DF;
	Fri,  8 Oct 2021 16:24:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5C526E0D7;
 Fri,  8 Oct 2021 16:24:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DD875A7E03;
 Fri,  8 Oct 2021 16:24:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi@etezian.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 08 Oct 2021 16:24:03 -0000
Message-ID: <163371024386.16847.4967921933569621771@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211008112733.3600-1-andi@etezian.org>
In-Reply-To: <20211008112733.3600-1-andi@etezian.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gt=3A_move_remaining_debugfs_interfaces_into_gt_?=
 =?utf-8?q?=28rev10=29?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/gt: move remaining debugfs interfaces into gt (rev10)
URL   : https://patchwork.freedesktop.org/series/75333/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
997777b302f7 drm/i915/gt: move remaining debugfs interfaces into gt
-:138: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#138: 
new file mode 100644

-:271: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#271: FILE: drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c:129:
+				   intel_uncore_read(uncore,
+						GEN12_VCS4_VCS5_INTR_MASK));

-:275: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#275: FILE: drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c:133:
+				   intel_uncore_read(uncore,
+						GEN12_VCS6_VCS7_INTR_MASK));

-:284: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#284: FILE: drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c:142:
+				   intel_uncore_read(uncore,
+						GEN12_VECS2_VECS3_INTR_MASK));

total: 0 errors, 1 warnings, 3 checks, 412 lines checked


