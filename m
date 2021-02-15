Return-Path: <SRS0=GsLQ=HR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C793AC433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Feb 2021 12:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1009664DEC
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Feb 2021 12:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1009664DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA606E202;
	Mon, 15 Feb 2021 12:39:56 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633346E202;
 Mon, 15 Feb 2021 12:39:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23871276-1500050 for multiple; Mon, 15 Feb 2021 12:39:52 +0000
MIME-Version: 1.0
In-Reply-To: <SA2PR11MB50685BFD01D8C6318437AD59AE889@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210210075929.5357-1-anandx.ram.moon@intel.com>
 <161295390650.6673.18431407043692596805@build.alporthouse.com>
 <SA2PR11MB50685BFD01D8C6318437AD59AE889@SA2PR11MB5068.namprd11.prod.outlook.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Ram Moon,
 AnandX" <anandx.ram.moon@intel.com>, "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Mon, 15 Feb 2021 12:39:51 +0000
Message-ID: <161339279139.27357.6733884217281880617@build.alporthouse.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Ram Moon, AnandX (2021-02-15 12:29:17)
> Hi Chris,
> 
> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Chris Wilson
> Sent: Wednesday, February 10, 2021 4:15 PM
> To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; Jani Nikula <jani.nikula@linux.intel.com>; Auld, Matthew <matthew.auld@intel.com>; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Ram Moon, AnandX <anandx.ram.moon@intel.com>
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for corner cases
> 
> Quoting Anand Moon (2021-02-10 07:59:29)
> > Add check for object size to return appropriate error -E2BIG or 
> > -EINVAL to avoid WARM_ON and successful return for some testcase.
> 
> No. You miss the point of having those warnings. We need to inspect the code to remove the last remaining "int pagenum", and then we can remove the GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX). These are not emitted for users, only for us to motivate us into finally fixing the code.
> -Chris
> 
> Yes, I got your point these check are meant to catch up integer overflow.
> 
> I have check with the IGT testcase case  _gem_create_ and _gem_userptr_blits_  
> which fails pass size *-1ull << 32*  left shift and *0~* which leads to integer overflow 
> ie  _negative_ size passed to create  i915_gem_create via ioctl  this leads to GM_WARN_ON. 
> 
> Can we drop these testcase so that we don't break the kernel ?

The kernel rejects the ioctl with the expected errno. We leave a warning
purely for the benefit of CI, only when compiled for debugging and not by
default, so that we have a persistent reminder to do the code review.
What's broken?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
