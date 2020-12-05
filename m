Return-Path: <SRS0=rL+1=FJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAFAC4361A
	for <intel-gfx@archiver.kernel.org>; Sat,  5 Dec 2020 00:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB6E22D71
	for <intel-gfx@archiver.kernel.org>; Sat,  5 Dec 2020 00:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CB6E22D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD426E220;
	Sat,  5 Dec 2020 00:43:59 +0000 (UTC)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300816E220
 for <intel-gfx@lists.freedesktop.org>; Sat,  5 Dec 2020 00:43:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v14so10133505lfo.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Dec 2020 16:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m+4KDkiF63jvTm0PCdct1J8lBBd4GY/t32JxIqXy+sM=;
 b=JYJQfXQDhANgz3X6m/CAIxHI9NXg9q4VwiCbePQsVesziOTkjDXl/KxP9MAJs6X3DW
 gjz53nSu3tDBtt8AuuDmoTSayUYP1QtOdFeSJLnqIml+dW9B3RbgCM47pDRZ5ypXNZDP
 xB6W7sQQkYhJ9jN5xDHEFwTkrAXlYSoaArZGAV0BkkSHo1al4r4LAh7lZbpyTPu4XaJq
 t/H+KY7l80IdUQN0WazG0p1XU2fby0xFuRWbnnWhvTwc/mlJo7n953HTFQ8wLz317UGc
 cCXfsEGfohuntG8DeFGMPj/nAxNpeiZEHM5IB2pmtDhB65hHzYpPbBGVYuXtXXd+4vKa
 ThpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m+4KDkiF63jvTm0PCdct1J8lBBd4GY/t32JxIqXy+sM=;
 b=jzSBBoh4wOmmXPJdROhrMUgttGVCIgX+K46+9lSn3sPU/ulrvvpEAVb8F4kI4KL4Tl
 As6vSGePAmhjaDUChl/aUrqN6mm1gqyGcoKy9OqU+1y8PdExD/5fbEXZVPlPePTkiVCm
 5xTDS+VNtDbePGklyGisWwWgGftKV8kj8HUUy9W3EqyTd+rnsFTvUjc98n7AIez1BCTe
 S2uNAm88VvAaR09OViEjY6vR7CU4JMFNGdkr+xwC+E+EqWocHdJv8N0lCY8eKKoedCmq
 La9DuaCdsexjrnbBeeFKJI3esjYGdP3lMDsYN4CT6wSrCUhKZAPLLp9vkNhW5ftkXfN+
 QE/w==
X-Gm-Message-State: AOAM531VOnpESwwk23CcO2EfSi6iTCRHDvHRKhZ4byptoB9mFYv6/Ghg
 yGrT85pGJFLB6a564EVGx2fFU+9YjOqWa3X6cIo=
X-Google-Smtp-Source: ABdhPJwftkLnTcrjGDPRxj8lC+kEm1hn4C9lO7xG+Z1av6WLVfwNRh1Tbv0ujS0gx3mfrXHqGHNHMjRKGAnCDMIedcw=
X-Received: by 2002:a19:fc0f:: with SMTP id a15mr4130391lfi.248.1607129036420; 
 Fri, 04 Dec 2020 16:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20201204182309.14213-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20201204182309.14213-1-ville.syrjala@linux.intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Fri, 4 Dec 2020 16:43:44 -0800
