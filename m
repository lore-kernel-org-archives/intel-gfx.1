Return-Path: <SRS0=3Vrl=O4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8CCC433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 23:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8E960FE8
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 23:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF8E960FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEAD6E079;
	Fri,  8 Oct 2021 23:05:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB92A6E079;
 Fri,  8 Oct 2021 23:05:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A7CD4A0169;
 Fri,  8 Oct 2021 23:05:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 08 Oct 2021 23:05:10 -0000
Message-ID: <163373431068.16849.4361751541338072952@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_dma-resv=3A_Fix_dma=5Fresv=5Fget=5Ffences_and_dma=5Fresv=5F?=
 =?utf-8?q?copy=5Ffences_after_conversion_=28rev3=29?=
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

Series: dma-resv: Fix dma_resv_get_fences and dma_resv_copy_fences after conversion (rev3)
URL   : https://patchwork.freedesktop.org/series/95605/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
f35815098fd4 dma-resv: Fix dma_resv_get_fences and dma_resv_copy_fences after conversion
-:16: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#16: 
<7> [187.536343] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created

total: 0 errors, 1 warnings, 0 checks, 57 lines checked


