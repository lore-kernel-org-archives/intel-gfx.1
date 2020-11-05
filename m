Return-Path: <SRS0=eU4y=EL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EDBC55179
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 18:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D6D206B6
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 18:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47D6D206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8697E6EDDC;
	Thu,  5 Nov 2020 18:41:30 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08BE6EDDC
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2020 18:41:29 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22906818-1500050 
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Nov 2020 18:41:28 +0000
MIME-Version: 1.0
In-Reply-To: <20201105154934.16022-2-chris@chris-wilson.co.uk>
References: <20201105154934.16022-1-chris@chris-wilson.co.uk>
 <20201105154934.16022-2-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 05 Nov 2020 18:41:25 +0000
Message-ID: <160460168592.18394.4434466144151994039@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [CI 2/2] drm/i915/gem: Pull phys pread/pwrite
 implementations to the backend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2020-11-05 15:49:34)
> Move the specialised interactions with the physical GEM object from the
> pread/pwrite ioctl handler into the phys backend.
> 

Fixes: c6790dc22312 ("drm/i915: Wean off drm_pci_alloc/drm_pci_free")
Testcase: igt/gem_pwrite/exhaustion
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Cc: stable@vger.kernel.org
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
