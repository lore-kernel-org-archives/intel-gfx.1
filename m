Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6786CD8CAA
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Jun 2026 11:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EFA10E15B;
	Tue,  9 Jun 2026 11:22:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98AF10E101;
 Tue,  9 Jun 2026 11:22:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/atomic=3A_track_indiv?=
 =?utf-8?q?idual_colorop_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 09 Jun 2026 11:22:57 -0000
Message-ID: <178100417775.59616.5150613550015416165@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609110420.1298352-1-mwen@igalia.com>
In-Reply-To: <20260609110420.1298352-1-mwen@igalia.com>
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

Series: drm/atomic: track individual colorop updates
URL   : https://patchwork.freedesktop.org/series/168172/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/168172/revisions/1/mbox/ not applied
Applying: drm/colorop: Remove read-only comments from interpolation fields
Applying: drm/colorop: make lut(1/3)d_interpolation props correctly behave as mutable
error: sha1 information is lacking or useless (include/drm/drm_colorop.h).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0002 drm/colorop: make lut(1/3)d_interpolation props correctly behave as mutable
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


