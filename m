Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9413DC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 16:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105CD64D99
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 16:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105CD64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCA26E85D;
	Wed, 27 Jan 2021 16:53:04 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20216E85A
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Jan 2021 16:52:59 +0000 (UTC)
IronPort-SDR: qQskJlvqDpUV4v56Hfm2Aj0zmcRvjFw2Kpo9viZn8pau6uQxyhneqy8RIDpuRLLqiLziceV1/b
 DU9MMPQDFwnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180176964"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="180176964"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 08:52:59 -0800
IronPort-SDR: sLG4S7M1OTsIq3u4s6GnTb3Ven6+pfbNnCNMSnIUNyrSQ07qILtStko2+QqThBumKl+mxcdRdO
 1yoJ3pVY0ezQ==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="578211842"
Received: from reynol4x-mobl.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.255.78.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 08:52:58 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 27 Jan 2021 08:54:02 -0800
Message-Id: <20210127165402.117829-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127165402.117829-1-jose.souza@intel.com>
References: <20210127165402.117829-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 4/4] drm/i915: Rename is_16gb_dimm to
 wm_lv_0_adjust_needed
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

QXMgaXQgbm93IGl0IGlzIGFsd2F5cyByZXF1aXJlZCBmb3IgR0VOMTIrIHRoZSBpc18xNmdiX2Rp
bW0gbmFtZQpkbyBub3QgbWFrZSBzZW5zZSBmb3IgR0VOMTIrLgoKdjI6Ci0gVXBkYXRlZCBjb21t
ZW50IG9uIHRvcCBvZiAiZHJhbV9pbmZvLT53bV9sdl8wX2FkanVzdF9uZWVkZWQgPQohSVNfR0VO
OV9MUChpOTE1KTsiCgpSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uu
c291emFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICB8
ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcmFtLmMgfCAxNSArKysrKysrLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMgICB8ICAyICstCiAzIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZHJ2LmgKaW5kZXggODAyMjdkNDdiNWNiLi5mNjg0MTQ3MjkwY2IgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9kcnYuaApAQCAtMTEyOCw3ICsxMTI4LDcgQEAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
ewogCX0gd207CiAKIAlzdHJ1Y3QgZHJhbV9pbmZvIHsKLQkJYm9vbCBpc18xNmdiX2RpbW07CisJ
CWJvb2wgd21fbHZfMF9hZGp1c3RfbmVlZGVkOwogCQl1OCBudW1fY2hhbm5lbHM7CiAJCWJvb2wg
c3ltbWV0cmljX21lbW9yeTsKIAkJZW51bSBpbnRlbF9kcmFtX3R5cGUgewpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHJhbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfZHJhbS5jCmluZGV4IDZjZTU2ZWVkYWYxMi4uNmExM2NmMzlkYTk5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcmFtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfZHJhbS5jCkBAIC0yMDcsNyArMjA3LDcgQEAgc2tsX2RyYW1fZ2V0X2NoYW5u
ZWxzX2luZm8oc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAJCXJldHVybiAtRUlOVkFM
OwogCX0KIAotCWRyYW1faW5mby0+aXNfMTZnYl9kaW1tID0gY2gwLmlzXzE2Z2JfZGltbSB8fCBj
aDEuaXNfMTZnYl9kaW1tOworCWRyYW1faW5mby0+d21fbHZfMF9hZGp1c3RfbmVlZGVkID0gY2gw
LmlzXzE2Z2JfZGltbSB8fCBjaDEuaXNfMTZnYl9kaW1tOwogCiAJZHJhbV9pbmZvLT5zeW1tZXRy
aWNfbWVtb3J5ID0gaW50ZWxfaXNfZHJhbV9zeW1tZXRyaWMoJmNoMCwgJmNoMSk7CiAKQEAgLTQ3
OSw3ICs0NzksNyBAQCBzdGF0aWMgaW50IGdlbjExX2dldF9kcmFtX2luZm8oc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUpCiBzdGF0aWMgaW50IGdlbjEyX2dldF9kcmFtX2luZm8oc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpCiB7CiAJLyogQWx3YXlzIG5lZWRlZCBmb3IgR0VOMTIr
ICovCi0JaTkxNS0+ZHJhbV9pbmZvLmlzXzE2Z2JfZGltbSA9IHRydWU7CisJaTkxNS0+ZHJhbV9p
bmZvLndtX2x2XzBfYWRqdXN0X25lZWRlZCA9IHRydWU7CiAKIAlyZXR1cm4gaWNsX3Bjb2RlX3Jl
YWRfbWVtX2dsb2JhbF9pbmZvKGk5MTUpOwogfQpAQCAtNDkwLDExICs0OTAsMTAgQEAgaW50IGlu
dGVsX2RyYW1fZGV0ZWN0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQogCWludCByZXQ7
CiAKIAkvKgotCSAqIEFzc3VtZSAxNkdiIERJTU1zIGFyZSBwcmVzZW50IHVudGlsIHByb3ZlbiBv
dGhlcndpc2UuCi0JICogVGhpcyBpcyBvbmx5IHVzZWQgZm9yIHRoZSBsZXZlbCAwIHdhdGVybWFy
ayBsYXRlbmN5Ci0JICogdy9hIHdoaWNoIGRvZXMgbm90IGFwcGx5IHRvIGJ4dC9nbGsuCisJICog
QXNzdW1lIGxldmVsIDAgd2F0ZXJtYXJrIGxhdGVuY3kgYWRqdXN0bWVudCBpcyBuZWVkZWQgdW50
aWwgcHJvdmVuCisJICogb3RoZXJ3aXNlLCB0aGlzIHcvYSBpcyBub3QgbmVlZGVkIGJ5IGJ4dC9n
bGsuCiAJICovCi0JZHJhbV9pbmZvLT5pc18xNmdiX2RpbW0gPSAhSVNfR0VOOV9MUChpOTE1KTsK
KwlkcmFtX2luZm8tPndtX2x2XzBfYWRqdXN0X25lZWRlZCA9ICFJU19HRU45X0xQKGk5MTUpOwog
CiAJaWYgKElOVEVMX0dFTihpOTE1KSA8IDkgfHwgIUhBU19ESVNQTEFZKGk5MTUpKQogCQlyZXR1
cm4gMDsKQEAgLTUxNSw4ICs1MTQsOCBAQCBpbnQgaW50ZWxfZHJhbV9kZXRlY3Qoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAKIAlkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAiRFJBTSBj
aGFubmVsczogJXVcbiIsIGRyYW1faW5mby0+bnVtX2NoYW5uZWxzKTsKIAotCWRybV9kYmdfa21z
KCZpOTE1LT5kcm0sICJEUkFNIDE2R2IgRElNTXM6ICVzXG4iLAotCQkgICAgeWVzbm8oZHJhbV9p
bmZvLT5pc18xNmdiX2RpbW0pKTsKKwlkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAiV2F0ZXJtYXJr
IGxldmVsIDAgYWRqdXN0bWVudCBuZWVkZWQ6ICVzXG4iLAorCQkgICAgeWVzbm8oZHJhbV9pbmZv
LT53bV9sdl8wX2FkanVzdF9uZWVkZWQpKTsKIAogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX3BtLmMKaW5kZXggNmU5Njc4YmQwNTk3Li5jNThlNTA3NzU5MGQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfcG0uYwpAQCAtMjkzMCw3ICsyOTMwLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfcmVhZF93
bV9sYXRlbmN5KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAkJICogYW55IHVu
ZGVycnVuLiBJZiBub3QgYWJsZSB0byBnZXQgRGltbSBpbmZvIGFzc3VtZSAxNkdCIGRpbW0KIAkJ
ICogdG8gYXZvaWQgYW55IHVuZGVycnVuLgogCQkgKi8KLQkJaWYgKGRldl9wcml2LT5kcmFtX2lu
Zm8uaXNfMTZnYl9kaW1tKQorCQlpZiAoZGV2X3ByaXYtPmRyYW1faW5mby53bV9sdl8wX2FkanVz
dF9uZWVkZWQpCiAJCQl3bVswXSArPSAxOwogCiAJfSBlbHNlIGlmIChJU19IQVNXRUxMKGRldl9w
cml2KSB8fCBJU19CUk9BRFdFTEwoZGV2X3ByaXYpKSB7Ci0tIAoyLjMwLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxp
c3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
