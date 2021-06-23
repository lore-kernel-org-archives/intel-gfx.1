Return-Path: <SRS0=EMYW=LR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175C3C48BE5
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 16:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF61610A0
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 16:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF61610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A7C6E957;
	Wed, 23 Jun 2021 16:47:44 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB196E957;
 Wed, 23 Jun 2021 16:47:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A99241F438A5;
 Wed, 23 Jun 2021 17:47:40 +0100 (BST)
Date: Wed, 23 Jun 2021 18:47:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20210623184737.7e47f77c@collabora.com>
In-Reply-To: <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 06/15] drm/panfrost: Fix implicit sync
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBKdW4gMjAyMSAxODo1NTowMiArMDIwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gQ3VycmVudGx5IHRoaXMgaGFzIG5vIHByYWN0aWFs
IHJlbGV2YW5jZSBJIHRoaW5rIGJlY2F1c2UgdGhlcmUncyBub3QKPiBtYW55IHdobyBjYW4gcHVs
bCBvZmYgYSBzZXR1cCB3aXRoIHBhbmZyb3N0IGFuZCBhbm90aGVyIGdwdSBpbiB0aGUKPiBzYW1l
IHN5c3RlbS4gQnV0IHRoZSBydWxlcyBhcmUgdGhhdCBpZiB5b3UncmUgc2V0dGluZyBhbiBleGNs
dXNpdmUKPiBmZW5jZSwgaW5kaWNhdGluZyBhIGdwdSB3cml0ZSBhY2Nlc3MgaW4gdGhlIGltcGxp
Y2l0IGZlbmNpbmcgc3lzdGVtLAo+IHRoZW4geW91IG5lZWQgdG8gd2FpdCBmb3IgYWxsIGZlbmNl
cywgbm90IGp1c3QgdGhlIHByZXZpb3VzIGV4Y2x1c2l2ZQo+IGZlbmNlLgo+IAo+IHBhbmZyb3N0
IGFnYWluc3QgaXRzZWxmIGhhcyBubyBwcm9ibGVtLCBiZWNhdXNlIGl0IGFsd2F5cyBzZXRzIHRo
ZQo+IGV4Y2x1c2l2ZSBmZW5jZSAoYnV0IHRoYXQncyBwcm9iYWJseSBzb21ldGhpbmcgdGhhdCB3
aWxsIG5lZWQgdG8gYmUKPiBmaXhlZCBmb3IgdnVsa2FuIGFuZC9vciBtdWx0aS1lbmdpbmUgZ3B1
cywgb3IgeW91J2xsIHN1ZmZlciBiYWRseSkuCj4gQWxzbyBubyBwcm9ibGVtIHdpdGggdGhhdCBh
Z2FpbnN0IGRpc3BsYXkuCj4gCj4gV2l0aCB0aGUgcHJlcCB3b3JrIGRvbmUgdG8gc3dpdGNoIG92
ZXIgdG8gdGhlIGRlcGVuZGVuY3kgaGVscGVycyB0aGlzCj4gaXMgbm93IGEgb25lbGluZXIuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8
dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnBy
aWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bj
b2xsYWJvcmEuY29tPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3Jn
PgoKUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+Cgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3Rfam9iLmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+
IGluZGV4IDcxY2Q0M2ZhMWIzNi4uZWYwMDRkNTg3ZGM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+IEBAIC0yMDMsOSArMjAzLDggQEAgc3RhdGljIGludCBw
YW5mcm9zdF9hY3F1aXJlX29iamVjdF9mZW5jZXMoc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqYm9z
LAo+ICAJaW50IGksIHJldDsKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgYm9fY291bnQ7IGkrKykg
ewo+IC0JCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gZG1hX3Jlc3ZfZ2V0X2V4Y2xfdW5sb2Nr
ZWQoYm9zW2ldLT5yZXN2KTsKPiAtCj4gLQkJcmV0ID0gZHJtX2dlbV9mZW5jZV9hcnJheV9hZGQo
ZGVwcywgZmVuY2UpOwo+ICsJCS8qIHBhbmZyb3N0IGFsd2F5cyB1c2VzIHdyaXRlIG1vZGUgaW4g
aXRzIGN1cnJlbnQgdWFwaSAqLwo+ICsJCXJldCA9IGRybV9nZW1fZmVuY2VfYXJyYXlfYWRkX2lt
cGxpY2l0KGRlcHMsIGJvc1tpXSwgdHJ1ZSk7Cj4gIAkJaWYgKHJldCkKPiAgCQkJcmV0dXJuIHJl
dDsKPiAgCX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
