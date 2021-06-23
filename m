Return-Path: <SRS0=EMYW=LR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180AAC4743C
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 12:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E1861076
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 12:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E1861076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527B96E8D4;
	Wed, 23 Jun 2021 12:25:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11746E8D4;
 Wed, 23 Jun 2021 12:25:28 +0000 (UTC)
IronPort-SDR: N2nZnG09KaRZyYPOxOfCQpG64iUeXWqxPCZdpea3geRrW92q+go+4gTjN0l4A5GfIDuPVHfeW2
 6aR+eSPP1MYA==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207066044"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207066044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:25:27 -0700
IronPort-SDR: DheJDumbH+dm8wOCtzxqpNWaWwp1ErVaALMWZ760nx6jeAzAUPwcKfoomp/D0frnExsEyn7SUQ
 4a99IKqnuY/g==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="556129300"
Received: from dconnon-mobl.ger.corp.intel.com (HELO [10.252.14.111])
 ([10.252.14.111])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:25:25 -0700
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
 <a5c0dca7-a586-15b6-6004-09d320b1159e@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <dcb9729d-fd1c-900e-bb6e-38eb2cf208d2@intel.com>
Date: Wed, 23 Jun 2021 13:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a5c0dca7-a586-15b6-6004-09d320b1159e@linux.intel.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/gtt: ignore min_page_size for
 paging structures
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gMjMvMDYvMjAyMSAxMjo1MSwgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6Cj4gCj4gT24gNi8y
My8yMSAxOjI2IFBNLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4+IFRoZSBtaW5fcGFnZV9zaXplIGlz
IG9ubHkgbmVlZGVkIGZvciBwYWdlcyBpbnNlcnRlZCBpbnRvIHRoZSBHVFQsIGFuZAo+PiBmb3Ig
b3VyIHBhZ2luZyBzdHJ1Y3R1cmVzIHdlIG9ubHkgbmVlZCBhdCBtb3N0IDRLIGJ5dGVzLCBzbyBz
aW1wbHkKPj4gaWdub3JlIHRoZSBtaW5fcGFnZV9zaXplIHJlc3RyaWN0aW9ucyBoZXJlLCBvdGhl
cndpc2Ugd2UgbWlnaHQgc2VlIHNvbWUKPj4gc2V2ZXJlIG92ZXJhbGxvY2F0aW9uIG9uIHNvbWUg
ZGV2aWNlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPgo+PiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
Z3R0LmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
Z3R0LmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0LmMKPj4gaW5kZXgg
MDg0ZWE2NWQ1OWMwLi42MWU4YThjMjUzNzQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0dC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2d0dC5jCj4+IEBAIC0xNiw3ICsxNiw3IEBAIHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0
ICphbGxvY19wdF9sbWVtKHN0cnVjdCAKPj4gaTkxNV9hZGRyZXNzX3NwYWNlICp2bSwgaW50IHN6
KQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iajsK
Pj4gLcKgwqDCoCBvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX2xtZW0odm0tPmk5MTUsIHN6
LCAwKTsKPj4gK8KgwqDCoCBvYmogPSBfX2k5MTVfZ2VtX29iamVjdF9jcmVhdGVfbG1lbV93aXRo
X3BzKHZtLT5pOTE1LCBzeiwgc3osIDApOwo+PiDCoMKgwqDCoMKgIC8qCj4+IMKgwqDCoMKgwqDC
oCAqIEVuc3VyZSBhbGwgcGFnaW5nIHN0cnVjdHVyZXMgZm9yIHRoaXMgdm0gc2hhcmUgdGhlIHNh
bWUgZG1hLXJlc3YKPj4gwqDCoMKgwqDCoMKgICogb2JqZWN0IHVuZGVybmVhdGgsIHdpdGggdGhl
IGlkZWEgdGhhdCBvbmUgb2JqZWN0X2xvY2soKSB3aWxsIAo+PiBsb2NrCj4gCj4gSSB0aGluayBm
b3IgdGhpcyBvbmUgdGhlIG5ldyBndCBtaWdyYXRpb24gY29kZSBtaWdodCBicmVhaywgYmVjYXVz
ZSAKPiB0aGVyZSB3ZSBpbnNlcnQgZXZlbiBQVCBwYWdlcyBpbnRvIHRoZSBHVFQsIHNvIGl0IG1p
Z2h0IG5lZWQgYSBzcGVjaWFsIAo+IGludGVyZmFjZT8gUmFtIGlzIGxvb2tpbmcgYXQgc3VwcG9y
dGVyIGxhcmdlciBHUFUgUFRFIHNpemVzIHdpdGggdGhhdCAKPiBjb2RlLi4KCkZvciBERzEgYXQg
bGVhc3Qgd2UgZG9uJ3QgbmVlZCB0aGlzLiBCdXQgeWVhaCB3ZSBjYW4gYWx3YXlzIGp1c3QgcGFz
cyAKYWxvbmcgdGhlIHBhZ2Ugc2l6ZSB3aGVuIGFsbG9jYXRpbmcgdGhlIHN0YXNoIEkgZ3Vlc3Ms
IGlmIHdlIG5lZWQgCnNvbWV0aGluZyBzcGVjaWFsIGZvciBtaWdyYXRpb24/CgpCdXQgd2hlbiB3
ZSBuZWVkIHRvIHN1cHBvcnQgaHVnZSBQVEVzIGZvciBzdHVmZiBvdGhlciB0aGFuIERHMSwgdGhl
biAKaXQncyBzdGlsbCBhIHBpbGUgb2Ygd29yayBJIGFzc3VtZSwgc2luY2Ugd2Ugc3RpbGwgbmVl
ZCBhbGwgdGhlIHNwZWNpYWwgClBURSBpbnNlcnRpb24gcm91dGluZXMgc3BlY2lmaWNhbGx5IGZv
ciBpbnNlcnRfcHRlKCkgd2hpY2ggd2lsbCBkaWZmZXIgCndpbGRseSBiZXR3ZWVuIGdlbmVyYXRp
b25zLCBhbHNvIGVhY2ggaGFzIHF1aXRlIGRpZmZlcmVudCByZXN0cmljdGlvbnMgCndydCBtaW4g
cGh5c2ljYWwgYWxpZ25tZW50IG9mIGxtZW0sIHdoZXRoZXIgeW91IGNhbiBtaXggNjRLLzRLIFBU
RXMgaW4gCnRoZSBzYW1lIDJNIHZhIHJhbmdlLCB3aGV0aGVyIDRLIFBURXMgYXJlIGV2ZW4gc3Vw
cG9ydGVkIGZvciBsbWVtIGV0Yy4KCk5vdCBzdXJlIGlmIGl0J3Mgc2ltcGxlciB0byBnbyB3aXRo
IG1hcHBpbmcgYWxsIG9mIGxtZW0gdXBmcm9udCB3aXRoIHRoZSAKZmxhdC1wcEdUVD8gTWF5YmUg
dGhhdCBzaWRlc3RlcHMgc29tZSBvZiB0aGVzZSBpc3N1ZXM/IEF0IGxlYXN0IGZvciB0aGUgCnBo
eXNpY2FsIGFsaWdubWVudCBvZiBwYWdpbmcgc3RydWN0dXJlcyB0aGF0IHdvdWxkIG5vIGxvbmdl
ciBiZSBhIGNvbmNlcm4uCgo+IAo+IC9UaG9tYXMKPiAKPiAKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
