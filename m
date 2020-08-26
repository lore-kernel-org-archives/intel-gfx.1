Return-Path: <SRS0=RAJW=CE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C99C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 07:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22AF52071E
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 07:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22AF52071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725D6E0A8;
	Wed, 26 Aug 2020 07:26:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270C36E0A8
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2020 07:26:24 +0000 (UTC)
IronPort-SDR: M3NW3ppOayRDRvEV6vgZiQyGfHOXwjehjXRlOHUkWzf7xccm5lwhpDKt2h0lb1y5GakIjTFPPE
 JAf4EV5SNaDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="174296315"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="174296315"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 00:26:23 -0700
IronPort-SDR: ohizELWOIj3dhWy/JW+2uacM2WVrZ5sqWE8q+Zbjwt9mjJ01tFj6vYvDMlyjmmRCYn/WNYj+6n
 Q+CdnXx1SIbA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="402988706"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 00:26:22 -0700
Date: Wed, 26 Aug 2020 12:44:58 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20200826071454.GH25390@intel.com>
References: <20200825171331.17971-1-jose.souza@intel.com>
 <20200825171331.17971-3-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825171331.17971-3-jose.souza@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/i915/display: Fix DRRS debugfs
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
Cc: intel-gfx@lists.freedesktop.org, Hariom Pandey <hariom.pandey@intel.com>,
 Srinivas K <srinivasx.k@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0yNSBhdCAxMDoxMzozMSAtMDcwMCwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3
cm90ZToKPiBTdXBwb3J0ZWQgYW5kIGVuYWJsZWQgYXJlIGRpZmZlcmVudCB0aGluZ3Mgc28gcHJp
bnRpbmcgYm90aC4KPiAKPiB2MzogdXNpbmcgZHJycy0+dHlwZSBpbnN0ZWFkIG9mIHZidC5kcnJz
X3R5cGUKPiAKPiBDYzogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4K
PiBDYzogU3Jpbml2YXMgSyA8c3Jpbml2YXN4LmtAaW50ZWwuY29tPgo+IENjOiBIYXJpb20gUGFu
ZGV5IDxoYXJpb20ucGFuZGV5QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYyB8IDEyICsrKysrKysrKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9k
ZWJ1Z2ZzLmMKPiBpbmRleCBmNTQ5MzgxMDQ4YjMuLjY1Y2NmNWQ2Y2QzOSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMu
Ywo+IEBAIC0xMDY5LDEwICsxMDY5LDE4IEBAIHN0YXRpYyB2b2lkIGRycnNfc3RhdHVzX3Blcl9j
cnRjKHN0cnVjdCBzZXFfZmlsZSAqbSwKPiAgCj4gIAlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9i
ZWdpbihkZXYsICZjb25uX2l0ZXIpOwo+ICAJZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGNv
bm5lY3RvciwgJmNvbm5faXRlcikgewo+ICsJCWJvb2wgc3VwcG9ydGVkID0gZmFsc2U7Cj4gKwo+
ICAJCWlmIChjb25uZWN0b3ItPnN0YXRlLT5jcnRjICE9ICZpbnRlbF9jcnRjLT5iYXNlKQo+ICAJ
CQljb250aW51ZTsKPiAgCj4gIAkJc2VxX3ByaW50ZihtLCAiJXM6XG4iLCBjb25uZWN0b3ItPm5h
bWUpOwo+ICsKPiArCQlpZiAoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9D
T05ORUNUT1JfZURQICYmCj4gKwkJICAgIGRycnMtPnR5cGUgPT0gU0VBTUxFU1NfRFJSU19TVVBQ
T1JUKQo+ICsJCQlzdXBwb3J0ZWQgPSB0cnVlOwo+ICsKPiArCQlzZXFfcHJpbnRmKG0sICJcdERS
UlMgU3VwcG9ydGVkOiAlc1xuIiwgeWVzbm8oc3VwcG9ydGVkKSk7CnByaXRuaW5nIGZvcm1hdCB3
aWxsIGxvb2tzIGNvbmZ1c2luZyBpZiBhIGNydGMgYXR0YWNoZWQgdG8gbW9yZSB0aGVuIGEgb25l
IGNvbm5lY3RvciwKc29tZXdoYXQgYmVsb3csCgpDUlRDIDE6ICBlRFAtMToKCiAgICAgICAgRFJS
UyBTdXBwb3J0ZWQgOiBZZXMKRFAtMToKCURSUlMgU3VwcG9ydGVkIDogTm8KQmV0dGVyIHRvIGtl
ZXAgc2VxX3ByaW50ZihtLCAiXHREUlJTIFN1cHBvcnRlZDogJXNcbiIsIHllc25vKHN1cHBvcnRl
ZCkpIG91dHNpZGUKZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyIGxvb3AuCgpUaGFua3MsCkFu
c2h1bWFuIEd1cHRhLgoJCj4gIAl9Cj4gIAlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNv
bm5faXRlcik7Cj4gIAo+IEBAIC0xMDgzLDcgKzEwOTEsNyBAQCBzdGF0aWMgdm9pZCBkcnJzX3N0
YXR1c19wZXJfY3J0YyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gIAo+ICAJCW11dGV4X2xvY2soJmRy
cnMtPm11dGV4KTsKPiAgCQkvKiBEUlJTIFN1cHBvcnRlZCAqLwo+IC0JCXNlcV9wdXRzKG0sICJc
dERSUlMgU3VwcG9ydGVkOiBZZXNcbiIpOwo+ICsJCXNlcV9wdXRzKG0sICJcdERSUlMgRW5hYmxl
ZDogWWVzXG4iKTsKPiAgCj4gIAkJLyogZGlzYWJsZV9kcnJzKCkgd2lsbCBtYWtlIGRycnMtPmRw
IE5VTEwgKi8KPiAgCQlpZiAoIWRycnMtPmRwKSB7Cj4gQEAgLTExMTgsNyArMTEyNiw3IEBAIHN0
YXRpYyB2b2lkIGRycnNfc3RhdHVzX3Blcl9jcnRjKHN0cnVjdCBzZXFfZmlsZSAqbSwKPiAgCQlt
dXRleF91bmxvY2soJmRycnMtPm11dGV4KTsKPiAgCX0gZWxzZSB7Cj4gIAkJLyogRFJSUyBub3Qg
c3VwcG9ydGVkLiBQcmludCB0aGUgVkJUIHBhcmFtZXRlciovCj4gLQkJc2VxX3B1dHMobSwgIlx0
RFJSUyBTdXBwb3J0ZWQgOiBObyIpOwo+ICsJCXNlcV9wdXRzKG0sICJcdERSUlMgRW5hYmxlZCA6
IE5vIik7Cj4gIAl9Cj4gIAlzZXFfcHV0cyhtLCAiXG4iKTsKPiAgfQo+IC0tIAo+IDIuMjguMAo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
