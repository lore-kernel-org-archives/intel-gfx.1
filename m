Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47928C2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 18:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1A6238E6
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 18:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1A6238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4D89FA9;
	Tue, 17 Nov 2020 18:51:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204D89FE8
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 18:50:54 +0000 (UTC)
IronPort-SDR: fex/g6awPwmoIpla0Ty5qGE3xbKqwqZya6xAEt1EAFqoipOv7Amfa5PxgzLlc2WhfW+TtcOI2B
 b9Kdkyc/ig9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168412302"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="168412302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:50:53 -0800
IronPort-SDR: SS2YA8BIhbZKxHAEYgmyU3ViorTZbccwRixM+VBitCm2Gec16M2OV9mhJeBI5G5vgpGIpS5Qhj
 DKxZPqchz88w==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="340996913"
Received: from ankithac-mobl1.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.254.101.215])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:50:53 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2020 10:50:27 -0800
Message-Id: <20201117185029.22078-20-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117185029.22078-1-aditya.swarup@intel.com>
References: <20201117185029.22078-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 19/21] drm/i915/display: Add
 HAS_D12_PLANE_MINIMIZATION
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgotIEFz
IFJLTCBhbmQgQURMLVMgb25seSBoYXZlIDUgcGxhbmVzLCBwcmltYXJ5IGFuZCA0IHNwcml0ZXMg
YW5kCiAgdGhlIGN1cnNvciBwbGFuZSwgbGV0J3MgZ3JvdXAgdGhlIGhhbmRsaW5nIHRvZ2V0aGVy
IHVuZGVyCiAgSEFTX0QxMl9QTEFORV9NSU5JTUlaQVRJT04uCi0gQWxzbyB1c2UgbWFjcm8gdG8g
c2VsZWN0IHBpcGUgaXJxIGZhdWx0IGVycm9yIG1hc2suCgpCU3BlYzogNDkyNTEKQ2M6IEx1Y2Fz
IERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpDYzogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBN
YXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWRpdHlhIFN3YXJ1cCA8YWRpdHlhLnN3YXJ1cEBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmggICAgICAgICAgICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9pcnEuYyAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2RldmljZV9pbmZvLmMgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Nwcml0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9z
cHJpdGUuYwppbmRleCAxZTk1NGUyOTI4ZmUuLmY2NWZkOTM3YmM1NSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCkBAIC0zNTEsNyArMzUxLDcgQEAgaW50
IGludGVsX3BsYW5lX2NoZWNrX3NyY19jb29yZGluYXRlcyhzdHJ1Y3QgaW50ZWxfcGxhbmVfc3Rh
dGUgKnBsYW5lX3N0YXRlKQogCiBzdGF0aWMgdTggaWNsX252MTJfeV9wbGFuZV9tYXNrKHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICppOTE1KQogewotCWlmIChJU19ST0NLRVRMQUtFKGk5MTUpKQor
CWlmIChIQVNfRDEyX1BMQU5FX01JTklNSVpBVElPTihpOTE1KSkKIAkJcmV0dXJuIEJJVChQTEFO
RV9TUFJJVEUyKSB8IEJJVChQTEFORV9TUFJJVEUzKTsKIAllbHNlCiAJCXJldHVybiBCSVQoUExB
TkVfU1BSSVRFNCkgfCBCSVQoUExBTkVfU1BSSVRFNSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaApp
bmRleCA4MTdhNTEwMmI5NGYuLmY4ZDYxNzg1NjAwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5o
CkBAIC0xNzcwLDYgKzE3NzAsOSBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGk5MTVfcmV2X3N0ZXBw
aW5ncyBhZGxzX3Jldmlkc1tdOwogI2RlZmluZSBJTlRFTF9ESVNQTEFZX0VOQUJMRUQoZGV2X3By
aXYpIFwKIAkoZHJtX1dBUk5fT04oJihkZXZfcHJpdiktPmRybSwgIUhBU19ESVNQTEFZKGRldl9w
cml2KSksICEoZGV2X3ByaXYpLT5wYXJhbXMuZGlzYWJsZV9kaXNwbGF5KQogCisjZGVmaW5lIEhB
U19EMTJfUExBTkVfTUlOSU1JWkFUSU9OKGRldl9wcml2KSAoSVNfUk9DS0VUTEFLRShkZXZfcHJp
dikgfHwgXAorCQkJCQkgICAgICBJU19BTERFUkxBS0VfUyhkZXZfcHJpdikpCisKIHN0YXRpYyBp
bmxpbmUgYm9vbCBpbnRlbF92dGRfYWN0aXZlKHZvaWQpCiB7CiAjaWZkZWYgQ09ORklHX0lOVEVM
X0lPTU1VCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYwppbmRleCA3NThlZDRmNmM5ZjMuLmUzOWRiMzlj
ZDc5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jCkBAIC0yMjQ2LDcgKzIyNDYsNyBAQCBzdGF0
aWMgdTMyIGdlbjhfZGVfcG9ydF9hdXhfbWFzayhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYpCiAKIHN0YXRpYyB1MzIgZ2VuOF9kZV9waXBlX2ZhdWx0X21hc2soc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogewotCWlmIChJU19ST0NLRVRMQUtFKGRldl9wcml2KSkK
KwlpZiAoSEFTX0QxMl9QTEFORV9NSU5JTUlaQVRJT04oZGV2X3ByaXYpKQogCQlyZXR1cm4gUktM
X0RFX1BJUEVfSVJRX0ZBVUxUX0VSUk9SUzsKIAllbHNlIGlmIChJTlRFTF9HRU4oZGV2X3ByaXYp
ID49IDExKQogCQlyZXR1cm4gR0VOMTFfREVfUElQRV9JUlFfRkFVTFRfRVJST1JTOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGV2aWNlX2luZm8uYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9pbmZvLmMKaW5kZXggNjRhMDk5NTRmZDU0Li40OWQ1
ZGFjMzRkNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9p
bmZvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGV2aWNlX2luZm8uYwpAQCAt
NDA5LDcgKzQwOSw3IEBAIHZvaWQgaW50ZWxfZGV2aWNlX2luZm9fcnVudGltZV9pbml0KHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAogCUJVSUxEX0JVR19PTihCSVRTX1BFUl9U
WVBFKGludGVsX2VuZ2luZV9tYXNrX3QpIDwgSTkxNV9OVU1fRU5HSU5FUyk7CiAKLQlpZiAoSVNf
Uk9DS0VUTEFLRShkZXZfcHJpdikpCisJaWYgKEhBU19EMTJfUExBTkVfTUlOSU1JWkFUSU9OKGRl
dl9wcml2KSkKIAkJZm9yX2VhY2hfcGlwZShkZXZfcHJpdiwgcGlwZSkKIAkJCXJ1bnRpbWUtPm51
bV9zcHJpdGVzW3BpcGVdID0gNDsKIAllbHNlIGlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEx
KQotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
