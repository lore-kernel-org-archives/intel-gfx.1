Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177ABC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 17:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EBFA22ADF
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 17:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EBFA22ADF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4D989688;
	Mon, 25 Jan 2021 17:33:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7790C89688
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 17:33:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8B41AD17;
 Mon, 25 Jan 2021 17:33:43 +0000 (UTC)
Date: Mon, 25 Jan 2021 18:33:36 +0100
From: Borislav Petkov <bp@suse.de>
To: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <20210125173336.GB23290@zn.tnic>
References: <20210125105931.268977-1-aditya.swarup@intel.com>
 <20210125105931.268977-2-aditya.swarup@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125105931.268977-2-aditya.swarup@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] x86/gpu: Add Alderlake-S stolen memory
 support
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
Cc: Jani Nikula <jani.nikula@intel.com>, x86@kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMjUsIDIwMjEgYXQgMDI6NTk6MzFBTSAtMDgwMCwgQWRpdHlhIFN3YXJ1cCB3
cm90ZToKPiBGcm9tOiBDYXogWW9rb3lhbWEgPGNhei55b2tveWFtYUBpbnRlbC5jb20+Cj4gCj4g
QWxkZXJsYWtlLVMgaXMgYSBHZW4gMTIgYmFzZWQgaHlicmlkIHByb2Nlc3NvciBhcmNoaXRldHVy
ZS4gQXMgaXQKCnR5cG86ICJhcmNoaXRlY3R1cmUiCgo+IGJlbG9uZ3MgdG8gR2VuIDEyIGZhbWls
eSwgaXQgdXNlcyB0aGUgc2FtZSBHVFQgc3RvbGVuIG1lbW9yeSBzZXR0aW5ncwo+IGxpa2UgaXRz
IHByZWRlY2Vzc29ycyAtIElDTChHZW4gMTEpIGFuZCBUR0woR2VuIDEyKS4gVGhpcyBwYXRjaCBp
bmhlcml0cwoKcy9UaGlzIHBhdGNoIGluaGVyaXRzL0luaGVyaXQvCgo+IHRoZSBnZW4xMSBhbmQg
Z2VuIDkgcXVpcmtzIGZvciBkZXRlcm1pbmluZyBiYXNlIGFuZCBzaXplIG9mIHN0b2xlbgo+IG1l
bW9yeS4KPiAKPiBOb3RlIHRoYXQgdGhpcyBwYXRjaCBkZXBlbmRzIG9uIGNvbW1pdCAwODgzZDYz
YjE5YmIKPiAoImRybS9pOTE1L2FkbF9zOiBBZGQgQURMLVMgcGxhdGZvcm0gaW5mbyBhbmQgUENJ
IGlkcyIpCgpUaGlzIHNlbnRlbmNlIGRvZXMgbm90IGJlbG9uZyBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UuCgo+IEJzcGVjOiA1MjA1NQo+IEJzcGVjOiA0OTU4OQo+IEJzcGVjOiA0OTYzNgoKVGhhbmtz
IGZvciBleHBsYWluaW5nIHRob3NlLgoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgR0Y6IEZlbGl4IEltZW5kw7ZyZmZl
ciwgSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ2Z4Cg==
