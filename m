Return-Path: <SRS0=RAJW=CE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3642CC433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 02:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08FB520737
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 02:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08FB520737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83698892E2;
	Wed, 26 Aug 2020 02:57:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E50892E2
 for <Intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2020 02:57:29 +0000 (UTC)
IronPort-SDR: 6SCyoJi3jEKEZHjweGZyKslf+/LxKPHkPvy1mog6CDflzlrrnVu16uOLMLxS1oJA4KAze16VFL
 O0UCcayKUZwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136290162"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="136290162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 19:57:29 -0700
IronPort-SDR: P+FdHL9X7+TlbU81FTL+/c0offQniPOuO8FerH7SQmt/pAYRmcNb/ghyy/r0A8oaVQhqhFJwkl
 qB5gpTlKx3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="331638218"
Received: from dassapta-mobl.amr.corp.intel.com (HELO
 cataylo2-MOBL1.amr.corp.intel.com) ([10.255.230.108])
 by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2020 19:57:27 -0700
From: clinton.a.taylor@intel.com
To: Intel-gfx@lists.freedesktop.org
Date: Tue, 25 Aug 2020 19:57:24 -0700
Message-Id: <20200826025724.20944-1-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805232920.15085-1-clinton.a.taylor@intel.com>
References: <20200805232920.15085-1-clinton.a.taylor@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4] drm/i915/gt: Implement WA_1406941453
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

RnJvbTogQ2xpbnQgVGF5bG9yIDxjbGludG9uLmEudGF5bG9yQGludGVsLmNvbT4KCkVuYWJsZSBI
VyBEZWZhdWx0IGZsaXAgZm9yIHNtYWxsIFBMLgoKYnNwZWM6IDUyODkwCmJzcGVjOiA1MzUwOApi
c3BlYzogNTMyNzMKCnYyOiByZWJhc2UgdG8gZHJtLXRpcAp2MzogbW92ZSBmcm9tIGN0eCB0byBn
dCB3b3JrYXJvdW5kcy4gUmVtb3ZlIHdoaXRlbGlzdC4KdjQ6IG1vdmUgdG8gcmNzIFdBIGluaXQK
CkNjOiBNYXR0IEF0d29vZCA8bWF0dGhldy5zLmF0d29vZEBpbnRlbC5jb20+CkNjOiBNYXR0IFJv
cGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IENsaW50IFRheWxvciA8Y2xp
bnRvbi5hLnRheWxvckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfd29ya2Fyb3VuZHMuYyB8IDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9y
ZWcuaCAgICAgICAgICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF93b3JrYXJvdW5kcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfd29ya2Fyb3VuZHMuYwppbmRleCBhM2Y3
MmI3NWM2MWUuLmIwYTdjYjA1NjYzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfd29ya2Fyb3VuZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF93b3JrYXJvdW5kcy5jCkBAIC0xNzI1LDYgKzE3MjUsMTMgQEAgcmNzX2VuZ2luZV93YV9pbml0
KHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwgc3RydWN0IGk5MTVfd2FfbGlzdCAqd2Fs
KQogCQkJICAgICBGRl9ET1BfQ0xPQ0tfR0FURV9ESVNBQkxFKTsKIAl9CiAKKwlpZiAoSVNfR0VO
KGk5MTUsIDEyKSkgeworCQkvKiBXYV8xNDA2OTQxNDUzOmdlbjEyICovCisJCXdhX21hc2tlZF9l
bih3YWwsCisJCQkgICAgIEdFTjEwX1NBTVBMRVJfTU9ERSwKKwkJCSAgICAgRU5BQkxFX1NNQUxM
UEwpOworCX0KKwogCWlmIChJU19HRU4oaTkxNSwgMTEpKSB7CiAJCS8qIFRoaXMgaXMgbm90IGFu
IFdhLiBFbmFibGUgZm9yIGJldHRlciBpbWFnZSBxdWFsaXR5ICovCiAJCXdhX21hc2tlZF9lbih3
YWwsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAppbmRleCBhYzY5MTkyN2UyOWQuLmFiNGIxYWJkNDM2
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCkBAIC05MzE1LDYgKzkzMTUsNyBAQCBlbnVtIHsK
ICNkZWZpbmUgICBHRU4xMV9MU05fVU5TTENWQ19HQUZTX0hBTEZfU0ZfTUFYQUxMT0MJKDEgPDwg
NykKIAogI2RlZmluZSBHRU4xMF9TQU1QTEVSX01PREUJCV9NTUlPKDB4RTE4QykKKyNkZWZpbmUg
ICBFTkFCTEVfU01BTExQTAkJCVJFR19CSVQoMTUpCiAjZGVmaW5lICAgR0VOMTFfU0FNUExFUl9F
TkFCTEVfSEVBRExFU1NfTVNHCVJFR19CSVQoNSkKIAogLyogSVZZQlJJREdFIERQRiAqLwotLSAK
Mi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJ
bnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
