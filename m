Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BCEC433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 14:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177F2206FA
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177F2206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845E6EAC7;
	Fri, 31 Jul 2020 14:32:49 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043C6EAC7
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 14:32:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21994495-1500050 for multiple; Fri, 31 Jul 2020 15:32:45 +0100
MIME-Version: 1.0
In-Reply-To: <20200731134553.156492-3-lionel.g.landwerlin@intel.com>
References: <20200731134553.156492-1-lionel.g.landwerlin@intel.com>
 <20200731134553.156492-3-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 31 Jul 2020 15:32:44 +0100
Message-ID: <159620596470.21624.386540668077781122@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: add syncobj timeline support
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-07-31 14:45:52)
> Introduces a new parameters to execbuf so that we can specify syncobj
> handles as well as timeline points.
> 
> v2: Reuse i915_user_extension_fn
> 
> v3: Check that the chained extension is only present once (Chris)
> 
> v4: Check that dma_fence_chain_find_seqno returns a non NULL fence (Lionel)
> 
> v5: Use BIT_ULL (Chris)
> 
> v6: Fix issue with already signaled timeline points,
>     dma_fence_chain_find_seqno() setting fence to NULL (Chris)
> 
> v7: Report ENOENT with invalid syncobj handle (Lionel)
> 
> v8: Check for out of order timeline point insertion (Chris)
> 
> v9: After explanations on
>     https://lists.freedesktop.org/archives/dri-devel/2019-August/229287.html
>     drop the ordering check from v8 (Lionel)
> 
> v10: Set first extension enum item to 1 (Jason)

The other unaddressed issue here is that we do not need to arbitrarily
limit the caller to only a single extension. The code to handle multiple
invocations is actually smaller...
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
