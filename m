Return-Path: <SRS0=dFBv=KA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A096BC433B4
	for <intel-gfx@archiver.kernel.org>; Wed,  5 May 2021 09:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E695E61029
	for <intel-gfx@archiver.kernel.org>; Wed,  5 May 2021 09:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E695E61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tuxedocomputers.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5BF6E0E5;
	Wed,  5 May 2021 09:32:07 +0000 (UTC)
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5116E0E5;
 Wed,  5 May 2021 09:32:06 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id BD54BC800B7;
 Wed,  5 May 2021 11:32:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id YlBRfrwkfAw1; Wed,  5 May 2021 11:32:04 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:8600:6e35:22:d0af:f0c]
 (p200300e37f3986006E350022d0af0f0C.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:8600:6e35:22:d0af:f0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 6D59FC800B6;
 Wed,  5 May 2021 11:32:04 +0200 (CEST)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
 <20210503182148.851790-3-wse@tuxedocomputers.com>
 <YJEW3J0+RQPo22AD@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <559ca7d0-f68d-32c8-d2d9-37f57d2ecdcd@tuxedocomputers.com>
Date: Wed, 5 May 2021 11:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJEW3J0+RQPo22AD@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 2/4] Add missing check
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

QW0gMDQuMDUuMjEgdW0gMTE6NDEgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cgo+IE9uIE1vbiwg
TWF5IDAzLCAyMDIxIGF0IDA4OjIxOjQ2UE0gKzAyMDAsIFdlcm5lciBTZW1iYWNoIHdyb3RlOgo+
PiBBZGQgYSBtaXNzaW5nIGNoZWNrIHRoYXQgY291bGQgcG90ZW50aWFsbHkgbGVhZCB0byBhbiB1
bmFyY2hpdmFibGUgbW9kZSBiZWluZwo+PiB2YWxpZGF0ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0ZXJzLmNvbT4KPj4gLS0tCj4+Cj4+ID5G
cm9tIDU0ZmE3MDZmMGE1ZjI2MGEzMmFmNWQxOGI5NjIyY2VlYmI5NGMxMmUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4+IEZyb206IFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0ZXJz
LmNvbT4KPj4gRGF0ZTogTW9uLCAzIE1heSAyMDIxIDE0OjQyOjM2ICswMjAwCj4+IFN1YmplY3Q6
IFtQQVRDSCAyLzRdIEFkZCBtaXNzaW5nIGNoZWNrCj4gSSBndWVzcyB5b3UgZGlkIHNvbWV0aGlu
ZyBhIGJpdCB3b25reSB3aXRoIGdpdCBmb3JtYXQtcGF0Y2gvc2VuZC1tYWlsPwpJIGhhdmUgbm8g
aWRlYSBob3cgdGhhdCB0aW1lc3RhbXAgaGFwcGVuZWQsIEkgd2lsbCBjaGVjayB3aGVuIHNlbmRp
bmcgbXkgbmV4dCBwYXRjaCBeXi4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hkbWkuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hkbWkuYwo+PiBpbmRleCA1NzZkM2Q5MTBkMDYuLmNlMTY1ZWYyOGU4OCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPj4gQEAgLTE5MTMsNyArMTkx
Myw3IEBAIGludGVsX2hkbWlfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAo+PiAgCQljbG9jayAqPSAyOwo+PiAgCX0KPj4gIAo+PiAtCWlmIChkcm1fbW9kZV9pc180
MjBfb25seSgmY29ubmVjdG9yLT5kaXNwbGF5X2luZm8sIG1vZGUpKQo+PiArCWlmIChjb25uZWN0
b3ItPnljYmNyXzQyMF9hbGxvd2VkICYmIGRybV9tb2RlX2lzXzQyMF9vbmx5KCZjb25uZWN0b3It
PmRpc3BsYXlfaW5mbywgbW9kZSkpCj4gVGhpcyBvbmUgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4g
ZHJtX21vZGVfdmFsaWRhdGVfeWNiY3I0MjAoKSBoYXMKPiBhbHJlYWR5IGNoZWNrZWQgaXQgZm9y
IHVzLgpJIHdhc24ndCBhd2FyZSBvZiBkcm1fbW9kZV92YWxpZGF0ZV95Y2JjcjQyMCwgdGhhbmtz
IGZvciB0aGUgaGludC4gSW4gdGhlICI0MjBfYWxzbyItcGF0Y2ggSSBjaGFuZ2UgZHJtX21vZGVf
aXNfNDIwX29ubHkgdG8gZHJtX21vZGVfaXNfNDIwIChoZWxwZXIgZnVuY3Rpb246IF9vbmx5ICsg
X2Fsc28pLCB3aGljaCBpcyBub3QgY2hlY2tlZCBieSBkcm1fbW9kZV92YWxpZGF0ZV95Y2JjcjQy
MC4gSSBjYW4gYWRkIHRoaXMgY2hlY2sgdG8gdGhhdCBwYXRjaCwgc2luY2UgaXRzIG9ubHkgcmVx
dWlyZWQgdGhlbi4KPj4gIAkJY2xvY2sgLz0gMjsKPj4gIAo+PiAgCXN0YXR1cyA9IGludGVsX2hk
bWlfbW9kZV9jbG9ja192YWxpZChoZG1pLCBjbG9jaywgaGFzX2hkbWlfc2luayk7Cj4+IC0tIAo+
PiAyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
