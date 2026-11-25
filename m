Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F1606A31E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 03:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9255810E89A;
	Wed, 25 Nov 2026 03:50:52 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBE410E775;
 Wed, 25 Nov 2026 03:50:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_linux-next=3A_build_failu?=
 =?utf-8?q?re_after_merge_of_the_drm-misc_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Brown" <broonie@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 25 Nov 2026 03:50:51 -0000
Message-ID: <179557865171.82384.9412973438568863738@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <awXJ__-grexFFPb4@sirena.org.uk>
In-Reply-To: <awXJ__-grexFFPb4@sirena.org.uk>
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

Series: linux-next: build failure after merge of the drm-misc tree
URL   : https://patchwork.freedesktop.org/series/179539/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/179539/revisions/1/mbox/ not applied
Applying: linux-next: build failure after merge of the drm-misc tree
Using index info to reconstruct a base tree...
A	drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c deleted in HEAD and modified in linux-next: build failure after merge of the drm-misc tree. Version linux-next: build failure after merge of the drm-misc tree of drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c left in tree.
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 linux-next: build failure after merge of the drm-misc tree
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


