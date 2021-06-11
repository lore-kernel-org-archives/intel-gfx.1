Return-Path: <SRS0=pHm+=LF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD21FC48BE5
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Jun 2021 23:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B60613C3
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Jun 2021 23:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85B60613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5706E0EF;
	Fri, 11 Jun 2021 23:59:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B7D06E0EF;
 Fri, 11 Jun 2021 23:59:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5E7D2A47DF;
 Fri, 11 Jun 2021 23:59:22 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 11 Jun 2021 23:59:22 -0000
Message-ID: <162345596236.29312.11847844768167428103@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210611234044.853-1-matthew.brost@intel.com>
In-Reply-To: <20210611234044.853-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_GuC_submission_/_DRM_scheduler_integration_plan_+_new_uAPI?=
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

Series: GuC submission / DRM scheduler integration plan + new uAPI
URL   : https://patchwork.freedesktop.org/series/91417/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2a85231e7bad drm/doc/rfc: i915 GuC submission / DRM scheduler
-:35: WARNING:BAD_SIGN_OFF: Duplicate signature
#35: 
Cc: Jason Ekstrand <jason@jlekstrand.net>

-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

-:47: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#47: FILE: Documentation/gpu/rfc/i915_scheduler.rst:1:
+=========================================

total: 0 errors, 3 warnings, 0 checks, 98 lines checked
2ba86c355a5b drm/doc/rfc: i915 new parallel submission uAPI plan
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:44: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#44: FILE: Documentation/gpu/rfc/i915_parallel_execbuf.h:1:
+#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */

-:72: WARNING:TYPO_SPELLING: 'inteface' may be misspelled - perhaps 'interface'?
#72: FILE: Documentation/gpu/rfc/i915_parallel_execbuf.h:29:
+ * inteface.
    ^^^^^^^^

-:159: WARNING:PREFER_DEFINED_ATTRIBUTE_MACRO: Prefer __packed over __attribute__((packed))
#159: FILE: Documentation/gpu/rfc/i915_parallel_execbuf.h:116:
+} __attribute__ ((packed));

-:224: WARNING:REPEATED_WORD: Possible repeated word: 'in'
#224: FILE: Documentation/gpu/rfc/i915_scheduler.rst:145:
+in in the drm_i915_gem_exec_object2 list or the first N if I915_EXEC_BATCH_FIRST

total: 0 errors, 5 warnings, 0 checks, 179 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
