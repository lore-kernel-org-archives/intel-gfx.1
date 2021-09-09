Return-Path: <SRS0=8Ejf=N7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B93C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 19:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284CD610A3
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 19:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 284CD610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52D06E907;
	Thu,  9 Sep 2021 19:54:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6329A6E907;
 Thu,  9 Sep 2021 19:54:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5C24DA77A5;
 Thu,  9 Sep 2021 19:54:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 09 Sep 2021 19:54:43 -0000
Message-ID: <163121728334.16811.10304906137948536746@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBN?=
 =?utf-8?q?ove_vfio=5Fccw_to_the_new_mdev_API?=
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

Series: Move vfio_ccw to the new mdev API
URL   : https://patchwork.freedesktop.org/series/94520/
State : failure

== Summary ==

Applying: vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
Using index info to reconstruct a base tree...
M	drivers/s390/cio/vfio_ccw_drv.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/s390/cio/vfio_ccw_drv.c
Applying: vfio/ccw: Pass vfio_ccw_private not mdev_device to various functions
Applying: vfio/ccw: Convert to use vfio_register_group_dev()
error: sha1 information is lacking or useless (drivers/s390/cio/vfio_ccw_ops.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0003 vfio/ccw: Convert to use vfio_register_group_dev()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


