Return-Path: <SRS0=RNxq=D6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89751C388F9
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 22:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB1D20897
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 22:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB1D20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD73D6E834;
	Fri, 23 Oct 2020 22:03:55 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7F16E834;
 Fri, 23 Oct 2020 22:03:54 +0000 (UTC)
Date: Fri, 23 Oct 2020 22:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603490632;
 bh=qzB91Ubxupcx9OPD7IhKyOP7RJXvP6iDjdCbyxkaCQA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Oe03KUAZUSwmZj2dLqy9zdyGNDBib5YEcsNXyYoxrs7ssBQ8etUR5XECQVlvWBih7
 O/RHSPoF+s66XDyZ8KjpoSbkVFRYsfOpmNlWwCU7ZCSshK9K+u7TtTZwvDiibqq/7Q
 RQEejxaTZmXoIQREmbZWWHsErsiCVthKC39AVmzi9fF1AWPzcaWkzhXYAM3BRE85lB
 doAWpcF2berH7urXhNucEa07f7mtnJ7iVYuejCx5mQTv9mQfXzQEYNYIIkiWQJEKfV
 l18M5U4f8MKQM2zcEeWtYUDtlZuoFFDlbkQVsrKmo/3DL0YrJ93fHLmYuljQe/yrBK
 zWH+9TeI3Psmw==
To: Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <wusQ8YNZOE_lHaJ5e15M4lmDPxrD2HiUYKJN5Sh6bcZC-Ly-IzqOPeU9OSmC1X4ftuMbwhJpHRnpDQDnp6Z5-bHrONqzOyS8sdKYxN-TFTY=@emersion.fr>
In-Reply-To: <20201023203957.3255-1-ville.syrjala@linux.intel.com>
References: <20201023203957.3255-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm: Don't create the IN_FORMATS blob when
 the driver does not provide .format_mod_supported()
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCBPY3RvYmVyIDIzLCAyMDIwIDEwOjM5IFBNLCBWaWxsZSBTeXJqYWxhIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IEZyb206IFZpbGxlIFN5cmrDpGzD
pCB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbQo+Cj4gVGhlIGNvZGUgcmVzcG9uc2libGUg
Zm9yIGNyZWF0aW5nIHRoZSBJTl9GT1JNQVRTCj4gYmxvYiBpcyBicm9rZW4gd2hlbiB0aGUgZHJp
dmVyIGRvZXNuJ3QgcHJvdmlkZSBhCj4gLmZvcm1hdF9tb2Rfc3VwcG9ydGVkKCkgaG9vay4gSXQg
anVzdCBjb3BpZXMgaW4KPiB0aGUgZm9ybWF0IGxpc3QsIGJ1dCBsZWF2ZXMgYWxsIHRoZSBtb2Rp
ZmllciBpbmZvcm1hdGlvbgo+IHplcm9lZC4gVGhhdCB3b3VsZCBpbmRpY2F0ZSAoaW4gYSB2ZXJ5
IHNpbGx5IHdheSkgdGhhdAo+IHRoZXJlIGFyZSBpbiBmYWN0IG5vIHN1cHBvcnRlZCBmb3JtYXQr
bW9kaWZpZXIgY29tYmluYXRpb25zLgo+IFRoYXQgaXMgdXR0ZXIgbm9uc2Vuc2UuCgpTaG91bGQg
d2UgV0FSTl9PTiB3aGVuIHRoZSBkcml2ZXIgZW5hYmxlcyBhbGxvd19mYl9tb2RpZmllcnMgYnV0
CmRvZXNuJ3QgcG9wdWxhdGUgZm9ybWF0X21vZF9zdXBwb3J0ZWQ/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
