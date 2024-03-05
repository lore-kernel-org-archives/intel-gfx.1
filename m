Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ADCC54798
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Mar 2024 21:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C9110E65A;
	Tue,  5 Mar 2024 21:39:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3CF112CEB;
 Tue,  5 Mar 2024 21:39:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm=3A_enable_W=3D1_warni?=
 =?utf-8?q?ngs_by_default_across_the_subsystem_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 05 Mar 2024 21:39:16 -0000
Message-ID: <170967475638.524851.7476157411182349880@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709629403.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709629403.git.jani.nikula@intel.com>
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

Series: drm: enable W=1 warnings by default across the subsystem (rev4)
URL   : https://patchwork.freedesktop.org/series/127072/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/127072/revisions/4/mbox/ not applied
Applying: drm: enable (most) W=1 warnings by default across the subsystem
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/Makefile
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/Makefile
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm: enable (most) W=1 warnings by default across the subsystem
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


