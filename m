Return-Path: <SRS0=J5D5=LG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E995C48BCF
	for <intel-gfx@archiver.kernel.org>; Sat, 12 Jun 2021 08:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CC361184
	for <intel-gfx@archiver.kernel.org>; Sat, 12 Jun 2021 08:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CC361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763446E0D1;
	Sat, 12 Jun 2021 08:23:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17506E0D1;
 Sat, 12 Jun 2021 08:23:38 +0000 (UTC)
IronPort-SDR: c1RaNO+ijiEJgp9ebY3JoIx/wfPM1eVG/9cCv6iF7BhFkDaGqQPpxmYUez81A+jC2xbygUwWaR
 f2+zgRIYWYeg==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="205469296"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="205469296"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2021 01:23:38 -0700
IronPort-SDR: CsqbSQUwtXmCWsFGn6BRTor2yWGGA3RkBDZ3aauIzU1zcCzN3Xs6VkANg6DCOvq1JZPmClyyZZ
 En+mKDM7hJJg==
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="420300598"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.31])
 ([10.249.254.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2021 01:23:36 -0700
Message-ID: <a7941cc1de789afe7ea66dd75e3abb46f45dc67d.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Sat, 12 Jun 2021 10:23:34 +0200
In-Reply-To: <CAM0jSHNdwG0WcGNUV01JV2r5SXdxQPN4Oz+wLJrBs=7yZrCz0g@mail.gmail.com>
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
 <20210611145459.8576-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNdwG0WcGNUV01JV2r5SXdxQPN4Oz+wLJrBs=7yZrCz0g@mail.gmail.com>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTA2LTExIGF0IDE3OjI5ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4g
T24gRnJpLCAxMSBKdW4gMjAyMSBhdCAxNTo1NSwgVGhvbWFzIEhlbGxzdHLDtm0KPiA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gCj4gPiBBZnRlciBhIFRUTSBt
b3ZlIHdlIG5lZWQgdG8gdXBkYXRlIHRoZSBpOTE1IGdlbSBmbGFncyBhbmQgY2FjaGluZwo+ID4g
c2V0dGluZ3MgdG8gcmVmbGVjdCB0aGUgbmV3IHBsYWNlbWVudC4KPiA+IEFsc28gaW50cm9kdWNl
IGdwdV9iaW5kc19pb21lbSgpIGFuZCBjcHVfbWFwc19pb21lbSgpIHRvIGNsZWFuIHVwCj4gPiB0
aGUKPiA+IHZhcmlvdXMgd2F5cyB3ZSBwcmV2aW91c2x5IHVzZWQgdG8gZGV0ZWN0IHRoaXMuCj4g
PiBGaW5hbGx5LCBpbml0aWFsaXplIHRoZSBUVE0gb2JqZWN0IHJlc2VydmVkIHRvIGJlIGFibGUg
dG8gdXBkYXRlCj4gPiBmbGFncyBhbmQgY2FjaGluZyBiZWZvcmUgYW55b25lIGVsc2UgZ2V0cyBo
b2xkIG9mIHRoZSBvYmplY3QuCj4gCj4gSG1tLCB3aHkgZG8gd2UgbmVlZCB0byB1cGRhdGUgaXQg
YWZ0ZXIgYSBtb3ZlPyBJcyBpdCBub3Qgc3RhdGljPyBpLmUKPiB3ZSBqdXN0IGNvbnNpZGVyIHRo
ZSBtbS5wbGFjZW1lbnRzL3JlZ2lvbiB0byBkZXRlcm1pbmUgdGhlIGNvcnJlY3QKPiBkb21haW4g
YW5kIGNhY2hlIHRyYWNraW5nPyBPciBtYXliZSBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgZWl0
aGVyCj4gd2F5PwoKRmxhZ3MgYXJlIG5vdCBzdGF0aWMsIGN1cnJlbnRseS4gSWYgbWlncmF0aW5n
IGZyb20gTE1FTSB0byBTWVNURU0sIHRoZXkKbmVlZCB0byBiZSB1cGRhdGVkLiBDYWNoaW5nIGFu
ZCBkb21haW5zIHNob3VsZCByZW1haW4gdW5jaGFuZ2VkIGZvciBub3cKYmVjYXVzZSBvZiB0aGUg
cnVsZSB0aGF0IHdlIGRvbid0IHdhbnQgdG8gY2hhbmdlIGNhY2hpbmcgbW9kZSB3aGVuCm1pZ3Jh
dGluZyBmcm9tIExNRU0gdG8gU1lTVEVNIGZvciBidWZmZXJzIHRoYXQgc3VwcG9ydCBib3RoLCBh
bmQgdGhhdApydWxlIGlzIGVuZm9yY2VkIGJ5IHNldHRpbmcgdGhlIHR0bV90dCBjYWNoaW5nIG1v
ZGUgYWNjb3JkaW5nbHkuCkhvd2V2ZXIsIEkgZmlndXJlIGlmIHdlIG5lZWQgdG8gY2hhbmdlIHRo
YXQgcnVsZSBtb3ZpbmcgZm9yd2FyZCBiZWNhdXNlCndlIGRlY2lkZSB3ZSBjYW4ndCByZWx5IG9u
IHRoZSBUVE0gc2hpbmtlciBmb3IgV0Mgc3lzdGVtIHBhZ2VzLCBvcgpiZWNhdXNlIGFsbG9jYXRp
bmcgV0Mgc3lzdGVtIHBhZ2VzIGlzIHRvbyBleHBlbnNpdmUsIEl0IHdvdWxkIGJlIGdvb2QKaWYg
d2UgZG9uJ3QgbmVlZCB0byBhdWRpdCBhbGwgdGhlIGNvZGUgdG8gZmluZCBwbGFjZXMgd2hlcmUg
YW4gdXBkYXRlZApjYWNoaW5nIHBvbGljeSBuZWVkcyBjaGFuZ2VzLgoKL1Rob21hcwoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
