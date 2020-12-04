Return-Path: <SRS0=5A7x=FI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B40C4361A
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 12:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507E422795
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 12:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 507E422795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880196E15D;
	Fri,  4 Dec 2020 12:20:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B26E13A;
 Fri,  4 Dec 2020 12:20:51 +0000 (UTC)
IronPort-SDR: 0dfnJMo7RUzacY8JJCTMMDoZM+750v43Qu3q19slY5JtGQoPQHYcjSTfo6jugHqq5UBJPU9kTN
 V7bjxc74i1tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="172586002"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="172586002"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 04:20:51 -0800
IronPort-SDR: Y08IE4NjqXkTl1l1k8G7dSB7r7rEm2v8wWXWrIgeFD66vtN3rbMRejofIqhI/2BnfSrlY3NCL3
 imjXbzmRSavA==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="540675631"
Received: from jkrzyszt-desk.ger.corp.intel.com ([172.22.244.18])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 04:20:49 -0800
Message-ID: <1c364bddd1a951c03af51a84d2b106995fb18e5d.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Date: Fri, 04 Dec 2020 13:20:47 +0100
In-Reply-To: <160708360801.1246.16281098489778669426@build.alporthouse.com>
References: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
 <160708360801.1246.16281098489778669426@build.alporthouse.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] runner: Don't kill a test
 on taint if watching timeouts
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 2020-12-04 at 12:06 +0000, Chris Wilson wrote:
> Quoting Janusz Krzysztofik (2020-12-04 11:51:38)
> > We may still be interested in results of a test even if it has tainted
> > the kernel.  On the other hand, we need to kill the test on taint if no
> > other means of killing it on a jam is active.
> 
> Just so long as we are confident that the original error is preserved,
> and not lost under a deluge of what may come next. E.g. is there
> sufficient syncs after detecting the taint to record the kernel logs
> asap?
> 
> Although that the kernel taints is a strong indicator the test results
> are unreliable (or even irrelevant), imo.

Unless tainted with kernel warnings which result from bugs that can be
fixed, I believe.

Thanks,
Janusz

> -Chris

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
