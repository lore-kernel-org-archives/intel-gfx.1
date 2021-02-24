Return-Path: <SRS0=v1fV=H2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAFEC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Feb 2021 07:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC75F64ED0
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Feb 2021 07:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC75F64ED0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1172C6EA5F;
	Wed, 24 Feb 2021 07:46:47 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9417D6EA5F
 for <intel-gfx@lists.freedesktop.org>; Wed, 24 Feb 2021 07:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 770483F652;
 Wed, 24 Feb 2021 08:46:43 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=KJJgLuEU; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVLueYxh58w4; Wed, 24 Feb 2021 08:46:42 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B87863F643;
 Wed, 24 Feb 2021 08:46:39 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 194E1360057;
 Wed, 24 Feb 2021 08:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614152799; bh=+midem5UdmkQDOaonXhpDjQ6hUcv5qjys80Y/tIhOns=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KJJgLuEUs30BqWarhKyhaQwyQ95uA8cvx4uocDmqohxrUOOzkzT8at17UI4NevDhX
 ZkF+dg4lg2DgEAWVhjLN/z5eozWop6n8jvvr2eNPqznccbm8aRYWDSFiKc7+N9jwBv
 H9C6NcglY7TYvFa7nTJRU/NClO/eXhk/ty+SKte4=
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
Date: Wed, 24 Feb 2021 08:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
Subject: Re: [Intel-gfx] [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require
 VM_PFNMAP vma for mmap
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Stultz <john.stultz@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDIvMjMvMjEgMTE6NTkgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gdGxkcjsgRE1BIGJ1
ZmZlcnMgYXJlbid0IG5vcm1hbCBtZW1vcnksIGV4cGVjdGluZyB0aGF0IHlvdSBjYW4gdXNlCj4g
dGhlbSBsaWtlIHRoYXQgKGxpa2UgY2FsbGluZyBnZXRfdXNlcl9wYWdlcyB3b3Jrcywgb3IgdGhh
dCB0aGV5J3JlCj4gYWNjb3VudGluZyBsaWtlIGFueSBvdGhlciBub3JtYWwgbWVtb3J5KSBjYW5u
b3QgYmUgZ3VhcmFudGVlZC4KPgo+IFNpbmNlIHNvbWUgdXNlcnNwYWNlIG9ubHkgcnVucyBvbiBp
bnRlZ3JhdGVkIGRldmljZXMsIHdoZXJlIGFsbAo+IGJ1ZmZlcnMgYXJlIGFjdHVhbGx5IGFsbCBy
ZXNpZGVudCBzeXN0ZW0gbWVtb3J5LCB0aGVyZSdzIGEgaHVnZQo+IHRlbXB0YXRpb24gdG8gYXNz
dW1lIHRoYXQgYSBzdHJ1Y3QgcGFnZSBpcyBhbHdheXMgcHJlc2VudCBhbmQgdXNlYWJsZQo+IGxp
a2UgZm9yIGFueSBtb3JlIHBhZ2VjYWNoZSBiYWNrZWQgbW1hcC4gVGhpcyBoYXMgdGhlIHBvdGVu
dGlhbCB0bwo+IHJlc3VsdCBpbiBhIHVhcGkgbmlnaHRtYXJlLgo+Cj4gVG8gc3RvcCB0aGlzIGdh
cCByZXF1aXJlIHRoYXQgRE1BIGJ1ZmZlciBtbWFwcyBhcmUgVk1fUEZOTUFQLCB3aGljaAo+IGJs
b2NrcyBnZXRfdXNlcl9wYWdlcyBhbmQgYWxsIHRoZSBvdGhlciBzdHJ1Y3QgcGFnZSBiYXNlZAo+
IGluZnJhc3RydWN0dXJlIGZvciBldmVyeW9uZS4gSW4gc3Bpcml0IHRoaXMgaXMgdGhlIHVhcGkg
Y291bnRlcnBhcnQgdG8KPiB0aGUga2VybmVsLWludGVybmFsIENPTkZJR19ETUFCVUZfREVCVUcu
Cj4KPiBNb3RpdmF0ZWQgYnkgYSByZWNlbnQgcGF0Y2ggd2hpY2ggd2FudGVkIHRvIHN3aWNoIHRo
ZSBzeXN0ZW0gZG1hLWJ1Zgo+IGhlYXAgdG8gdm1faW5zZXJ0X3BhZ2UgaW5zdGVhZCBvZiB2bV9p
bnNlcnRfcGZuLgo+Cj4gdjI6Cj4KPiBKYXNvbiBicm91Z2h0IHVwIHRoYXQgd2UgYWxzbyB3YW50
IHRvIGd1YXJhbnRlZSB0aGF0IGFsbCBwdGVzIGhhdmUgdGhlCj4gcHRlX3NwZWNpYWwgZmxhZyBz
ZXQsIHRvIGNhdGNoIGZhc3QgZ2V0X3VzZXJfcGFnZXMgKG9uIGFyY2hpdGVjdHVyZXMKPiB0aGF0
IHN1cHBvcnQgdGhpcykuIEFsbG93aW5nIFZNX01JWEVETUFQIChsaWtlIFZNX1NQRUNJQUwgZG9l
cykgd291bGQKPiBzdGlsbCBhbGxvdyB2bV9pbnNlcnRfcGFnZSwgYnV0IGxpbWl0aW5nIHRvIFZN
X1BGTk1BUCB3aWxsIGNhdGNoIHRoYXQuCj4KPiAgRnJvbSBhdWRpdGluZyB0aGUgdmFyaW91cyBm
dW5jdGlvbnMgdG8gaW5zZXJ0IHBmbiBwdGUgZW50aXJlcwo+ICh2bV9pbnNlcnRfcGZuX3Byb3Qs
IHJlbWFwX3Bmbl9yYW5nZSBhbmQgYWxsIGl0J3MgY2FsbGVycyBsaWtlCj4gZG1hX21tYXBfd2Mp
IGl0IGxvb2tzIGxpa2UgVk1fUEZOTUFQIGlzIGFscmVhZHkgcmVxdWlyZWQgYW55d2F5LCBzbwo+
IHRoaXMgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IGZsYWcgdG8gY2hlY2sgZm9yLgo+CklmIHdlIHJl
cXVpcmUgVk1fUEZOTUFQLCBmb3Igb3JkaW5hcnkgcGFnZSBtYXBwaW5ncywgd2UgYWxzbyBuZWVk
IHRvIApkaXNhbGxvdyBDT1cgbWFwcGluZ3MsIHNpbmNlIGl0IHdpbGwgbm90IHdvcmsgb24gYXJj
aGl0ZWN0dXJlcyB0aGF0IApkb24ndCBoYXZlIENPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTCwg
KHNlZSB0aGUgZG9jcyBmb3Igdm1fbm9ybWFsX3BhZ2UoKSkuCgpBbHNvIHdvcnRoIG5vdGluZyBp
cyB0aGUgY29tbWVudCBpbsKgIHR0bV9ib19tbWFwX3ZtYV9zZXR1cCgpIHdpdGggCnBvc3NpYmxl
IHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucyB3aXRoIHg4NiArIFBBVCArIFZNX1BGTk1BUCArIG5v
cm1hbCAKcGFnZXMuIFRoYXQncyBhIHZlcnkgb2xkIGNvbW1lbnQsIHRob3VnaCwgYW5kIG1pZ2h0
IG5vdCBiZSB2YWxpZCBhbnltb3JlLgoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
