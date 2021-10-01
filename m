Return-Path: <SRS0=cmqZ=OV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2739CC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 23:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD88761A6F
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 23:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD88761A6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FA06E5B9;
	Fri,  1 Oct 2021 23:17:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0AC66E5AE;
 Fri,  1 Oct 2021 23:17:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A7C91A8169;
 Fri,  1 Oct 2021 23:17:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 01 Oct 2021 23:17:47 -0000
Message-ID: <163313026765.25583.16362698399395052359@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBN?=
 =?utf-8?q?ove_vfio=5Fccw_to_the_new_mdev_API_=28rev5=29?=
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

Series: Move vfio_ccw to the new mdev API (rev5)
URL   : https://patchwork.freedesktop.org/series/94520/
State : failure

== Summary ==

Applying: vfio/ccw: Remove unneeded GFP_DMA
Applying: vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
Applying: vfio/ccw: Pass vfio_ccw_private not mdev_device to various functions
Applying: vfio/ccw: Convert to use vfio_register_emulated_iommu_dev()
Applying: vfio/ccw: Make the FSM complete and synchronize it to the mdev
Applying: vfio/mdev: Consolidate all the device_api sysfs into the core code
Applying: vfio/mdev: Add mdev available instance checking to the core
error: sha1 information is lacking or useless (drivers/s390/crypto/vfio_ap_ops.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0007 vfio/mdev: Add mdev available instance checking to the core
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


