Return-Path: <SRS0=NnJ0=BU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3E1C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 17:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71E0207DA
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 17:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="bogLYM5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71E0207DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268C289ED6;
	Mon, 10 Aug 2020 17:44:13 +0000 (UTC)
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A93789ED6
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 71DF63F3F8;
 Mon, 10 Aug 2020 19:44:10 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=bogLYM5I; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqBhoQ1fksBr; Mon, 10 Aug 2020 19:44:09 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 913B43F30B;
 Mon, 10 Aug 2020 19:44:09 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 66EDB361F69;
 Mon, 10 Aug 2020 19:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1597081449; bh=KHX4mGZnpEPcNKsZEehdtUB1vx2JMXUtXv2KL7e9XA0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=bogLYM5IzphOCTUuCOW+pwCApCYeB279TcCuPZwBzac5mftmfhXbCMyEPzpOkEKEP
 tiRa8TQcj9X29m4fW7dl9uAwBwzyywvKuXnIMQTsvXxn3lcr/sJ71cMx/MWhZclSmD
 W6AX4Bb/DcQdS9rFnK8s4G0BUMT7HBBovc8Oqb+o=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
 <20200810103103.303818-8-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <3912e7aa-0d86-ae6b-c009-9a6f00dcf7b9@shipmail.org>
Date: Mon, 10 Aug 2020 19:44:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810103103.303818-8-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 07/24] drm/i915: Parse command buffer
 earlier in eb_relocate(slow)
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

Ck9uIDgvMTAvMjAgMTI6MzAgUE0sIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+IFdlIHdhbnQg
dG8gaW50cm9kdWNlIGJhY2tvZmYgbG9naWMsIGJ1dCB3ZSBuZWVkIHRvIGxvY2sgdGhlCj4gcG9v
bCBvYmplY3QgYXMgd2VsbCBmb3IgY29tbWFuZCBwYXJzaW5nLiBCZWNhdXNlIG9mIHRoaXMsIHdl
Cj4gd2lsbCBuZWVkIGJhY2tvZmYgbG9naWMgZm9yIHRoZSBlbmdpbmUgcG9vbCBvYmosIG1vdmUg
dGhlIGJhdGNoCj4gdmFsaWRhdGlvbiB1cCBzbGlnaHRseSB0byBlYl9sb29rdXBfdm1hcywgYW5k
IHRoZSBhY3R1YWwgY29tbWFuZAo+IHBhcnNpbmcgaW4gYSBzZXBhcmF0ZSBmdW5jdGlvbiB3aGlj
aCBjYW4gZ2V0IGNhbGxlZCBmcm9tIGV4ZWNidWYKPiByZWxvY2F0aW9uIGZhc3QgYW5kIHNsb3dw
YXRoLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWdmeAo=
