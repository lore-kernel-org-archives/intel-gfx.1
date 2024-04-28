Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A557C4345F
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Apr 2024 03:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FDE10F9B5;
	Sun, 28 Apr 2024 03:48:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DB010F9B5;
 Sun, 28 Apr 2024 03:48:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ESPARSE=3A_warning_for_series_starting_with_=5B?=
 =?utf-8?q?1/1=5D_iommu/vt-d=3A_Decouple_igfx=5Foff_from_graphic_identity_ma?=
 =?utf-8?q?pping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lu Baolu" <baolu.lu@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sun, 28 Apr 2024 03:48:41 -0000
Message-ID: <171427612116.1720937.4419255333174194391@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240428032020.214616-1-baolu.lu@linux.intel.com>
In-Reply-To: <20240428032020.214616-1-baolu.lu@linux.intel.com>
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

Series: series starting with [1/1] iommu/vt-d: Decouple igfx_off from graphic identity mapping
URL   : https://patchwork.freedesktop.org/series/132986/
State : warning

== Summary ==

Error: dim sparse failed
Sparse version: v0.6.2


