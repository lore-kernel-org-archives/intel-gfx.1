Return-Path: <SRS0=ja9S=JZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84758C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Apr 2021 10:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1326141B
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Apr 2021 10:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1326141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582F6E1F1;
	Wed, 28 Apr 2021 10:16:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F42116EB0C
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Apr 2021 10:16:09 +0000 (UTC)
IronPort-SDR: ptDuQa9cPw58PI7KXbdND1NNNu/8KNL6Rl83VMnm+i+csYnmar42Eu7QLcnIVMeybjmGH9gpk9
 RXwLXkgOLf/w==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="183847851"
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="183847851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 03:16:08 -0700
IronPort-SDR: gottI/S+DolsNTcIDw3li1GiNO8PKSBEE1rBB6BSgD9/O1pItcuxBARoH7IfI0qSDtiWwINm5m
 s5ffCfd8yg/g==
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="423461115"
Received: from ajalsove-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 03:16:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
In-Reply-To: <YG4aSL1jEG/Tz7wU@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407090812.3602-1-jani.nikula@intel.com>
 <YG4aSL1jEG/Tz7wU@intel.com>
Date: Wed, 28 Apr 2021 13:16:04 +0300
Message-ID: <87zgxi3eaj.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC] drm/i915/backlight: switch to unique
 backlight device names
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCAwNyBBcHIgMjAyMSwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMTI6MDg6MTJQTSAr
MDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IENoYW5nZSB0aGUgYmFja2xpZ2h0IGRldmljZSBu
YW1lcyBmcm9tIGludGVsX2JhY2tsaWdodCB0bwo+PiBjYXJkJWQtJXMtYmFja2xpZ2h0IGZvcm1h
dCwgZm9yIGV4YW1wbGUgY2FyZDAtZURQLTEtYmFja2xpZ2h0LCB0byBtYWtlCj4+IHRoZW0gdW5p
cXVlLiBPdGhlcndpc2UsIHJlZ2lzdGVyaW5nIG11bHRpcGxlIGJhY2tsaWdodCBkZXZpY2VzIHdp
dGgKPj4gaW50ZWxfYmFja2xpZ2h0IG5hbWUgd2lsbCBmYWlsLCByZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgdGhleSdyZSB0d28KPj4gY29ubmVjdG9ycyBpbiB0aGUgc2FtZSBkZXZpY2Ugb3IgdHdvIGRp
ZmZlcmVudCBkZXZpY2VzLgo+PiAKPj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Cj4+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8yNzk0Cj4+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+IAo+PiAtLS0KPj4gCj4+IElzIHRoZSBuYW1lICJp
bnRlbF9iYWNrbGlnaHQiIHBhcnQgb2YgdGhlIFVBQkk/IEluIHRoZW9yeSB0aGUgdXNlcnNwYWNl
Cj4+IHNob3VsZCBvbmx5IGxvb2sgYXQgdGhlIG5hbWVzIGFuZCB0eXBlcyBhdmFpbGFibGUgdW5k
ZXIKPj4gL3N5cy9jbGFzcy9iYWNrbGlnaHQsIG5vdCB0aGUgZXhhY3QgbmFtZXMuCj4KPiBRdWlj
ayBnbGFuY2UgYXQgc29tZSB0aGluZ3Mgc3VnZ2VzdCB0aGlzIG1pZ2h0IGFmZmVjdCBzb21lCj4g
Y3VzdG9tIHNldHVwcyBwZW9wbGUgaGF2ZS4KPgo+IFRoZXJlIGlzIGFuIHhvcmcuY29uZiBvcHRp
b24gaW4gdGhlIGludGVsIGRkeCB0byBmb3JjZSB0aGUKPiBiYWNrbGlnaHQgZGV2aWNlIHNlbGVj
dGlvbi4gQnV0IEkgZGlkbid0IHNlZSBhbnkgaGFyZGNvZGluZwo+IG9mIHRoZSBiYWNrbGlnaHQg
ZGV2aWNlIG5hbWUsIHNvIHVubGVzcyB0aGUgdXNlciBoYXMKPiBjb25maWd1cmVkIHRoYXQga25v
YiB0aGluZ3Mgc2hvdWxkIGtlZXAgd29ya2luZyBJIHRoaW5rLgo+Cj4gQWxzbyBnb29nbGluZyBz
YXlzIHN5c3RlbWQgbWlnaHQgaGF2ZSBzb21lIGJhY2tsaWdodAo+IG5hbWUgdG8gc2VydmljZSBu
YW1lIG1hZ2ljIGdvaW5nIG9uLiBCdXQgSSB3YXMgdG9vIGxhenkKPiB0byBhY3R1YWxseSByZWFk
IHRoZSBjb2RlIHNvIGRvbid0IGtub3cgdGhlIGRldGFpbHMuCgpUaGFua3MsIEkgc3dpdGNoZWQg
dG8gdXNpbmcgaW50ZWxfYmFja2xpZ2h0IGZpcnN0LCBhbmQgZmFsbGluZyBiYWNrIHRvCnVuaXF1
ZSBuYW1lcyBhZnRlciB0aGF0IFsxXS4KCkJSLApKYW5pLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODk1NzgvCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9w
ZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1nZngK
