Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10DAC2D0E4
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 12:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8601521D81
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 12:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8601521D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8536EC6F;
	Fri, 27 Nov 2020 12:09:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342816EC2F;
 Fri, 27 Nov 2020 12:09:01 +0000 (UTC)
IronPort-SDR: /liN7wKau9nahU7C78BE1gRCCjPTYZy8j0po+IX+urcDsO+1Vc395DxLcOvlzsl6m6W66cPD4q
 nNXvRKdI6ArA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540616"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540616"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:01 -0800
IronPort-SDR: cz3IPQ6I49zXUSVWtYDCR6hwxkjsS9sg4orNLjY0ANNpH/ZDFpcEFglAAqrQ8i3t+MPX3BLcTR
 J3bVAYaIKB2g==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028840"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 12:05:28 +0000
Message-Id: <20201127120718.454037-53-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 052/162] drm/i915/selftests: Prepare
 coherency tests for obj->mm.lock removal.
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KClN0cmFpZ2h0Zm9yd2FyZCBjb252ZXJzaW9uLCBqdXN0IGNvbnZlcnQgYSBidW5jaCBvZiBj
YWxscyB0bwp1bmxvY2tlZCB2ZXJzaW9ucy4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb2hlcmVuY3kuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2NvaGVyZW5jeS5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb2hlcmVuY3ku
YwppbmRleCAyZTQzOWJiMjY5ZDYuLjQyYWEzYzVlMDYyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb2hlcmVuY3kuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2NvaGVyZW5jeS5jCkBAIC0x
NTksNyArMTU5LDcgQEAgc3RhdGljIGludCB3Y19zZXQoc3RydWN0IGNvbnRleHQgKmN0eCwgdW5z
aWduZWQgbG9uZyBvZmZzZXQsIHUzMiB2KQogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKLQlt
YXAgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChjdHgtPm9iaiwgSTkxNV9NQVBfV0MpOworCW1h
cCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKGN0eC0+b2JqLCBJOTE1X01BUF9X
Qyk7CiAJaWYgKElTX0VSUihtYXApKQogCQlyZXR1cm4gUFRSX0VSUihtYXApOwogCkBAIC0xODIs
NyArMTgyLDcgQEAgc3RhdGljIGludCB3Y19nZXQoc3RydWN0IGNvbnRleHQgKmN0eCwgdW5zaWdu
ZWQgbG9uZyBvZmZzZXQsIHUzMiAqdikKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCi0JbWFw
ID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAoY3R4LT5vYmosIEk5MTVfTUFQX1dDKTsKKwltYXAg
PSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChjdHgtPm9iaiwgSTkxNV9NQVBfV0Mp
OwogCWlmIChJU19FUlIobWFwKSkKIAkJcmV0dXJuIFBUUl9FUlIobWFwKTsKIAotLSAKMi4yNi4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
