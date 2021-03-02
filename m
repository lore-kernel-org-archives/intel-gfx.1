Return-Path: <SRS0=7YZZ=IA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAABBC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 11:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F8161477
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 11:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44F8161477
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3089EB1;
	Tue,  2 Mar 2021 11:52:52 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C91089EB1
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Mar 2021 11:52:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23993122-1500050 for multiple; Tue, 02 Mar 2021 11:52:47 +0000
MIME-Version: 1.0
In-Reply-To: <20210224152925.1969970-1-piotr.piorkowski@intel.com>
References: <20210224152925.1969970-1-piotr.piorkowski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 02 Mar 2021 11:52:47 +0000
Message-ID: <161468596756.13469.2479317373307898338@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Verify dma_addr in
 gen8_ggtt_pte_encode
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
Cc: Michal Winiarski <michal.winiarski@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

UXVvdGluZyBQaW9ya293c2tpLCBQaW90ciAoMjAyMS0wMi0yNCAxNToyOToyNSkKPiBGcm9tOiBQ
aW90ciBQacOzcmtvd3NraSA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+Cj4gCj4gVW50aWwg
bm93LCB0aGUgZ2VuOF9nZ3R0X3B0ZV9lbmNvZGUgZnVuY3Rpb24sIHJlc3BvbnNpYmxlIGZvciB0
aGUgcHJlcGFyYXRpb24KPiBvZiBHR1RUIFBURSwgaGFzIG5vdCB2ZXJpZmllZCBpbiBhbnkgd2F5
IHdoZXRoZXIgdGhlIGFkZHJlc3MgZ2l2ZW4gYXMgdGhlCj4gcGFyYW1ldGVyIGlzIGNvcnJlY3Qu
Cj4gQnkgYWRkaW5nIGEgR0dUVCBhZGRyZXNzIG1hc2ssIHdlIGNhbiBlYXNpbHkgdmVyaWZ5IHRo
YXQgZG1hX2FkZHIgd2lsbCBub3QgZml0Cj4gaW4gdGhlIFBURSBmaWVsZC4KPiBXaGlsZSBhcm91
bmQsIGNsZWFudXAgYSBwbGFjZSB3aGVyZSB3ZSBob2xkIGFsbCBHRU4xMiBHR1RUIFBURSBtYXNr
cywKPiBhbmQgdGhlIGFkZGl0aW9uIG9mIHRoZSBQVEUgZGVzY3JpcHRpb24uCj4gCj4gQnNwZWM6
IDQ1MDE1Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jr
b3dza2lAaW50ZWwuY29tPgo+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5j
b20+Cj4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPgo+
IENjOiBNaWNoYWwgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jIHwgIDIgKysKPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0LmggIHwgMTMgKysrKysrKysrKysrLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jCj4gaW5kZXggYjBiOGRlZDgzNGYwLi41MmIyNDI4ZGE0
MzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jCj4gQEAgLTE5Myw2ICsx
OTMsOCBAQCBzdGF0aWMgdTY0IGdlbjhfZ2d0dF9wdGVfZW5jb2RlKGRtYV9hZGRyX3QgYWRkciwK
PiAgewo+ICAgICAgICAgZ2VuOF9wdGVfdCBwdGUgPSBhZGRyIHwgX1BBR0VfUFJFU0VOVDsKPiAg
Cj4gKyAgICAgICBHRU1fQlVHX09OKGFkZHIgJiB+R0VOMTJfR0dUVF9QVEVfQUREUl9NQVNLKTsK
CllvdSBjYW4gYWxzbyBjaGVjayB0aGUgZG1hX2dldF9tYXNrKCkgZG9lc24ndCBleGNlZWQgdGhl
IGFkZHIgbWFzay4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
