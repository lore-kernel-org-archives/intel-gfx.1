Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AD3C00A89
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 09:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177C42076E
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 09:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="pTASBkjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177C42076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B966ED23;
	Fri, 30 Oct 2020 09:46:26 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E236ED23
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 09:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B3BF73F3E7;
 Fri, 30 Oct 2020 10:46:16 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=pTASBkjI; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGCo-3Ep7Ehy; Fri, 30 Oct 2020 10:46:15 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 64E383F386;
 Fri, 30 Oct 2020 10:46:13 +0100 (CET)
Received: from Win10-45-1tb161.SSPE.ch.intel.com (jfdmzpr06-ext.jf.intel.com
 [134.134.137.75])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A279C3605DC;
 Fri, 30 Oct 2020 10:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1604051180; bh=2GTQZSLwpR7igu8SubaGjWmcw3BOE0tjknOfpEQh7OU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pTASBkjIjr8p/kWaqCoe1adRlwyPhwjmGVBx5v+sUnGGwEP+Hbv3pOTUt+LA8AN9X
 //Y5wQeFJjDYtPfDIvu4dA8lEfBhcL7Z+iR6nBIaByzUj7vkaZf2IPzhsxtpBKRVep
 FWBjTDqWtSZYYJehVRqk8dwZf4pOLv1ySHRRHLFI=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-19-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <2e458cd1-49cb-7b93-ed33-719efa641bc5@shipmail.org>
Date: Fri, 30 Oct 2020 10:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-19-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 18/61] drm/i915: Make ring submission
 compatible with obj->mm.lock removal, v2.
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDEwLzE2LzIwIDEyOjQ0IFBNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToKPiBXZSBtYXAg
dGhlIGluaXRpYWwgY29udGV4dCBkdXJpbmcgZmlyc3QgcGluLgo+Cj4gVGhpcyBhbGxvd3MgdXMg
dG8gcmVtb3ZlIHBpbl9tYXAgZnJvbSBzdGF0ZSBhbGxvY2F0aW9uLCB3aGljaCBzYXZlcwo+IHVz
IGEgZmV3IHJldHJ5IGxvb3BzLiBXZSB3b24ndCBuZWVkIHRoaXMgdW50aWwgZmlyc3QgcGluIGFu
eXdheS4KPgo+IGludGVsX3Jpbmdfc3VibWlzc2lvbl9zZXR1cCgpIGlzIGFsc28gcmV3b3JrZWQg
c2xpZ2h0bHkgdG8gZG8gYWxsCj4gcGlubmluZyBpbiBhIHNpbmdsZSB3dyBsb29wLgo+Cj4gQ2hh
bmdlcyBzaW5jZSB2MToKPiAtIEhhbmRsZSAtRURFQURMSyBiYWNrb2ZmIGluIGludGVsX3Jpbmdf
c3VibWlzc2lvbl9zZXR1cCgpIGJldHRlci4KPiAtIEhhbmRsZSBzbWF0Y2ggZXJyb3JzIHJlcG9y
dGVkIGJ5IERhbiBhbmQgdGVzdGJvdC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxz
dHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
