Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF62FC4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 02:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B094760E09
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 02:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B094760E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E1F6EBA2;
	Thu, 29 Jul 2021 02:13:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACB826E7E5;
 Thu, 29 Jul 2021 02:13:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 98497AA0EA;
 Thu, 29 Jul 2021 02:13:50 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Hellwig" <hch@lst.de>
Date: Thu, 29 Jul 2021 02:13:50 -0000
Message-ID: <162752483060.27325.15126882621748261861@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Provide_core_infrastructure_for_managing_open/release_=28re?=
 =?utf-8?b?djcp?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Provide core infrastructure for managing open/release (rev7)
URL   : https://patchwork.freedesktop.org/series/92556/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d0838f25c8bb vfio/samples: Remove module get/put
-:57: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
07fe7105d3c8 vfio/mbochs: Fix missing error unwind of mbochs_used_mbytes
-:12: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match 
#12: 
Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
-:102: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 2 warnings, 0 checks, 78 lines checked
2e74c07c7aa1 vfio: Introduce a vfio_uninit_group_dev() API call
418c0065f422 vfio: Provide better generic support for open/release vfio_device_ops
-:242: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#242: FILE: drivers/vfio/vfio.c:1483:
+	fdno = ret = get_unused_fd_flags(O_CLOEXEC);

-:340: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#340: FILE: include/linux/vfio.h:25:
+	struct mutex lock;

-:384: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 2 checks, 309 lines checked
e6b9a22005db vfio/samples: Delete useless open/close
-:98: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
9b57c1f6a23e vfio/fsl: Move to the device set infrastructure
-:300: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 256 lines checked
65ae71f84df5 vfio/platform: Use open_device() instead of open coding a refcnt scheme
-:50: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#50: FILE: drivers/vfio/platform/vfio_platform_common.c:230:
+		dev_warn(

-:104: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#104: FILE: drivers/vfio/platform/vfio_platform_common.c:261:
+		dev_warn(

-:148: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 2 checks, 120 lines checked
bffca3b655e2 vfio/pci: Move to the device set infrastructure
aeb2adf0bd2f vfio/pci: Change vfio_pci_try_bus_reset() to use the dev_set
-:125: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#125: FILE: drivers/vfio/pci/vfio_pci.c:2219:
+	if (vfio_pci_for_each_slot_or_bus(

-:225: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 1 checks, 195 lines checked
65a4bc732166 vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to use the device set
-:20: WARNING:BAD_SIGN_OFF: Non-standard signature: Reviewed-off-by:
#20: 
Reviewed-off-by: Christoph Hellwig <hch@lst.de>

-:253: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#253: FILE: drivers/vfio/pci/vfio_pci.c:2108:
+	if (vfio_pci_for_each_slot_or_bus(

-:310: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 2 warnings, 1 checks, 276 lines checked
102df9bcfb33 vfio/mbochs: Fix close when multiple device FDs are open
-:37: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
5a99781c4cce vfio/ap, ccw: Fix open/close when multiple device FDs are open
-:84: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
6852c4b7af29 vfio/gvt: Fix open/close when multiple device FDs are open
-:52: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
79c59eed163a vfio: Remove struct vfio_device_ops open/release
-:143: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@ziepe.ca>' != 'Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>'

total: 0 errors, 1 warnings, 0 checks, 107 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
