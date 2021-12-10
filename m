Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E3BC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Dec 2021 15:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B36510E58B;
	Fri, 10 Dec 2021 15:02:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A32DA10E54E;
 Fri, 10 Dec 2021 15:02:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9FAB8A00A0;
 Fri, 10 Dec 2021 15:02:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Fri, 10 Dec 2021 15:02:25 -0000
Message-ID: <163914854565.3443.3357153142809164379@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211210110556.883735-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211210110556.883735-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Stop_doing_writeback_from_the_shrinker?=
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

Series: drm/i915: Stop doing writeback from the shrinker
URL   : https://patchwork.freedesktop.org/series/97856/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
ea5ef6ccbc42 drm/i915: Stop doing writeback from the shrinker
-:9: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 2d6692e642e7 ("drm/i915: Start writeback from the shrinker")'
#9: 
This effectively removes writeback which was added in 2d6692e642e7

-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 5537252b6b6d ("drm/i915: Invalidate our pages under memory pressure")'
#14: 
5537252b6b6d ("drm/i915: Invalidate our pages under memory pressure")

-:281: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#281: FILE: drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:72:
+       if (obj->base.filp)$

-:281: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (7, 16)
#281: FILE: drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:72:
+       if (obj->base.filp)
+		invalidate_mapping_pages(file_inode(obj->base.filp)->i_mapping,

total: 2 errors, 2 warnings, 0 checks, 187 lines checked


