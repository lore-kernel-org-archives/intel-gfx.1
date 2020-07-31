Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2953C433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 09:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEBDA20838
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 09:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="am68p0GR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEBDA20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6D16EA33;
	Fri, 31 Jul 2020 09:04:12 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA8F6EA33
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 09:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DFB823F54A;
 Fri, 31 Jul 2020 11:04:06 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=am68p0GR; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmvYE0Uwx5_i; Fri, 31 Jul 2020 11:04:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8BAC13F536;
 Fri, 31 Jul 2020 11:04:03 +0200 (CEST)
Received: from localhost.localdomain (unknown [134.134.137.77])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2B516361FD5;
 Fri, 31 Jul 2020 11:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1596186245; bh=2TLXOoJl6y6JCsVil4arkP8esE4ZomTXCkl+SktTsJY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=am68p0GR93dfrVKaHYBP26oOOzi21So9/ebt52ijTKgak0Xmn711zSqR1ZNV4xcF8
 rBVX4adKiardTIQC4kNINfQlou+xwLDwI5ustwRUWNdDTrujFWGQvgB4QNsDiirec/
 TmNQgq9807nbSgf+rMNcanQLHXr7NAP1TjsBbEQw=
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200715115147.11866-1-chris@chris-wilson.co.uk>
 <20200715115147.11866-18-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <c847f75c-25f5-2157-c5c8-07bd6c252213@shipmail.org>
Date: Fri, 31 Jul 2020 11:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715115147.11866-18-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 18/66] drm/i915: Always defer fenced work to
 the worker
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

Ck9uIDcvMTUvMjAgMTo1MCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEN1cnJlbnRseSwgaWYg
YW4gZXJyb3IgaXMgcmFpc2VkIHdlIGFsd2F5cyBjYWxsIHRoZSBjbGVhbnVwIGxvY2FsbHkKPiBb
YW5kIHNraXAgdGhlIG1haW4gd29yayBjYWxsYmFja10uIEhvd2V2ZXIsIHNvbWUgZnV0dXJlIHVz
ZXJzCkNvdWxkIHlvdSBhZGQgYW4gZXhhbXBsZSBvZiB0aG9zZSBmdXR1cmUgdXNlcnM/Cj4gbWF5
IG5lZWQKPiB0byB0YWtlIGEgbXV0ZXggdG8gY2xlYW51cCBhbmQgc28gd2UgY2Fubm90IGltbWVk
aWF0ZWx5IGV4ZWN1dGUgdGhlCj4gY2xlYW51cCBhcyB3ZSBtYXkgc3RpbGwgYmUgaW4gaW50ZXJy
dXB0IGNvbnRleHQuCj4KPiBXaXRoIHRoZSBleGVjdXRlLWltbWVkaWF0ZSBmbGFnLCBmb3IgbW9z
dCBjYXNlcyB0aGlzIHNob3VsZCByZXN1bHQgaW4KPiBpbW1lZGlhdGUgY2xlYW51cCBvZiBhbiBl
cnJvci4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgoKT3RoZXJ3aXNlIFJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBpbnRlbC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ2Z4Cg==
