Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047F0C433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 15:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9408864F4B
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 15:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9408864F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0C56E106;
	Tue,  2 Feb 2021 15:43:32 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D666E106
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 15:43:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23774095-1500050 
 for multiple; Tue, 02 Feb 2021 15:43:17 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  2 Feb 2021 15:43:18 +0000
Message-Id: <20210202154318.19246-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202154318.19246-1-chris@chris-wilson.co.uk>
References: <20210202154318.19246-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915: Lift marking a lock as used to
 utils
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

QWZ0ZXIgY2FsbGluZyBsb2NrX3NldF9zdWJjbGFzcygpIHRoZSBsb2NrIF9tdXN0XyBiZSB1c2Vk
LCBvciBlbHNlCmxvY2tkZXAncyBpbnRlcm5hbCBucl91c2VkX2xvY2tzIGJlY29tZXMgdW5iYWxh
bmNlZC4gRXh0cmFjdCB0aGUgbGl0dGxlCnV0aWxpdHkgZnVuY3Rpb24gdG8gaTkxNV91dGlscy5j
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
Q2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYyB8IDEzICstLS0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuYyAgICAgICAgIHwgMTUg
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmggICAgICAg
ICB8ICA3ICsrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5n
aW5lX2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYwppbmRl
eCA1NmZiOWNlY2U3MWIuLmYxMWVhNzI2NDVhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfZW5naW5lX2NzLmMKQEAgLTc2OSwxOCArNzY5LDcgQEAgaW50ZWxfZW5naW5lX2luaXRf
YWN0aXZlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwgdW5zaWduZWQgaW50IHN1YmNs
YXNzKQogCiAJc3Bpbl9sb2NrX2luaXQoJmVuZ2luZS0+YWN0aXZlLmxvY2spOwogCWxvY2tkZXBf
c2V0X3N1YmNsYXNzKCZlbmdpbmUtPmFjdGl2ZS5sb2NrLCBzdWJjbGFzcyk7Ci0KLQkvKgotCSAq
IER1ZSB0byBhbiBpbnRlcmVzdGluZyBxdWlyayBpbiBsb2NrZGVwJ3MgaW50ZXJuYWwgZGVidWcg
dHJhY2tpbmcsCi0JICogYWZ0ZXIgc2V0dGluZyBhIHN1YmNsYXNzIHdlIG11c3QgZW5zdXJlIHRo
ZSBsb2NrIGlzIHVzZWQuIE90aGVyd2lzZSwKLQkgKiBucl91bnVzZWRfbG9ja3MgaXMgaW5jcmVt
ZW50ZWQgb25jZSB0b28gb2Z0ZW4uCi0JICovCi0jaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfQUxM
T0MKLQlsb2NhbF9pcnFfZGlzYWJsZSgpOwotCWxvY2tfbWFwX2FjcXVpcmUoJmVuZ2luZS0+YWN0
aXZlLmxvY2suZGVwX21hcCk7Ci0JbG9ja19tYXBfcmVsZWFzZSgmZW5naW5lLT5hY3RpdmUubG9j
ay5kZXBfbWFwKTsKLQlsb2NhbF9pcnFfZW5hYmxlKCk7Ci0jZW5kaWYKKwltYXJrX2xvY2tfdXNl
ZF9pcnEoJmVuZ2luZS0+YWN0aXZlLmxvY2spOwogfQogCiBzdGF0aWMgc3RydWN0IGludGVsX2Nv
bnRleHQgKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5jCmluZGV4IDkwYzdmMGM0ODM4Yy4uODk0
ZGU2MDgzM2VjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5jCkBAIC0xMjcsMyArMTI3LDE4
IEBAIHZvaWQgZnNfcmVjbGFpbV90YWludHNfbXV0ZXgoc3RydWN0IG11dGV4ICptdXRleCkKIAog
CWZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKIH0KKworI2lmZGVmIENPTkZJR19ERUJV
R19MT0NLX0FMTE9DCit2b2lkIF9fbWFya19sb2NrX3VzZWRfaXJxKHN0cnVjdCBsb2NrZGVwX21h
cCAqbG9jaykKK3sKKwkvKgorCSAqIER1ZSB0byBhbiBpbnRlcmVzdGluZyBxdWlyayBpbiBsb2Nr
ZGVwJ3MgaW50ZXJuYWwgZGVidWcgdHJhY2tpbmcsCisJICogYWZ0ZXIgc2V0dGluZyBhIHN1YmNs
YXNzIHdlIG11c3QgZW5zdXJlIHRoZSBsb2NrIGlzIHVzZWQuIE90aGVyd2lzZSwKKwkgKiBucl91
bnVzZWRfbG9ja3MgaXMgaW5jcmVtZW50ZWQgb25jZSB0b28gb2Z0ZW4uCisJICovCisJbG9jYWxf
aXJxX2Rpc2FibGUoKTsKKwlsb2NrX21hcF9hY3F1aXJlKGxvY2spOworCWxvY2tfbWFwX3JlbGVh
c2UobG9jayk7CisJbG9jYWxfaXJxX2VuYWJsZSgpOworfQorI2VuZGlmCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3V0aWxzLmgKaW5kZXggM2Y2MTZkMDBkZTQyLi42MTA2MTZkNmJmMjkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3V0aWxzLmgKQEAgLTQ1MCw2ICs0NTAsMTMgQEAgc3RhdGljIGlubGluZSBib29s
IHRpbWVyX2V4cGlyZWQoY29uc3Qgc3RydWN0IHRpbWVyX2xpc3QgKnQpCiAJcmV0dXJuIHRpbWVy
X2FjdGl2ZSh0KSAmJiAhdGltZXJfcGVuZGluZyh0KTsKIH0KIAorI2lmZGVmIENPTkZJR19ERUJV
R19MT0NLX0FMTE9DCit2b2lkIF9fbWFya19sb2NrX3VzZWRfaXJxKHN0cnVjdCBsb2NrZGVwX21h
cCAqbG9jayk7CisjZGVmaW5lIG1hcmtfbG9ja191c2VkX2lycShsb2NrKSBfX21hcmtfbG9ja191
c2VkX2lycSgmKGxvY2spLT5kZXBfbWFwKQorI2Vsc2UKKyNkZWZpbmUgbWFya19sb2NrX3VzZWRf
aXJxKGxvY2spCisjZW5kaWYKKwogLyoKICAqIFRoaXMgaXMgYSBsb29rYWxpa2UgZm9yIElTX0VO
QUJMRUQoKSB0aGF0IHRha2VzIGEga2NvbmZpZyB2YWx1ZSwKICAqIGUuZy4gQ09ORklHX0RSTV9J
OTE1X1NQSU5fUkVRVUVTVCwgYW5kIGV2YWx1YXRlcyB3aGV0aGVyIGl0IGlzIG5vbi16ZXJvCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
