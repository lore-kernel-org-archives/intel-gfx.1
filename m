Return-Path: <SRS0=4X9/=ER=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6373AC388F9
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2020 16:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2D920678
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2020 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2D920678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D47897E7;
	Wed, 11 Nov 2020 16:24:24 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82595891AA
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 16:24:23 +0000 (UTC)
IronPort-SDR: TlnmT2Z9p+RQDR65i1/ChMVcUyMnS90kxLWGOYQLzqMQLghVu4yiIaerUkWyqOSW0zU6eib9rA
 nOqC3Cc6ZrYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="231794934"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="231794934"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 08:24:22 -0800
IronPort-SDR: fbYlG9a3d53NNgvUQSuIYarzoSu8a4aicxhiAfTHoPPlxvoR+r/slHC3crnRSNWLd4QNGLBwu2
 bqbHXWxiEEiA==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="473909012"
Received: from rmarepal-mobl2.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.212.98.105])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 08:24:19 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 11 Nov 2020 08:24:07 -0800
Message-Id: <20201111162408.98002-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/display: Group DC9 mask set
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

REM5IGhhcyBhIHNlcGFyYXRlIEhXIGZsb3cgZnJvbSB0aGUgcmVzdCBvZiB0aGUgREMgc3RhdGVz
IGFuZCBpdCBpcwphdmFpbGFibGUgaW4gR0VOOSBMUCBwbGF0Zm9ybXMgYW5kIG9uIEdFTjExIGFu
ZCBuZXdlciwgc28gaGVyZQptb3ZpbmcgdGhlIGFzc2lnbm1lbnQgb2YgdGhlIG1hc2sgdG8gYSBz
aW5nbGUgY29uZGl0aW9uYWwgYmxvY2sgdG8Kc2ltcGxpZmx5IGNvZGUuCgpDYzogTHVjYXMgRGUg
TWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+CkNjOiBBbnVzaGEgU3JpdmF0c2EgPGFu
dXNoYS5zcml2YXRzYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUg
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMKaW5kZXggNjg5OTIy
NDgwNjYxLi40OGQ0MWE0M2ZiYjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5jCkBAIC00NDk3LDI2ICs0NDk3LDI0IEBAIHN0YXRp
YyB1MzIgZ2V0X2FsbG93ZWRfZGNfbWFzayhjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYsCiAJCQltYXhfZGMgPSAzOwogCQllbHNlCiAJCQltYXhfZGMgPSA0OwotCQkvKgot
CQkgKiBEQzkgaGFzIGEgc2VwYXJhdGUgSFcgZmxvdyBmcm9tIHRoZSByZXN0IG9mIHRoZSBEQyBz
dGF0ZXMsCi0JCSAqIG5vdCBkZXBlbmRpbmcgb24gdGhlIERNQyBmaXJtd2FyZS4gSXQncyBuZWVk
ZWQgYnkgc3lzdGVtCi0JCSAqIHN1c3BlbmQvcmVzdW1lLCBzbyBhbGxvdyBpdCB1bmNvbmRpdGlv
bmFsbHkuCi0JCSAqLwotCQltYXNrID0gRENfU1RBVEVfRU5fREM5OwogCX0gZWxzZSBpZiAoSVNf
R0VOKGRldl9wcml2LCAxMSkpIHsKIAkJbWF4X2RjID0gMjsKLQkJbWFzayA9IERDX1NUQVRFX0VO
X0RDOTsKIAl9IGVsc2UgaWYgKElTX0dFTihkZXZfcHJpdiwgMTApIHx8IElTX0dFTjlfQkMoZGV2
X3ByaXYpKSB7CiAJCW1heF9kYyA9IDI7Ci0JCW1hc2sgPSAwOwogCX0gZWxzZSBpZiAoSVNfR0VO
OV9MUChkZXZfcHJpdikpIHsKIAkJbWF4X2RjID0gMTsKLQkJbWFzayA9IERDX1NUQVRFX0VOX0RD
OTsKIAl9IGVsc2UgewogCQltYXhfZGMgPSAwOwotCQltYXNrID0gMDsKIAl9CiAKKwkvKgorCSAq
IERDOSBoYXMgYSBzZXBhcmF0ZSBIVyBmbG93IGZyb20gdGhlIHJlc3Qgb2YgdGhlIERDIHN0YXRl
cywKKwkgKiBub3QgZGVwZW5kaW5nIG9uIHRoZSBETUMgZmlybXdhcmUuIEl0J3MgbmVlZGVkIGJ5
IHN5c3RlbQorCSAqIHN1c3BlbmQvcmVzdW1lLCBzbyBhbGxvdyBpdCB1bmNvbmRpdGlvbmFsbHku
CisJICovCisJbWFzayA9IElTX0dFTjlfTFAoZGV2X3ByaXYpIHx8IElOVEVMX0dFTihkZXZfcHJp
dikgPj0gMTEgPworCSAgICAgICBEQ19TVEFURV9FTl9EQzkgOiAwOworCiAJaWYgKCFkZXZfcHJp
di0+cGFyYW1zLmRpc2FibGVfcG93ZXJfd2VsbCkKIAkJbWF4X2RjID0gMDsKIAotLSAKMi4yOS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
