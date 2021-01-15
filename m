Return-Path: <SRS0=bvk2=GS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71206C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 11:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5F12313E
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 11:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5F12313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9041F8901E;
	Fri, 15 Jan 2021 11:40:09 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34208901E
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Jan 2021 11:40:07 +0000 (UTC)
IronPort-SDR: EPH/x8K0QiyeBnARXRNZhzgm/72ju4n5UdlqoZuwu6v10Z2knAmLv+LcT/CNvEhoK7Ksxm6bxm
 ogwig87CLVBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="175956491"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="175956491"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 03:40:07 -0800
IronPort-SDR: VtT9tj8+iuRAdK9AfJpluizXx8/McrF8GUcrWLVaNW5aY+pPfotPLH++KCE5Y6H34MlUoSFMKD
 aGz9mbzhDXZQ==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="364556442"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.213.120.203])
 ([10.213.120.203])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 03:40:05 -0800
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210111163711.12913-1-ville.syrjala@linux.intel.com>
 <20210111163711.12913-7-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <9693a332-6ab6-e71c-a92f-8ff2b4c951e5@intel.com>
Date: Fri, 15 Jan 2021 17:10:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210111163711.12913-7-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 06/11] drm/i915: Move the async_flip bit
 setup into the .async_flip() hook
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

T24gMS8xMS8yMDIxIDEwOjA3IFBNLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBTZXQgdXAgdGhl
IGFzeW5jIGZsaXAgUExBTkVfQ1RMIGJpdCBkaXJlY3RseSBpbiB0aGUKPiAuYXN5bmNfZmxpcCgp
IGhvb2suIE5laXRoZXIgLnVwZGF0ZV9wbGFuZSgpIG5vciAuZGlzYWJsZV9wbGFuZSgpCj4gZXZl
ciBuZWVkIHRvIHNldCB0aGlzIHNvIGhhdmluZyBpdCBkb25lIGJ5IHNrbF9wbGFuZV9jdGxfY3J0
YygpCj4gaXMgcmF0aGVyIHBvaW50bGVzcy4KPgo+IENjOiBLYXJ0aGlrIEIgUyA8a2FydGhpay5i
LnNAaW50ZWwuY29tPgo+IENjOiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBLYXJ0aGlr
IEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMyAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMgIHwgMiArKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+IGluZGV4IGYxMmI3NGNmZTk3NC4uZmM5MzIwMjhj
MzY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMKPiBAQCAtNDI1MCw5ICs0MjUwLDYgQEAgdTMyIHNrbF9wbGFuZV9jdGxfY3J0Yyhjb25zdCBz
dHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKPiAgIAlzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGNfc3RhdGUtPnVhcGkuY3J0Yy0+ZGV2KTsK
PiAgIAl1MzIgcGxhbmVfY3RsID0gMDsKPiAgIAo+IC0JaWYgKGNydGNfc3RhdGUtPnVhcGkuYXN5
bmNfZmxpcCkKPiAtCQlwbGFuZV9jdGwgfD0gUExBTkVfQ1RMX0FTWU5DX0ZMSVA7Cj4gLQo+ICAg
CWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYp
KQo+ICAgCQlyZXR1cm4gcGxhbmVfY3RsOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Nwcml0ZS5jCj4gaW5kZXggOGUwMWNkNGViZTM2Li4xMTg4ZTBmOTIyMjMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMKPiBA
QCAtNzgyLDYgKzc4Miw4IEBAIHNrbF9wbGFuZV9hc3luY19mbGlwKHN0cnVjdCBpbnRlbF9wbGFu
ZSAqcGxhbmUsCj4gICAKPiAgIAlwbGFuZV9jdGwgfD0gc2tsX3BsYW5lX2N0bF9jcnRjKGNydGNf
c3RhdGUpOwo+ICAgCj4gKwlwbGFuZV9jdGwgfD0gUExBTkVfQ1RMX0FTWU5DX0ZMSVA7Cj4gKwo+
ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZkZXZfcHJpdi0+dW5jb3JlLmxvY2ssIGlycWZsYWdzKTsK
PiAgIAo+ICAgCWludGVsX2RlX3dyaXRlX2Z3KGRldl9wcml2LCBQTEFORV9DVEwocGlwZSwgcGxh
bmVfaWQpLCBwbGFuZV9jdGwpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWdmeAo=
