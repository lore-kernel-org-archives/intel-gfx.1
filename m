Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D37C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Feb 2022 22:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE9C10E19E;
	Thu, 10 Feb 2022 22:10:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A212910E19E;
 Thu, 10 Feb 2022 22:10:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9DDD8AA917;
 Thu, 10 Feb 2022 22:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael Cheng" <michael.cheng@intel.com>
Date: Thu, 10 Feb 2022 22:10:26 -0000
Message-ID: <164453102660.24641.15944593779136618551@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220210214216.1227694-1-michael.cheng@intel.com>
In-Reply-To: <20220210214216.1227694-1-michael.cheng@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Move_=23define_wbvind=5Fon=5Fall=5Fcpus?=
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

Series: Move #define wbvind_on_all_cpus
URL   : https://patchwork.freedesktop.org/series/99991/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
8fdf2f52d823 drm/i915/gt: Move wbvind_on_all_cpus #define
-:6: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#6: 
Move wbvind_on_all_cpus to intel_gt.h. This will allow other wbind_on_all_cpus

-:39: WARNING:INCLUDE_LINUX: Use #include <linux/smp.h> instead of <asm/smp.h>
#39: FILE: drivers/gpu/drm/i915/gt/intel_gt.h:14:
+#include <asm/smp.h>

-:42: ERROR:CODE_INDENT: code indent should use tabs where possible
#42: FILE: drivers/gpu/drm/i915/gt/intel_gt.h:17:
+         pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)$

-:42: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#42: FILE: drivers/gpu/drm/i915/gt/intel_gt.h:17:
+         pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)$

total: 1 errors, 3 warnings, 0 checks, 26 lines checked


