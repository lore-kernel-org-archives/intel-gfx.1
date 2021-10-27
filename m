Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ABFC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 04:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB2EA60F70
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 04:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB2EA60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5C899D5;
	Wed, 27 Oct 2021 04:44:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DD9E899D5;
 Wed, 27 Oct 2021 04:44:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6C699A66C9;
 Wed, 27 Oct 2021 04:44:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 27 Oct 2021 04:44:28 -0000
Message-ID: <163530986840.4640.12838442851823966758@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211027043645.153133-1-jim.cromie@gmail.com>
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB1?=
 =?utf-8?q?se_DYNAMIC=5FDEBUG_to_implement_DRM=2Edebug_=26_DRM=2Etrace?=
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

Series: use DYNAMIC_DEBUG to implement DRM.debug & DRM.trace
URL   : https://patchwork.freedesktop.org/series/96327/
State : failure

== Summary ==

Applying: dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES macro and callbacks
Applying: drm: fix doc grammar
Applying: amdgpu: use dyndbg.CATEGORIES to control existing pr_dbgs
Applying: i915/gvt: trim spaces from pr_debug "gvt: core:" prefixes
Applying: i915/gvt: use dyndbg.CATEGORIES for existing pr_debugs
Applying: drm_print: add choice to use dynamic debug in drm-debug
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/Makefile).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0006 drm_print: add choice to use dynamic debug in drm-debug
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


