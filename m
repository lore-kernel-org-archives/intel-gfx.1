Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB6FC4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 16:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F13022283
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 16:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F13022283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F7D6E1F5;
	Wed, 16 Dec 2020 16:05:49 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C456E0F0;
 Wed, 16 Dec 2020 16:05:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23345963-1500050 for multiple; Wed, 16 Dec 2020 16:05:42 +0000
MIME-Version: 1.0
In-Reply-To: <83fba7f0-b361-fddb-b2bc-6c6f9df56b1a@linux.intel.com>
References: <20201216152809.706094-1-tvrtko.ursulin@linux.intel.com>
 <20201216152809.706094-2-tvrtko.ursulin@linux.intel.com>
 <160813391912.9127.16376546917210365956@build.alporthouse.com>
 <83fba7f0-b361-fddb-b2bc-6c6f9df56b1a@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Wed, 16 Dec 2020 16:05:43 +0000
Message-ID: <160813474395.9127.1105812834127662942@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/2] intel_gpu_top:
 Aggregate engine busyness per class
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-12-16 16:01:30)
> 
> On 16/12/2020 15:51, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-12-16 15:28:09)
> >> +static int
> >> +print_engines(struct engines *engines, double t, int lines, int w, int h)
> >> +{
> >> +       static struct engines *classes;
> >> +       struct engines *show;
> >> +
> >> +       if (class_view)
> >> +               classes = show = update_classes(classes, engines);
> > 
> > Something is not right here. Oh static, nvm.
> 
> Too hacky? Maybe "show = classes = update_classes()"would read better.

show = update_classes(engines);

with update_classes doing the if (once) classes = init_classes(engines) ?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
