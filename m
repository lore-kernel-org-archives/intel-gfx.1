Return-Path: <SRS0=YXNx=ED=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F591C4363A
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2020 21:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07FEE24842
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2020 21:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07FEE24842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C35E6E5BE;
	Wed, 28 Oct 2020 21:34:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F676E5BB
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 21:34:11 +0000 (UTC)
IronPort-SDR: YIxQb5XdtT3m0gAm0KtCd9WC7iIk1t6BF0SrvSAm3ONj8r3IgcyrHL4lbB63RRC8csZPdwZ6a7
 DNjsZOEJZfSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="155310558"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="155310558"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 14:34:10 -0700
IronPort-SDR: zaDbVYOaMxEcrhtt0dMTEKqL/MEvS/JvCo1VzfGlywbCytsBWuIegKjZmV+57kYN3RBlTlmTaB
 xHekQoOVXBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="334889061"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 28 Oct 2020 14:34:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Oct 2020 23:34:07 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Oct 2020 23:33:19 +0200
Message-Id: <20201028213323.5423-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028213323.5423-1-ville.syrjala@linux.intel.com>
References: <20201028213323.5423-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 15/19] drm/i915: Rename 'tmp_mask'
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhpcyBzaWxseSB0bXBfbWFzayB3aXRoIGhvdHBsdWdfdHJpZ2dlci90ZV90cmlnZ2Vy
CndoZXJlIGFwcHJvcHJpYXRlLgoKUmV2aWV3ZWQtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
aXJxLmMgfCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKaW5kZXgg
M2ZmNTc0N2U3NTVkLi43ODhlMzIwOThkM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYwpAQCAt
MjM4Niw3ICsyMzg2LDYgQEAgZ2VuOF9kZV9pcnFfaGFuZGxlcihzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqZGV2X3ByaXYsIHUzMiBtYXN0ZXJfY3RsKQogCWlmIChtYXN0ZXJfY3RsICYgR0VOOF9E
RV9QT1JUX0lSUSkgewogCQlpaXIgPSBJOTE1X1JFQUQoR0VOOF9ERV9QT1JUX0lJUik7CiAJCWlm
IChpaXIpIHsKLQkJCXUzMiB0bXBfbWFzazsKIAkJCWJvb2wgZm91bmQgPSBmYWxzZTsKIAogCQkJ
STkxNV9XUklURShHRU44X0RFX1BPUlRfSUlSLCBpaXIpOwpAQCAtMjM5OCwxNSArMjM5NywxNyBA
QCBnZW44X2RlX2lycV9oYW5kbGVyKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwg
dTMyIG1hc3Rlcl9jdGwpCiAJCQl9CiAKIAkJCWlmIChJU19HRU45X0xQKGRldl9wcml2KSkgewot
CQkJCXRtcF9tYXNrID0gaWlyICYgQlhUX0RFX1BPUlRfSE9UUExVR19NQVNLOwotCQkJCWlmICh0
bXBfbWFzaykgewotCQkJCQlieHRfaHBkX2lycV9oYW5kbGVyKGRldl9wcml2LCB0bXBfbWFzayk7
CisJCQkJdTMyIGhvdHBsdWdfdHJpZ2dlciA9IGlpciAmIEJYVF9ERV9QT1JUX0hPVFBMVUdfTUFT
SzsKKworCQkJCWlmIChob3RwbHVnX3RyaWdnZXIpIHsKKwkJCQkJYnh0X2hwZF9pcnFfaGFuZGxl
cihkZXZfcHJpdiwgaG90cGx1Z190cmlnZ2VyKTsKIAkJCQkJZm91bmQgPSB0cnVlOwogCQkJCX0K
IAkJCX0gZWxzZSBpZiAoSVNfQlJPQURXRUxMKGRldl9wcml2KSkgewotCQkJCXRtcF9tYXNrID0g
aWlyICYgQkRXX0RFX1BPUlRfSE9UUExVR19NQVNLOwotCQkJCWlmICh0bXBfbWFzaykgewotCQkJ
CQlpbGtfaHBkX2lycV9oYW5kbGVyKGRldl9wcml2LCB0bXBfbWFzayk7CisJCQkJdTMyIGhvdHBs
dWdfdHJpZ2dlciA9IGlpciAmIEJEV19ERV9QT1JUX0hPVFBMVUdfTUFTSzsKKworCQkJCWlmICho
b3RwbHVnX3RyaWdnZXIpIHsKKwkJCQkJaWxrX2hwZF9pcnFfaGFuZGxlcihkZXZfcHJpdiwgaG90
cGx1Z190cmlnZ2VyKTsKIAkJCQkJZm91bmQgPSB0cnVlOwogCQkJCX0KIAkJCX0KQEAgLTI0MTcs
OSArMjQxOCwxMCBAQCBnZW44X2RlX2lycV9oYW5kbGVyKHN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICpkZXZfcHJpdiwgdTMyIG1hc3Rlcl9jdGwpCiAJCQl9CiAKIAkJCWlmIChJTlRFTF9HRU4oZGV2
X3ByaXYpID49IDExKSB7Ci0JCQkJdG1wX21hc2sgPSBpaXIgJiAoRFNJMF9URSB8IERTSTFfVEUp
OwotCQkJCWlmICh0bXBfbWFzaykgewotCQkJCQlnZW4xMV9kc2lfdGVfaW50ZXJydXB0X2hhbmRs
ZXIoZGV2X3ByaXYsIHRtcF9tYXNrKTsKKwkJCQl1MzIgdGVfdHJpZ2dlciA9IGlpciAmIChEU0kw
X1RFIHwgRFNJMV9URSk7CisKKwkJCQlpZiAodGVfdHJpZ2dlcikgeworCQkJCQlnZW4xMV9kc2lf
dGVfaW50ZXJydXB0X2hhbmRsZXIoZGV2X3ByaXYsIHRlX3RyaWdnZXIpOwogCQkJCQlmb3VuZCA9
IHRydWU7CiAJCQkJfQogCQkJfQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1nZngK
