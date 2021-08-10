Return-Path: <SRS0=Fgr2=NB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D568C4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Aug 2021 16:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBFAC60EB5
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Aug 2021 16:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBFAC60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFF689FEA;
	Tue, 10 Aug 2021 16:00:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2354189FEA;
 Tue, 10 Aug 2021 16:00:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1AC17AA0EA;
 Tue, 10 Aug 2021 16:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Vetter" <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 10 Aug 2021 16:00:16 -0000
Message-ID: <162861121608.29683.13563268025149594348@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210810130523.1972031-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210810130523.1972031-1-daniel.vetter@ffwll.ch>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Use_locked_access_to_ctx-=3Eengines_in_set=5Fpr?=
 =?utf-8?q?iority?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: Use locked access to ctx->engines in set_priority
URL   : https://patchwork.freedesktop.org/series/93558/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
cc99b1d7369b drm/i915: Use locked access to ctx->engines in set_priority
-:8: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 89ff76bf9b3b ("drm/i915/gem: Utilize rcu iteration of context engines")'
#8: 
commit 89ff76bf9b3b0b86e6bbe344bd6378d8661303fc

-:17: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#17: 
ccbc1b97948a ("drm/i915/gem: Don't allow changing the VM on running contexts (v4)")

-:17: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit ccbc1b97948a ("drm/i915/gem: Don't allow changing the VM on running contexts (v4)")'
#17: 
ccbc1b97948a ("drm/i915/gem: Don't allow changing the VM on running contexts (v4)")

-:18: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit c7a71fc8ee04 ("drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES")'
#18: 
c7a71fc8ee04 ("drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES")

-:19: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 4a766ae40ec8 ("drm/i915: Drop the CONTEXT_CLONE API (v2)")'
#19: 
4a766ae40ec8 ("drm/i915: Drop the CONTEXT_CLONE API (v2)")

-:139: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 4 errors, 2 warnings, 0 checks, 93 lines checked


