Return-Path: <SRS0=KMKB=H6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9092C433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Feb 2021 06:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DFB64E01
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Feb 2021 06:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DFB64E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA6C6E133;
	Sun, 28 Feb 2021 06:52:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E286E133
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Feb 2021 06:52:42 +0000 (UTC)
IronPort-SDR: FTnK8Bi+khZZD+VkPnl84qV0zjrnEbIu9FWEyJLLS3bGVnG3Cs/RbX+2uXnPRuwIJpHK2aSY3X
 gbRJ7tFaHOzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9908"; a="205785794"
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="205785794"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2021 22:52:41 -0800
IronPort-SDR: dSFnjs26IhQyDFwh1nyrxPhP0A7u5k/R5AavrnvzJOcCUNRTD25OMSO1vA+H8+Zi9qgJPZm0RK
 q8b2OdLj2ihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="405672303"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 27 Feb 2021 22:52:41 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 27 Feb 2021 22:52:40 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 27 Feb 2021 22:52:39 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Sun, 28 Feb 2021 08:52:37 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Thread-Topic: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Index: AQHXBJBTlGMG4b5GwU+w3NO1EU5QQapbRLqAgAC+HMCABjNiUB7bF+50/ww+PVCAB+VEwA==
Date: Sun, 28 Feb 2021 06:52:37 +0000
Message-ID: <98093c00e7df45298c0ae0a7f27628db@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
 <cb20e706d494458a8957252eeacfb1da@intel.com>
 <7601e7f0024c41fb9b454a3c50b02173@intel.com>
 <1279191970.19051.1614033504390.JavaMail.zimbra@nod.at>
 <d2636c94015d40c199616947907b7148@intel.com>
In-Reply-To: <d2636c94015d40c199616947907b7148@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC PATCH 0/9] drm/i915/spi: discrete graphics
 internal spi
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

PiANCj4gDQo+ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQ0KPiA+ID4+ID4gSSdt
IG5vdCBzdXJlIHdoZXRoZXIgd2Ugd2FudCB0byB0YWtlIHRoYXQgcGF0aC4NCj4gPiA+DQo+ID4g
PiBIaSBSaWNoYXJkIGlzIHRoZXJlIGFueSB3YXkgd2UgY2FuIHRyeSB0byB1bmNsdXR0ZXIgdGhp
cyA/DQo+ID4NCj4gPiBPZiBjb3Vyc2UgdGhlcmUgaXMgYSB3YXkuIDotKQ0KPiA+IFlvdXIgdXNl
LWNhc2UgcmVhbGx5IHNlZW1zIHRvIGJlIHNwZWNpYWwgYW5kIE1URCBuZWVkcyBhbiBpbXByb3Zl
bWVudC4NCj4gPiBNaXF1ZWwsIFZpZ25lc2ggYW5kIEkganVzdCBuZWVkIHRvIGNoZWNrIG1vcmUg
aW50ZXJuYWxzIGFuZCBjb3JuZXINCj4gPiBjYXNlcyBpbiBNVEQuDQo+ID4gV2l0aCBzb21lIGx1
Y2sgeW91ciBwYXRjaCBjYW4gYmUgdXNlZCBhcy1pcyB3aXRoIHNvbWUgbWlub3INCj4gPiBhZGp1
c3RtZW50cyBvbiB0b3AuDQo+IEdyZWF0LCB3YWl0aW5nIGZvciB5b3VyIGNvbW1lbnRzLg0KDQpI
aSwgIEkgd291bGQgbGlrZSB0byBzZW5kIG91dCB0aGUgc2Vjb25kIHZlcnNpb24gb2YgdGhlIHNl
cmllcy4gDQpQbGVhc2UgaWYgeW91IGhhdmUgYW55IGNvbW1lbnRzIGxldCBtZSBrbm93Lg0KDQpU
aGFua3MNClRvbWFzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
