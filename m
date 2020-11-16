Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1CBC4742C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 13:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707D222240
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 13:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707D222240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18B389D87;
	Mon, 16 Nov 2020 13:08:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B9289D99;
 Mon, 16 Nov 2020 13:08:14 +0000 (UTC)
IronPort-SDR: 6tqx323XHaNveA+Oav/7fyKO3MnrNDjbfy+HJWrKwGx0s3XZZuuOzWE7tz0qvTGj5WrnBUeA8g
 WssbHFNOYJGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="170844030"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="170844030"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 05:08:11 -0800
IronPort-SDR: WMSUxWL6RzfP9C/GaM8ulHmp037MouS4qz2Kb8HufU8pI7BFTU48xL2vdJ+W88E53ADNjuS6TG
 6l2iSu3kYPyw==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="543596465"
Received: from abaldovi-mobl.ger.corp.intel.com (HELO [10.252.52.236])
 ([10.252.52.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 05:08:10 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
References: <20201113162736.2434791-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e87c35c2-b74b-b9bb-5c0d-b5201445b973@linux.intel.com>
Date: Mon, 16 Nov 2020 13:08:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113162736.2434791-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [RFC i-g-t 0/5] User friendly
 lsgpu/intel_gpu_top device listing
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDEzLzExLzIwMjAgMTY6MjcsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IEZyb206IFR2cnRr
byBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gCj4gUGxlYXNlIHNlZSBpbmRp
dmlkdWFsIHBhdGggY29tbWl0IG1lc3NhZ2VzIGZvciBkZXRhaWxzLCBidXQgZXNzZW50aWFsbHkg
SQo+IGltcGxlbWVudGVkIHRoaXM6Cj4gCj4gJCBzdWRvIHRvb2xzL2xzZ3B1Cj4gY2FyZDEgICAg
ICAgICAgICAgICAgICAgODA4Njo0OTA1ICAgIGRybTovZGV2L2RyaS9jYXJkMQo+IOKUlOKUgHJl
bmRlckQxMjkgICAgICAgICAgICAgICAgICAgICAgICAgZHJtOi9kZXYvZHJpL3JlbmRlckQxMjkK
PiBjYXJkMCAgICAgICAgICAgICAgICAgICA4MDg2OjNFOTggICAgZHJtOi9kZXYvZHJpL2NhcmQw
Cj4g4pSU4pSAcmVuZGVyRDEyOCAgICAgICAgICAgICAgICAgICAgICAgICBkcm06L2Rldi9kcmkv
cmVuZGVyRDEyOAo+IAo+ICQgc3VkbyB0b29scy9sc2dwdSAtLXBjaQo+IGNhcmQxICAgICAgICAg
ICAgICAgICAgIDgwODY6NDkwNSAgICBwY2k6dmVuZG9yPTgwODYsZGV2aWNlPTQ5MDUsY2FyZD0w
Cj4g4pSU4pSAcmVuZGVyRDEyOQo+IGNhcmQwICAgICAgICAgICAgICAgICAgIDgwODY6M0U5OCAg
ICBwY2k6dmVuZG9yPTgwODYsZGV2aWNlPTNFOTgsY2FyZD0wCj4g4pSU4pSAcmVuZGVyRDEyOAo+
IAo+ICQgc3VkbyB0b29scy9sc2dwdSAtLXN5c2ZzCj4gY2FyZDEgICAgICAgICAgICAgICAgICAg
ODA4Njo0OTA1ICAgIHN5czovc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjAxLjAvMDAw
MDowMTowMC4wLzAwMDA6MDI6MDEuMC8wMDAwOjAzOjAwLjAKPiDilJTilIByZW5kZXJEMTI5ICAg
ICAgICAgICAgICAgICAgICAgICAgIHN5czovc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAw
OjAxLjAvMDAwMDowMTowMC4wLzAwMDA6MDI6MDEuMC8wMDAwOjAzOjAwLjAvZHJtL3JlbmRlckQx
MjkKPiBjYXJkMCAgICAgICAgICAgICAgICAgICA4MDg2OjNFOTggICAgc3lzOi9zeXMvZGV2aWNl
cy9wY2kwMDAwOjAwLzAwMDA6MDA6MDIuMAo+IOKUlOKUgHJlbmRlckQxMjggICAgICAgICAgICAg
ICAgICAgICAgICAgc3lzOi9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MDIuMC9kcm0v
cmVuZGVyRDEyOAo+IAo+IEkgbmVlZCB0byBmaW5kIGEgbWFjaGluZSB3aXRoIHR3byBHUFVzIG9m
IHRoZSBzYW1lIGRldmljZSBpZCB0byBmaW5pc2ggdGVzdGluZwo+IHRoaXMgaGVuY2Ugc3RpbGwg
UkZDLgoKSSBtb2NrIHRlc3RlZCB0aGUgUENJIGNhcmQgaW5kZXggZ2VuZXJhdGluZyBjb2RlIGFu
ZCBpdCBzZWVtcyB0byB3b3JrIGZpbmU6CgokIHRvb2xzL2xzZ3B1IC0tcGNpCmNhcmQwICAgICAg
ICAgICAgICAgICAgIDgwODY6MTkzQiAgICBwY2k6dmVuZG9yPTgwODYsZGV2aWNlPTE5M0IsY2Fy
ZD0wCuKUnOKUgHJlbmRlckQxMjgK4pSU4pSAcmVuZGVyRDEyOApjYXJkMHggICAgICAgICAgICAg
ICAgICA4MDg2OjE5M0IgICAgcGNpOnZlbmRvcj04MDg2LGRldmljZT0xOTNCLGNhcmQ9MQrilJzi
lIByZW5kZXJEMTI4CuKUlOKUgHJlbmRlckQxMjgKClJlZ2FyZHMsCgpUdnJ0a28KCj4gVHZydGtv
IFVyc3VsaW4gKDUpOgo+ICAgIGludGVsX2dwdV90b3A6IFVzZXIgZnJpZW5kbHkgZGV2aWNlIGxp
c3RpbmcKPiAgICBsc2dwdTogVXNlciBmcmllbmRseSBkZXZpY2UgbGlzdGluZwo+ICAgIGxpYi9p
Z3RfZGV2aWNlX3NjYW46IFJlbWVtYmVyIFBDSSBjYXJkIGluZGV4IGFmdGVyIHNjYW5uaW5nCj4g
ICAgbHNncHU6IEFkZCBmaWx0ZXIgdHlwZSBwcmludC1vdXQgc2VsZWN0aW9uCj4gICAgaW50ZWxf
Z3B1X3RvcDogRGVmYXVsdCBHUFUgbGlzdCB0byBQQ0kgbW9kZQo+IAo+ICAgbGliL2lndF9kZXZp
Y2Vfc2Nhbi5jIHwgMjA1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LQo+ICAgbGliL2lndF9kZXZpY2Vfc2Nhbi5oIHwgIDE2ICsrKy0KPiAgIHRvb2xzL2ludGVsX2dw
dV90b3AuYyB8ICAgOCArLQo+ICAgdG9vbHMvbHNncHUuYyAgICAgICAgIHwgIDM4ICsrKysrKy0t
Cj4gICA0IGZpbGVzIGNoYW5nZWQsIDIzMyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwt
Z2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
