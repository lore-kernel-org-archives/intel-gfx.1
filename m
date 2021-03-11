Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D06C43331
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 13:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1166A64F98
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1166A64F98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FFF6ECC3;
	Thu, 11 Mar 2021 13:49:11 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117676EC97
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 13:48:57 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 14:42:24 +0100
Message-Id: <20210311134249.588632-45-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311134249.588632-1-maarten.lankhorst@linux.intel.com>
References: <20210311134249.588632-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v8 44/69] drm/i915/selftests: Prepare context
 tests for obj->mm.lock removal.
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

U3RyYWlnaHRmb3J3YXJkIGNvbnZlcnNpb24sIGp1c3QgY29udmVydCBhIGJ1bmNoIG9mIGNhbGxz
IHRvCnVubG9ja2VkIHZlcnNpb25zLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2NvbnRleHQuYyB8IDEwICsrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9j
b250ZXh0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2Nv
bnRleHQuYwppbmRleCBkZjk0OTMyMGYyYjUuLjgyZDVkMzdlOWI2NiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb250ZXh0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb250ZXh0LmMKQEAg
LTEwOTIsNyArMTA5Miw3IEBAIF9fcmVhZF9zbGljZV9jb3VudChzdHJ1Y3QgaW50ZWxfY29udGV4
dCAqY2UsCiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKLQlidWYgPSBpOTE1X2dlbV9v
YmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dCKTsKKwlidWYgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX21hcF91bmxvY2tlZChvYmosIEk5MTVfTUFQX1dCKTsKIAlpZiAoSVNfRVJSKGJ1ZikpIHsK
IAkJcmV0ID0gUFRSX0VSUihidWYpOwogCQlyZXR1cm4gcmV0OwpAQCAtMTUwOSw3ICsxNTA5LDcg
QEAgc3RhdGljIGludCB3cml0ZV90b19zY3JhdGNoKHN0cnVjdCBpOTE1X2dlbV9jb250ZXh0ICpj
dHgsCiAJaWYgKElTX0VSUihvYmopKQogCQlyZXR1cm4gUFRSX0VSUihvYmopOwogCi0JY21kID0g
aTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJY21kID0gaTkxNV9n
ZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQik7CiAJaWYgKElTX0VS
UihjbWQpKSB7CiAJCWVyciA9IFBUUl9FUlIoY21kKTsKIAkJZ290byBvdXQ7CkBAIC0xNjIwLDcg
KzE2MjAsNyBAQCBzdGF0aWMgaW50IHJlYWRfZnJvbV9zY3JhdGNoKHN0cnVjdCBpOTE1X2dlbV9j
b250ZXh0ICpjdHgsCiAJCWlmIChlcnIpCiAJCQlnb3RvIG91dF92bTsKIAotCQljbWQgPSBpOTE1
X2dlbV9vYmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dDKTsKKwkJY21kID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQyk7CiAJCWlmIChJU19FUlIo
Y21kKSkgewogCQkJZXJyID0gUFRSX0VSUihjbWQpOwogCQkJZ290byBvdXQ7CkBAIC0xNjU2LDcg
KzE2NTYsNyBAQCBzdGF0aWMgaW50IHJlYWRfZnJvbV9zY3JhdGNoKHN0cnVjdCBpOTE1X2dlbV9j
b250ZXh0ICpjdHgsCiAJCWlmIChlcnIpCiAJCQlnb3RvIG91dF92bTsKIAotCQljbWQgPSBpOTE1
X2dlbV9vYmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dDKTsKKwkJY21kID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQyk7CiAJCWlmIChJU19FUlIo
Y21kKSkgewogCQkJZXJyID0gUFRSX0VSUihjbWQpOwogCQkJZ290byBvdXQ7CkBAIC0xNzE1LDcg
KzE3MTUsNyBAQCBzdGF0aWMgaW50IHJlYWRfZnJvbV9zY3JhdGNoKHN0cnVjdCBpOTE1X2dlbV9j
b250ZXh0ICpjdHgsCiAJfQogCWk5MTVfcmVxdWVzdF9wdXQocnEpOwogCi0JY21kID0gaTkxNV9n
ZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQyk7CisJY21kID0gaTkxNV9nZW1fb2Jq
ZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQyk7CiAJaWYgKElTX0VSUihjbWQp
KSB7CiAJCWVyciA9IFBUUl9FUlIoY21kKTsKIAkJZ290byBvdXRfdm07Ci0tIAoyLjMwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
