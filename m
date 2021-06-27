Return-Path: <SRS0=4yRy=LV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AA6C48BC2
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Jun 2021 23:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CAD61C2E
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Jun 2021 23:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9CAD61C2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8226E1E0;
	Sun, 27 Jun 2021 23:08:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 195226E0B9;
 Sun, 27 Jun 2021 23:08:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1158CA41FB;
 Sun, 27 Jun 2021 23:08:51 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sun, 27 Jun 2021 23:08:51 -0000
Message-ID: <162483533104.7295.4267434830360868465@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210627231439.138612-1-matthew.brost@intel.com>
In-Reply-To: <20210627231439.138612-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_CT_changes_required_for_GuC_submission?=
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

Series: CT changes required for GuC submission
URL   : https://patchwork.freedesktop.org/series/91943/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
4de6bd659c01 drm/i915/guc: Relax CTB response timeout
9074da160af0 drm/i915/guc: Improve error message for unsolicited CT response
7ed4a3e0276a drm/i915/guc: Increase size of CTB buffers
3a1d54d48cfe drm/i915/guc: Add non blocking CTB send function
af75da893bfe drm/i915/guc: Add stall timer to non blocking CTB send function
609b9d9541a4 drm/i915/guc: Optimize CTB writes and reads
-:125: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#125: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:542:
+		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u size=%u\n",
+			  ctb->desc->head, ctb->desc->tail, ctb->size);

total: 0 errors, 0 warnings, 1 checks, 188 lines checked
8dbeeecc18bf drm/i915/guc: Module load failure test for CT buffer creation
-:38: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: John Harrison <John.C.Harrison@Intel.com>' != 'Signed-off-by: John Harrison <john.c.harrison@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
