Return-Path: <SRS0=4j6q=ID=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FACAC433E6
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Mar 2021 15:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2946064F27
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Mar 2021 15:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2946064F27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2F56E1B4;
	Fri,  5 Mar 2021 15:23:13 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36246E1B4
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Mar 2021 15:23:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 24026849-1500050 for multiple; Fri, 05 Mar 2021 15:23:09 +0000
MIME-Version: 1.0
In-Reply-To: <161494684568.15221.13792200139079395463@build.alporthouse.com>
References: <20200916180745.627-1-cooper.chiou@intel.com>
 <20210302062700.6025-1-cooper.chiou@intel.com>
 <0c8ef2fb-34b0-98ea-12bb-fc300172799c@linux.intel.com>
 <161484956454.28586.15932692857365863465@build.alporthouse.com>
 <161485897632.28586.2630377954645968923@build.alporthouse.com>
 <161490560153.13701.1838349946598091390@build.alporthouse.com>
 <40dd702b-c71c-0b99-93e6-0e120ef7715d@linux.intel.com>
 <161494684568.15221.13792200139079395463@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Cooper Chiou <cooper.chiou@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 05 Mar 2021 15:23:07 +0000
Message-ID: <161495778793.8241.1217804178417987035@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Enable
 WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 William Tseng <william.tseng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2021-03-05 12:20:45)
> Quoting Tvrtko Ursulin (2021-03-05 09:23:02)
> > I am not sure if PC8 and DMC could also be involved from what Cooper was 
> > saying in a different thread. Maybe another CI run without the DMC, both 
> > ffs and fls. Another for limiting cstates.
> 
> Disabling the dmc leaves the display code in an inconsistent state so we
> don't complete a BAT run; but since the warnings are thrown during boot
> we can say that disabling the dmc does clear up the workaround issues on
> ehl/jsl:
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7612/fi-ehl-2/boot0.txt
> https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7612/fi-jsl-1/boot0.txt

Fwiw, disabling the dmc and using fls for gen9 is not enough to avoid
the warnings though:

https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7614/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html

So far only ffs works for gen9 mcr.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
