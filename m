Return-Path: <SRS0=0RYq=D5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21BAC388F9
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 18:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D7E24630
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 18:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D7E24630
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C246D6F609;
	Thu, 22 Oct 2020 18:48:40 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4C36F609
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 18:48:38 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22778415-1500050 for multiple; Thu, 22 Oct 2020 19:48:32 +0100
MIME-Version: 1.0
In-Reply-To: <20201022173343.GO6112@intel.com>
References: <20201022071637.17240-1-chris@chris-wilson.co.uk>
 <20201022114246.28566-1-chris@chris-wilson.co.uk>
 <20201022173343.GO6112@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date: Thu, 22 Oct 2020 19:48:30 +0100
Message-ID: <160339251012.18131.738819723089615366@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Reset the interrupt mask on
 disabling interrupts
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

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMjAtMTAtMjIgMTg6MzM6NDMpCj4gT24gVGh1LCBP
Y3QgMjIsIDIwMjAgYXQgMTI6NDI6NDZQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
QXMgd2UgZGlzYWJsZSB0aGUgaW50ZXJydXB0IGR1cmluZyBzdXNwZW5kLCBhbHNvIHJlc2V0IHRo
ZSBpcnFfbWFzayB0bwo+ID4gc2hvcnQtY2lyY3VpdCBzdWJzeXN0ZW1zIHRoYXQgbGF0ZXIgdHJ5
IHRvIHR1cm4gb2ZmIHRoZWlyIGludGVycnVwdAo+ID4gc291cmNlLgo+ID4gCj4gPiA8ND5bICAx
MDEuODE2NzMwXSBpOTE1IDAwMDA6MDA6MDIuMDogZHJtX1dBUk5fT04oIWludGVsX2lycXNfZW5h
YmxlZChkZXZfcHJpdikpCj4gPiA8ND5bICAxMDEuODE2ODUzXSBXQVJOSU5HOiBDUFU6IDMgUElE
OiA0MjQxIGF0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmM6MzQzIGlsa191cGRhdGVf
ZGlzcGxheV9pcnErMHhiMy8weDEzMCBbaTkxNV0KPiA+IAo+ID4gdjI6IFJlc2V0IGlycV9tYXNr
IGZvciBpOHh4X2lycV9yZXNldCBhcyB3ZWxsLCBhbmQgc3BsaXQgcGF0Y2ggdG8gZm9jdXMKPiA+
IG9uIG9ubHkgaTkxNS0+aXJxX21hc2sKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFuZCBmaW5nZXJzIGNyb3Nz
ZWQgZm9yIGZpLWlsay1tIG1ha2luZyBhIHNwZWVkeSByZWNvdmVyeS4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5n
IGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
