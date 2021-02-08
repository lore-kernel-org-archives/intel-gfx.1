Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA0AC433E0
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 20:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8ECB64E54
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 20:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8ECB64E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1E96E9F0;
	Mon,  8 Feb 2021 20:41:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CAA6E9F0
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 20:41:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23815991-1500050 for multiple; Mon, 08 Feb 2021 20:41:01 +0000
MIME-Version: 1.0
In-Reply-To: <5f2f642c-1292-59b3-c9e7-30f0a5a1c871@intel.com>
References: <20210206020925.36729-1-daniele.ceraolospurio@intel.com>
 <20210206020925.36729-9-daniele.ceraolospurio@intel.com>
 <161261636706.12021.3736940066271164943@build.alporthouse.com>
 <5f2f642c-1292-59b3-c9e7-30f0a5a1c871@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Mon, 08 Feb 2021 20:41:02 +0000
Message-ID: <161281686211.9448.17535695573288002748@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC 08/14] drm/i915/pxp: Implement arb session
 teardown
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
Cc: "Huang, Sean Z" <sean.z.huang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Daniele Ceraolo Spurio (2021-02-08 19:43:23)
> 
> 
> On 2/6/2021 4:59 AM, Chris Wilson wrote:
> > Is there any reason at all to use the batch and not just emit directly
> > into the ring? The command sequence is short. And you probably want to
> > disable arbitration.
> 
> Future proofing - with multiple sessions in place we'd need to emit a 
> termination for each of them (pxp_emit_session_selection + 
> pxp_emit_inline_termination), so the sequence would be longer. It'd 
> still be below a page, so it should still be possible to fit it in the 
> ring if you believe that works better.

In terms of complexity and assurance (pre-allocated space), emitting from
the ring buffer is far simpler. You can make the ring upto 512KiB, but
if a single page is all that is needed for the most complicated
invalidate command, 8/16KiB should be plenty. (Number of pages then
equals number of invalidates that can in flight at any time, which
realistically is going to be a small number.)
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
