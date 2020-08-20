Return-Path: <SRS0=S5Fm=B6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDCAC433DF
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 10:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50636206FA
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 10:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="Eib4PSHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50636206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3DA6E33C;
	Thu, 20 Aug 2020 10:53:53 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5D36E33C
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2020 10:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 958DF3F475;
 Thu, 20 Aug 2020 12:53:51 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Eib4PSHm; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7b0mo7b51zp; Thu, 20 Aug 2020 12:53:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 44AF23F23E;
 Thu, 20 Aug 2020 12:53:48 +0200 (CEST)
Received: from localhost.localdomain (unknown [134.134.139.83])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 62D5D361F12;
 Thu, 20 Aug 2020 12:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1597920828; bh=6eErzhmhwji4Uew6QJcsKCZUwFqQePJGQw1hEut/JdE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Eib4PSHm8Ej7CHEKjsrNH83QFgqq3ul/mXoUgU01BGepYou8i49gtUWalBb4mkSN+
 3YNkWP4v2/xmIrdtgnJWbYGg9skRw9x+iqn2DtUFifqt+JTsgA7BYFIE+6Hcba4IFF
 dzPTvc1wFKuZknWcBZ9ODWJBheA0Sg2Zyjxtlcag=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20200819140904.1708856-1-maarten.lankhorst@linux.intel.com>
 <20200819140904.1708856-25-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <500ebd7e-65af-7b3c-0512-604f6d326b56@shipmail.org>
Date: Thu, 20 Aug 2020 12:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819140904.1708856-25-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 24/24] drm/i915: Do not share hwsp across
 contexts any more
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDgvMTkvMjAgNDowOSBQTSwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6Cj4gSW5zdGVhZCBv
ZiBzaGFyaW5nIHBhZ2VzIHdpdGggYnJlYWRjcnVtYnMsIGdpdmUgZWFjaCB0aW1lbGluZSBhCj4g
c2luZ2xlIHBhZ2UuIFRoaXMgYWxsb3dzIHVucmVsYXRlZCB0aW1lbGluZXMgbm90IHRvIHNoYXJl
IGxvY2tzCj4gYW55IG1vcmUgZHVyaW5nIGNvbW1hbmQgc3VibWlzc2lvbi4KPgo+IEFzIGFuIGFk
ZGl0aW9uYWwgYmVuZWZpdCwgc2Vxbm8gd3JhcGFyb3VuZCBubyBsb25nZXIgcmVxdWlyZXMKPiBp
OTE1X3ZtYV9waW4sIHdoaWNoIG1lYW5zIHdlIG5vIGxvbmdlciBuZWVkIHRvIHdvcnJ5IGFib3V0
IGEKPiBwb3RlbnRpYWwgLUVERUFETEsgYXQgYSBwb2ludCB3aGVyZSB3ZSBhcmUgcmVhZHkgdG8g
c3VibWl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
