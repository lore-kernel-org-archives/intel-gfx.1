Return-Path: <SRS0=edJA=EY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29099C5519F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 11:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B64C22228
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 11:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B64C22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41E889E14;
	Wed, 18 Nov 2020 11:12:03 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803E89E14
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2020 11:12:02 +0000 (UTC)
IronPort-SDR: rn67q2/UdY1xdg0DTvf4Gub4ciBV3SVAiNQyXIEv9A5u6j2125enMku5NEW58jvKUtgHyOiPe0
 XlVCMqr9WttA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="171196475"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="171196475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 03:12:01 -0800
IronPort-SDR: siuiPYO3ZtPJiHjzSBT+54IXRoOsTvDIrpKq/SDByrxzzmAqXYlemtKceHk+4qqfAzAdJ0KMgO
 I9ebgSmCpxzA==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="476301203"
Received: from dlmurray-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.82.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 03:11:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20201106101443.686053-2-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201106101443.686053-1-gwan-gyeong.mun@intel.com>
 <20201106101443.686053-2-gwan-gyeong.mun@intel.com>
Date: Wed, 18 Nov 2020 13:11:56 +0200
Message-ID: <878sayq5qb.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v4 2/2] drm/i915/display: Support Multiple
 Transcoders' PSR status on debugfs
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

T24gRnJpLCAwNiBOb3YgMjAyMCwgR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50
ZWwuY29tPiB3cm90ZToKPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoZSBQU1Igc3RhdGUgb2YgZWFj
aCB0cmFuc2NvZGVyLCBpdCBhZGRzCj4gaTkxNV9wc3Jfc3RhdHVzIHRvIHN1Yi1kaXJlY3Rvcnkg
b2YgZWFjaCB0cmFuc2NvZGVyLgo+Cj4gdjI6IENoYW5nZSB1c2luZyBvZiBTeW1ib2xpYyBwZXJt
aXNzaW9ucyAnU19JUlVHTycgdG8gdXNpbmcgb2Ygb2N0YWwKPiAgICAgcGVybWlzc2lvbnMgJzA0
NDQnCj4KPiBTaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBp
bnRlbC5jb20+Cj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPgo+IC0tLQo+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMu
YyAgfCAyMyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9kZWJ1Z2ZzLmMKPiBpbmRleCA4NDAyZTZhYzlmNzYuLjM3ODA1NjE1YTIyMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVi
dWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
X2RlYnVnZnMuYwo+IEBAIC0yMDkzLDYgKzIwOTMsMjMgQEAgc3RhdGljIGludCBpOTE1X2hkY3Bf
c2lua19jYXBhYmlsaXR5X3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQo+ICB9
Cj4gIERFRklORV9TSE9XX0FUVFJJQlVURShpOTE1X2hkY3Bfc2lua19jYXBhYmlsaXR5KTsKPiAg
Cj4gK3N0YXRpYyBpbnQgaTkxNV9wc3Jfc3RhdHVzX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2
b2lkICpkYXRhKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gbS0+
cHJpdmF0ZTsKPiArCXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPQo+ICsJCWludGVsX2F0dGFj
aGVkX2RwKHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpKTsKPiArCXN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdiA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOwo+ICsKPiArCWlmIChj
b25uZWN0b3ItPnN0YXR1cyAhPSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkKPiArCQlyZXR1
cm4gLUVOT0RFVjsKPiArCj4gKwlpZiAoIUhBU19QU1IoZGV2X3ByaXYpKQo+ICsJCXJldHVybiAt
RU5PREVWOwo+ICsKPiArCXJldHVybiBpbnRlbF9wc3Jfc3RhdHVzKG0sIGludGVsX2RwKTsKPiAr
fQo+ICtERUZJTkVfU0hPV19BVFRSSUJVVEUoaTkxNV9wc3Jfc3RhdHVzKTsKPiArCj4gICNkZWZp
bmUgTFBTUF9DQVBBQkxFKENPTkQpIChDT05EID8gc2VxX3B1dHMobSwgIkxQU1A6IGNhcGFibGVc
biIpIDogXAo+ICAJCQkJc2VxX3B1dHMobSwgIkxQU1A6IGluY2FwYWJsZVxuIikpCj4gIAo+IEBA
IC0yMjY4LDYgKzIyODUsMTIgQEAgaW50IGludGVsX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJCQkJICAgIGNvbm5lY3RvciwgJmk5MTVf
cHNyX3Npbmtfc3RhdHVzX2ZvcHMpOwo+ICAJfQo+ICAKPiArCWlmIChJTlRFTF9HRU4oZGV2X3By
aXYpID49IDEyICYmCgpJJ2QgYWRkIHRoaXMgZm9yIGFsbCBnZW5lcmF0aW9ucyB0byB1bmlmeSB0
aGUgZGVidWdmcywgYW5kIGV2ZW50dWFsbHkKcGhhc2Ugb3V0IHRoZSBub24gY29ubmVjdG9yIHNw
ZWNpZmljIGRlYnVnZnMgZmlsZS4KCkFuZCBJJ2QgYWRkIEhBU19QU1IoKSBjaGVjayBoZXJlIHRv
IG5vdCBjcmVhdGUgdGhlIGZpbGUgaWYgaXQncyBub3QKcG9zc2libGUgaW5zdGVhZCBvZiBoYXZp
bmcgdGhlIGNoZWNrIGluIGk5MTVfcHNyX3N0YXR1c19zaG93KCkuCgpCUiwKSmFuaS4KCj4gKwkg
ICAgY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSB7
Cj4gKwkJZGVidWdmc19jcmVhdGVfZmlsZSgiaTkxNV9wc3Jfc3RhdHVzIiwgMDQ0NCwgcm9vdCwK
PiArCQkJCSAgICBjb25uZWN0b3IsICZpOTE1X3Bzcl9zdGF0dXNfZm9wcyk7Cj4gKwl9Cj4gKwo+
ICAJaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0Rp
c3BsYXlQb3J0IHx8Cj4gIAkgICAgY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9E
RV9DT05ORUNUT1JfSERNSUEgfHwKPiAgCSAgICBjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09
IERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQikgewoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVu
IFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ2Z4Cg==
