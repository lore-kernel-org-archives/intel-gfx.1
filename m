Return-Path: <SRS0=x/xo=B4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EDDC433E1
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 11:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB75206DA
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 11:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB75206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439B89BB3;
	Tue, 18 Aug 2020 11:44:52 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751AE89BB3
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2020 11:44:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22162018-1500050 for multiple; Tue, 18 Aug 2020 12:44:45 +0100
MIME-Version: 1.0
In-Reply-To: <CA+GA0_tJyx-Xj6ORoBWj8+E8hXftWj4+qDMqvy83W7gQpMZ9oA@mail.gmail.com>
References: <CA+GA0_srCED0nX7XkiuOBxsxPy8xskG0Z-Lu9bWnD=tknnJNww@mail.gmail.com>
 <CA+GA0_tJyx-Xj6ORoBWj8+E8hXftWj4+qDMqvy83W7gQpMZ9oA@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Marcin Ślusarz <marcin.slusarz@gmail.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 18 Aug 2020 12:44:46 +0100
Message-ID: <159775108662.667.4098859189018751595@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gt: raise logging level of
 "gpu reset disabled" message
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXJjaW4gxZpsdXNhcnogKDIwMjAtMDgtMTggMTI6Mzc6MjApCj4gRnJvbTogTWFy
Y2luIMWabHVzYXJ6IDxtYXJjaW4uc2x1c2FyekBpbnRlbC5jb20+Cj4gCj4gRmV3IGxpbmVzIGFi
b3ZlIHRoZXJlJ3MgZHJtX25vdGljZSBzYXlpbmcgdGhhdCB0aGUgZ3B1IHdpbGwgYmUgcmVzZXQu
Cj4gUHJpbnRpbmcgImdwdSByZXNldCBkaXNhYmxlZCIgdXNpbmcgbG93ZXIgbG9nZ2luZyBsZXZl
bCBtYWtlcyBpdAo+IGhhcmRlciB0byBmaWd1cmUgb3V0IHdoYXQgaGFwcGVuZWQuCgpJdCdzIGRp
c2FibGVkIGJ5IHVzZXIgcmVxdWVzdCwgYW5kIHdlIG1heSBkbyB0aGlzIHZlcnkgdmVyeSBmcmVx
dWVudGx5LgpJZiB5b3UgYXJlIHdpc2UgZW5vdWdoIHRvIHRvdWNoIGFuIHVuc2FmZSBtb2R1bGUg
cGFyYW1ldGVyLCB5b3UgZ2V0IHRvCmtlZXAgYWxsIHRoZSBwaWVjZXMuCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
