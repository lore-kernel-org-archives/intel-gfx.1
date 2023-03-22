Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A144DC74A5B
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Mar 2023 03:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E4110E260;
	Wed, 22 Mar 2023 03:41:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06E4610E24B;
 Wed, 22 Mar 2023 03:41:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0309DAADD2;
 Wed, 22 Mar 2023 03:41:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Date: Wed, 22 Mar 2023 03:41:18 -0000
Message-ID: <167945647800.13421.1822609997320054767@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230321233849.3408339-1-david.e.box@linux.intel.com>
In-Reply-To: <20230321233849.3408339-1-david.e.box@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_PCI/ASPM=3A_pci=5Fenable=5Flink=5Fstate=3A_Add_argument_to_?=
 =?utf-8?q?acquire_bus_lock?=
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

Series: PCI/ASPM: pci_enable_link_state: Add argument to acquire bus lock
URL   : https://patchwork.freedesktop.org/series/115466/
State : warning

== Summary ==

Error: dim checkpatch failed
27c33bf46d11 PCI/ASPM: pci_enable_link_state: Add argument to acquire bus lock
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#16: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Fixes: de82f60f9c86 ("PCI/ASPM: Add pci_enable_link_state()")

total: 0 errors, 1 warnings, 0 checks, 53 lines checked


