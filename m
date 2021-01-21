Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23DCC433E6
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 09:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 337E2238E7
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 09:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 337E2238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E6E6E52A;
	Thu, 21 Jan 2021 09:20:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398A16E52A
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 09:20:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23657456-1500050 for multiple; Thu, 21 Jan 2021 09:19:47 +0000
MIME-Version: 1.0
In-Reply-To: <87h7namz5w.fsf@intel.com>
References: <YAkaBa22zvbXKd4E@mwanda> <87h7namz5w.fsf@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 21 Jan 2021 09:19:46 +0000
Message-ID: <161122078664.32666.16504061212673044761@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2021-01-21 09:12:27)
> On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > This was supposed to be | instead of ||.
> >
> > Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, but we already have the fix [1] for this that I thought was
> pushed by now [2].
> 
> Chris?

6b20b734bbf1 ("drm/i915/display: Bitwise or the conversion colour specifier together")
in
  remotes/drm-intel/drm-intel-next
  remotes/drm-intel/for-linux-next
should be visible.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
