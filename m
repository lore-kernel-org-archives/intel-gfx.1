Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14833C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Jan 2022 19:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F20E10E532;
	Tue, 11 Jan 2022 19:17:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C100B10E532;
 Tue, 11 Jan 2022 19:17:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BF2A7A00FD;
 Tue, 11 Jan 2022 19:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 11 Jan 2022 19:17:00 -0000
Message-ID: <164192862076.24978.18331147607948701616@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220111163019.13694-1-matthew.brost@intel.com>
In-Reply-To: <20220111163019.13694-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Flip_guc=5Fid_allocation_partition?=
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

Series: drm/i915: Flip guc_id allocation partition
URL   : https://patchwork.freedesktop.org/series/98751/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7c34b8acae82 drm/i915: Flip guc_id allocation partition
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'guc' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:150:
+#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
+	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))

total: 0 errors, 0 warnings, 1 checks, 94 lines checked


