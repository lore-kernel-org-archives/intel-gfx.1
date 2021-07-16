Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A0AC07E95
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 14:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092F9613F1
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 14:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092F9613F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40FF6E98C;
	Fri, 16 Jul 2021 14:03:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 543A66E98C;
 Fri, 16 Jul 2021 14:03:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4DB49A8836;
 Fri, 16 Jul 2021 14:03:50 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lu Baolu" <baolu.lu@linux.intel.com>
Date: Fri, 16 Jul 2021 14:03:50 -0000
Message-ID: <162644423031.12779.10270503125065655676@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210714131837.8978-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210714131837.8978-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_iommu/vt-d=3A_Disable_igfx_iommu_superpage_on_bxt/skl/glk_?=
 =?utf-8?b?KHJldjQp?=
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

Series: iommu/vt-d: Disable igfx iommu superpage on bxt/skl/glk (rev4)
URL   : https://patchwork.freedesktop.org/series/92374/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3787d58e063c iommu/vt-d: Disable superpage for Geminilake igfx
-:18: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#18: 
 DMAR: [DMA Write] Request device [00:02.0] PASID ffffffff fault addr 7fa8a78000 [fault reason 05] PTE Write access is not set

total: 0 errors, 1 warnings, 0 checks, 58 lines checked
bc14bdaeb12c iommu/vt-d: Disable superpage for Broxton igfx
5ce9ceeeb766 iommu/vt-d: Disable superpage for Skylake igfx
1e0a0cb6420a drm/i915/fbc: Allow FBC + VT-d on SKL/BXT


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
