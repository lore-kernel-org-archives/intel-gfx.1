Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E8CD3427
	for <intel-gfx@archiver.kernel.org>; Thu,  7 May 2026 11:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DAF10F003;
	Thu,  7 May 2026 11:20:11 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5904F10EFEC;
 Thu,  7 May 2026 11:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm=3A_Improve_logic_behi?=
 =?utf-8?q?nd_damage_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 07 May 2026 11:20:11 -0000
Message-ID: <177815281134.47681.17044193470441470529@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507075725.29738-1-tzimmermann@suse.de>
In-Reply-To: <20260507075725.29738-1-tzimmermann@suse.de>
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

Series: drm: Improve logic behind damage handling
URL   : https://patchwork.freedesktop.org/series/166107/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/166107/revisions/1/mbox/ not applied
Applying: drm/damage-helper: Do not alter damage clips on modeset, but ignore them
Applying: drm/atomic-helpers: Evaluate plane damage after atomic_check
Applying: drm/ingenic: Remove calls to drm_atomic_helper_check_plane_damage()
Applying: drm/damage-helper: Test src coord in drm_atomic_helper_check_plane_damage()
error: sha1 information is lacking or useless (drivers/gpu/drm/drm_atomic_helper.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 drm/damage-helper: Test src coord in drm_atomic_helper_check_plane_damage()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


