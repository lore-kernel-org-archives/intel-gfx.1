Return-Path: <SRS0=W/nN=E7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441D7C8300B
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 10:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B572063A
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 10:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B572063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0536E91F;
	Wed, 25 Nov 2020 10:40:37 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826F06E8B2
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 10:40:31 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 25 Nov 2020 11:40:00 +0100
Message-Id: <20201125104011.606641-53-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8
In-Reply-To: <20201125104011.606641-1-maarten.lankhorst@linux.intel.com>
References: <20201125104011.606641-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v5 52/63] drm/i915/selftests: Prepare hangcheck
 for obj->mm.lock removal
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

Q29udmVydCBhIGZldyBjYWxscyB0byB1c2UgdGhlIHVubG9ja2VkIHZlcnNpb25zLgoKU2lnbmVk
LW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9oYW5n
Y2hlY2suYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRl
c3RfaGFuZ2NoZWNrLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9oYW5nY2hl
Y2suYwppbmRleCBmYjVlYmY5MzBhYjIuLmUzMDI3Y2ViYWI1YiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNrLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNrLmMKQEAgLTgwLDE1ICs4MCwxNSBAQCBzdGF0
aWMgaW50IGhhbmdfaW5pdChzdHJ1Y3QgaGFuZyAqaCwgc3RydWN0IGludGVsX2d0ICpndCkKIAl9
CiAKIAlpOTE1X2dlbV9vYmplY3Rfc2V0X2NhY2hlX2NvaGVyZW5jeShoLT5od3MsIEk5MTVfQ0FD
SEVfTExDKTsKLQl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKGgtPmh3cywgSTkxNV9N
QVBfV0IpOworCXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQoaC0+aHdz
LCBJOTE1X01BUF9XQik7CiAJaWYgKElTX0VSUih2YWRkcikpIHsKIAkJZXJyID0gUFRSX0VSUih2
YWRkcik7CiAJCWdvdG8gZXJyX29iajsKIAl9CiAJaC0+c2Vxbm8gPSBtZW1zZXQodmFkZHIsIDB4
ZmYsIFBBR0VfU0laRSk7CiAKLQl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKGgtPm9i
aiwKLQkJCQkJaTkxNV9jb2hlcmVudF9tYXBfdHlwZShndC0+aTkxNSkpOworCXZhZGRyID0gaTkx
NV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQoaC0+b2JqLAorCQkJCQkJIGk5MTVfY29oZXJl
bnRfbWFwX3R5cGUoZ3QtPmk5MTUpKTsKIAlpZiAoSVNfRVJSKHZhZGRyKSkgewogCQllcnIgPSBQ
VFJfRVJSKHZhZGRyKTsKIAkJZ290byBlcnJfdW5waW5faHdzOwpAQCAtMTQ5LDcgKzE0OSw3IEBA
IGhhbmdfY3JlYXRlX3JlcXVlc3Qoc3RydWN0IGhhbmcgKmgsIHN0cnVjdCBpbnRlbF9lbmdpbmVf
Y3MgKmVuZ2luZSkKIAkJcmV0dXJuIEVSUl9DQVNUKG9iaik7CiAJfQogCi0JdmFkZHIgPSBpOTE1
X2dlbV9vYmplY3RfcGluX21hcChvYmosIGk5MTVfY29oZXJlbnRfbWFwX3R5cGUoZ3QtPmk5MTUp
KTsKKwl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgaTkxNV9j
b2hlcmVudF9tYXBfdHlwZShndC0+aTkxNSkpOwogCWlmIChJU19FUlIodmFkZHIpKSB7CiAJCWk5
MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKIAkJaTkxNV92bV9wdXQodm0pOwotLSAKMi4yOS4yLjIy
Mi5nNWQyYTkyZDEwZjgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
