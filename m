Return-Path: <SRS0=KPZb=HM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0229AC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 10:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24FD864E3E
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 10:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24FD864E3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6177E6E20B;
	Wed, 10 Feb 2021 10:45:12 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740126E20B;
 Wed, 10 Feb 2021 10:45:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23831758-1500050 for multiple; Wed, 10 Feb 2021 10:45:04 +0000
MIME-Version: 1.0
In-Reply-To: <20210210075929.5357-1-anandx.ram.moon@intel.com>
References: <20210210075929.5357-1-anandx.ram.moon@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Anand Moon <anandx.ram.moon@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Wed, 10 Feb 2021 10:45:06 +0000
Message-ID: <161295390650.6673.18431407043692596805@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size
 for corner cases
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
Cc: Anand Moon <anandx.ram.moon@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Anand Moon (2021-02-10 07:59:29)
> Add check for object size to return appropriate error -E2BIG or -EINVAL
> to avoid WARM_ON and sucessfull return for some testcase.

No. You miss the point of having those warnings. We need to inspect the
code to remove the last remaining "int pagenum", and then we can remove
the GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX). These are not emitted for
users, only for us to motivate us into finally fixing the code.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
