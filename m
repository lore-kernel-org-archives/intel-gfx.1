Return-Path: <SRS0=oW1W=D4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7DEC4363A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 20:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251072237B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 20:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251072237B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BE86EE7F;
	Wed, 21 Oct 2020 20:45:05 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81C6EE7F
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 20:45:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22769239-1500050 for multiple; Wed, 21 Oct 2020 21:45:00 +0100
MIME-Version: 1.0
In-Reply-To: <160330176036.24927.9129805853490209956@build.alporthouse.com>
References: <20201021131443.25616-1-ville.syrjala@linux.intel.com>
 <20201021131443.25616-2-ville.syrjala@linux.intel.com>
 <160330176036.24927.9129805853490209956@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2020 21:44:59 +0100
Message-ID: <160331309909.24927.11932650661851239816@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915: Read actual GPU frequency
 from MEMSTAT_ILK on ILK
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMjAtMTAtMjEgMTg6MzY6MDApCj4gUXVvdGluZyBWaWxs
ZSBTeXJqYWxhICgyMDIwLTEwLTIxIDE0OjE0OjQwKQo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gVGhlcmUgaXMgbm8gR0VO
Nl9SUFNUQVQxIG9uIElMSy4gSW5zdGVhZCBvZiByZWFkaW5nIHRoYXQgbGV0J3MKPiA+IHRyeSB0
byBnZXQgdGhlIHNhbWUgaW5mb3JtYXRpb24gZnJvbSBNRU1TVEFUX0lMSy4gQXQgbGVhc3QgaXQK
PiA+IHNlZW1zIHRvIHRyYWNrIE1FTVNXQ1RMIGZyZXF1ZW5jeSByZXF1ZXN0IHBlcmZlY3RseSBv
biBteSBJTEsuCj4gPiBJdCBuZWVkcyB0aGUgc2FtZSBpbnZlcnQgdHJpY2sgYXMgdGhlIHJlcXVl
c3QgdmFsdWUuCj4gPiAKPiA+IFdlIGRvbid0IHdhbnQgdG8gcHV0IHRoZSBpbnZlcnQgdGhpbmcg
aW50byBpbnRlbF9ncHVfZnJlcSgpCj4gPiBhbmQgaW50ZWxfZnJlcV9vcGNvZGUoKSBiZWNhdXNl
IHRoYXQgd291bGQgaW5jb3JyZWN0bHkgaW52ZXJ0Cj4gPiB0aGUgbWluL21heC9ldGMgZnJlcXVl
bmNpZXMgYWxzby4KPiA+IAo+ID4gT25lIGRheSBzb21lb25lIG1pZ2h0IHdhbnQgdG8gcmV2ZXJz
ZSBlbmdpbmVlciB0aGUgZm9ybXVsYSBmb3IKPiA+IGNvbnZlcnRpbmcgdGhlc2UgbnVtdmVycyB0
byBIeiwgYnV0IGZvciBub3cgd2UnbGwganVzdCByZXBvcnQKPiA+IHRoZW0gcmF3Lgo+IAo+IFJh
dy4gVGhhdCdsbCBiZSBhIG51aXNhbmNlLCBidXQgYSBzdGVwIGZvcndhcmQuCgpJIHNob3VsZCBu
b3RlIHRoYXQgY3VycmVudGx5IHRoZXNlIGFyZSBvbmx5IGhvb2tlZCB1cCB0byB0aGUgZGVidWcK
aW50ZXJmYWNlcywgYW5kIG5vdCBzeXNmcywgc28gcmF3IGlzICJnb29kIGVub3VnaCIgYW5kIHNo
b3VsZCBub3QgYmUKdXNlciB2aXNpYmxlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
