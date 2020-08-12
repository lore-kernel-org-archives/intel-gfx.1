Return-Path: <SRS0=eb9m=BW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_NONE,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AC9C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 20:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8707B20781
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 20:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="kecQ8HPK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8707B20781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD3C6E192;
	Wed, 12 Aug 2020 20:28:38 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84F16E192
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2020 20:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C84073F52C;
 Wed, 12 Aug 2020 22:28:32 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=kecQ8HPK; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrMJ6QTFInnP; Wed, 12 Aug 2020 22:28:32 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DF9763F4F8;
 Wed, 12 Aug 2020 22:28:30 +0200 (CEST)
Received: from localhost.localdomain (jfdmzpr03-ext.jf.intel.com
 [134.134.139.72])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 30FB7360507;
 Wed, 12 Aug 2020 22:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1597264112; bh=eJsSH9iGWV7IXsIjKs9k1cMZgHOjTqBFjN9ZweYnHc8=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=kecQ8HPKIzelubnpm9lOxVU0dvStzXTBTFfvgr9nJHzVp4xj9hEEtmyFHTYu+3PnL
 tHVZjpqTnY54oekw/vSaf0pj7X97cRN+NUqACU93GnELf2fLMOSNagSVo/PP7YaL41
 25HfSvrMD6ukjrCQc3bKMWiU+kvnYs25eZMOSt2w=
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
 <20200810103103.303818-16-maarten.lankhorst@linux.intel.com>
 <ef9789d4-61a3-7087-dcda-75a60f6df899@shipmail.org>
Message-ID: <c6d51150-7128-d5cb-5ab5-5bf556488e54@shipmail.org>
Date: Wed, 12 Aug 2020 22:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ef9789d4-61a3-7087-dcda-75a60f6df899@shipmail.org>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 15/24] drm/i915: Make sure execbuffer always
 passes ww state to i915_vma_pin.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDgvMTIvMjAgOTozMiBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPgo+
PiArwqDCoMKgIGlmICghZXJyICYmIGNlLT5yaW5nLT52bWEtPm9iaikKPj4gK8KgwqDCoMKgwqDC
oMKgIGVyciA9IGk5MTVfZ2VtX29iamVjdF9sb2NrKGNlLT5yaW5nLT52bWEtPm9iaiwgd3cpOwo+
PiArwqDCoMKgIGlmICghZXJyICYmIGNlLT5zdGF0ZSkKPj4gK8KgwqDCoMKgwqDCoMKgIGVyciA9
IGk5MTVfZ2VtX29iamVjdF9sb2NrKGNlLT5zdGF0ZS0+b2JqLCB3dyk7Cj4KPiBDb3VsZCB0aGVz
ZSB0aHJlZSBsb2NrcyBiZSBtYWRlIGludGVycnVwdGlibGU/CgpOZXZlciBtaW5kLCBJIHNlZSBu
b3cgaG93IHRoYXQncyBkb25lLgoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAo=
