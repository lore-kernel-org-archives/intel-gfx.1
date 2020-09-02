Return-Path: <SRS0=CUzP=CL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B47FC433E7
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2020 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84FB2078E
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2020 14:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="YgmagkOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A84FB2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519D36E914;
	Wed,  2 Sep 2020 14:02:26 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EEA6E914
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2020 14:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 70F004044F;
 Wed,  2 Sep 2020 16:02:19 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=YgmagkOL; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moN3urDVtjTV; Wed,  2 Sep 2020 16:02:14 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 7B3AB4039D;
 Wed,  2 Sep 2020 16:02:12 +0200 (CEST)
Received: from Win10-1tb-87.SSPE.ch.intel.com (jfdmzpr04-ext.jf.intel.com
 [134.134.137.73])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 99010361EC7;
 Wed,  2 Sep 2020 16:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1599055335; bh=XJuLbzEOzBSmgoIOGCyzTh/QaXgZgMNWVdBSOSZoJvk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=YgmagkOLrX2GYR1+glfqhwgIjF1hG/FEi6essmpqwdqJp9nRAjxv61jFdxftsA4R/
 shjx1D1dxTYA8Mx+zGD/ugbsX8bLwKNy5Bredw9aRq6ldDr8ocOz/plE/7jSld1/lx
 w9lDjKO4mWO7JagMMu2ecuwhHVbdP0EWVeP24UwA=
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200826132811.17577-1-chris@chris-wilson.co.uk>
 <20200826132811.17577-35-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <b2ebd7c1-733f-04aa-78cd-f05e5ff5438a@shipmail.org>
Date: Wed, 2 Sep 2020 16:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826132811.17577-35-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 35/39] drm/i915: Encode fence specific
 waitqueue behaviour into the wait.flags
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

