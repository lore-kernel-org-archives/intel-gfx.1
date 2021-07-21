Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4F6C12002
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 09:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBB3611C1
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 09:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBB3611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4B6E8CF;
	Wed, 21 Jul 2021 09:06:24 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2956E8CF
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 09:06:24 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 j1-20020a0568302701b02904d1f8b9db81so1402700otu.12
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vbpSdcWmIY+7r9fq9wV0Y0tg1sXtpdB2EkkXyx4/kCY=;
 b=cg7Inx34ukIGeHvO4NDJ000KDZTFqYb3n9e/bS//3XfGNhypQgwqzlne/6EEwMNAsD
 XSDqI82eSOsiLJksHJ0mMzKaNRgKWY0kXOrmu2e+gmSkDlak1jv2tugs1wI1nrDcxyfa
 E4jxGaGaxx1B+iJpoyEqP5uMVAmatvi6C13OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vbpSdcWmIY+7r9fq9wV0Y0tg1sXtpdB2EkkXyx4/kCY=;
 b=oB6Ss2fkXVo+FxAvgF1pW+SWMIHB1hiIrB8fi78dCm7s5SchpgUKKT7rIesUbdslcs
 UCt9EQ6WLGTcu6TsfzQKEbf3qaZnvlgMAfvsJqzbkDWF3SPasyBf8A9LlLrYpW1FwA/a
 jynvvAdd7FWf0BM7zO+T5HlDTO9tR52HolqG4M1XdTrZITyEYHcIqN0YYWiW7mNEuB2a
 BInjgIoSF13jRKgiatqC9MrlzGLggF0S8mXj3+waDYjxBv+QF/Qh/AvHw72foB0v+uJl
 4asgJX3w1L+j3bAaIE4MeyNvHwRinFpU16x7XqYulGi2vWMtmqKxO+ljHsee8Lnx58Qp
 PpGA==
X-Gm-Message-State: AOAM5318IaXKqUaj18JE/pTsECRhTY4enm1FwBqrtQ1P9vEavAoT8dFK
 jhWkmzPa43xNKvQFKYXa5tyAf59tqACCB2jGAMKNfoZMYvI=
X-Google-Smtp-Source: ABdhPJyFr2+NmX8zM8mNYprI/bXbf5nV9Pn3jlKU0aAdhbsK6eiFr6kIyN1LFI3V2PANdj0e0pTwEtGPxTtvHTcMWns=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr24210677otu.303.1626858383358; 
 Wed, 21 Jul 2021 02:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210720181357.2760720-1-jason@jlekstrand.net>
 <20210720181357.2760720-5-jason@jlekstrand.net>
 <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
In-Reply-To: <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 11:06:12 +0200
Message-ID: <CAKMK7uGjaHes1U+h7-8GTx1rPVBGBJz5dJw7=Nhh5WEUJG1Yqw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/ttm: Force re-init if
 ttm_global_init() fails
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjEsIDIwMjEgYXQgODozNiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+IEFtIDIwLjA3LjIxIHVtIDIwOjEzIHNjaHJpZWIg
SmFzb24gRWtzdHJhbmQ6Cj4gPiBJZiB3ZSBoYXZlIGEgZmFpbHVyZSwgZGVjcmVtZW50IHRoZSBy
ZWZlcmVuY2UgY291bnQgc28gdGhhdCB0aGUgbmV4dAo+ID4gY2FsbCB0byB0dG1fZ2xvYmFsX2lu
aXQoKSB3aWxsIGFjdHVhbGx5IGRvIHNvbWV0aGluZyBpbnN0ZWFkIG9mIGFzc3VtZQo+ID4gZXZl
cnl0aGluZyBpcyBhbGwgc2V0IHVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEVrc3Ry
YW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4KPiA+IEZpeGVzOiA2MmI1M2IzN2U0YjEgKCJkcm0v
dHRtOiB1c2UgYSBzdGF0aWMgdHRtX2JvX2dsb2JhbCBpbnN0YW5jZSIpCj4gPiBSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gSSd2ZSBq
dXN0IHB1c2hlZCB0aGlzIHRvIGRybS1taXNjLWZpeGVzLgoKRGlkIHlvdSBzZWUgcGF0Y2ggNS82
IGhlcmUgd2hpY2ggaXMgYWxzbyB0b3VjaGluZyB0dG0/Ci1EYW5pZWwKCj4KPiBUaGFua3MsCj4g
Q2hyaXN0aWFuLgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNl
LmMgfCAyICsrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9kZXZpY2UuYwo+ID4gaW5kZXggNWYzMWFjZWMzYWQ3Ni4uNTE5ZGVlYThl
MzliNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYwo+ID4gQEAgLTEwMCw2ICsx
MDAsOCBAQCBzdGF0aWMgaW50IHR0bV9nbG9iYWxfaW5pdCh2b2lkKQo+ID4gICAgICAgZGVidWdm
c19jcmVhdGVfYXRvbWljX3QoImJ1ZmZlcl9vYmplY3RzIiwgMDQ0NCwgdHRtX2RlYnVnZnNfcm9v
dCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZnbG9iLT5ib19jb3VudCk7Cj4g
PiAgIG91dDoKPiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIC0tdHRtX2dsb2Jf
dXNlX2NvdW50Owo+ID4gICAgICAgbXV0ZXhfdW5sb2NrKCZ0dG1fZ2xvYmFsX211dGV4KTsKPiA+
ICAgICAgIHJldHVybiByZXQ7Cj4gPiAgIH0KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcg
bGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
