Return-Path: <SRS0=0Its=HL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF60C433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 18:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D26564E3F
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 18:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D26564E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F646EB91;
	Tue,  9 Feb 2021 18:13:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847056EB92
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Feb 2021 18:13:27 +0000 (UTC)
IronPort-SDR: 26ok/s3NJ/A6RWCSdBPR5wIK1/KV3de9Wunz10ir2ve9t1mHat/NbrR/ztLyzw5VRIjFqtYO2L
 KRb2XPPGrSWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="201014108"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="201014108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 10:13:25 -0800
IronPort-SDR: oUOsSKnbl4h3l3+hKcnqlPrR2iW3kBsG7CSkI43yB2CxfbcXpC/Bnv4y2E545TgBUWnPbte1R0
 2gjGxE+1eTvA==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="396324686"
Received: from rmahmood-mobl1.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.254.190.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 10:13:23 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Feb 2021 10:14:38 -0800
Message-Id: <20210209181439.215104-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209181439.215104-1-jose.souza@intel.com>
References: <20210209181439.215104-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/4] drm/i915/display: Remove some redundancy
 around CAN_PSR()
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

SWYgc291cmNlX3N1cHBvcnQgaXMgc2V0IHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBQU1Igc28gbm8g
bmVlZCB0byBjaGVjawppdCBhZ2FpbiBhdCBldmVyeSBDQU5fUFNSKCkuCgpBbHNvIHJlbW92aW5n
IHRoZSBpbnRlbF9kcF9pc19lZHAoKSBjYWxscywgaWYgc2lua19zdXBwb3J0IGlzIHNldAp0aGUg
c2luayBjb25uZWN0ZWQgaXMgZm9yIHN1cmUgYSBlRFAgcGFuZWwuCgpDYzogR3dhbi1neWVvbmcg
TXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCB8IDUgKystLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyAgICAgICAgICAgfCA0ICsrLS0KIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKaW5kZXggZWJh
YTlkMGVkMzc2Li40YTQ2YzRlOWIwYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCkBAIC0xNzkzLDkgKzE3OTMsOCBAQCBkcF90
b19pOTE1KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCiAJcmV0dXJuIHRvX2k5MTUoZHBfdG9f
ZGlnX3BvcnQoaW50ZWxfZHApLT5iYXNlLmJhc2UuZGV2KTsKIH0KIAotI2RlZmluZSBDQU5fUFNS
KGludGVsX2RwKQkoSEFTX1BTUihkcF90b19pOTE1KGludGVsX2RwKSkgJiYgXAotCQkJCSAoaW50
ZWxfZHApLT5wc3Iuc2lua19zdXBwb3J0ICYmIFwKLQkJCQkgKGludGVsX2RwKS0+cHNyLnNvdXJj
ZV9zdXBwb3J0KQorI2RlZmluZSBDQU5fUFNSKGludGVsX2RwKSAoKGludGVsX2RwKS0+cHNyLnNp
bmtfc3VwcG9ydCAmJiBcCisJCQkgICAoaW50ZWxfZHApLT5wc3Iuc291cmNlX3N1cHBvcnQpCiAK
IHN0YXRpYyBpbmxpbmUgYm9vbCBpbnRlbF9lbmNvZGVyX2Nhbl9wc3Ioc3RydWN0IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMK
aW5kZXggNGY4OWUwZGU1ZGRlLi4wYTBjYzYxMzQ0YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKQEAgLTIzNTgsNyArMjM1OCw3IEBAIGJvb2wgaW50ZWxfZHBfaW5p
dGlhbF9mYXN0c2V0X2NoZWNrKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCQlyZXR1
cm4gZmFsc2U7CiAJfQogCi0JaWYgKENBTl9QU1IoaW50ZWxfZHApICYmIGludGVsX2RwX2lzX2Vk
cChpbnRlbF9kcCkpIHsKKwlpZiAoQ0FOX1BTUihpbnRlbF9kcCkpIHsKIAkJZHJtX2RiZ19rbXMo
Jmk5MTUtPmRybSwgIkZvcmNpbmcgZnVsbCBtb2Rlc2V0IHRvIGNvbXB1dGUgUFNSIHN0YXRlXG4i
KTsKIAkJY3J0Y19zdGF0ZS0+dWFwaS5tb2RlX2NoYW5nZWQgPSB0cnVlOwogCQlyZXR1cm4gZmFs
c2U7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYwppbmRleCA4YWQ5ZmNm
ZjNhMTIuLmUwMTExYjQ3MDU3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jCkBAIC0xOTYyLDcgKzE5NjIsNyBAQCB2b2lkIGludGVsX3Bzcl9zaG9ydF9wdWxzZShz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCQkJICBEUF9QU1JfVlNDX1NEUF9VTkNPUlJFQ1RB
QkxFX0VSUk9SIHwKIAkJCSAgRFBfUFNSX0xJTktfQ1JDX0VSUk9SOwogCi0JaWYgKCFDQU5fUFNS
KGludGVsX2RwKSB8fCAhaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkKKwlpZiAoIUNBTl9QU1Io
aW50ZWxfZHApKQogCQlyZXR1cm47CiAKIAltdXRleF9sb2NrKCZwc3ItPmxvY2spOwpAQCAtMjAx
Miw3ICsyMDEyLDcgQEAgYm9vbCBpbnRlbF9wc3JfZW5hYmxlZChzdHJ1Y3QgaW50ZWxfZHAgKmlu
dGVsX2RwKQogewogCWJvb2wgcmV0OwogCi0JaWYgKCFDQU5fUFNSKGludGVsX2RwKSB8fCAhaW50
ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkKKwlpZiAoIUNBTl9QU1IoaW50ZWxfZHApKQogCQlyZXR1
cm4gZmFsc2U7CiAKIAltdXRleF9sb2NrKCZpbnRlbF9kcC0+cHNyLmxvY2spOwotLSAKMi4zMC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
