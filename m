Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A009C6FD1D
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Mar 2023 15:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F57610EECF;
	Thu, 30 Mar 2023 15:33:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03E0610EECA;
 Thu, 30 Mar 2023 15:33:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EF0C4AA917;
 Thu, 30 Mar 2023 15:33:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Date: Thu, 30 Mar 2023 15:33:52 -0000
Message-ID: <168019043297.18826.17246702598800284578@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230327093458.44939-1-yi.l.liu@intel.com>
In-Reply-To: <20230327093458.44939-1-yi.l.liu@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJ?=
 =?utf-8?q?ntroduce_new_methods_for_verifying_ownership_in_vfio_PCI_hot_re?=
 =?utf-8?q?set_=28rev3=29?=
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

Series: Introduce new methods for verifying ownership in vfio PCI hot reset (rev3)
URL   : https://patchwork.freedesktop.org/series/115264/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/115264/revisions/3/mbox/ not applied
Applying: vfio/pci: Update comment around group_fd get in vfio_pci_ioctl_pci_hot_reset()
Applying: vfio/pci: Only check ownership of opened devices in hot reset
Applying: vfio/pci: Move the existing hot reset logic to be a helper
Applying: vfio-iommufd: Add helper to retrieve iommufd_ctx and devid for vfio_device
Applying: vfio/pci: Allow passing zero-length fd array in VFIO_DEVICE_PCI_HOT_RESET
Applying: vfio: Refine vfio file kAPIs for vfio PCI hot reset
Applying: vfio: Accpet device file from vfio PCI hot reset path
Applying: vfio/pci: Renaming for accepting device fd in hot reset path
Applying: vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl
Patch is empty.
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To record the empty patch as an empty commit, run "git am --allow-empty".
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


