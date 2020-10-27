Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C309BC55179
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 07:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC7220738
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 07:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC7220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECE46E1A7;
	Tue, 27 Oct 2020 07:48:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925486E1A7
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 07:48:20 +0000 (UTC)
IronPort-SDR: oqThQlKfu5lSVCChMfdTg6OTuMideHhwKSmCCNvJ+dnQiF9RUTuBkInDfj2zSnBES54ZUIaofN
 1umpkU4Ahubg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="252740552"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="252740552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 00:48:20 -0700
IronPort-SDR: F75TAVMn2iBSo20z72TP7WajO0WCsEoLFpSfEk0ehFgZDZ3Qo7nxM5V0/iTNwxjmJshqST8UaG
 B7J9q6+31mZA==
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="394382449"
Received: from poomaduv-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.87.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 00:48:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20201027044618.719064-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201027044618.719064-1-lucas.demarchi@intel.com>
Date: Tue, 27 Oct 2020 09:48:14 +0200
Message-ID: <873620jeip.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Guard debugfs against invalid
 access without display
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

T24gTW9uLCAyNiBPY3QgMjAyMCwgTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+IHdyb3RlOgo+IERvIG5vdCBjcmVhdGUgdGhlIGRpc3BsYXkgZGVidWdmcyBmaWxlcyB3
aGVuIHdlIGRvbid0IGhhdmUgZGlzcGxheS4KPgo+IEJhc2VkIG9uIHByZXZpb3VzIHBhdGNoIGJ5
IEpvc8OpIFNvdXphLgo+Cj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgoK
UmV2aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Ry
di5jCj4gaW5kZXggZDMyMzdiMGQ4MjFkLi5kNmUyNTIxMmQ1YzAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfZHJ2LmMKPiBAQCAtNjcxLDcgKzY3MSw4IEBAIHN0YXRpYyB2b2lkIGk5MTVfZHJpdmVy
X3JlZ2lzdGVyKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKPiAgCS8qIFJldmVh
bCBvdXIgcHJlc2VuY2UgdG8gdXNlcnNwYWNlICovCj4gIAlpZiAoZHJtX2Rldl9yZWdpc3Rlcihk
ZXYsIDApID09IDApIHsKPiAgCQlpOTE1X2RlYnVnZnNfcmVnaXN0ZXIoZGV2X3ByaXYpOwo+IC0J
CWludGVsX2Rpc3BsYXlfZGVidWdmc19yZWdpc3RlcihkZXZfcHJpdik7Cj4gKwkJaWYgKEhBU19E
SVNQTEFZKGRldl9wcml2KSkKPiArCQkJaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzX3JlZ2lzdGVyKGRl
dl9wcml2KTsKPiAgCQlpOTE1X3NldHVwX3N5c2ZzKGRldl9wcml2KTsKPiAgCj4gIAkJLyogRGVw
ZW5kcyBvbiBzeXNmcyBoYXZpbmcgYmVlbiBpbml0aWFsaXplZCAqLwoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
