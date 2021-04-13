Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9647CC433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 10:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5209261242
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 10:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5209261242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55B889DF9;
	Tue, 13 Apr 2021 10:57:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BE389DF9
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 10:57:09 +0000 (UTC)
IronPort-SDR: cuduMZHyXwsJMHPU5mFUlLmkdZgZlYc6ketb7AIPLCfK84tVm7WPU8Y6S+mmeMCExTf0oOfCTv
 pugBopnBufmw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181904327"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="181904327"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 03:57:08 -0700
IronPort-SDR: mXfrQtzqtB1TYLrBz9TPqKaqLGCjeY/6faRwU1FArikbL1SzApR56sII3UphkIEFZT8OQptmQ8
 /670k5uMkLBQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424199744"
Received: from alinapar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.36.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 03:57:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20210412054607.18133-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412054607.18133-1-ville.syrjala@linux.intel.com>
Date: Tue, 13 Apr 2021 13:57:04 +0300
Message-ID: <877dl6h2pr.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 0/5] drm/i915: Fix glk display version
 regressions
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

T24gTW9uLCAxMiBBcHIgMjAyMSwgVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4KPiBGaXggYSBjb3VwbGUgb2YgcmVncmVzc2lvbnMgZHVlIHRvIHRo
ZSBnbGsgZGlzcGxheSB2ZXJzaW9uIDktPjEwCj4gY2hhbmdlLiBJICp0aGluayogYWxsIHRoZSBv
bmVzIHRoYXQgc2xpcHBlZCB0aHJvdWdoIGludm9sdmVkCj4gZWl0aGVyIERJU1BMQVlfVkVSPT05
IG9yIERJU1BMQVlfVkVSPDEwIGNoZWNrcy4gVGhlc2UgdGhyZWUKPiByZWdyZXNzaW9ucyBhcmUg
dGhlIG9uZXMgSSBmb3VuZCB0aHJvdWdoIGEgcXVpY2sgc2NhbiwgYnV0IHNvbWVvbmUKPiBzaG91
bGQgcHJvYmFibHkgZ28gdGhyb3VnaCB0aGUgd2hvbGUgdHJlZSB3aXRoIGEgZmluZSB0b290aGNv
bWIKPiBpbiBjYXNlIHdlIG1pc3NlZCBtb3JlIGNhc2VzLgo+Cj4gQWxzbyB0b3NzZWQgaW4gYSBj
b3VwbGUgb2YgY2xlYW51cHMuCgpWaWxsZSwgcGxlYXNlIGhvbGQgb24gd2l0aCBtZXJnaW5nIHRo
aXMgdW50aWwgd2UgZmlndXJlIG91dCBob3cgdG8gbWVyZ2UKWzFdLiBJIGRvbid0IHdhbnQgdG8g
Y3JlYXRlIGV4dHJhIGNvbmZsaWN0cyB3aGVuIHRoZXkgY2FuIGJlIGF2b2lkZWQuCgpCUiwKSmFu
aS4KCgpbMV0gaHR0cDovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwNDEzMDUxMDAyLjkyNTg5LTEt
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tCgoKPgo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQu
cm9wZXJAaW50ZWwuY29tPgo+Cj4gVmlsbGUgU3lyasOkbMOkICg1KToKPiAgIGRybS9pOTE1OiBS
ZXN0b3JlIGxvc3QgZ2xrIEZCQyAxNmJwcCB3L2EKPiAgIGRybS9pOTE1OiBSZXN0b3JlIGxvc3Qg
Z2xrIGNjcyB3L2EKPiAgIGRybS9pOTE1OiBEaXNhYmxlIExUVFBSIGRldGVjdGlvbiBvbiBHTEsg
b25jZSBhZ2Fpbgo+ICAgZHJtL2k5MTU6IERvbid0IHVzZSB7c2tsLGNubH1faHBkX3BpbigpIGZv
ciBieHQvZ2xrCj4gICBkcm0vaTkxNTogUmVtb3ZlIGEgZmV3IHJlZHVuZGFudCBnbGsgY2hlY2tz
Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyAgICAgICAgICAg
ICAgfCA2ICsrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYyAgICAgICAgICB8IDMgKystCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfbGlua190cmFpbmluZy5jIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2ZiYy5jICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMgICAgfCAyICstCj4gIDUgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCkphbmkgTmlrdWxhLCBJ
bnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
