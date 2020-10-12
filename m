Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BF1C43457
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 21:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEDA214DB
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 21:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEDA214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57F96E7DA;
	Mon, 12 Oct 2020 21:30:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4815A6E7E2
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 21:30:56 +0000 (UTC)
IronPort-SDR: V7cys57Kk/pPYYZWWFmcw7di3KNvlBdTVGIc8Om/b5OMWb54GHbqrSZe9DeRsrTkESb4WoqSZt
 A9ke6O+3tzlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="163169622"
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="163169622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 14:30:55 -0700
IronPort-SDR: SiBoHxsz8+hQG64QbbDe9YXtjnUfnuIaOA5GVqPHPKjIVoUh2epMfRCe/+gIsrF1PWJLhQDpsC
 u2o7qCuCsr8g==
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="463244992"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 14:30:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Oct 2020 14:29:52 -0700
Message-Id: <20201012212959.871513-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012212959.871513-1-lucas.demarchi@intel.com>
References: <20201012212959.871513-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 08/15] drm/i915/dg1: invert HPD pins
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

RnJvbTogQ2xpbnRvbiBBIFRheWxvciA8Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+CgpIUEQg
cGlucyBhcmUgaW52ZXJ0ZWQgZm9yIERHMSBwbGF0Zm9ybS4KCkJzcGVjOiA0OTk1NgpDYzogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNjOiBNYXR0IFJvcGVy
IDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbGludG9uIEEgVGF5
bG9yIDxjbGludG9uLmEudGF5bG9yQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEx1Y2FzIERlIE1h
cmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBN
YXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2lycS5jIHwgOSArKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVn
LmggfCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2lycS5jCmluZGV4IDBkNmU0ODk0YjUwNS4uZDc2OTc0ZDk1N2IzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfaXJxLmMKQEAgLTMyODgsNiArMzI4OCwxNSBAQCBzdGF0aWMgdm9pZCBqc3BfaHBk
X2lycV9zZXR1cChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCiAKIHN0YXRpYyB2
b2lkIGRnMV9ocGRfaXJxX3NldHVwKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikK
IHsKKwl1MzIgdmFsOworCisJdmFsID0gSTkxNV9SRUFEKFNPVVRIX0NISUNLRU4xKTsKKwl2YWwg
fD0gKElOVkVSVF9ERElBX0hQRCB8CisJCUlOVkVSVF9ERElCX0hQRCB8CisJCUlOVkVSVF9ERElD
X0hQRCB8CisJCUlOVkVSVF9ERElEX0hQRCk7CisJSTkxNV9XUklURShTT1VUSF9DSElDS0VOMSwg
dmFsKTsKKwogCWljcF9ocGRfaXJxX3NldHVwKGRldl9wcml2LAogCQkJICBERzFfRERJX0hQRF9F
TkFCTEVfTUFTSywgMCk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X3JlZy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAppbmRleCBlN2YxYWFjNTUz
ZDAuLmE5NDNmMzY4MTllYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9y
ZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCkBAIC04Njk3LDYgKzg2
OTcsMTAgQEAgZW51bSB7CiAjZGVmaW5lIFNPVVRIX0NISUNLRU4xCQlfTU1JTygweGMyMDAwKQog
I2RlZmluZSAgRkRJQV9QSEFTRV9TWU5DX1NISUZUX09WUgkxOQogI2RlZmluZSAgRkRJQV9QSEFT
RV9TWU5DX1NISUZUX0VOCTE4CisjZGVmaW5lICBJTlZFUlRfRERJRF9IUEQJCQkoMSA8PCAxOCkK
KyNkZWZpbmUgIElOVkVSVF9ERElDX0hQRAkJCSgxIDw8IDE3KQorI2RlZmluZSAgSU5WRVJUX0RE
SUJfSFBECQkJKDEgPDwgMTYpCisjZGVmaW5lICBJTlZFUlRfRERJQV9IUEQJCQkoMSA8PCAxNSkK
ICNkZWZpbmUgIEZESV9QSEFTRV9TWU5DX09WUihwaXBlKSAoMSA8PCAoRkRJQV9QSEFTRV9TWU5D
X1NISUZUX09WUiAtICgocGlwZSkgKiAyKSkpCiAjZGVmaW5lICBGRElfUEhBU0VfU1lOQ19FTihw
aXBlKSAoMSA8PCAoRkRJQV9QSEFTRV9TWU5DX1NISUZUX0VOIC0gKChwaXBlKSAqIDIpKSkKICNk
ZWZpbmUgIEZESV9CQ19CSUZVUkNBVElPTl9TRUxFQ1QJKDEgPDwgMTIpCi0tIAoyLjI4LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