SGksIENocmlzLAoKT24gOC8yNi8yMCAzOjI4IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gVXNl
IHRoZSB3YWl0X3F1ZXVlX2VudHJ5LmZsYWdzIHRvIGRlbm90ZSB0aGUgc3BlY2lhbCBmZW5jZSBi
ZWhhdmlvdXIKPiAoZmxhdHRlbmluZyBjb250aW51YXRpb25zIGFsb25nIGZlbmNlIGNoYWlucywg
YW5kIGZvciBwcm9wYWdhdGluZwo+IGVycm9ycykgcmF0aGVyIHRoYW4gdHJ5aW5nIHRvIGRldGVj
dCBvcmRpbmFyeSB3YWl0ZXJzIGJ5IHRoZWlyCj4gZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2ZlbmNlLmMgfCAyNSArKysrKysrKysrKysrKystLS0t
LS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19mZW5jZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19mZW5jZS5jCj4gaW5kZXggNGNkMjAzOGNi
ZTM1Li40ZTU1N2QxYzQ2NDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9zd19mZW5jZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19mZW5jZS5j
Cj4gQEAgLTE4LDEwICsxOCwxNSBAQAo+ICAgI2RlZmluZSBJOTE1X1NXX0ZFTkNFX0JVR19PTihl
eHByKSBCVUlMRF9CVUdfT05fSU5WQUxJRChleHByKQo+ICAgI2VuZGlmCj4gICAKPiAtI2RlZmlu
ZSBJOTE1X1NXX0ZFTkNFX0ZMQUdfQUxMT0MgQklUKDMpIC8qIGFmdGVyIFdRX0ZMQUdfKiBmb3Ig
c2FmZXR5ICovCj4gLQo+ICAgc3RhdGljIERFRklORV9TUElOTE9DSyhpOTE1X3N3X2ZlbmNlX2xv
Y2spOwo+ICAgCj4gKyNkZWZpbmUgV1FfRkxBR19CSVRTIFwKPiArCUJJVFNfUEVSX1RZUEUodHlw
ZW9mX21lbWJlcihzdHJ1Y3Qgd2FpdF9xdWV1ZV9lbnRyeSwgZmxhZ3MpKQo+ICsKPiArLyogYWZ0
ZXIgV1FfRkxBR18qIGZvciBzYWZldHkgKi8KPiArI2RlZmluZSBJOTE1X1NXX0ZFTkNFX0ZMQUdf
RkVOQ0UgQklUKFdRX0ZMQUdfQklUUyAtIDEpCj4gKyNkZWZpbmUgSTkxNV9TV19GRU5DRV9GTEFH
X0FMTE9DIEJJVChXUV9GTEFHX0JJVFMgLSAyKQoKTm90IHN1cmUgaWYgc2hhcmluZyB0aGUgZmxh
Z3MgZmllbGQgd2l0aCB0aGUgd2FpdC5jIGltcGxlbWVudGF0aW9uIGlzIApmdWxseSBPSyBlaXRo
ZXIuIElzIHRoZSBAa2V5IHBhcmFtZXRlciB0byB0aGUgd2FrZSBmdW5jdGlvbiB1c2VhYmxlPyBJ
IAptZWFuIHJhdGhlciB0aGFuIHBhc3NpbmcganVzdCBhIGxpc3QgaGVhZCBjb3VsZCB3ZSBwYXNz
IHNvbWV0aGluZyBsaWtlCgpzdHJ1Y3QgaTkxNV9zd19mZW5jZV9rZXkgewogwqDCoMKgIGJvb2wg
bm9fcmVjdXJzaW9uOyAvKiBNYWtlcyB0aGUgd2FpdCBmdW5jdGlvbiBqdXN0IHB1dCBpdHMgZW50
cnkgb24gCkBjb250aW51YXRpb24gYW5kIHJldHVybiAqLwogwqDCoMKgIGludCBlcnJvcjsKIMKg
wqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIGNvbnRpbnVhdGlvbjsKfQoKL1Rob21hcwoKCgoKCj4gKwo+
ICAgZW51bSB7Cj4gICAJREVCVUdfRkVOQ0VfSURMRSA9IDAsCj4gICAJREVCVUdfRkVOQ0VfTk9U
SUZZLAo+IEBAIC0xNTQsMTAgKzE1OSwxMCBAQCBzdGF0aWMgdm9pZCBfX2k5MTVfc3dfZmVuY2Vf
d2FrZV91cF9hbGwoc3RydWN0IGk5MTVfc3dfZmVuY2UgKmZlbmNlLAo+ICAgCXNwaW5fbG9ja19p
cnFzYXZlX25lc3RlZCgmeC0+bG9jaywgZmxhZ3MsIDEgKyAhIWNvbnRpbnVhdGlvbik7Cj4gICAJ
aWYgKGNvbnRpbnVhdGlvbikgewo+ICAgCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9zLCBu
ZXh0LCAmeC0+aGVhZCwgZW50cnkpIHsKPiAtCQkJaWYgKHBvcy0+ZnVuYyA9PSBhdXRvcmVtb3Zl
X3dha2VfZnVuY3Rpb24pCj4gLQkJCQlwb3MtPmZ1bmMocG9zLCBUQVNLX05PUk1BTCwgMCwgY29u
dGludWF0aW9uKTsKPiAtCQkJZWxzZQo+ICsJCQlpZiAocG9zLT5mbGFncyAmIEk5MTVfU1dfRkVO
Q0VfRkxBR19GRU5DRSkKPiAgIAkJCQlsaXN0X21vdmVfdGFpbCgmcG9zLT5lbnRyeSwgY29udGlu
dWF0aW9uKTsKPiArCQkJZWxzZQo+ICsJCQkJcG9zLT5mdW5jKHBvcywgVEFTS19OT1JNQUwsIDAs
IGNvbnRpbnVhdGlvbik7Cj4gICAJCX0KPiAgIAl9IGVsc2Ugewo+ICAgCQlMSVNUX0hFQUQoZXh0
cmEpOwo+IEBAIC0xNjYsOSArMTcxLDkgQEAgc3RhdGljIHZvaWQgX19pOTE1X3N3X2ZlbmNlX3dh
a2VfdXBfYWxsKHN0cnVjdCBpOTE1X3N3X2ZlbmNlICpmZW5jZSwKPiAgIAkJCWxpc3RfZm9yX2Vh
Y2hfZW50cnlfc2FmZShwb3MsIG5leHQsICZ4LT5oZWFkLCBlbnRyeSkgewo+ICAgCQkJCWludCB3
YWtlX2ZsYWdzOwo+ICAgCj4gLQkJCQl3YWtlX2ZsYWdzID0gZmVuY2UtPmVycm9yOwo+IC0JCQkJ
aWYgKHBvcy0+ZnVuYyA9PSBhdXRvcmVtb3ZlX3dha2VfZnVuY3Rpb24pCj4gLQkJCQkJd2FrZV9m
bGFncyA9IDA7Cj4gKwkJCQl3YWtlX2ZsYWdzID0gMDsKPiArCQkJCWlmIChwb3MtPmZsYWdzICYg
STkxNV9TV19GRU5DRV9GTEFHX0ZFTkNFKQo+ICsJCQkJCXdha2VfZmxhZ3MgPSBmZW5jZS0+ZXJy
b3I7Cj4gICAKPiAgIAkJCQlwb3MtPmZ1bmMocG9zLCBUQVNLX05PUk1BTCwgd2FrZV9mbGFncywg
JmV4dHJhKTsKPiAgIAkJCX0KPiBAQCAtMzMyLDggKzMzNyw4IEBAIHN0YXRpYyBpbnQgX19pOTE1
X3N3X2ZlbmNlX2F3YWl0X3N3X2ZlbmNlKHN0cnVjdCBpOTE1X3N3X2ZlbmNlICpmZW5jZSwKPiAg
IAkJCQkJICBzdHJ1Y3QgaTkxNV9zd19mZW5jZSAqc2lnbmFsZXIsCj4gICAJCQkJCSAgd2FpdF9x
dWV1ZV9lbnRyeV90ICp3cSwgZ2ZwX3QgZ2ZwKQo+ICAgewo+ICsJdW5zaWduZWQgaW50IHBlbmRp
bmc7Cj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAtCWludCBwZW5kaW5nOwo+ICAgCj4gICAJ
ZGVidWdfZmVuY2VfYXNzZXJ0KGZlbmNlKTsKPiAgIAltaWdodF9zbGVlcF9pZihnZnBmbGFnc19h
bGxvd19ibG9ja2luZyhnZnApKTsKPiBAQCAtMzQ5LDcgKzM1NCw3IEBAIHN0YXRpYyBpbnQgX19p
OTE1X3N3X2ZlbmNlX2F3YWl0X3N3X2ZlbmNlKHN0cnVjdCBpOTE1X3N3X2ZlbmNlICpmZW5jZSwK
PiAgIAlpZiAodW5saWtlbHkoaTkxNV9zd19mZW5jZV9jaGVja19pZl9hZnRlcihmZW5jZSwgc2ln
bmFsZXIpKSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gICAKPiAtCXBlbmRpbmcgPSAwOwo+ICsJ
cGVuZGluZyA9IEk5MTVfU1dfRkVOQ0VfRkxBR19GRU5DRTsKPiAgIAlpZiAoIXdxKSB7Cj4gICAJ
CXdxID0ga21hbGxvYyhzaXplb2YoKndxKSwgZ2ZwKTsKPiAgIAkJaWYgKCF3cSkgewpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
