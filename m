Return-Path: <SRS0=vKGW=C2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C14C43461
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2020 19:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE76921D41
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2020 19:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE76921D41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF066E2ED;
	Thu, 17 Sep 2020 19:46:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2AE6E2ED
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2020 19:46:34 +0000 (UTC)
IronPort-SDR: o91+OGdVppoUqs1TcaUjyStbN/T3LYm/2HgYNKVOYeN6TXXJ+BSJucj0LScW2Dn1HRdm8JOdo6
 LUcoHDvP3pYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="139785555"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="139785555"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 12:46:33 -0700
IronPort-SDR: r7Eoqbv43ZEHxhgbKI4bAXau9pQsmDmRCYdEjYCX7sJWzYwMpVXDhwvljbkqhLgvlQbEwdmMpf
 tdET+e81VBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="508563203"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2020 12:46:33 -0700
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 12:46:32 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Sep 2020 01:16:30 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Fri, 18 Sep 2020 01:16:30 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH 07/20] drm/i915: Relocate CHV CGM gamma masks
Thread-Index: AQHWXH87NQ81coQxtU+xKKo7HUA2+KltnUWw
Date: Thu, 17 Sep 2020 19:46:30 +0000
Message-ID: <3fd51d2bbba34400811ed4594d0df94e@intel.com>
References: <20200717211345.26851-1-ville.syrjala@linux.intel.com>
 <20200717211345.26851-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20200717211345.26851-8-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 07/20] drm/i915: Relocate CHV CGM gamma masks
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZQ0K
PiBTeXJqYWxhDQo+IFNlbnQ6IFNhdHVyZGF5LCBKdWx5IDE4LCAyMDIwIDI6NDQgQU0NCj4gVG86
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW0ludGVsLWdmeF0g
W1BBVENIIDA3LzIwXSBkcm0vaTkxNTogUmVsb2NhdGUgQ0hWIENHTSBnYW1tYSBtYXNrcw0KPiAN
Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4N
Cj4gDQo+IENHTV9QSVBFX0dBTU1BX1JFRF9NQVNLICYgY28uIGFyZSBtaXNwbGFjZWQuIE1vdmUg
dGhlbiBiZWxvdyB0aGUNCj4gcmVsZXZhbnQgcmVnaXN0ZXIuIEFuZCB3aGlsZSBhdCBpdCBhZGQg
dGhlIGRlZ2FtbWEgY291bnRlcnBhcnRzLg0KDQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfcmVnLmggfCA5ICsrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0K
PiBpbmRleCBiOTYwN2FjMzYyMGQuLjQyOGVmMDZiODA4NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3JlZy5oDQo+IEBAIC0xMDk5OSwxNCArMTA5OTksMTcgQEAgZW51bSBza2xfcG93ZXJfZ2F0
ZSB7DQo+ICAjZGVmaW5lIF9DR01fUElQRV9BX0NTQ19DT0VGRjY3CShWTFZfRElTUExBWV9CQVNF
ICsgMHg2NzkwQykNCj4gICNkZWZpbmUgX0NHTV9QSVBFX0FfQ1NDX0NPRUZGOAkoVkxWX0RJU1BM
QVlfQkFTRSArIDB4Njc5MTApDQo+ICAjZGVmaW5lIF9DR01fUElQRV9BX0RFR0FNTUEJKFZMVl9E
SVNQTEFZX0JBU0UgKyAweDY2MDAwKQ0KPiArI2RlZmluZSAgIENHTV9QSVBFX0RFR0FNTUFfUkVE
X01BU0sJUkVHX0dFTk1BU0soMTMsIDApDQo+ICsjZGVmaW5lICAgQ0dNX1BJUEVfREVHQU1NQV9H
UkVFTl9NQVNLCVJFR19HRU5NQVNLKDI5LCAxNikNCj4gKyNkZWZpbmUgICBDR01fUElQRV9ERUdB
TU1BX0JMVUVfTUFTSwlSRUdfR0VOTUFTSygxMywgMCkNCj4gICNkZWZpbmUgX0NHTV9QSVBFX0Ff
R0FNTUEJKFZMVl9ESVNQTEFZX0JBU0UgKyAweDY3MDAwKQ0KPiArI2RlZmluZSAgIENHTV9QSVBF
X0dBTU1BX1JFRF9NQVNLCVJFR19HRU5NQVNLKDksIDApDQo+ICsjZGVmaW5lICAgQ0dNX1BJUEVf
R0FNTUFfR1JFRU5fTUFTSwlSRUdfR0VOTUFTSygyNSwgMTYpDQo+ICsjZGVmaW5lICAgQ0dNX1BJ
UEVfR0FNTUFfQkxVRV9NQVNLCVJFR19HRU5NQVNLKDksIDApDQo+ICAjZGVmaW5lIF9DR01fUElQ
RV9BX01PREUJKFZMVl9ESVNQTEFZX0JBU0UgKyAweDY3QTAwKQ0KPiAgI2RlZmluZSAgIENHTV9Q
SVBFX01PREVfR0FNTUEJKDEgPDwgMikNCj4gICNkZWZpbmUgICBDR01fUElQRV9NT0RFX0NTQwko
MSA8PCAxKQ0KPiAgI2RlZmluZSAgIENHTV9QSVBFX01PREVfREVHQU1NQQkoMSA8PCAwKQ0KPiAt
I2RlZmluZSAgIENHTV9QSVBFX0dBTU1BX1JFRF9NQVNLICAgUkVHX0dFTk1BU0soOSwgMCkNCj4g
LSNkZWZpbmUgICBDR01fUElQRV9HQU1NQV9HUkVFTl9NQVNLIFJFR19HRU5NQVNLKDI1LCAxNikN
Cj4gLSNkZWZpbmUgICBDR01fUElQRV9HQU1NQV9CTFVFX01BU0sgIFJFR19HRU5NQVNLKDksIDAp
DQo+IA0KPiAgI2RlZmluZSBfQ0dNX1BJUEVfQl9DU0NfQ09FRkYwMQkoVkxWX0RJU1BMQVlfQkFT
RSArIDB4Njk5MDApDQo+ICAjZGVmaW5lIF9DR01fUElQRV9CX0NTQ19DT0VGRjIzCShWTFZfRElT
UExBWV9CQVNFICsgMHg2OTkwNCkNCj4gLS0NCj4gMi4yNi4yDQo+IA0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBJbnRlbC1nZnggbWFpbGluZyBs
aXN0DQo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
