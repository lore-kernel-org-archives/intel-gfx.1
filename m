Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41204606A324
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 18:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B104610F14E;
	Mon,  2 Nov 2026 18:53:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8310F14E;
 Mon,  2 Nov 2026 18:53:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/psr=3A_fix_up_th?=
 =?utf-8?q?e_drm-intel_merge_of_psr2=5Fsel=5Ffetch=5Fapply=5Fsu=5Farea=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sasha Levin" <sashal@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Nov 2026 18:53:39 -0000
Message-ID: <179364561973.106184.8550825180820108709@221881a7231d>
X-Patchwork-Hint: ignore
References: <auijDJ-9T2YhFE80@sirena.org.uk>
In-Reply-To: <auijDJ-9T2YhFE80@sirena.org.uk>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/psr: fix up the drm-intel merge of psr2_sel_fetch_apply_su_area()
URL   : https://patchwork.freedesktop.org/series/177490/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/177490/revisions/1/mbox/ not applied
Applying: drm/i915/psr: fix up the drm-intel merge of psr2_sel_fetch_apply_su_area()
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/display/intel_psr.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/psr: fix up the drm-intel merge of psr2_sel_fetch_apply_su_area()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


