Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FCFC433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDD2C613CA
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD2C613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9C76E250;
	Thu, 29 Apr 2021 13:23:50 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ABD6E226;
 Thu, 29 Apr 2021 13:23:48 +0000 (UTC)
IronPort-SDR: bMWBWtj+nMfH8djzgs+QjB7WJPrf+cf6gLJ5yAHaTr/slA2bh4j1ZSPCoGmnPfC4jdDK/sJJ6P
 zquz3WxnbZPQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="184134297"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="184134297"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 06:23:46 -0700
IronPort-SDR: LO6JGwXxq9VSEOAZp0Aik1oIucAD9YSBXwPMl3etLAzfbj1CO9FFfSTgrPNbbXt67WUKfuajx9
 UQ4zHNhUOjaQ==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="458757282"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO [10.213.208.64])
 ([10.213.208.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 06:23:45 -0700
To: Petri Latvala <petri.latvala@intel.com>, xorg-announce@lists.x.org
References: <YIK5ypkeffpqZmOh@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3b0b6cbe-adc5-000d-2bc4-0d73a501a83d@linux.intel.com>
Date: Thu, 29 Apr 2021 14:23:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIK5ypkeffpqZmOh@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [ANNOUNCE] igt-gpu-tools 1.26
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 xorg@lists.x.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDIzLzA0LzIwMjEgMTM6MTIsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gQSBuZXcgaWd0LWdw
dS10b29scyByZWxlYXNlIGlzIGF2YWlsYWJsZSB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoK
PiAKPiAtIEF1dG90b29scyBzdXBwb3J0IGhhcyBiZWVuIGVudGlyZWx5IGRyb3BwZWQgaW4gZmF2
b3Igb2Ygb25seSBtZXNvbi4gKEFya2FkaXVzeiBIaWxlcikKPiAKPiAtIFRlc3RzIGNhbiBub3cg
c2lnbmFsIHRoYXQgdGhlIHdob2xlIHRlc3Qgcm91bmQgc2hvdWxkIGJlIGFib3J0ZWQuIChBcmth
ZGl1c3ogSGlsZXIpCj4gCj4gLSBWYXJpb3VzIHJvYnVzdG5lc3MgaW1wcm92ZW1lbnRzIGZvciBD
aGFtZWxpdW0gdXNlLiAoQXJrYWRpdXN6IEhpbGVyLAo+ICAgIEt1bmFsIEpvc2hpLCBJbXJlIERl
YWssIGV0IGFsKQo+IAo+IC0gRGV2aWNlIGZpbHRlcmluZyBpbXByb3ZlbWVudHMgZm9yIG11bHRp
LWRldmljZSB1c2UuIChBcmthZGl1c3ogSGlsZXIpCj4gCj4gLSBEZXZpY2UgZmlsdGVyaW5nIGZv
ciB2YXJpb3VzIEludGVsIHRvb2xzIGxpa2UgaW50ZWxfZ3B1X3RvcC4gKEF5YXogQSBTaWRkaXF1
aSkKPiAKPiAtIE92ZXJoYXVsZWQga2VybmVsIHBhcmFtZXRlciBoYW5kbGluZy4gKEphbmkgTmlr
dWxhKQo+IAo+IC0gSW50cm9kdWNlZCBhbiBpOTE1IGJhdGNoYnVmZmVyIGZhY2lsaXR5LiAoWmJp
Z25pZXcgS2VtcGN6ecWEc2tpKQo+IAo+IC0gSW1wcm92ZW1lbnRzIGZvciB0ZXN0aW5nIG5vdXZl
YXUuIChMeXVkZSBQYXVsKQo+IAo+IC0gTW9yZSByZWFkYWJsZSBhbmQgdXNlZnVsIG91dHB1dCBm
b3IgbHNncHUgYW5kIG90aGVyIHRvb2xzIHRoYXQgbGlzdAo+ICAgIGRldmljZXMuIChUdnJ0a28g
VXJzdWxpbikKPiAKPiAtIGludGVsX2dwdV90b3AgY2FuIG5vdyBzaG93IHBlci1jbGllbnQgYnVz
eW5lc3Mgc3RhdHMuIChUdnJ0a28gVXJzdWxpbikKClNhZGx5IG5vdCwgaTkxNSBzaWRlIGdvdCBr
aWNrZWQgb3V0LiArRGFuaWVsIGlmIGhlIHdhbnRzIHRvIHJlY29uc2lkZXIgCm9yIG90aGVyd2lz
ZSB3ZSBoYXZlIHRvIHJlbW92ZSB0aGlzIGNvZGUgYXMgd2VsbC4KClJlZ2FyZHMsCgpUdnJ0a28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
