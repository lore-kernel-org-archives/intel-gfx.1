Return-Path: <SRS0=l5Yo=BO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4FFC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Aug 2020 14:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD9721744
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Aug 2020 14:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD9721744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6306E0D2;
	Tue,  4 Aug 2020 14:08:31 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA8C6E0D2
 for <intel-gfx@lists.freedesktop.org>; Tue,  4 Aug 2020 14:08:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22030042-1500050 for multiple; Tue, 04 Aug 2020 15:08:24 +0100
MIME-Version: 1.0
In-Reply-To: <1804e5f6-7a1a-999b-cdfd-50903cc3cc1d@shipmail.org>
References: <20200715115147.11866-1-chris@chris-wilson.co.uk>
 <20200715115147.11866-11-chris@chris-wilson.co.uk>
 <dabc6756-3ba8-ee58-ca6c-e2ae2f0227ac@shipmail.org>
 <159594782797.665.3798858958968044733@build.alporthouse.com>
 <1804e5f6-7a1a-999b-cdfd-50903cc3cc1d@shipmail.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Thomas Hellström (Intel) <thomas_os@shipmail.org>, intel-gfx@lists.freedesktop.org
Date: Tue, 04 Aug 2020 15:08:24 +0100
Message-ID: <159655010494.4193.7855959524648425177@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 11/66] drm/i915: Preallocate stashes for vma
 page-directories
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

UXVvdGluZyBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpICgyMDIwLTA3LTMwIDEzOjI4OjE5KQo+
IAo+IE9uIDcvMjgvMjAgNDo1MCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4KPiA+IEl0J3Mg
aW4gdGhlIHVzZXIgY3JpdGljYWwgcGF0aCAodGhlIHNob3J0ZXN0IHBhdGggdG8gcGVyZm9ybSB0
aGVpcgo+ID4gc2VxdWVuY2Ugb2Ygb3BlcmF0aW9ucyksIGJ1dCBpdCdzIGJlZm9yZSB0aGUgZG1h
LWZlbmNlIGl0c2VsZi4gSSBzYXkKPiA+IHRoYXQncyBhIHBhcnRpY3VsYXJseSBuYXN0eSBmYWxz
ZSBjbGFpbSB0aGF0IGl0IGlzIG5vdCBvbiB0aGUgY3JpdGljYWwKPiA+IHBhdGgsIGJ1dCBiZWlu
ZyB3aGVyZSBpdCBpcyBjaXJjdW12ZW50cyB0aGUgd2hvbGUgYXJndW1lbnQuCj4gPiAgIAo+IAo+
IENvdWxkbid0IHRoZSBmb2xsb3dpbmcgc2l0dWF0aW9uIGhhcHBlbj8KPiAKPiAxLiBDUyBzcGF3
bnMgdXNlcnB0ciBwaW5uaW5nIHdvcmsuCj4gMi4gQ1MgY3JlYXRlcyBhbmQgcHVibGlzaGVzIGEg
RE1BLWZlbmNlIHRoYXQgZGVwZW5kcyBvbiB0aGF0IHBpbm5pbmcgd29yay4KClRoZXJlJ3MgYSBi
cmVhayBiZWZvcmUgMiBpbiB0aGF0IHdlIGRvIG5vdCBwdWJsaXNoIGEgZG1hLWZlbmNlIG9uIHBl
bmRpbmcKdXNlcnB0ciB3b3JrLiBUaGVyZSdzIG5vIGFzeW5jIHdhaXQgb24gdGhlIHVzZXJwdHIs
IGlmIHRoZSBwYWdlcyBhcmUgbm90CmF2YWlsYWJsZSBhdCB0aGUgcG9pbnQgb2YgYWNxdWlyZSwg
d2UgaGl0IGFuIC1FQUdBSU4sIGFuZCB0YWtlIHRoZQpmbHVzaF93b3JrcXVldWUgcGF0aCB1bnRp
bCB3ZSBzdG9wIGhpdHRpbmcgLUVBR0FJTi4KClRoYXQgaXMgYXMgcGFpbmZ1bCBhcyBpdCBzb3Vu
ZHMsIGFuZCBJIGNsYWltIHRoYXQgc2l0dGluZyBhbmQgc3Bpbm5pbmcgaW4KYSB1c2VyIHBhdGgg
aXMgbm8gYmV0dGVyIGluIHRlcm1zIG9mIGNyaXRpY2FsIHBhdGggdGhhbiBoYXZpbmcgaXQgaW5z
aWRlCnRoZSBkbWEtZmVuY2Ugc2VjdGlvbi4gSG93ZXZlciwgd2l0aCB0aGlzIHByZXRlbnNlIHdl
IGRvIG5vdCB2aW9sYXRlIHRoYXQKcnVsZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
