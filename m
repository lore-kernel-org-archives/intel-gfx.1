Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CC7C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 19:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0636103C
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 19:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B0636103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5423A7376D;
	Tue,  2 Nov 2021 19:18:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4831C7376D;
 Tue,  2 Nov 2021 19:18:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 41407A363C;
 Tue,  2 Nov 2021 19:18:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 02 Nov 2021 19:18:31 -0000
Message-ID: <163588071123.15502.11468206482131209421@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211102180347.25674-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20211102180347.25674-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/perf=3A_Detect_offset_in_context_image_for_OA_ctx_?=
 =?utf-8?q?control_reg?=
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

Series: drm/i915/perf: Detect offset in context image for OA ctx control reg
URL   : https://patchwork.freedesktop.org/series/96507/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
4715ece29768 drm/i915/perf: Detect offset in context image for OA ctx control reg
-:60: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_alert([subsystem]dev, ... then dev_alert(dev, ... then pr_alert(...  to printk(KERN_ALERT ...
#60: FILE: drivers/gpu/drm/i915/selftests/i915_perf.c:189:
+		printk(KERN_ALERT "OA: offset %08x for %08x\n", offset, reg);

-:62: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_alert([subsystem]dev, ... then dev_alert(dev, ... then pr_alert(...  to printk(KERN_ALERT ...
#62: FILE: drivers/gpu/drm/i915/selftests/i915_perf.c:191:
+		printk(KERN_ALERT "OA: offset not found for %08x\n", reg);

total: 0 errors, 2 warnings, 0 checks, 135 lines checked


