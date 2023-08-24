Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AF4C27C40
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Aug 2023 06:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7637010E103;
	Thu, 24 Aug 2023 06:24:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9619F10E103;
 Thu, 24 Aug 2023 06:24:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8D17EAADDA;
 Thu, 24 Aug 2023 06:24:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gil Dekel" <gildekel@chromium.org>
Date: Thu, 24 Aug 2023 06:24:57 -0000
Message-ID: <169285829756.13342.5443384793366086326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230818170156.2194015-1-gildekel@chromium.org>
In-Reply-To: <20230818170156.2194015-1-gildekel@chromium.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBE?=
 =?utf-8?q?efine_a_final_failure_state_when_link_training_fails?=
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

Series: Define a final failure state when link training fails
URL   : https://patchwork.freedesktop.org/series/122644/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/122644/revisions/1/mbox/ not applied
Applying: drm/i915/dp_link_training: Add a final failing state to link training fallback
Applying: drm/i915/dp_link_training: Add a final failing state to link training fallback for MST
Applying: drm/i915/dp_link_training: Emit a link-status=Bad uevent with trigger property
Applying: drm/i915: Move DP modeset_retry_work into intel_dp
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/display/intel_dp.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 drm/i915: Move DP modeset_retry_work into intel_dp
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


