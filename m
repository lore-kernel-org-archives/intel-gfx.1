Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC9CC61DA4
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Feb 2023 10:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858A710E742;
	Fri,  3 Feb 2023 10:18:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B92C710E742;
 Fri,  3 Feb 2023 10:18:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AE680A00E6;
 Fri,  3 Feb 2023 10:18:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>
Date: Fri, 03 Feb 2023 10:18:24 -0000
Message-ID: <167541950468.8766.1734743324075958596@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230203100215.31852-1-bagasdotme@gmail.com>
In-Reply-To: <20230203100215.31852-1-bagasdotme@gmail.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBo?=
 =?utf-8?q?tmldocs_fixes_for_next-20230203?=
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

Series: htmldocs fixes for next-20230203
URL   : https://patchwork.freedesktop.org/series/113640/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/113640/revisions/1/mbox/ not applied
Applying: drm/i915/doc: Escape wildcard in method names
Applying: drm/scheduler: Fix elapsed_ns kernel-doc error
Using index info to reconstruct a base tree...
M	include/drm/gpu_scheduler.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm/gpu_scheduler.h
CONFLICT (content): Merge conflict in include/drm/gpu_scheduler.h
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0002 drm/scheduler: Fix elapsed_ns kernel-doc error
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


