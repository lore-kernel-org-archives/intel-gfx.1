Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687BDC77B73
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Apr 2023 02:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC6310E2DC;
	Fri, 21 Apr 2023 02:26:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 600EA10E2DC;
 Fri, 21 Apr 2023 02:26:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2A88EAADE6;
 Fri, 21 Apr 2023 02:26:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Date: Fri, 21 Apr 2023 02:26:55 -0000
Message-ID: <168204401514.5828.17181603294815130602@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
In-Reply-To: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Improvements_to_uc_firmare_management_=28rev2=29?=
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

Series: Improvements to uc firmare management (rev2)
URL   : https://patchwork.freedesktop.org/series/116517/
State : warning

== Summary ==

Error: dim checkpatch failed
5f4add3122b0 drm/i915/guc: Decode another GuC load failure case
2b35e460865b drm/i915/guc: Print status register when waiting for GuC to load
5fcf4600dbe0 drm/i915/uc: Track patch level versions on reduced version firmware files
-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'major_' - possible side-effects?
#61: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:200:
+#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
+	UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
+		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))

-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'minor_' - possible side-effects?
#61: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:200:
+#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
+	UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
+		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))

-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'patch_' - possible side-effects?
#61: FILE: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:200:
+#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
+	UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
+		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))

total: 0 errors, 0 warnings, 3 checks, 73 lines checked
0ad23ab7f74c drm/i915/uc: Enhancements to firmware table validation
8d3a53230905 drm/i915/uc: Reject duplicate entries in firmware table
0eae0615810a drm/i915/uc: Make unexpected firmware versions an error in debug builds


