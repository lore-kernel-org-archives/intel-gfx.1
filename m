Return-Path: <SRS0=yb3L=EI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2A0C4741F
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 02:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9275D2225B
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 02:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9275D2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CB6E24E;
	Mon,  2 Nov 2020 02:07:23 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749AE6E24E
 for <Intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2020 02:07:22 +0000 (UTC)
IronPort-SDR: PZKHzban26eaALn1dv5kQoTIPMwm6/PlZA8F5It3ROEh3QEgRXtnUrh25xNVZRKHU8QON5RlQh
 /WKl75zV0v0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="148679734"
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; d="scan'208";a="148679734"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 18:07:22 -0800
IronPort-SDR: O/lSjeHppVwIa8kesMLcYMknp+CrstaTpLi/t6DayECS/VYRvc9ZB0E5Bb5pyK4/f+FhUlFaKp
 SMosrengpVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; d="scan'208";a="357184384"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2020 18:07:19 -0800
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@infradead.org>
References: <20200927063437.13988-1-baolu.lu@linux.intel.com>
 <e999e371-6d36-ffea-542f-a5f4b230b0ed@linux.intel.com>
 <c2af9a9d-1cae-b8f7-a0b3-880574060a23@linux.intel.com>
 <8bac9e91-36a0-c1d6-a887-4d60567ac75a@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3f5694f3-62f9-cc2b-1c2b-f9e99a4788c1@linux.intel.com>
Date: Mon, 2 Nov 2020 10:00:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8bac9e91-36a0-c1d6-a887-4d60567ac75a@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 0/7] Convert the intel iommu driver to
 the dma-iommu api
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
Cc: linux-kernel@vger.kernel.org, Intel-gfx@lists.freedesktop.org,
 Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org,
 baolu.lu@linux.intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

SGkgVHZydGtvLAoKT24gMTAvMTIvMjAgNDo0NCBQTSwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4g
Cj4gT24gMjkvMDkvMjAyMCAwMToxMSwgTHUgQmFvbHUgd3JvdGU6Cj4+IEhpIFR2cnRrbywKPj4K
Pj4gT24gOS8yOC8yMCA1OjQ0IFBNLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPj4+Cj4+PiBPbiAy
Ny8wOS8yMDIwIDA3OjM0LCBMdSBCYW9sdSB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IFRoZSBw
cmV2aW91cyBwb3N0IG9mIHRoaXMgc2VyaWVzIGNvdWxkIGJlIGZvdW5kIGhlcmUuCj4+Pj4KPj4+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDIwMDkxMjAzMjIwMC4xMTQ4
OS0xLWJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbS8gCj4+Pj4KPj4+Pgo+Pj4+IFRoaXMgdmVyc2lv
biBpbnRyb2R1Y2UgYSBuZXcgcGF0Y2ggWzQvN10gdG8gZml4IGFuIGlzc3VlIHJlcG9ydGVkIGhl
cmUuCj4+Pj4KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS81MWExYmFl
Yy00OGQxLWMwYWMtMTgxYi0xZmJhOTJhYTQyOGRAbGludXguaW50ZWwuY29tLyAKPj4+Pgo+Pj4+
Cj4+Pj4gVGhlcmUgYXJlbid0IGFueSBvdGhlciBjaGFuZ2VzLgo+Pj4+Cj4+Pj4gUGxlYXNlIGhl
bHAgdG8gdGVzdCBhbmQgcmV2aWV3Lgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+IGJhb2x1
Cj4+Pj4KPj4+PiBMdSBCYW9sdSAoMyk6Cj4+Pj4gwqDCoCBpb21tdTogQWRkIHF1aXJrIGZvciBJ
bnRlbCBncmFwaGljIGRldmljZXMgaW4gbWFwX3NnCj4+Pgo+Pj4gU2luY2UgSSBkbyBoYXZlIHBh
dGNoZXMgdG8gZml4IGk5MTUgdG8gaGFuZGxlIHRoaXMsIGRvIHdlIHdhbnQgdG8gCj4+PiBjby1v
cmRpbmF0ZSB0aGUgdHdvIGFuZCBhdm9pZCBoYXZpbmcgdG8gYWRkIHRoaXMgcXVpcmsgYW5kIHRo
ZW4gbGF0ZXIgCj4+PiByZW1vdmUgaXQ/IE9yIHlvdSB3YW50IHRvIGdvIHRoZSBzdGFnZWQgYXBw
cm9hY2g/Cj4+Cj4+IEkgaGF2ZSBubyBwcmVmZXJlbmNlLiBJdCBkZXBlbmRzIG9uIHdoaWNoIHBh
dGNoIGdvZXMgZmlyc3QuIExldCB0aGUKPj4gbWFpbnRhaW5lcnMgaGVscCBoZXJlLgo+IAo+IEZZ
SSB3ZSBoYXZlIG1lcmdlZCB0aGUgcmVxdWlyZWQgaTkxNSBwYXRjaGVzIHRvIG91dCB0cmVlIGxh
c3Qgd2VlayBvciAKPiBzby4gSSAqdGhpbmsqIHRoaXMgbWVhbnMgdGhleSB3aWxsIGdvIGludG8g
NS4xMS4gU28gdGhlIGk5MTUgc3BlY2lmaWMgCj4gd29ya2Fyb3VuZCBwYXRjaCB3aWxsIG5vdCBi
ZSBuZWVkZWQgaW4gSW50ZWwgSU9NTVUuCgpEbyB5b3UgbWluZCB0ZWxsaW5nIG1lIHdoYXQncyB0
aGUgc3RhdHVzIG9mIHRoaXMgZml4IHBhdGNoPyBJIHRyaWVkIHRoaXMKc2VyaWVzIG9uIHY1LjEw
LXJjMSB3aXRoIHRoZSBncmFwaGljIHF1aXJrIHBhdGNoIGRyb3BwZWQuIEkgYW0gc3RpbGwKc2Vl
aW5nIGRtYSBmYXVsdHMgZnJvbSBncmFwaGljIGRldmljZS4KCkJlc3QgcmVnYXJkcywKYmFvbHUK
Cj4gCj4gUmVnYXJkcywKPiAKPiBUdnJ0a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ2Z4Cg==
