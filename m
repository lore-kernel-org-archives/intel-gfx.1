Return-Path: <SRS0=ieU+=EE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09572C2D0A3
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2020 21:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3463C20731
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2020 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3463C20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AAC6E90C;
	Thu, 29 Oct 2020 21:30:47 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818706E90C
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 21:30:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22841888-1500050 
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 21:30:43 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Oct 2020 21:30:42 +0000
Message-Id: <20201029213042.11672-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI] drm: Quieten [zero] EDID carping
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

V2UgaGF2ZSBhIGZldyBkaXNwbGF5cyBpbiBDSSB0aGF0IGFsd2F5cyByZXBvcnQgdGhlaXIgRURJ
RCBhcyBhIGJ1bmNoIG9mCnplcm9lcy4gVGhpcyBpcyBjb25zaXN0ZW50IGJlaGF2aW91ciwgc28g
b25lIGFzc3VtZXMgaW50ZW50aW9uYWwKaW5kaWNhdGlvbiBvZiBhbiAiYWJzZW50IiBFRElELiBG
bGFnZ2luZyB0aGVzZSBjb25zaXN0ZW50IHdhcm5pbmdzCmRldHJhY3RzIGZyb20gQ0kuCgpPbmUg
b3B0aW9uIHdvdWxkIGJlIHRvIGlnbm9yZSB0aGUgemVybyBFRElEcyBhcyBpbnRlbnRpb25hbCBi
ZWhhdmlvdXIsCmJ1dCBWaWxsZSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIGluZm9ybWF0aW9uIGF2
YWlsYWJsZSBmb3IgZGVidWdnaW5nLgpUaGUgc2ltcGxlIGFsdGVybmF0aXZlIHRoZW4gaXMgdG8g
cmVkdWNlIHRoZSBsb2dsZXZlbCBmb3IgYWxsIHRoZSBFRElECmR1bXBpbmcgZnJvbSBXQVJOIHRv
IERFQlVHIHNvIHRoZSBpbmZvcm1hdGlvbiBpcyBwcmVzZW50IGJ1dCBub3QgYW5ub3kKQ0kuIE5v
dGUgdGhhdCB0aGUgYmFkIEVESUQgZHVtcGluZyBpcyBhbHJlYWR5IG9ubHkgc2hvd24gaWYKZHJt
LmRlYnVnPUtNUywgaXQncyBqdXN0IHRoZSBsb2dsZXZlbCBjaG9zZW4gd2FzIHNldCB0byBiZSBj
YXVnaHQgYnkgQ0kKaWYgaXQgZXZlciBvY2N1cnJlZCBhcyBpdCB3YXMgZXhwZWN0ZWQgdG8gYmUg
YW4gaW50ZXJuYWwgZXJyb3Igbm90CmV4dGVybmFsLgoKQ2xvc2VzOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzIyMDMKU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDYzMTEyNWI0NmUwNC4uYzczNjNhZjczMWI0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYwpAQCAtMTg0NCw3ICsxODQ0LDcgQEAgc3RhdGljIHZvaWQgY29ubmVj
dG9yX2JhZF9lZGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJaWYgKGNvbm5l
Y3Rvci0+YmFkX2VkaWRfY291bnRlcisrICYmICFkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfS01T
KSkKIAkJcmV0dXJuOwogCi0JZHJtX3dhcm4oY29ubmVjdG9yLT5kZXYsICIlczogRURJRCBpcyBp
bnZhbGlkOlxuIiwgY29ubmVjdG9yLT5uYW1lKTsKKwlkcm1fZGJnX2ttcyhjb25uZWN0b3ItPmRl
diwgIiVzOiBFRElEIGlzIGludmFsaWQ6XG4iLCBjb25uZWN0b3ItPm5hbWUpOwogCWZvciAoaSA9
IDA7IGkgPCBudW1fYmxvY2tzOyBpKyspIHsKIAkJdTggKmJsb2NrID0gZWRpZCArIGkgKiBFRElE
X0xFTkdUSDsKIAkJY2hhciBwcmVmaXhbMjBdOwpAQCAtMTg1Niw3ICsxODU2LDcgQEAgc3RhdGlj
IHZvaWQgY29ubmVjdG9yX2JhZF9lZGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
CiAJCWVsc2UKIAkJCXNwcmludGYocHJlZml4LCAiXHRbJTAyeF0gR09PRCAiLCBpKTsKIAotCQlw
cmludF9oZXhfZHVtcChLRVJOX1dBUk5JTkcsCisJCXByaW50X2hleF9kdW1wKEtFUk5fREVCVUcs
CiAJCQkgICAgICAgcHJlZml4LCBEVU1QX1BSRUZJWF9OT05FLCAxNiwgMSwKIAkJCSAgICAgICBi
bG9jaywgRURJRF9MRU5HVEgsIGZhbHNlKTsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