Message-ID: <CAKi4VA+khWptKMFNQ=HCSiutEbP_+0KoYhGCXhhZQBDPVA=9pg@mail.gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Reduce duplicated switch cases in
 hpd code
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgNCwgMjAyMCBhdCAxMDoyMyBBTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gV2l0aCBHRU4xMV9IT1RQTFVHX0NUTF9M
T05HX0RFVEVDVCgpLCBTSE9UUExVR19DVExfRERJX0hQRF9MT05HX0RFVEVDVCgpCj4gYW5kIElD
UF9UQ19IUERfTE9OR19ERVRFQ1QoKSB0YWtpbmcgdGhlIGhwZF9waW4gYXMgdGhlaXIgYXJndW1l
bnQKPiB3ZSBjYW4gcmVtb3ZlIHNvbWUgZHVwbGljYXRpb24gaW4gdGhlIGxvbmdfZGV0ZWN0KCkg
c3dpdGNoIHN0YXRlbWVudHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2lycS5jIHwgMTkgKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEu
Ywo+IGluZGV4IGIyNDUxMDlmNzNlMy4uNDkxZjgyNTAwZDY4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2lycS5jCj4gQEAgLTEwNDQsMTcgKzEwNDQsMTIgQEAgc3RhdGljIGJvb2wgZ2VuMTFfcG9y
dF9ob3RwbHVnX2xvbmdfZGV0ZWN0KGVudW0gaHBkX3BpbiBwaW4sIHUzMiB2YWwpCj4gIHsKPiAg
ICAgICAgIHN3aXRjaCAocGluKSB7Cj4gICAgICAgICBjYXNlIEhQRF9QT1JUX1RDMToKCmNhc2Ug
SFBEX1BPUlRfVEMxIC4uLiBIUERfUE9SVF9UQzYKPwoKaW4gYW55IGNhc2UsCgpSZXZpZXdlZC1i
eTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+CgpMdWNhcyBEZSBN
YXJjaGkKCj4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwgJiBHRU4xMV9IT1RQTFVHX0NUTF9M
T05HX0RFVEVDVChIUERfUE9SVF9UQzEpOwo+ICAgICAgICAgY2FzZSBIUERfUE9SVF9UQzI6Cj4g
LSAgICAgICAgICAgICAgIHJldHVybiB2YWwgJiBHRU4xMV9IT1RQTFVHX0NUTF9MT05HX0RFVEVD
VChIUERfUE9SVF9UQzIpOwo+ICAgICAgICAgY2FzZSBIUERfUE9SVF9UQzM6Cj4gLSAgICAgICAg
ICAgICAgIHJldHVybiB2YWwgJiBHRU4xMV9IT1RQTFVHX0NUTF9MT05HX0RFVEVDVChIUERfUE9S
VF9UQzMpOwo+ICAgICAgICAgY2FzZSBIUERfUE9SVF9UQzQ6Cj4gLSAgICAgICAgICAgICAgIHJl
dHVybiB2YWwgJiBHRU4xMV9IT1RQTFVHX0NUTF9MT05HX0RFVEVDVChIUERfUE9SVF9UQzQpOwo+
ICAgICAgICAgY2FzZSBIUERfUE9SVF9UQzU6Cj4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwg
JiBHRU4xMV9IT1RQTFVHX0NUTF9MT05HX0RFVEVDVChIUERfUE9SVF9UQzUpOwo+ICAgICAgICAg
Y2FzZSBIUERfUE9SVF9UQzY6Cj4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwgJiBHRU4xMV9I
T1RQTFVHX0NUTF9MT05HX0RFVEVDVChIUERfUE9SVF9UQzYpOwo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gdmFsICYgR0VOMTFfSE9UUExVR19DVExfTE9OR19ERVRFQ1QocGluKTsKPiAgICAgICAg
IGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIH0KPiBA
QCAtMTA3OCwxMyArMTA3MywxMCBAQCBzdGF0aWMgYm9vbCBpY3BfZGRpX3BvcnRfaG90cGx1Z19s
b25nX2RldGVjdChlbnVtIGhwZF9waW4gcGluLCB1MzIgdmFsKQo+ICB7Cj4gICAgICAgICBzd2l0
Y2ggKHBpbikgewo+ICAgICAgICAgY2FzZSBIUERfUE9SVF9BOgo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gdmFsICYgU0hPVFBMVUdfQ1RMX0RESV9IUERfTE9OR19ERVRFQ1QoSFBEX1BPUlRfQSk7
Cj4gICAgICAgICBjYXNlIEhQRF9QT1JUX0I6Cj4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwg
JiBTSE9UUExVR19DVExfRERJX0hQRF9MT05HX0RFVEVDVChIUERfUE9SVF9CKTsKPiAgICAgICAg
IGNhc2UgSFBEX1BPUlRfQzoKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHZhbCAmIFNIT1RQTFVH
X0NUTF9ERElfSFBEX0xPTkdfREVURUNUKEhQRF9QT1JUX0MpOwo+ICAgICAgICAgY2FzZSBIUERf
UE9SVF9EOgo+IC0gICAgICAgICAgICAgICByZXR1cm4gdmFsICYgU0hPVFBMVUdfQ1RMX0RESV9I
UERfTE9OR19ERVRFQ1QoSFBEX1BPUlRfRCk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiB2YWwg
JiBTSE9UUExVR19DVExfRERJX0hQRF9MT05HX0RFVEVDVChwaW4pOwo+ICAgICAgICAgZGVmYXVs
dDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgfQo+IEBAIC0xMDk0
LDE3ICsxMDg2LDEyIEBAIHN0YXRpYyBib29sIGljcF90Y19wb3J0X2hvdHBsdWdfbG9uZ19kZXRl
Y3QoZW51bSBocGRfcGluIHBpbiwgdTMyIHZhbCkKPiAgewo+ICAgICAgICAgc3dpdGNoIChwaW4p
IHsKPiAgICAgICAgIGNhc2UgSFBEX1BPUlRfVEMxOgo+IC0gICAgICAgICAgICAgICByZXR1cm4g
dmFsICYgSUNQX1RDX0hQRF9MT05HX0RFVEVDVChIUERfUE9SVF9UQzEpOwo+ICAgICAgICAgY2Fz
ZSBIUERfUE9SVF9UQzI6Cj4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwgJiBJQ1BfVENfSFBE
X0xPTkdfREVURUNUKEhQRF9QT1JUX1RDMik7Cj4gICAgICAgICBjYXNlIEhQRF9QT1JUX1RDMzoK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIHZhbCAmIElDUF9UQ19IUERfTE9OR19ERVRFQ1QoSFBE
X1BPUlRfVEMzKTsKPiAgICAgICAgIGNhc2UgSFBEX1BPUlRfVEM0Ogo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gdmFsICYgSUNQX1RDX0hQRF9MT05HX0RFVEVDVChIUERfUE9SVF9UQzQpOwo+ICAg
ICAgICAgY2FzZSBIUERfUE9SVF9UQzU6Cj4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwgJiBJ
Q1BfVENfSFBEX0xPTkdfREVURUNUKEhQRF9QT1JUX1RDNSk7Cj4gICAgICAgICBjYXNlIEhQRF9Q
T1JUX1RDNjoKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHZhbCAmIElDUF9UQ19IUERfTE9OR19E
RVRFQ1QoSFBEX1BPUlRfVEM2KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHZhbCAmIElDUF9U
Q19IUERfTE9OR19ERVRFQ1QocGluKTsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIH0KPiAtLQo+IDIuMjYuMgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
