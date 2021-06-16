Return-Path: <SRS0=BVws=LK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C628C48BE5
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jun 2021 14:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F746101A
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jun 2021 14:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46F746101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7056E5B0;
	Wed, 16 Jun 2021 14:29:55 +0000 (UTC)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60BD6E1D7;
 Wed, 16 Jun 2021 14:29:53 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id u30so2782417qke.7;
 Wed, 16 Jun 2021 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s2dm6lcMnXuyN8GaQsvpUNJ+EJn6v08TzDTNDWuGErg=;
 b=u3THyfh4TH56LlT0weSc076G011Wy3ry8CxGT2sNorwxBlSX3rGCJb4wV4CDNsuYVp
 nEF00F6qUEoAtZD9x3K6b0Q7vq5LRjofJV0XilSvHmnd4sQ5UiGfOG4lnHXP3yR4vfVG
 /3zPiz6C4P5xx5nyd9g9y4v8cZmZ1adkxAuqQyD4UJyuZPaMc31cNCeIF3K6La//8qXo
 KvrrDxpNOELSZwKR9TJquhuwKyHw54UloxmVwoAhbtzQQOz1vlzPvk+NdhrqoDueecPe
 tdm0oj6ezj8s+XaCkqjm+c4G8rhjpEX+mbfv3G1s6eUKask+LZ3qhs+EvoGOyKxHoNIP
 05WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s2dm6lcMnXuyN8GaQsvpUNJ+EJn6v08TzDTNDWuGErg=;
 b=sOdUl/mssvyarGmo2sYfnbRGsmQCtTBPsD927yEH7yYOIWlt64hysPV0n1RzqNPStH
 XBZZaehtoB9xR6br/jJ18wQJTbN5QpBDUaQG/53Xuer4fuvI9UvIRXW35jhMy7DHLV+e
 /OU81J83qnxtXBM1lKqkl6tfEnOG9QJbkq1PGZpvXlOZzXSjiYWTZq9BjT9XqEczsDBH
 xEqwsQIAc8KmgGqi6kt74QEXvQIWof8byBVobtGi/DInuWmf1y4tACtoyRKqDzF3k8T1
 Y51jatNO/dNjtwFZ7Vcm/2D+SneU5YopyXKhRrhmxOPTXzuLWe+YnVpG3nMP006Aq8iI
 AG/A==
X-Gm-Message-State: AOAM531xDThZsIbGZeNNPOAxOUaEs4Gx/c4y4WIZ9pV93XGfIWcUHxhW
 6Y4rJwLbcv9pto5wfKmKfbZ0tnATjkVLECB0i/sOTKeqTlw=
X-Google-Smtp-Source: ABdhPJwJbZnu00wNRVIfPlxcX1IRr/fA34VSBPBN1aLgsMy8cnRE0R5aUwFCfvw/Qo2ND84v9tfnr+EHKbyt9xabhds=
X-Received: by 2002:a37:b1c3:: with SMTP id a186mr316282qkf.17.1623853792996; 
 Wed, 16 Jun 2021 07:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210614092227.97421-1-matthew.auld@intel.com>
In-Reply-To: <20210614092227.97421-1-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Jun 2021 15:29:26 +0100
Message-ID: <CAM0jSHPacC6S6u1eCgaDUd6UNNJV5UgqQSBzRbtNXSzw3mdLyg@mail.gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: allow DG1 autoprobe for
 CONFIG_BROKEN
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCAxNCBKdW4gMjAyMSBhdCAxMDoyMiwgTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPiB3cm90ZToKPgo+IFB1cmVseSBmb3IgQ0kgc28gd2UgY2FuIGdldCBzb21lIHBy
ZS1tZXJnZSByZXN1bHRzIGZvciBERzEuIFRoaXMgaXMKPiBlc3BlY2lhbGx5IHVzZWZ1bCBmb3Ig
Y3Jvc3MgZHJpdmVyIFRUTSBjaGFuZ2VzIHdoZXJlIENJIGNhbiBob3BlZnVsbHkKPiBjYXRjaCBy
ZWdyZXNzaW9ucy4gVGhpcyBpcyBzaW1pbGFyIHRvIGhvdyB3ZSBhbHJlYWR5IGhhbmRsZSB0aGUg
REcxCj4gc3BlY2lmaWMgdUFQSSwgd2hpY2ggYXJlIGFsc28gaGlkZGVuIGJlaGluZCBDT05GSUdf
QlJPS0VOLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4g
Q2M6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KCkRhbmllbCwgYW55IG9iamVjdGlv
bnMgdG8gbGFuZGluZyB0aGlzPwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
Y2kuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9wY2kuYwo+IGluZGV4IDgzYjUwMGJiMTcwYy4uNzg3NDIxNTdhYWEzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGNpLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jCj4gQEAgLTEwNDAsNiArMTA0MCw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKPiAgICAgICAgIElOVEVM
X1JLTF9JRFMoJnJrbF9pbmZvKSwKPiAgICAgICAgIElOVEVMX0FETFNfSURTKCZhZGxfc19pbmZv
KSwKPiAgICAgICAgIElOVEVMX0FETFBfSURTKCZhZGxfcF9pbmZvKSwKPiArI2lmIElTX0VOQUJM
RUQoQ09ORklHX0RSTV9JOTE1X1VOU1RBQkxFX0ZBS0VfTE1FTSkKPiArICAgICAgIElOVEVMX0RH
MV9JRFMoJmRnMV9pbmZvKSwKPiArI2VuZGlmCj4gICAgICAgICB7MCwgMCwgMH0KPiAgfTsKPiAg
TU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIHBjaWlkbGlzdCk7Cj4gLS0KPiAyLjI2LjMKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFp
bGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
