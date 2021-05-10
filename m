Return-Path: <SRS0=pmG3=KF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0922BC433ED
	for <intel-gfx@archiver.kernel.org>; Mon, 10 May 2021 13:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680EE61075
	for <intel-gfx@archiver.kernel.org>; Mon, 10 May 2021 13:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 680EE61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6D96E487;
	Mon, 10 May 2021 13:59:49 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E976E487
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 May 2021 13:59:47 +0000 (UTC)
Received: from mobile-user-c1d2e5-142.dhcp.inet.fi ([193.210.229.142]
 helo=[192.168.1.190])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <tjaalton@ubuntu.com>)
 id 1lg6Rl-00030u-8B; Mon, 10 May 2021 13:59:45 +0000
To: Paul Zimmerman <pauldzim@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210509044330.4655-1-pauldzim@gmail.com>
From: Timo Aaltonen <tjaalton@ubuntu.com>
Message-ID: <02957632-b050-f9eb-fcd8-75db9c92b8e0@ubuntu.com>
Date: Mon, 10 May 2021 16:59:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509044330.4655-1-pauldzim@gmail.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH RFC] Revert "drm/i915: Try to use
 fast+narrow link on eDP again and fall back to the old max strategy on
 failure"
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 9.5.2021 7.43, Paul Zimmerman wrote:
> This reverts commit 2bbd6dba84d44219387df051a1c799b7bac46099.
> 
> Since 5.12-rc2, my Dell XPS-15 laptop has had a blank screen on boot.
> The system seems to run fine other than having no display, I am able
> to ssh into the machine. I don't see anything interesting in the dmesg
> log. I bisected the problem down to this commit, and reverting it fixes
> the problem.

Have you tried with drm-tip? It has acca7762eb71bc0 which hopefully 
helps here.


-- 
t
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
