Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66492C433E9
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 13:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B61F64F8E
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 13:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B61F64F8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED03E6ECB1;
	Thu, 11 Mar 2021 13:48:55 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8C6EC9B
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 13:48:53 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 14:42:36 +0100
Message-Id: <20210311134249.588632-57-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311134249.588632-1-maarten.lankhorst@linux.intel.com>
References: <20210311134249.588632-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v8 56/69] drm/i915/selftests: Prepare timeline
 tests for obj->mm.lock removal
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

V2UgY2FuIG5vIGxvbmdlciBjYWxsIGludGVsX3RpbWVsaW5lX3BpbiB3aXRoIGEgbnVsbCBhcmd1
bWVudCwKc28gYWRkIGEgd3cgbG9vcCB0aGF0IGxvY2tzIHRoZSBiYWNraW5nIG9iamVjdC4KClNp
Z25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rf
dGltZWxpbmUuYyB8IDMwICsrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfdGltZWxpbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3NlbGZ0ZXN0X3RpbWVsaW5lLmMKaW5kZXggMzFiNDkyZWIyOTgyLi5kMjBmOTMwMWE0NTkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3RpbWVsaW5lLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfdGltZWxpbmUuYwpAQCAtMzcsNiAr
MzcsMjYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaHdzcF9jYWNoZWxpbmUoc3RydWN0IGludGVs
X3RpbWVsaW5lICp0bCkKIAlyZXR1cm4gKGFkZHJlc3MgKyBvZmZzZXRfaW5fcGFnZSh0bC0+aHdz
cF9vZmZzZXQpKSAvIENBQ0hFTElORV9CWVRFUzsKIH0KIAorc3RhdGljIGludCBzZWxmdGVzdF90
bF9waW4oc3RydWN0IGludGVsX3RpbWVsaW5lICp0bCkKK3sKKwlzdHJ1Y3QgaTkxNV9nZW1fd3df
Y3R4IHd3OworCWludCBlcnI7CisKKwlpOTE1X2dlbV93d19jdHhfaW5pdCgmd3csIGZhbHNlKTsK
K3JldHJ5OgorCWVyciA9IGk5MTVfZ2VtX29iamVjdF9sb2NrKHRsLT5od3NwX2dndHQtPm9iaiwg
Jnd3KTsKKwlpZiAoIWVycikKKwkJZXJyID0gaW50ZWxfdGltZWxpbmVfcGluKHRsLCAmd3cpOwor
CisJaWYgKGVyciA9PSAtRURFQURMSykgeworCQllcnIgPSBpOTE1X2dlbV93d19jdHhfYmFja29m
Zigmd3cpOworCQlpZiAoIWVycikKKwkJCWdvdG8gcmV0cnk7CisJfQorCWk5MTVfZ2VtX3d3X2N0
eF9maW5pKCZ3dyk7CisJcmV0dXJuIGVycjsKK30KKwogI2RlZmluZSBDQUNIRUxJTkVTX1BFUl9Q
QUdFIChQQUdFX1NJWkUgLyBDQUNIRUxJTkVfQllURVMpCiAKIHN0cnVjdCBtb2NrX2h3c3BfZnJl
ZWxpc3QgewpAQCAtNzgsNyArOTgsNyBAQCBzdGF0aWMgaW50IF9fbW9ja19od3NwX3RpbWVsaW5l
KHN0cnVjdCBtb2NrX2h3c3BfZnJlZWxpc3QgKnN0YXRlLAogCQlpZiAoSVNfRVJSKHRsKSkKIAkJ
CXJldHVybiBQVFJfRVJSKHRsKTsKIAotCQllcnIgPSBpbnRlbF90aW1lbGluZV9waW4odGwsIE5V
TEwpOworCQllcnIgPSBzZWxmdGVzdF90bF9waW4odGwpOwogCQlpZiAoZXJyKSB7CiAJCQlpbnRl
bF90aW1lbGluZV9wdXQodGwpOwogCQkJcmV0dXJuIGVycjsKQEAgLTQ2NCw3ICs0ODQsNyBAQCBj
aGVja2VkX3RsX3dyaXRlKHN0cnVjdCBpbnRlbF90aW1lbGluZSAqdGwsIHN0cnVjdCBpbnRlbF9l
bmdpbmVfY3MgKmVuZ2luZSwgdTMyCiAJc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7CiAJaW50IGVy
cjsKIAotCWVyciA9IGludGVsX3RpbWVsaW5lX3Bpbih0bCwgTlVMTCk7CisJZXJyID0gc2VsZnRl
c3RfdGxfcGluKHRsKTsKIAlpZiAoZXJyKSB7CiAJCXJxID0gRVJSX1BUUihlcnIpOwogCQlnb3Rv
IG91dDsKQEAgLTY2NCw3ICs2ODQsNyBAQCBzdGF0aWMgaW50IGxpdmVfaHdzcF93cmFwKHZvaWQg
KmFyZykKIAlpZiAoIXRsLT5oYXNfaW5pdGlhbF9icmVhZGNydW1iKQogCQlnb3RvIG91dF9mcmVl
OwogCi0JZXJyID0gaW50ZWxfdGltZWxpbmVfcGluKHRsLCBOVUxMKTsKKwllcnIgPSBzZWxmdGVz
dF90bF9waW4odGwpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0X2ZyZWU7CiAKQEAgLTgxMSwxMyAr
ODMxLDEzIEBAIHN0YXRpYyBpbnQgc2V0dXBfd2F0Y2hlcihzdHJ1Y3QgaHdzcF93YXRjaGVyICp3
LCBzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQogCWlmIChJU19FUlIob2JqKSkKIAkJcmV0dXJuIFBUUl9F
UlIob2JqKTsKIAotCXctPm1hcCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9N
QVBfV0IpOworCXctPm1hcCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwg
STkxNV9NQVBfV0IpOwogCWlmIChJU19FUlIody0+bWFwKSkgewogCQlpOTE1X2dlbV9vYmplY3Rf
cHV0KG9iaik7CiAJCXJldHVybiBQVFJfRVJSKHctPm1hcCk7CiAJfQogCi0Jdm1hID0gaTkxNV9n
ZW1fb2JqZWN0X2dndHRfcGluX3d3KG9iaiwgTlVMTCwgTlVMTCwgMCwgMCwgMCk7CisJdm1hID0g
aTkxNV9nZW1fb2JqZWN0X2dndHRfcGluKG9iaiwgTlVMTCwgMCwgMCwgMCk7CiAJaWYgKElTX0VS
Uih2bWEpKSB7CiAJCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKIAkJcmV0dXJuIFBUUl9FUlIo
dm1hKTsKLS0gCjIuMzAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ2Z4Cg==
