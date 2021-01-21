Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B13C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 11:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB65238E2
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 11:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB65238E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45BA6E52D;
	Thu, 21 Jan 2021 11:41:58 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4996E52D;
 Thu, 21 Jan 2021 11:41:57 +0000 (UTC)
IronPort-SDR: GQvrjc6q+xkEv+EuEY47BlNhaqFTDYk22FnLqK4kIBO4L82k1QY0Wn45DrB6nvPAWj9zY5Kfrq
 TOsL1o2B6jaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="240795173"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="240795173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 03:41:49 -0800
IronPort-SDR: F+l6wcpjNWKR2MsUk1BH9s79JJkN0WGHyDmPQFNor+Vh5QwRPk9kB/tZV4yEd95RTfV5UACx/9
 Oc/cC4BWTAlw==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="385269424"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 03:41:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
 <875z3qmt5b.fsf@intel.com>
 <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
Date: Thu, 21 Jan 2021 13:41:43 +0200
Message-ID: <8735yums94.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/msm/dp: fix build after dp quirk helper
 change
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBKYW4gMjAyMSwgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3
cm90ZToKPiBIaSBKYW5pLAo+Cj4gT24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgODoyMiBBTSBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPiB3cm90ZToKPgo+PiBTZWFuLCBSb2IsIG9y
IGFueW9uZSB3aXRoIGFuIGFybSB0b29sY2hhaW4gZm9yIG1zbSBhdmFpbGFibGUsIGNvdWxkIEkK
Pj4gdHJvdWJsZSB5b3UgdG8gYnVpbGQgdGVzdCB0aGlzIHBsZWFzZT8KPgo+IEkgdHJpZWQgdG8g
YnVpbGQgYWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaDoKCk9uIHRvcCBvZiB3aGF0PyBDdXJyZW50
IGRybS10aXA/CgpCUiwKSmFuaS4KCgoKPgo+ICAgQ0MgICAgICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2RwL2RwX2N0cmwubwo+IGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5jOiBJbiBmdW5j
dGlvbiDigJhkcF9jdHJsX3VzZV9maXhlZF9udmlk4oCZOgo+IGRyaXZlcnMvZ3B1L2RybS9tc20v
ZHAvZHBfY3RybC5jOjE0Mjk6MTE6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0bwo+IGZ1bmN0
aW9uIOKAmGRybV9kcF9oYXNfcXVpcmvigJkKPiAgMTQyOSB8ICAgcmV0dXJuIChkcm1fZHBfaGFz
X3F1aXJrKCZjdHJsLT5wYW5lbC0+ZGVzYywKPiAgICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBf
Y3RybC5jOjE1Ogo+IC4vaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oOjIxMDE6MTogbm90ZTog
ZGVjbGFyZWQgaGVyZQo+ICAyMTAxIHwgZHJtX2RwX2hhc19xdWlyayhjb25zdCBzdHJ1Y3QgZHJt
X2RwX2Rlc2MgKmRlc2MsIHUzMiBlZGlkX3F1aXJrcywKPiAgICAgICB8IF5+fn5+fn5+fn5+fn5+
fn4KPiBtYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg3Ogo+IGRyaXZlcnMv
Z3B1L2RybS9tc20vZHAvZHBfY3RybC5vXSBFcnJvciAxCj4gbWFrZVszXTogKioqIFtzY3JpcHRz
L01ha2VmaWxlLmJ1aWxkOjUzMDogZHJpdmVycy9ncHUvZHJtL21zbV0gRXJyb3IgMgo+IG1ha2Vb
Ml06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1MzA6IGRyaXZlcnMvZ3B1L2RybV0gRXJy
b3IgMgo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1MzA6IGRyaXZlcnMv
Z3B1XSBFcnJvciAyCj4gbWFrZTogKioqIFtNYWtlZmlsZToxODE5OiBkcml2ZXJzXSBFcnJvciAy
Cj4KPiBJIGhhZCB0byBhZGQgdGhlIGV4dHJhIHBhcmFtZXRlciBsaWtlIHRoaXM6Cj4KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfY3RybC5jCj4gQEAgLTE0MjAsMTYgKzE0MjAsMTQgQEAgdm9pZCBkcF9jdHJs
X2hvc3RfZGVpbml0KHN0cnVjdCBkcF9jdHJsICpkcF9jdHJsKQo+ICBzdGF0aWMgYm9vbCBkcF9j
dHJsX3VzZV9maXhlZF9udmlkKHN0cnVjdCBkcF9jdHJsX3ByaXZhdGUgKmN0cmwpCj4gIHsKPiAg
ICAgICAgIHU4ICpkcGNkID0gY3RybC0+cGFuZWwtPmRwY2Q7Cj4gLSAgICAgICB1MzIgZWRpZF9x
dWlya3MgPSAwOwo+Cj4gLSAgICAgICBlZGlkX3F1aXJrcyA9IGRybV9kcF9nZXRfZWRpZF9xdWly
a3MoY3RybC0+cGFuZWwtPmVkaWQpOwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEZvciBiZXR0
ZXIgaW50ZXJvcCBleHBlcmllbmNlLCB1c2VkIGEgZml4ZWQgTlZJRD0weDgwMDAKPiAgICAgICAg
ICAqIHdoZW5ldmVyIGNvbm5lY3RlZCB0byBhIFZHQSBkb25nbGUgZG93bnN0cmVhbS4KPiAgICAg
ICAgICAqLwo+ICAgICAgICAgaWYgKGRybV9kcF9pc19icmFuY2goZHBjZCkpCj4gLSAgICAgICAg
ICAgICAgIHJldHVybiAoZHJtX2RwX2hhc19xdWlyaygmY3RybC0+cGFuZWwtPmRlc2MsIGVkaWRf
cXVpcmtzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFBfRFBDRF9RVUlSS19D
T05TVEFOVF9OKSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAoZHJtX2RwX2hhc19xdWlyaygm
Y3RybC0+cGFuZWwtPmRlc2MsIDAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBEUF9EUENEX1FVSVJLX0NPTlNUQU5UX04pKTsKPgo+ICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICB9Cj4KPiBhbmQgdGhlbiBpdCBidWlsZHMuCgotLSAKSmFuaSBOaWt1bGEsIEludGVs
IE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1nZngK
