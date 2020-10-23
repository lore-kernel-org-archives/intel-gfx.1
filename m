Return-Path: <SRS0=RNxq=D6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEE4C388F9
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 13:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86540208FE
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 13:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86540208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47B16F884;
	Fri, 23 Oct 2020 13:35:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDB36F884
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 13:35:24 +0000 (UTC)
IronPort-SDR: V2sSqlXJEj1r+0duY2PjQk1fp3Gvbc7bYvaoZ87ccWEYJHQ5azjtygtI3+Go8gfGa5bVCN8cDp
 3cyFs0A1FWTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="167770178"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="167770178"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 06:35:24 -0700
IronPort-SDR: w1jU/yJEjgZzXcfRMnKDjkxWTcf0XeZnbD1zyzDk/34IJRL5/fT3p1LFc0fzvuM1Vnuqu0HwgG
 TXdo07hemeOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="333306251"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 23 Oct 2020 06:35:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Oct 2020 16:35:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 23 Oct 2020 16:34:19 +0300
Message-Id: <20201023133420.12039-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023133420.12039-1-ville.syrjala@linux.intel.com>
References: <20201023133420.12039-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 18/19] drm/i915: Use GEN3_IRQ_INIT() to init
 south interrupts in icp+
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk5v
IHJlYXNvbiBub3QgdG8gdXNlIEdFTjNfSVJRX0lOSVQoKSBvbiBpY3ArLgoKU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEu
YwppbmRleCAwNGE2ZjMyMjExMGQuLmI0ZWRkZjQ5YTYyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2ly
cS5jCkBAIC0zNzEzLDE0ICszNzEzLDEwIEBAIHN0YXRpYyB2b2lkIGdlbjhfaXJxX3Bvc3RpbnN0
YWxsKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAogc3RhdGljIHZvaWQgaWNw
X2lycV9wb3N0aW5zdGFsbChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCiB7CisJ
c3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlID0gJmRldl9wcml2LT51bmNvcmU7CiAJdTMyIG1h
c2sgPSBTREVfR01CVVNfSUNQOwogCi0JZHJtX1dBUk5fT04oJmRldl9wcml2LT5kcm0sIEk5MTVf
UkVBRChTREVJRVIpICE9IDApOwotCUk5MTVfV1JJVEUoU0RFSUVSLCAweGZmZmZmZmZmKTsKLQlQ
T1NUSU5HX1JFQUQoU0RFSUVSKTsKLQotCWdlbjNfYXNzZXJ0X2lpcl9pc196ZXJvKCZkZXZfcHJp
di0+dW5jb3JlLCBTREVJSVIpOwotCUk5MTVfV1JJVEUoU0RFSU1SLCB+bWFzayk7CisJR0VOM19J
UlFfSU5JVCh1bmNvcmUsIFNERSwgfm1hc2ssIDB4ZmZmZmZmZmYpOwogfQogCiBzdGF0aWMgdm9p
ZCBnZW4xMV9pcnFfcG9zdGluc3RhbGwoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2
KQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
