Return-Path: <SRS0=0RYq=D5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F34C388F7
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 11:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7752227F
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 11:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7752227F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03BC6E037;
	Thu, 22 Oct 2020 11:43:01 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2F06E037
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 11:42:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22774043-1500050 
 for multiple; Thu, 22 Oct 2020 12:42:49 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Oct 2020 12:42:46 +0100
Message-Id: <20201022114246.28566-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022071637.17240-1-chris@chris-wilson.co.uk>
References: <20201022071637.17240-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Reset the interrupt mask on disabling
 interrupts
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

QXMgd2UgZGlzYWJsZSB0aGUgaW50ZXJydXB0IGR1cmluZyBzdXNwZW5kLCBhbHNvIHJlc2V0IHRo
ZSBpcnFfbWFzayB0bwpzaG9ydC1jaXJjdWl0IHN1YnN5c3RlbXMgdGhhdCBsYXRlciB0cnkgdG8g
dHVybiBvZmYgdGhlaXIgaW50ZXJydXB0CnNvdXJjZS4KCjw0PlsgIDEwMS44MTY3MzBdIGk5MTUg
MDAwMDowMDowMi4wOiBkcm1fV0FSTl9PTighaW50ZWxfaXJxc19lbmFibGVkKGRldl9wcml2KSkK
PDQ+WyAgMTAxLjgxNjg1M10gV0FSTklORzogQ1BVOiAzIFBJRDogNDI0MSBhdCBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2lycS5jOjM0MyBpbGtfdXBkYXRlX2Rpc3BsYXlfaXJxKzB4YjMvMHgx
MzAgW2k5MTVdCgp2MjogUmVzZXQgaXJxX21hc2sgZm9yIGk4eHhfaXJxX3Jlc2V0IGFzIHdlbGws
IGFuZCBzcGxpdCBwYXRjaCB0byBmb2N1cwpvbiBvbmx5IGk5MTUtPmlycV9tYXNrCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9pcnEuYyB8IDEyICsrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYwpp
bmRleCAwOTIyMWNhMWZmYjIuLjUzZTY3Yzc5NmQwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5j
CkBAIC0zMzcsMTcgKzMzNywxNCBAQCB2b2lkIGlsa191cGRhdGVfZGlzcGxheV9pcnEoc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAogCXUzMiBuZXdfdmFsOwogCiAJbG9ja2RlcF9h
c3NlcnRfaGVsZCgmZGV2X3ByaXYtPmlycV9sb2NrKTsKLQogCWRybV9XQVJOX09OKCZkZXZfcHJp
di0+ZHJtLCBlbmFibGVkX2lycV9tYXNrICYgfmludGVycnVwdF9tYXNrKTsKIAotCWlmIChkcm1f
V0FSTl9PTigmZGV2X3ByaXYtPmRybSwgIWludGVsX2lycXNfZW5hYmxlZChkZXZfcHJpdikpKQot
CQlyZXR1cm47Ci0KIAluZXdfdmFsID0gZGV2X3ByaXYtPmlycV9tYXNrOwogCW5ld192YWwgJj0g
fmludGVycnVwdF9tYXNrOwogCW5ld192YWwgfD0gKH5lbmFibGVkX2lycV9tYXNrICYgaW50ZXJy
dXB0X21hc2spOwogCi0JaWYgKG5ld192YWwgIT0gZGV2X3ByaXYtPmlycV9tYXNrKSB7CisJaWYg
KG5ld192YWwgIT0gZGV2X3ByaXYtPmlycV9tYXNrICYmCisJICAgICFkcm1fV0FSTl9PTigmZGV2
X3ByaXYtPmRybSwgIWludGVsX2lycXNfZW5hYmxlZChkZXZfcHJpdikpKSB7CiAJCWRldl9wcml2
LT5pcnFfbWFzayA9IG5ld192YWw7CiAJCUk5MTVfV1JJVEUoREVJTVIsIGRldl9wcml2LT5pcnFf
bWFzayk7CiAJCVBPU1RJTkdfUkVBRChERUlNUik7CkBAIC0yOTUxLDYgKzI5NDgsOCBAQCBzdGF0
aWMgdm9pZCBpbGtfaXJxX3Jlc2V0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikK
IAlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSAmZGV2X3ByaXYtPnVuY29yZTsKIAogCUdF
TjNfSVJRX1JFU0VUKHVuY29yZSwgREUpOworCWRldl9wcml2LT5pcnFfbWFzayA9IH4wdTsKKwog
CWlmIChJU19HRU4oZGV2X3ByaXYsIDcpKQogCQlpbnRlbF91bmNvcmVfd3JpdGUodW5jb3JlLCBH
RU43X0VSUl9JTlQsIDB4ZmZmZmZmZmYpOwogCkBAIC0zNjk1LDYgKzM2OTQsNyBAQCBzdGF0aWMg
dm9pZCBpOHh4X2lycV9yZXNldChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCiAJ
aTl4eF9waXBlc3RhdF9pcnFfcmVzZXQoZGV2X3ByaXYpOwogCiAJR0VOMl9JUlFfUkVTRVQodW5j
b3JlKTsKKwlkZXZfcHJpdi0+aXJxX21hc2sgPSB+MHU7CiB9CiAKIHN0YXRpYyB2b2lkIGk4eHhf
aXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKQEAgLTM4
NjQsNiArMzg2NCw3IEBAIHN0YXRpYyB2b2lkIGk5MTVfaXJxX3Jlc2V0KHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdikKIAlpOXh4X3BpcGVzdGF0X2lycV9yZXNldChkZXZfcHJpdik7
CiAKIAlHRU4zX0lSUV9SRVNFVCh1bmNvcmUsIEdFTjJfKTsKKwlkZXZfcHJpdi0+aXJxX21hc2sg
PSB+MHU7CiB9CiAKIHN0YXRpYyB2b2lkIGk5MTVfaXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICpkZXZfcHJpdikKQEAgLTM5NzAsNiArMzk3MSw3IEBAIHN0YXRpYyB2b2lk
IGk5NjVfaXJxX3Jlc2V0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAlpOXh4
X3BpcGVzdGF0X2lycV9yZXNldChkZXZfcHJpdik7CiAKIAlHRU4zX0lSUV9SRVNFVCh1bmNvcmUs
IEdFTjJfKTsKKwlkZXZfcHJpdi0+aXJxX21hc2sgPSB+MHU7CiB9CiAKIHN0YXRpYyB2b2lkIGk5
NjVfaXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
