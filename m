Return-Path: <SRS0=ktOb=HY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AB1C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 19:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 664996186A
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 19:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 664996186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E762A6E193;
	Mon, 22 Feb 2021 19:04:26 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5452E6E193
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 19:04:26 +0000 (UTC)
IronPort-SDR: w3N3PdKEPW+FZw29IkvZvw4Y7HK+GNd59qoqH0OpCsajCQD/ZvdK1KyzQ3GNRBtosumVXlp0+Z
 XIsNQ082EYDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="203962661"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="203962661"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 11:04:24 -0800
IronPort-SDR: xS70y8s30vTm0xABKlSwUjsrWEO+JkzZ6YU7q2keBLjfx0EUUmDkkcfevlnUscBojgLlH8FV0b
 n1frd8i8WQyw==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="514894182"
Received: from helsinki.fi.intel.com ([10.237.66.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 11:04:20 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 22 Feb 2021 21:05:28 +0200
Message-Id: <20210222190528.1591188-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2] drm/i915/display: Do not allow DC3CO if PSR
 SF is enabled
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

RXZlbiB0aG91Z2ggR0VOMTIrIEhXIHN1cHBvcnRzIFBTUiArIERDM0NPLCBETUMncyBIVyBEQzND
TyBleGl0IG1lY2hhbmlzbQpoYXMgYW4gaXNzdWUgd2l0aCB1c2luZyBvZiBTZWxlY3RpdmUgRmVj
dGggYW5kIFBTUjIgbWFudWFsIHRyYWNraW5nLgpBbmQgYXMgc29tZSBHRU4xMisgcGxhdGZvcm1z
IChSS0wsIEFETC1TKSBkb24ndCBzdXBwb3J0IFBTUjIgSFcgdHJhY2tpbmcsClNlbGVjdGl2ZSBG
ZXRjaCB3aWxsIGJlIGVuYWJsZWQgYnkgZGVmYXVsdCBvbiB0aGF0IHBsYXRmb3Jtcy4KVGhlcmVm
b3JlIGlmIHRoZSBzeXN0ZW0gZW5hYmxlcyBQU1IgU2VsZWN0aXZlIEZldGNoIC8gUFNSIG1hbnVh
bCB0cmFja2luZywKaXQgZG9lcyBub3QgYWxsb3cgREMzQ08gZGMgc3RhdGUsIGluIHRoYXQgY2Fz
ZS4KCldoZW4gdGhpcyBEQzNDTyBleGl0IGlzc3VlIGlzIGFkZHJlc3NlZCB3aGlsZSBQU1IgU2Vs
ZWN0aXZlIEZldGNoIGlzCmVuYWJsZWQsIHRoaXMgcmVzdHJpY3Rpb24gc2hvdWxkIGJlIHJlbW92
ZWQuCgpDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNj
OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8IDggKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3Bzci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9wc3IuYwppbmRleCA3YzZlNTYxZjg2YzEuLjczNzBkZTk3ZTU5OSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jCkBAIC02NTQsNiArNjU0LDE0IEBAIHRnbF9kYzNj
b19leGl0bGluZV9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAogCXN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOwog
CXUzMiBleGl0X3NjYW5saW5lczsKIAorCS8qCisJICogRE1DJ3MgREMzQ08gZXhpdCBtZWNoYW5p
c20gaGFzIGFuIGlzc3VlIHdpdGggU2VsZWN0aXZlIEZlY3RoCisJICogVE9ETzogd2hlbiB0aGUg
aXNzdWUgaXMgYWRkcmVzc2VkLCB0aGlzIHJlc3RyaWN0aW9uIHNob3VsZCBiZSByZW1vdmVkLgor
CSAqLworCWlmIChkZXZfcHJpdi0+cGFyYW1zLmVuYWJsZV9wc3IyX3NlbF9mZXRjaCB8fAorCSAg
ICBpbnRlbF9kcC0+cHNyLmRlYnVnID09IEk5MTVfUFNSX0RFQlVHX0VOQUJMRV9TRUxfRkVUQ0gp
CisJCXJldHVybjsKKwogCWlmICghKGRldl9wcml2LT5jc3IuYWxsb3dlZF9kY19tYXNrICYgRENf
U1RBVEVfRU5fREMzQ08pKQogCQlyZXR1cm47CiAKLS0gCjIuMzAuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
