Return-Path: <SRS0=PnqF=LJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDAFC48BDF
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 14:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 551A761477
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 551A761477
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4306E2C7;
	Tue, 15 Jun 2021 14:04:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC5626E0ED;
 Tue, 15 Jun 2021 14:04:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A88EEA9932;
 Tue, 15 Jun 2021 14:04:22 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Claire Chang" <tientzu@chromium.org>
Date: Tue, 15 Jun 2021 14:04:22 -0000
Message-ID: <162376586268.8816.16638421463377511178@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210615132711.553451-1-tientzu@chromium.org>
In-Reply-To: <20210615132711.553451-1-tientzu@chromium.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBS?=
 =?utf-8?q?estricted_DMA?=
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

Series: Restricted DMA
URL   : https://patchwork.freedesktop.org/series/91518/
State : failure

== Summary ==

Applying: swiotlb: Refactor swiotlb init functions
Applying: swiotlb: Refactor swiotlb_create_debugfs
Applying: swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
Applying: swiotlb: Update is_swiotlb_buffer to add a struct device argument
Applying: swiotlb: Update is_swiotlb_active to add a struct device argument
Applying: swiotlb: Use is_dev_swiotlb_force for swiotlb data bouncing
Applying: swiotlb: Move alloc_size to swiotlb_find_slots
Applying: swiotlb: Refactor swiotlb_tbl_unmap_single
Applying: swiotlb: Add restricted DMA pool initialization
Applying: swiotlb: Add restricted DMA alloc/free support
Applying: dt-bindings: of: Add restricted DMA pool
Applying: of: Add plumbing for restricted DMA pool
error: sha1 information is lacking or useless (drivers/of/address.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0012 of: Add plumbing for restricted DMA pool
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
