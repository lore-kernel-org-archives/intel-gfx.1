Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB5C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Feb 2022 20:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CEB10E156;
	Thu,  3 Feb 2022 20:23:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 441C710E156;
 Thu,  3 Feb 2022 20:23:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3F2C8A00FD;
 Thu,  3 Feb 2022 20:23:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael Cheng" <michael.cheng@intel.com>
Date: Thu, 03 Feb 2022 20:23:18 -0000
Message-ID: <164391979822.15865.2586621385106367701@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220203200403.378958-1-michael.cheng@intel.com>
In-Reply-To: <20220203200403.378958-1-michael.cheng@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Use_drm=5Fclflush*_instead_of_clflush_=28rev3=29?=
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

Series: Use drm_clflush* instead of clflush (rev3)
URL   : https://patchwork.freedesktop.org/series/99450/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
f5dee7fefc3b drm/i915/gt: Re-work intel_write_status_page
71ea7ccbe1e3 drm/i915/gt: Drop invalidate_csb_entries
-:49: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#49: FILE: drivers/gpu/drm/i915/gt/intel_execlists_submission.c:2781:
+	drm_clflush_virt_range(&execlists->csb_status[0],
+				sizeof(&execlists->csb_status[reset_value]));

-:49: WARNING:SIZEOF_ADDRESS: sizeof(& should be avoided
#49: FILE: drivers/gpu/drm/i915/gt/intel_execlists_submission.c:2781:
+				sizeof(&execlists->csb_status[reset_value]));

total: 0 errors, 1 warnings, 1 checks, 30 lines checked
0e3e2dcb944a drm/i915/gt: Re-work reset_csb
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/i915/gt/intel_execlists_submission.c:2948:
+	drm_clflush_virt_range(execlists->csb_write,
+			sizeof(execlists->csb_write));

total: 0 errors, 0 warnings, 1 checks, 11 lines checked
0314edfdf5da drm/i915/: Re-work clflush_write32


