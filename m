Return-Path: <SRS0=AGhj=HO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CEFC433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 14:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1310C61490
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 14:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1310C61490
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=daenzer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACA36E10B;
	Fri, 12 Feb 2021 14:01:25 +0000 (UTC)
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 776D86E10B;
 Fri, 12 Feb 2021 14:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4FFAD2A6045;
 Fri, 12 Feb 2021 15:01:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vkV0bfZJWGJB; Fri, 12 Feb 2021 15:01:23 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 622122A6042;
 Fri, 12 Feb 2021 15:01:21 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lAZ0b-000BpT-Bs; Fri, 12 Feb 2021 15:01:21 +0100
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205220012.1983-1-chris@chris-wilson.co.uk>
 <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <3a2316b6-27a9-d56a-b488-ac15a402a0d2@daenzer.net>
Date: Fri, 12 Feb 2021 15:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
Content-Language: en-CA
Subject: Re: [Intel-gfx] [PATCH v3] kcmp: Support selection of SYS_kcmp
 without CHECKPOINT_RESTORE
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 "# 3.13+" <stable@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wMi0xMiAxOjU3IHAubS4sIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBPbiBGcmksIDUg
RmViIDIwMjEgYXQgMjI6MDEsIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PiB3cm90ZToKPj4KPj4gVXNlcnNwYWNlIGhhcyBkaXNjb3ZlcmVkIHRoZSBmdW5jdGlvbmFsaXR5
IG9mZmVyZWQgYnkgU1lTX2tjbXAgYW5kIGhhcwo+PiBzdGFydGVkIHRvIGRlcGVuZCB1cG9uIGl0
LiBJbiBwYXJ0aWN1bGFyLCBNZXNhIHVzZXMgU1lTX2tjbXAgZm9yCj4+IG9zX3NhbWVfZmlsZV9k
ZXNjcmlwdGlvbigpIGluIG9yZGVyIHRvIGlkZW50aWZ5IHdoZW4gdHdvIGZkIChlLmcuIGRldmlj
ZQo+PiBvciBkbWFidWYpCj4gCj4gQXMgeW91IHJpZ2h0ZnVsbHkgcG9pbnQgb3V0LCBTWVNfa2Nt
cCBpcyBhIGJpdCBvZiBhIHR3byBlZGdlZCBzd29yZC4KPiBXaGlsZSB5b3UgbWVudGlvbiB0aGUg
Q09ORklHIGlzc3VlLCB0aGVyZSBpcyBhbHNvIGEgcG9ydGFiaWxpdHkgYXNwZWN0Cj4gKG1lc2Eg
cnVucyBvbiBtb3JlIHRoYW4ganVzdCBsaW51eCkgYW5kIGFzIHdlbGwgYXMgc2FuZGJveCBmaWx0
ZXJpbmcKPiBvZiB0aGUgZXh0cmEgc3lzY2FsbC4KPiAKPiBMYXN0IHRpbWUgSSBsb29rZWQsIHRo
ZSBsYXR0ZXIgd2FzIHN0aWxsIGFuIGlzc3VlIGFuZCBtZXNhIHdhcyB1c2luZwo+IFNZU19rY21w
IHRvIGNvbXBhcmUgZGV2aWNlIG5vZGUgZmRzLgo+IEEgZmFyIHNob3J0ZXIgYW5kIG1vcmUgcG9y
dGFibGUgc29sdXRpb24gaXMgcG9zc2libGUsIHNvIGxldCBtZQo+IHByZXBhcmUgYSBNZXNhIHBh
dGNoLgoKTWFrZSBzdXJlIHRvIHJlYWQgbXkgY29tbWVudHMgb24gCmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy82ODgxIGZpcnN0LiA6KQoK
Ci0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAg
ICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
