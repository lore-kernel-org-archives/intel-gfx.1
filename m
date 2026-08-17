Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ABDC5DF66
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 13:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0C310E402;
	Mon, 17 Aug 2026 13:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="VUIGLWkB";
	dkim-atps=neutral
X-Greylist: delayed 516 seconds by postgrey-1.36 at gabe;
 Mon, 17 Aug 2026 13:14:30 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [194.59.206.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08E10E402
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 13:14:30 +0000 (UTC)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hNtPD1cTkz48Tc;
 Mon, 17 Aug 2026 15:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1786971952;
 bh=9Ot99h3gjPJm00MYV6Mi8UoIzhZo274ii7+Oailx8mU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VUIGLWkBG8gJVupE865rz4e6XWfvuZcklI7mGFhbLRUJYU63vXraS4ccqLdxYmJIO
 ZzULEXJl0UxvBh/bnoiXTgDTnv5PJPY+dukiyB24jQrS7df7iRF5gqiu3IjLk2xqZ1
 jKw1dfKfgBZeyVgq1RA3oF6bbYA5e2tZIc4LAFtN3aJG3jLRB0CXhGjx9bXYOo/mxT
 mw+Mn1W6u5hYPbIkmu5gEDAjD4nLx2UEDULACbbzCvuR4/kNEjCQktuP8YKrDWkbRS
 SPLT63tRr3zHFvLBzRyXELK4VfKIls5SnE2X7JSYDjtgrIF5afvrIRYOL2uMmsyUp8
 ykI58OeUT8MYg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hNtPD0thgz7wjY;
 Mon, 17 Aug 2026 15:05:52 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hNtPB4rvfz8sb0;
 Mon, 17 Aug 2026 15:05:50 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id CECDA5FAC7;
 Mon, 17 Aug 2026 15:05:45 +0200 (CEST)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <61d9c006-aeca-47a6-8863-eed92f15ebea@leemhuis.info>
Date: Mon, 17 Aug 2026 15:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
To: nomorsukses@gmail.com
Cc: regressions@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>
References: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
 <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178697194616.796474.7993964972841137865@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CECDA5FAC7
X-NC-CID: AQZGOzuBJ+HwzmqEmWuxFn5ZCHAVXjubCJ30FJxjETpv2zPQ7mE=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 8/17/26 14:55, Jani Nikula wrote:
> On Thu, 06 Aug 2026, "nomorsukses@gmail.com" <nomorsukses@gmail.com> wrote:
>> I would like to report a possible kernel regression affecting the
>> internal display brightness on my Dell Latitude 7390.
> 
> Please file a bug as described at [1].
> 
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
Before doing so you might want to try 7.2 vanilla, as there was a
backlight bug affecting that machine that was fixed long ago:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015

Maybe Ubuntu just never picked up the fix. So if 7.2 works, you need to
report it to them.

Ciao, Thorsten
