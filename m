Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73667C71137
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Jun 2025 17:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5EE10E089;
	Wed, 11 Jun 2025 17:03:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12210E6D8;
 Wed, 11 Jun 2025 17:03:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_use_drm-?=
 =?utf-8?q?=3Edebugfs=5Froot_when_creating_debugfs_files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 11 Jun 2025 17:03:45 -0000
Message-ID: <174966142590.68523.6454104535653123958@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749653354.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749653354.git.jani.nikula@intel.com>
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

Series: drm/i915: use drm->debugfs_root when creating debugfs files
URL   : https://patchwork.freedesktop.org/series/150107/
State : warning

== Summary ==

Error: dim checkpatch failed
5451989ae13f drm/i915/display: use drm->debugfs_root for creating debugfs files
55ada7f9950e drm/i915/gvt: use drm->debugfs_root for creating debugfs files
94a446284629 drm/i915: use drm->debugfs_root for creating debugfs files
-:54: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#54: FILE: drivers/gpu/drm/i915/i915_debugfs.c:730:
+	debugfs_create_file("i915_forcewake_user", S_IRUSR, debugfs_root,

-:61: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
#61: FILE: drivers/gpu/drm/i915/i915_debugfs.c:733:
+		debugfs_create_file(i915_debugfs_files[i].name, S_IRUGO | S_IWUSR,

total: 0 errors, 2 warnings, 0 checks, 100 lines checked


