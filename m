Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8BAC32771
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Sep 2022 21:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCAC10E7F1;
	Mon, 26 Sep 2022 21:00:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD9E310E6FC;
 Mon, 26 Sep 2022 21:00:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8B608A66C9;
 Mon, 26 Sep 2022 21:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 26 Sep 2022 21:00:20 -0000
Message-ID: <166422602054.15110.859237627212339769@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220926142151.89216-1-matthew.auld@intel.com>
In-Reply-To: <20220926142151.89216-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_enable_PS64_support_for_DG2?=
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

Series: drm/i915: enable PS64 support for DG2
URL   : https://patchwork.freedesktop.org/series/109059/
State : warning

== Summary ==

Error: dim checkpatch failed
0b2ac0d0d908 drm/i915: enable PS64 support for DG2
-:15: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit caa574ffc4aa ("drm/i915/uapi: document behaviour for DG2 64K support")'
#15: 
commit caa574ffc4aaf4f29b890223878c63e2e7772f62

-:93: WARNING:LINE_SPACING: Missing a blank line after declarations
#93: FILE: drivers/gpu/drm/i915/gem/selftests/huge_pages.c:1560:
+	struct file *file;
+	I915_RND_STATE(prng);

total: 1 errors, 1 warnings, 0 checks, 449 lines checked


