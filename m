Return-Path: <SRS0=Vt61=DU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97FAC433DF
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 15:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524B325202
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 15:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524B325202
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB296E448;
	Tue, 13 Oct 2020 15:47:55 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9206E448
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 15:47:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22704345-1500050 for multiple; Tue, 13 Oct 2020 16:47:49 +0100
MIME-Version: 1.0
In-Reply-To: <20201007120329.17076-1-ville.syrjala@linux.intel.com>
References: <20201007120329.17076-1-ville.syrjala@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 13 Oct 2020 16:47:49 +0100
Message-ID: <160260406924.2946.14780529118115559847@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Mark ininitial fb obj as WT
 on eLLC machines to avoid rcu lockup during fbdev init
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

U2VlIHN1YmplY3QsIHMvaW5pbml0aWFsL2luaWl0YWwvCgpRdW90aW5nIFZpbGxlIFN5cmphbGEg
KDIwMjAtMTAtMDcgMTM6MDM6MjcpCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBDdXJyZW50bHkgd2UgbGVhdmUgdGhlIGNhY2hlX2xl
dmVsIG9mIHRoZSBpbml0aWFsIGZiIG9iago+IHNldCB0byBOT05FLiBUaGlzIG1lYW5zIG9uIGVM
TEMgbWFjaGluZXMgdGhlIGZpcnN0IHBpbl90b19kaXNwbGF5KCkKPiB3aWxsIHRyeSB0byBzd2l0
Y2ggaXQgdG8gV1Qgd2hpY2ggcmVxdWlyZXMgYSB2bWEgdW5iaW5kK2JpbmQuCj4gSWYgdGhhdCBo
YXBwZW5zIGR1cmluZyB0aGUgZmJkZXYgaW5pdGlhbGl6YXRpb24gcmN1IGRvZXMgbm90Cj4gc2Vl
bSBvcGVyYXRpb25hbCB3aGljaCBjYXVzZXMgdGhlIHVuYmluZCB0byBnZXQgc3R1Y2suIFRvCj4g
bW9zdCBhcHBlYXJhbmNlcyB0aGlzIGxvb2tzIGxpa2UgYSBkZWFkIG1hY2hpbmUgb24gYm9vdC4K
PiAKPiBBdm9pZCB0aGUgdW5iaW5kIGJ5IGFscmVhZHkgbWFya2luZyB0aGUgb2JqZWN0IGNhY2hl
X2xldmVsCj4gYXMgV1Qgd2hlbiBjcmVhdGluZyBpdC4gV2Ugc3RpbGwgZG8gYW4gZXhjcGxpY2l0
IGdndHQgcGluCj4gd2hpY2ggd2lsbCByZXdyaXRlIHRoZSBQVEVzIGFueXdheSwgc28gdGhleSB3
aWxsIG1hdGNoIHdoYXRldmVyCj4gY2FjaGUgbGV2ZWwgd2Ugc2V0Lgo+IAo+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2NS43Kwo+IFN1Z2dlc3RlZC1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzIzODEKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDggKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gaW5kZXggOTA3ZTFkMTU1NDQzLi4wMGMwODYwMGM2
MGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
Ywo+IEBAIC0zNDQ1LDYgKzM0NDUsMTQgQEAgaW5pdGlhbF9wbGFuZV92bWEoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUsCj4gICAgICAgICBpZiAoSVNfRVJSKG9iaikpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBOVUxMOwo+ICAKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBNYXJrIGl0
IFdUIGFoZWFkIG9mIHRpbWUgdG8gYXZvaWQgY2hhbmdpbmcgdGhlCj4gKyAgICAgICAgKiBjYWNo
ZV9sZXZlbCBkdXJpbmcgZmJkZXYgaW5pdGlhbGl6YXRpb24uIFRoZQo+ICsgICAgICAgICogdW5i
aW5kIHRoZXJlIHdvdWxkIGdldCBzdHVjayB3YWl0aW5nIGZvciByY3UuCj4gKyAgICAgICAgKi8K
PiArICAgICAgIGk5MTVfZ2VtX29iamVjdF9zZXRfY2FjaGVfY29oZXJlbmN5KG9iaiwgSEFTX1dU
KGk5MTUpID8KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEk5
MTVfQ0FDSEVfV1QgOiBJOTE1X0NBQ0hFX05PTkUpOwoKT2ssIEkndmUgYmVlbiB3b3JyeWluZyBh
Ym91dCB3aGV0aGVyIHRoZXJlIHdlcmUgYW55IG1vcmUgc2lkZS1lZmZlY3RzLApidXQgSSB0aGlu
ayBpdCBhbGwgY29tZXMgb3V0IGluIHRoZSB3YXNoLiBUaGUgcHJvb2YgaXMgZGVmaW5pdGVseSBp
biB0aGUKZWF0aW5nLCBhbmQgd2Ugd2lsbCBrbm93IHNvb24gZW5vdWdoIGlmIHdlIGJyZWFrIHNv
bWVvbmUncyB2aXJ0dWFsCnRlcm1pbmFsLgoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
