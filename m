Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEA5C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05AB11356F;
	Tue,  5 Jul 2022 13:37:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 887BF113578;
 Tue,  5 Jul 2022 13:37:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 731D5A47EB;
 Tue,  5 Jul 2022 13:37:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Date: Tue, 05 Jul 2022 13:37:11 -0000
Message-ID: <165702823144.2011.14434837483665254408@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBS?=
 =?utf-8?q?emove_the_VFIO=5FIOMMU=5FNOTIFY=5FDMA=5FUNMAP_notifier_=28rev3?=
 =?utf-8?q?=29?=
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

Series: Remove the VFIO_IOMMU_NOTIFY_DMA_UNMAP notifier (rev3)
URL   : https://patchwork.freedesktop.org/series/104793/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/104793/revisions/3/mbox/ not applied
Applying: vfio: Replace the DMA unmapping notifier with a callback
Using index info to reconstruct a base tree...
M	drivers/s390/cio/vfio_ccw_private.h
M	include/linux/vfio.h
Falling back to patching base and 3-way merge...
Auto-merging include/linux/vfio.h
CONFLICT (content): Merge conflict in include/linux/vfio.h
Auto-merging drivers/s390/cio/vfio_ccw_private.h
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 vfio: Replace the DMA unmapping notifier with a callback
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


