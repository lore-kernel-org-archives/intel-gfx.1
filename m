Return-Path: <SRS0=7YZZ=IA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D74AC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 17:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA49564F07
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 17:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA49564F07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501B6E958;
	Tue,  2 Mar 2021 17:20:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364B36E958
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Mar 2021 17:20:14 +0000 (UTC)
IronPort-SDR: S0Cbnio6D489qbIyCQl8RcVB6RvRmxRfVIbygXLPCh3D0QJ5Jha3j/hg0YYkvPrUpzErYz+2dA
 a55/sIz7pucQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183507029"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183507029"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 09:20:13 -0800
IronPort-SDR: /fezTkdVI1fCLN15a/757DNVfWjAWyoKZ9HNZJI6mn0jrDx24enqq2r8aGJMf9P/qfBGeBTKxm
 NCFBkLKkMRRQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="406819399"
Received: from rwathan-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 09:20:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
In-Reply-To: <YD5SSEELPvX8hiv2@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1613054234.git.jani.nikula@intel.com>
 <6fb9f831672c951c00d92f1176bd42d3b0f30145.1613054234.git.jani.nikula@intel.com>
 <485ac3466f8945afa89a79d4d979f0d1@intel.com> <87eeh8f3et.fsf@intel.com>
 <87czwhq2df.fsf@intel.com> <YD5SSEELPvX8hiv2@intel.com>
Date: Tue, 02 Mar 2021 19:20:07 +0200
Message-ID: <874khtpj5k.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 6/9] drm/i915/mso: add splitter state
 readout for platforms that support it
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Varide, Nischal" <nischal.varide@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAwMiBNYXIgMjAyMSwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBNYXIgMDIsIDIwMjEgYXQgMTI6MjU6MDBQTSAr
MDIwMCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIE1vbiwgMjIgRmViIDIwMjEsIEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+IHdyb3RlOgo+PiA+IE9uIE1vbiwgMjIgRmViIDIw
MjEsICJTaGFua2FyLCBVbWEiIDx1bWEuc2hhbmthckBpbnRlbC5jb20+IHdyb3RlOgo+PiA+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oCj4+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV90eXBlcy5oCj4+ID4+PiBpbmRleCA3MTYxMWI1OTZjODguLjU1NjRkYjUxMmQyMiAxMDA2NDQK
Pj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oCj4+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfdHlwZXMuaAo+PiA+Pj4gQEAgLTExNjEsNiArMTE2MSwxMyBAQCBzdHJ1Y3QgaW50ZWxf
Y3J0Y19zdGF0ZSB7Cj4+ID4+PiAgCQl1OCBwaXBlbGluZV9mdWxsOwo+PiA+Pj4gIAkJdTE2IGZs
aXBsaW5lLCB2bWluLCB2bWF4Owo+PiA+Pj4gIAl9IHZycjsKPj4gPj4+ICsKPj4gPj4+ICsJLyog
U3RyZWFtIFNwbGl0dGVyIGZvciBlRFAgTVNPICovCj4+ID4+PiArCXN0cnVjdCB7Cj4+ID4+PiAr
CQlib29sIGVuYWJsZTsKPj4gPj4+ICsJCXU4IGxpbmtfY291bnQ7Cj4+ID4+PiArCQl1OCBwaXhl
bF9vdmVybGFwOwo+PiA+Pj4gKwl9IHNwbGl0dGVyOwo+PiA+Pgo+PiA+PiBGb3IgRFNJIHdoaWNo
IGFsc28gaGFzIHRoaXMgaW4gY29tbW9uIGFsb25nIHdpdGggTVNPLCBtYXkgYmUgd2UgY2FuCj4+
ID4+IHRha2UgdGhlc2UgbGlua19jb3VudCBhbmQgcGl4ZWxfb3ZlcmxhcCBvdXQgb2Ygc3BsaXR0
ZXIgd2hpY2ggaXMgbW9yZQo+PiA+PiBvZiBhIE1TTyBmZWF0dXJlLiBUaG91Z2h0cyA/Cj4+ID4K
Pj4gPiBWaWxsZSBzdWdnZXN0ZWQgdGhlIHNhbWUgSSB0aGluay4KPj4gCj4+IENvbWluZyBiYWNr
IHRvIHRoaXMuIERTSSBkb2VzIG5vdCBhY3R1YWxseSB1c2UgY3J0YyBzdGF0ZSBmb3IgdGhpcwo+
PiBjdXJyZW50bHkuIEJ1dCBpdCBkb2VzIHVzZSB0aGUgZGlzcGxheSBzdHJlYW0gc3BsaXR0ZXIu
IFRoZSByZWdpc3RlciBpcwo+PiBkaWZmZXJlbnQsIGJ1dCB0aGUgZnVuY3Rpb25hbGl0eSBpcyBy
b3VnaGx5IHRoZSBzYW1lLgo+PiAKPj4gSSBzdWdnZXN0IHdlIGtlZXAgdGhlICJzcGxpdHRlciIg
c3Vic3RydWN0IGFzIGFib3ZlLCBhbmQgY29udmVydCBEU0kKPj4gY29kZSB0byB1c2UgaXQgaW4g
Zm9sbG93LXVwLgo+PiAKPj4gSW4gZWFybHkgdmVyc2lvbnMgb2YgdGhlIHBhdGNoIHRoZSBzdWJz
dHJ1Y3Qgd2FzIGNhbGxlZCAibXNvIjsgSSB0aGluawo+PiAic3BsaXR0ZXIiIGlzIGJldHRlciwg
YW5kIGNhcHR1cmVzIGJvdGggTVNPIGFuZCBEU0kgY2FzZXMuCj4KPiBUaGUgInNwbGl0dGVyIiBu
YW1lIGlzIHJhdGhlciBpY2wrIHNwZWNpZmljLiBFYXJsaWVyIERTSSBvciBMVkRTIGRvIG5vdAo+
IGhhdmUgc3VjaCBhIGh3IGJsb2NrIChhdCBsZWFzdCBpbiBuYW1lKS4KClNpZ2gsIHdlbGwsIFZM
ViBoYXMgcGl4ZWwgb3ZlcmxhcCBpbiBWTFZfQ0hJQ0tFTl8zIHJlZ2lzdGVyLgoKSSB0aGluayB3
ZSBlaXRoZXIgb3JnYW5pemUgdGhpcyB1bmRlciAic3BsaXR0ZXIiLCBvciB0aHJvdyBhbGwgb2Yg
dGhpcwppbiBjcnRjIHN0YXRlIHVub3JnYW5pemVkIHdpdGhvdXQgc3Vic3RydWN0cyBvciBwcmVm
aXhlcyBvciBjbHVlcyBob3cKdGhlIG1lbWJlcnMgcmVsYXRlIHRvIGVhY2ggb3RoZXIgb24gYW55
IHBsYXRmb3JtLgoKCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
