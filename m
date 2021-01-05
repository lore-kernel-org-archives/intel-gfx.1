Return-Path: <SRS0=Zd9y=GI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A50C433E6
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 15:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6E322BF3
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 15:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6E322BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EED36E15F;
	Tue,  5 Jan 2021 15:45:41 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AEC6E147
 for <intel-gfx@lists.freedesktop.org>; Tue,  5 Jan 2021 15:45:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  5 Jan 2021 16:35:44 +0100
Message-Id: <20210105153558.134272-51-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.30.0.rc1
In-Reply-To: <20210105153558.134272-1-maarten.lankhorst@linux.intel.com>
References: <20210105153558.134272-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 50/64] drm/i915/selftests: Prepare
 igt_gem_utils for obj->mm.lock removal
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

aWd0X2VtaXRfc3RvcmVfZHcgbmVlZHMgdG8gdXNlIHRoZSB1bmxvY2tlZCB2ZXJzaW9uLCBhcyBp
dCdzIG5vdApob2xkaW5nIGEgbG9jay4gVGhpcyBmaXhlcyBpZ3RfZ3B1X2ZpbGxfZHcoKSB3aGlj
aCBpcyB1c2VkIGJ5CnNvbWUgb3RoZXIgc2VsZnRlc3RzLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2lndF9nZW1fdXRpbHMuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaWd0X2dlbV91dGls
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pZ3RfZ2VtX3V0aWxzLmMK
aW5kZXggZDY3ODMwNjFiYzcyLi4wYjA5MmM2MmJiMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaWd0X2dlbV91dGlscy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaWd0X2dlbV91dGlscy5jCkBAIC01NSw3ICs1NSw3IEBA
IGlndF9lbWl0X3N0b3JlX2R3KHN0cnVjdCBpOTE1X3ZtYSAqdm1hLAogCWlmIChJU19FUlIob2Jq
KSkKIAkJcmV0dXJuIEVSUl9DQVNUKG9iaik7CiAKLQljbWQgPSBpOTE1X2dlbV9vYmplY3RfcGlu
X21hcChvYmosIEk5MTVfTUFQX1dDKTsKKwljbWQgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91
bmxvY2tlZChvYmosIEk5MTVfTUFQX1dDKTsKIAlpZiAoSVNfRVJSKGNtZCkpIHsKIAkJZXJyID0g
UFRSX0VSUihjbWQpOwogCQlnb3RvIGVycjsKLS0gCjIuMzAuMC5yYzEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
