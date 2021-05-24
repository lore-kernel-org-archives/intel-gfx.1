Return-Path: <SRS0=+tRi=KT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3B4C04FF3
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 22:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D420A613BF
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 22:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D420A613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2D089CD4;
	Mon, 24 May 2021 22:23:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63F589CD4
 for <intel-gfx@lists.freedesktop.org>; Mon, 24 May 2021 22:23:07 +0000 (UTC)
IronPort-SDR: jZsHK3oSqwF3jHFKGovyzsveDchQuG7H6hkwsm0BTN4mR4u4dLXikUgye8wy55v8BZK74kHJ1C
 I5P5Z0mq0aPA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="202086112"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="202086112"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:23:05 -0700
IronPort-SDR: Rp9hjb+Di351a/z4EgavzoZYsf3Oy9qcGR9JBU5xLF5wdunfH9oWnktOAx0uXtmvfB6oGWCNuv
 nazstt51u7Ew==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="470898317"
Received: from lpnguyen-mobl2.amr.corp.intel.com (HELO [10.209.115.31])
 ([10.209.115.31])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:23:05 -0700
To: intel-gfx@lists.freedesktop.org
References: <20210524214805.259692-1-jose.souza@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <564dd27a-ceab-f443-c173-ed9c54de3554@intel.com>
Date: Mon, 24 May 2021 15:23:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210524214805.259692-1-jose.souza@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/display/adl_p: Drop earlier
 return in tc_has_modular_fia()
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

Ck9uIDUvMjQvMjEgMjo0OCBQTSwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToKPiBNT0RV
TEFSX0ZJQV9NQVNLIGlzIHNldCBpbiBhZGxfcCBzbyB3ZSBjYW4gZHJvcCB0aGlzIGVhbGllciBy
ZXR1cm4KPiBhbmQgcmVhZCByZWdpc3RlcnMuCj4gQWxzbyB0byBhdm9pZCB3YXJuaW5ncyBmcm9t
IGljbF90Y19wb3J0X2Fzc2VydF9yZWZfaGVsZCgpIHdoZW4KPiBjYWxsaW5nIHRjX2NvbGRfYmxv
Y2soKSBpbiB0aGlzIGZ1bmN0aW9ucyBpdCBpcyBuZWNlc3NhcnkgdG8gaGVsZCB0aGUKPiBsb2Nr
Lgo+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYyB8IDYgKystLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYwo+IGluZGV4IDVmMDMyMTVhMDNlNC4uZGI4
NWUwZTIwMzFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfdGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYwo+
IEBAIC03MzQsMTMgKzczNCwxMSBAQCB0Y19oYXNfbW9kdWxhcl9maWEoc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmk5MTUsIHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZwo+ICAgCWlmICgh
SU5URUxfSU5GTyhpOTE1KS0+ZGlzcGxheS5oYXNfbW9kdWxhcl9maWEpCj4gICAJCXJldHVybiBm
YWxzZTsKPiAgIAo+IC0JLyogVE9ETzogY2hlY2sgaWYgaW4gcmVhbCBIVyBNT0RVTEFSX0ZJQV9N
QVNLIGlzIHNldCwgaWYgc28gcmVtb3ZlIHRoaXMgYmxvY2sgKi8KPiAtCWlmIChJU19BTERFUkxB
S0VfUChpOTE1KSkKPiAtCQlyZXR1cm4gdHJ1ZTsKPiAtCj4gKwltdXRleF9sb2NrKCZkaWdfcG9y
dC0+dGNfbG9jayk7Cj4gICAJd2FrZXJlZiA9IHRjX2NvbGRfYmxvY2soZGlnX3BvcnQpOwo+ICAg
CXZhbCA9IGludGVsX3VuY29yZV9yZWFkKCZpOTE1LT51bmNvcmUsIFBPUlRfVFhfREZMRVhEUFNQ
KEZJQTEpKTsKPiAgIAl0Y19jb2xkX3VuYmxvY2soZGlnX3BvcnQsIHdha2VyZWYpOwo+ICsJbXV0
ZXhfdW5sb2NrKCZkaWdfcG9ydC0+dGNfbG9jayk7Cj4gICAKPiAgIAlkcm1fV0FSTl9PTigmaTkx
NS0+ZHJtLCB2YWwgPT0gMHhmZmZmZmZmZik7Cj4gICAKClJldmlld2VkLWJ5OiBDbGludCBUYXls
b3IgPENsaW50b24uQS5UYXlsb3JAaW50ZWwuY29tPgoKLUNsaW50CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
