Return-Path: <SRS0=81md=OW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773FEC433EF
	for <intel-gfx@archiver.kernel.org>; Sat,  2 Oct 2021 10:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 266DE61994
	for <intel-gfx@archiver.kernel.org>; Sat,  2 Oct 2021 10:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 266DE61994
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DF46F496;
	Sat,  2 Oct 2021 10:52:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 378F26E86D;
 Sat,  2 Oct 2021 10:52:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2D62DA0003;
 Sat,  2 Oct 2021 10:52:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hugh Dickins" <hughd@google.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 02 Oct 2021 10:52:25 -0000
Message-ID: <163317194515.26858.13857485141546210738@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211002020257.34a0e882@oasis.local.home>
In-Reply-To: <20211002020257.34a0e882@oasis.local.home>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_kernel_BUG_at_drivers/gpu/drm/i915/i915=5Fsw=5Ffence=2Ec=3A?=
 =?utf-8?q?245!?=
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

Series: kernel BUG at drivers/gpu/drm/i915/i915_sw_fence.c:245!
URL   : https://patchwork.freedesktop.org/series/95368/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
234e2c966647 kernel BUG at drivers/gpu/drm/i915/i915_sw_fence.c:245!
-:75: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#75: 
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-:81: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 3ffe82d701a4 ("drm/i915/xehp: handle new steering options")'
#81: 
> 3ffe82d701a4 ("drm/i915/xehp: handle new steering options")

total: 1 errors, 1 warnings, 0 checks, 7 lines checked


