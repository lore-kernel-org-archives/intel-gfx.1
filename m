Return-Path: <SRS0=VOyE=K4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00635C4708F
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 09:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9979613AE
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 09:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9979613AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D3A6EC13;
	Wed,  2 Jun 2021 09:16:12 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4770F6EC13;
 Wed,  2 Jun 2021 09:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 6768A3F503;
 Wed,  2 Jun 2021 11:16:09 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="U+8r61NS";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su0KoBf9jvId; Wed,  2 Jun 2021 11:16:04 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B0F8D3F4B6;
 Wed,  2 Jun 2021 11:16:02 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2909A36012A;
 Wed,  2 Jun 2021 11:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622625362; bh=4hCp9bO61tPGQrNvB6R+ZrLQJBkFZAEhg82TnCH31/U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U+8r61NSU4bkHQBy9R/k9D7YZeBOoycOa0MKvjhL4DIoMK5uuaxZTZX3LV6QsiEZB
 Bb5pHmwbPEzHry0tsHT2Uj0TNHuVDLD9g/SuFeOksExVULzJUhMGxGxcbhWIQe5fA0
 MgpexLpM9xO9m2rKD7wz2/IgemRwAuOy173km1FU=
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
Date: Wed, 2 Jun 2021 11:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
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
Cc: Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDYvMi8yMSAxMDozMiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBVZmYgSSdtIGp1
c3Qgd2FpdGluZyBmb3IgZmVlZGJhY2sgZnJvbSBQaGlsaXAgdG8gbWVyZ2UgYSBsYXJnZSBwYXRj
aCAKPiBzZXQgZm9yIFRUTSB0aHJvdWdoIGRybS1taXNjLW5leHQuCj4KPiBJJ20gcHJldHR5IHN1
cmUgd2Ugd2lsbCBydW4gaW50byBtZXJnZSBjb25mbGljdHMgaWYgeW91IHRyeSB0byBwdXNoIAo+
IHlvdXIgY2hhbmdlcyB0aHJvdWdoIHRoZSBJbnRlbCB0cmVlLgo+Cj4gQ2hyaXN0aWFuLgoKT0ss
IHNvIHdoYXQgd291bGQgYmUgdGhlIGJlc3QgYXBwcm9hY2ggaGVyZT8sIEFkZGluZyB0aGUgVFRN
IHBhdGNoZXMgdG8gCmRybS1taXNjLW5leHQgd2hlbiB5b3VyIHNldCBoYXMgbGFuZGVkPwoKVGhh
bmtzLAoKVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
