Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946C3C433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 21:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA20564E38
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 21:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA20564E38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438C289D64;
	Tue,  2 Feb 2021 21:14:41 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9A89D64
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 21:14:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23777304-1500050 for multiple; Tue, 02 Feb 2021 21:14:34 +0000
MIME-Version: 1.0
In-Reply-To: <161228783372.1150.6556483629376691686@build.alporthouse.com>
References: <20210202151445.20002-1-chris@chris-wilson.co.uk>
 <20210202151445.20002-8-chris@chris-wilson.co.uk>
 <2097da50-efe4-1b23-67b5-9a43a70198c9@linux.intel.com>
 <161228783372.1150.6556483629376691686@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 02 Feb 2021 21:14:35 +0000
Message-ID: <161230047545.28247.13315008950874636165@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [CI 08/14] drm/i915/selftests: Force a rewind if at
 first we don't succeed
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

Quoting Chris Wilson (2021-02-02 17:43:53)
> Let's see how horrible it is to cycle elements on defer. (Curse the
> irqlock pollution.)

While that did work. I do not have a good idea on how to do list
rotation on an RCU list. I can see that it must require a pair of
synchronize_rcu, and that spells disaster (at least for handling it
inline).

Another way might be to randomize the deadlines along each branch to the
tree... Except we don't have deadlines at this point and we can't so
freely change the priorities.

Hmm.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
