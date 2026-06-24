Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E1CDB47F
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Jun 2026 18:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4336E10F0A3;
	Wed, 24 Jun 2026 18:12:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7D10F09F;
 Wed, 24 Jun 2026 18:12:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_support_for_a_DRM_bac?=
 =?utf-8?q?klight_capability?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 24 Jun 2026 18:12:50 -0000
Message-ID: <178232477008.113101.16774733186715788303@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624165751.2014759-1-mario.limonciello@amd.com>
In-Reply-To: <20260624165751.2014759-1-mario.limonciello@amd.com>
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

Series: Add support for a DRM backlight capability
URL   : https://patchwork.freedesktop.org/series/169109/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/169109/revisions/1/mbox/ not applied
Applying: Revert "backlight: Remove notifier"
Applying: backlight: add kernel-internal backlight API
Applying: drm: link connectors to backlight devices
Applying: DRM: Add support for client indicating support for luminance
error: sha1 information is lacking or useless (drivers/gpu/drm/drm_connector.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 DRM: Add support for client indicating support for luminance
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


