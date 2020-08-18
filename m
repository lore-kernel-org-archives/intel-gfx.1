Return-Path: <SRS0=x/xo=B4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AD0C433E1
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 11:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15BD82076D
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 11:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15BD82076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410489C05;
	Tue, 18 Aug 2020 11:58:06 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2A089BF6
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2020 11:58:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22162153-1500050 for multiple; Tue, 18 Aug 2020 12:57:59 +0100
MIME-Version: 1.0
In-Reply-To: <CA+GA0_srCED0nX7XkiuOBxsxPy8xskG0Z-Lu9bWnD=tknnJNww@mail.gmail.com>
References: <CA+GA0_srCED0nX7XkiuOBxsxPy8xskG0Z-Lu9bWnD=tknnJNww@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Marcin Ślusarz <marcin.slusarz@gmail.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 18 Aug 2020 12:58:00 +0100
Message-ID: <159775188083.667.5734044425203263287@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: obey "reset" module
 parameter
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXJjaW4gxZpsdXNhcnogKDIwMjAtMDgtMTggMTI6MzY6MDcpCj4gRnJvbTogTWFy
Y2luIMWabHVzYXJ6IDxtYXJjaW4uc2x1c2FyekBpbnRlbC5jb20+Cj4gCj4gRm9yIHNvbWUgcmVh
c29uIGludGVsX2d0X3Jlc2V0IGF0dGVtcHRzIHRvIHJlc2V0IHRoZSBHUFUgdHdpY2UuCj4gT24g
b25lIGNvZGUgcGF0aCAoZG9fcmVzZXQpICJyZXNldCIgcGFyYW1ldGVyIGlzIG9iZXllZCwgYnV0
IGlzCj4gbm90IG9uIHRoZSBvdGhlciBvbmUgKF9faW50ZWxfZ3Rfc2V0X3dlZGdlZCkuCgpJdCdz
IG5vdCB0aGF0IHNpbXBsZSwgd2UgZG8gd2FudCB0byBmb3JjZSBfX2ludGVsX2d0X3NldF93ZWRn
ZWQoKSB0bwpjYW5jZWwgd2hhdGV2ZXIgaXMgcnVubmluZyBvbiB0aGUgR1BVIGFzIGl0IGlzIHVz
ZWQgZm9yIG1vcmUgdGhhbiBqdXN0CmZhaWxpbmcgcmVzZXRzIChlLmcuIGFyb3VuZCBjb250cm9s
IGJvdW5kYXJpZXMpIHJlZ2FyZGxlc3Mgb2Ygd2hhdCB0aGUKdXNlciBtYXkgd2FudC4KCkknbSBs
b2F0aGUgdG8gYWRkIGEgcGFyYW1ldGVyIGp1c3QgdG8gZW5hYmxlIHVuc2FmZSBiZWhhdmlvdXIs
IGJ1dCB0aGF0Cm1heSBiZSB0aGUgY29tcHJvbWlzZS4KLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
