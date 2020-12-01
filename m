Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62EAC64E7B
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 09:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D5420809
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 09:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D5420809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB10089F89;
	Tue,  1 Dec 2020 09:34:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C1F989A72;
 Tue,  1 Dec 2020 09:34:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 84678A73C9;
 Tue,  1 Dec 2020 09:34:57 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Tue, 01 Dec 2020 09:34:57 -0000
Message-ID: <160681529753.6987.14495995937023142844@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201201090729.24777-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201201090729.24777-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B01/12=5D_drm/i915/gem=3A_Drop_free?=
 =?utf-8?q?=5Fwork_for_GEM_contexts?=
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

Series: series starting with [01/12] drm/i915/gem: Drop free_work for GEM contexts
URL   : https://patchwork.freedesktop.org/series/84440/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
4f351702b028 drm/i915/gem: Drop free_work for GEM contexts
9fc9fb916f26 drm/i915/gt: Track the overall awake/busy time
7d7adb951b35 drm/i915: Expose list of clients in sysfs
-:84: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#84: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 384 lines checked
ee050c119037 drm/i915: Update client name on context create
-:213: WARNING:BRACES: braces {} are not necessary for single statement blocks
#213: FILE: drivers/gpu/drm/i915/i915_drm_client.c:247:
+	if (name->pid != rcu_dereference_protected(client->name, true)->pid) {
+		name = rcu_replace_pointer(client->name, name, true);
+	}

total: 0 errors, 1 warnings, 0 checks, 208 lines checked
dff72485e95b drm/i915: Make GEM contexts track DRM clients
dc11141234a3 drm/i915: Track runtime spent in closed and unreachable GEM contexts
d3d5619fc9fb drm/i915: Track all user contexts per client
73cf39079d77 drm/i915: Track context current active time
-:132: WARNING:LINE_SPACING: Missing a blank line after declarations
#132: FILE: drivers/gpu/drm/i915/gt/intel_context_types.h:113:
+			u32 last;
+			I915_SELFTEST_DECLARE(u32 num_underflow);

total: 0 errors, 1 warnings, 0 checks, 238 lines checked
44dd43e81326 drm/i915: Prefer software tracked context busyness
56632b583933 drm/i915: Look up clients by pid
-:175: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#175: FILE: drivers/gpu/drm/i915/i915_drm_client.h:32:
+	spinlock_t pid_lock;

total: 0 errors, 0 warnings, 1 checks, 176 lines checked
241fa69b1882 proc: Show GPU runtimes
-:35: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#35: FILE: fs/proc/base.c:3266:
+	ONE("gpu", S_IRUGO, proc_pid_gpu),

-:43: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#43: FILE: fs/proc/base.c:3596:
+	ONE("gpu", S_IRUGO, proc_pid_gpu),

-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 149 lines checked
e3a6135246e4 drm/i915/gt: Export device and per-process runtimes via procfs
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

-:78: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#78: FILE: drivers/gpu/drm/i915/gt/intel_gt_proc.c:20:
+	BUILD_BUG_ON(MAX_ENGINE_CLASS >= ARRAY_SIZE(rt->channel));

total: 0 errors, 2 warnings, 0 checks, 125 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
