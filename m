Return-Path: <SRS0=pmG3=KF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D23C433B4
	for <intel-gfx@archiver.kernel.org>; Mon, 10 May 2021 11:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B021761001
	for <intel-gfx@archiver.kernel.org>; Mon, 10 May 2021 11:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B021761001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398076E12A;
	Mon, 10 May 2021 11:16:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C46E12A;
 Mon, 10 May 2021 11:16:17 +0000 (UTC)
IronPort-SDR: YBaxCwEz2bORs6FfpsoYMKkQA2RqIgng/uimljtKcEojFvQYvi+czqQD3I3QPDXIAWabLSwN8H
 Yf+8oB8MRFJQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="197184663"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="197184663"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 04:16:16 -0700
IronPort-SDR: 6f7483hNhBYZ6quW3AIAvXtqyjGE63Mhhqh6TMeYQme1IdnqDs+NRHcY9ZfhmJJcCXLHx3iMr+
 r0uzfvmVKEPg==
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="436099598"
Received: from solender-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 04:16:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
In-Reply-To: <36bc1118467da645a57515743c9f6c1cd86abe8c.1620641727.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <36bc1118467da645a57515743c9f6c1cd86abe8c.1620641727.git.mchehab+huawei@kernel.org>
Date: Mon, 10 May 2021 14:16:08 +0300
Message-ID: <87sg2uvnyf.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 44/53] docs: gpu: avoid using UTF-8 chars
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 dri-devel@lists.freedesktop.org, Mali DP Maintainers <malidp@foss.arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCAxMCBNYXkgMjAyMSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdl
aUBrZXJuZWwub3JnPiB3cm90ZToKPiBXaGlsZSBVVEYtOCBjaGFyYWN0ZXJzIGNhbiBiZSB1c2Vk
IGF0IHRoZSBMaW51eCBkb2N1bWVudGF0aW9uLAo+IHRoZSBiZXN0IGlzIHRvIHVzZSB0aGVtIG9u
bHkgd2hlbiBBU0NJSSBkb2Vzbid0IG9mZmVyIGEgZ29vZCByZXBsYWNlbWVudC4KPiBTbywgcmVw
bGFjZSB0aGUgb2NjdXJlbmNlcyBvZiB0aGUgZm9sbG93aW5nIFVURi04IGNoYXJhY3RlcnM6Cj4K
PiAJLSBVKzIwMTkgKCfigJknKTogUklHSFQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5v
cmc+CgpBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdCAgICAgICB8IDIgKy0KPiAgRG9jdW1lbnRh
dGlvbi9ncHUva29tZWRhLWttcy5yc3QgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
Z3B1L2k5MTUucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5yc3QKPiBpbmRleCA0ODZjNzIw
ZjM4OTAuLjJjYmY1NDQ2MGI0OCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9pOTE1
LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2k5MTUucnN0Cj4gQEAgLTM2MSw3ICszNjEs
NyBAQCBMb2NraW5nIEd1aWRlbGluZXMKPiAgCSAgcmVhbCBiYWQuCj4gIAo+ICAjLiBEbyBub3Qg
bmVzdCBkaWZmZXJlbnQgbHJ1L21lbW9yeSBtYW5hZ2VyIGxvY2tzIHdpdGhpbiBlYWNoIG90aGVy
Lgo+IC0gICBUYWtlIHRoZW0gaW4gdHVybiB0byB1cGRhdGUgbWVtb3J5IGFsbG9jYXRpb25zLCBy
ZWx5aW5nIG9uIHRoZSBvYmplY3TigJlzCj4gKyAgIFRha2UgdGhlbSBpbiB0dXJuIHRvIHVwZGF0
ZSBtZW1vcnkgYWxsb2NhdGlvbnMsIHJlbHlpbmcgb24gdGhlIG9iamVjdCdzCj4gICAgIGRtYV9y
ZXN2IHd3X211dGV4IHRvIHNlcmlhbGl6ZSBhZ2FpbnN0IG90aGVyIG9wZXJhdGlvbnMuCj4gIAo+
ICAjLiBUaGUgc3VnZ2VzdGlvbiBmb3IgbHJ1L21lbW9yeSBtYW5hZ2VycyBsb2NrcyBpcyB0aGF0
IHRoZXkgYXJlIHNtYWxsCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2tvbWVkYS1r
bXMucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUva29tZWRhLWttcy5yc3QKPiBpbmRleCBlYjY5M2M4
NTdlMmQuLmMyMDY3Njc4ZTkyYyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9rb21l
ZGEta21zLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2tvbWVkYS1rbXMucnN0Cj4gQEAg
LTMyNCw3ICszMjQsNyBAQCB0aGUgY29udHJvbC1hYmlsaXRlcyBvZiBkZXZpY2UuCj4gIAo+ICBX
ZSBoYXZlICZrb21lZGFfZGV2LCAma29tZWRhX3BpcGVsaW5lLCAma29tZWRhX2NvbXBvbmVudC4g
Tm93IGZpbGwgZGV2aWNlcyB3aXRoCj4gIHBpcGVsaW5lcy4gU2luY2Uga29tZWRhIGlzIG5vdCBm
b3IgRDcxIG9ubHkgYnV0IGFsc28gaW50ZW5kZWQgZm9yIGxhdGVyIHByb2R1Y3RzLAo+IC1vZiBj
b3Vyc2Ugd2XigJlkIGJldHRlciBzaGFyZSBhcyBtdWNoIGFzIHBvc3NpYmxlIGJldHdlZW4gZGlm
ZmVyZW50IHByb2R1Y3RzLiBUbwo+ICtvZiBjb3Vyc2Ugd2UnZCBiZXR0ZXIgc2hhcmUgYXMgbXVj
aCBhcyBwb3NzaWJsZSBiZXR3ZWVuIGRpZmZlcmVudCBwcm9kdWN0cy4gVG8KPiAgYWNoaWV2ZSB0
aGlzLCBzcGxpdCB0aGUga29tZWRhIGRldmljZSBpbnRvIHR3byBsYXllcnM6IENPUkUgYW5kIENI
SVAuCj4gIAo+ICAtICAgQ09SRTogZm9yIGNvbW1vbiBmZWF0dXJlcyBhbmQgY2FwYWJpbGl0aWVz
IGhhbmRsaW5nLgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50
ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
