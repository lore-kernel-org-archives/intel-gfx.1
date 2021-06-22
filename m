Return-Path: <SRS0=wfJw=LQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55B8C48BDF
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Jun 2021 18:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA7B60249
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Jun 2021 18:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BA7B60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ED76E870;
	Tue, 22 Jun 2021 18:20:09 +0000 (UTC)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12F96E87F;
 Tue, 22 Jun 2021 18:20:08 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id s17so434613oij.0;
 Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=29hikt8SUCNhjVnea4G3Tt6U2VKimPI9xOdyygn6y2o=;
 b=CZ9m2GCYl3/yRI7h1IWxxp6TOejM4xOmGC4KpzjeYdz81AHrXtUWyI89o0oJoZEqEO
 4M0lSdJJLM09L8Iu+QVRYMyvzCwO277e5L2CFRffawfY7hti2B+l01moMiqeK6VYIfMy
 xipBv2IcBYtsXCTXc4P0t6+b9PbMayyeC9h/Rtow4aXXkqlqUHIsJZ5rbH2IHoG0qNTV
 3i1Lg5Ep7aavjIc1coARhze9+h/4cP9P7IJTVr7PgXluFZ0cvGNPeb60iQu98O5T86PA
 wOUsSWE71SOtJEbFESRfEOs+Vh5hNmKwQjMMRE0HdP2wXKTosk4iXMis11i+oxQslA66
 dv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=29hikt8SUCNhjVnea4G3Tt6U2VKimPI9xOdyygn6y2o=;
 b=kS9RQQzIMNaP4XkkehPKJRyx5ZlfcomIQ+zfYJ0L0VlA5zGI9ZjAiq5JobY0hWxQnR
 RFh04YBTg5AwnGxrxKv5UMXCPM39TwKojGjACNeRIYKXaroIE3IHArxMmgcHG+octPBh
 4Lo8+AuA+VmnrwHwGvGe/X0saJBNimrrg+WHZ2yUrofTmqipiiojmBRIktXd03s8HHBH
 Nok5m6zCAWtFKyqhFTPykZC0AqutwDo3YoyqLhlHR89mbFp2WQ4YeY0JN9BBCdw6GyM3
 2uDBvgm6ft8BexdjyZj96w/PRo1M2F0EZGsfZy8pB7qzkhP4/KylHSJ58HWd81TMWMd3
 U/ww==
X-Gm-Message-State: AOAM531nt1ydQwTASi4son0XLVnDnXCQ9TrT9NgFVlJ+xk4sSAU3yox2
 F2hw7T5xnplquTBnUlCDL96bYrNrtuqYffi+1vo=
X-Google-Smtp-Source: ABdhPJyUgVQFlY0rBQR5TacbcyoHIMybYd5BiSysGFReHN0iSspTqQlRZ1YcySHqv8KLv5Rmbaa0C9Yyyx8ixm9qE9w=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr71122oic.5.1624386008138;
 Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Jun 2021 14:19:56 -0400
Message-ID: <CADnq5_N00p5VSqj3gEkFSEALOU2qbD=WkHMpsW0saz9iG_RZnA@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 01/15] dma-resv: Fix kerneldoc
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMTI6NTUgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBPdmVyc2lnaHQgZnJvbQo+Cj4gY29tbWl0IDZlZGJk
NmFiYjc4M2Q1NGY2YWM0YzNlZDVjZDllNTBjZmY2YzE1ZTkKPiBBdXRob3I6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBEYXRlOiAgIE1vbiBNYXkgMTAgMTY6
MTQ6MDkgMjAyMSArMDIwMAo+Cj4gICAgIGRtYS1idWY6IHJlbmFtZSBhbmQgY2xlYW51cCBkbWFf
cmVzdl9nZXRfZXhjbCB2Mwo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0Bs
aXN0cy5saW5hcm8ub3JnCgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9kbWEtcmVzdi5oIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1yZXN2LmggYi9pbmNsdWRlL2xpbnV4L2RtYS1yZXN2
LmgKPiBpbmRleCA1NjJiODg1Y2Y5YzMuLmUxY2EyMDgwYTFmZiAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L2RtYS1yZXN2LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1yZXN2LmgKPiBA
QCAtMjEyLDcgKzIxMiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkbWFfcmVzdl91bmxvY2soc3Ry
dWN0IGRtYV9yZXN2ICpvYmopCj4gIH0KPgo+ICAvKioKPiAtICogZG1hX3Jlc3ZfZXhjbHVzaXZl
IC0gcmV0dXJuIHRoZSBvYmplY3QncyBleGNsdXNpdmUgZmVuY2UKPiArICogZG1hX3Jlc3ZfZXhj
bF9mZW5jZSAtIHJldHVybiB0aGUgb2JqZWN0J3MgZXhjbHVzaXZlIGZlbmNlCj4gICAqIEBvYmo6
IHRoZSByZXNlcnZhdGlvbiBvYmplY3QKPiAgICoKPiAgICogUmV0dXJucyB0aGUgZXhjbHVzaXZl
IGZlbmNlIChpZiBhbnkpLiBDYWxsZXIgbXVzdCBlaXRoZXIgaG9sZCB0aGUgb2JqZWN0cwo+IC0t
Cj4gMi4zMi4wLnJjMgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
