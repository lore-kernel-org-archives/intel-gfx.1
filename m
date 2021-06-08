Return-Path: <SRS0=F+1B=LC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1469EC4743D
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 09:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B7161263
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B7161263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07796EB65;
	Tue,  8 Jun 2021 09:29:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27CA6EB5F;
 Tue,  8 Jun 2021 09:29:07 +0000 (UTC)
IronPort-SDR: KXwN9s07F6CXvMsaNQ2fE+Blb066GCvOXJSSMtQfIx+7lmje8i3vpY+Ew9eHdyznZ0kPiAD6jp
 Iq3XfNrNUbNg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226150954"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226150954"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:07 -0700
IronPort-SDR: yF4Xv33vq6UinavSYKYTP+vzE9SeG/xd+XLxS/A5a+qJ7BDzDt2wVSKQuWuLdjV/mxwXu5q13E
 wtd1OhVQeQ9g==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="551544388"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.115])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue,  8 Jun 2021 11:28:40 +0200
Message-Id: <20210608092846.64198-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/9] drm/i915: Introduce a ww transaction helper
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
Cc: matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

SW50cm9kdWNlIGEgZm9yX2k5MTVfZ2VtX3d3KCl7fSB1dGlsaXR5IHRvIGhlbHAgbWFrZSB0aGUg
Y29kZQphcm91bmQgYSB3dyB0cmFuc2FjdGlvbiBtb3JlIHJlYWRhYmxlLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3d3LmggfCAzMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fd3cu
aCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3d3LmgKaW5kZXggZjJkODc2OWU0MTE4
Li5mNmIxYTc5NjY2N2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2Vt
X3d3LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fd3cuaApAQCAtMTEsMTEg
KzExLDQwIEBAIHN0cnVjdCBpOTE1X2dlbV93d19jdHggewogCXN0cnVjdCB3d19hY3F1aXJlX2N0
eCBjdHg7CiAJc3RydWN0IGxpc3RfaGVhZCBvYmpfbGlzdDsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2Vt
X29iamVjdCAqY29udGVuZGVkOwotCWJvb2wgaW50cjsKKwl1bnNpZ25lZCBzaG9ydCBpbnRyOwor
CXVuc2lnbmVkIHNob3J0IGxvb3A7CiB9OwogCiB2b2lkIGk5MTVfZ2VtX3d3X2N0eF9pbml0KHN0
cnVjdCBpOTE1X2dlbV93d19jdHggKmN0eCwgYm9vbCBpbnRyKTsKIHZvaWQgaTkxNV9nZW1fd3df
Y3R4X2Zpbmkoc3RydWN0IGk5MTVfZ2VtX3d3X2N0eCAqY3R4KTsKIGludCBfX211c3RfY2hlY2sg
aTkxNV9nZW1fd3dfY3R4X2JhY2tvZmYoc3RydWN0IGk5MTVfZ2VtX3d3X2N0eCAqY3R4KTsKIHZv
aWQgaTkxNV9nZW1fd3dfdW5sb2NrX3NpbmdsZShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAq
b2JqKTsKKworLyogSW50ZXJuYWwgZnVuY3Rpb25zIHVzZWQgYnkgdGhlIGlubGluZXMhIERvbid0
IHVzZS4gKi8KK3N0YXRpYyBpbmxpbmUgaW50IF9faTkxNV9nZW1fd3dfZmluaShzdHJ1Y3QgaTkx
NV9nZW1fd3dfY3R4ICp3dywgaW50IGVycikKK3sKKwl3dy0+bG9vcCA9IDA7CisJaWYgKGVyciA9
PSAtRURFQURMSykgeworCQllcnIgPSBpOTE1X2dlbV93d19jdHhfYmFja29mZih3dyk7CisJCWlm
ICghZXJyKQorCQkJd3ctPmxvb3AgPSAxOworCX0KKworCWlmICghd3ctPmxvb3ApCisJCWk5MTVf
Z2VtX3d3X2N0eF9maW5pKHd3KTsKKworCXJldHVybiBlcnI7Cit9CisKK3N0YXRpYyBpbmxpbmUg
dm9pZAorX19pOTE1X2dlbV93d19pbml0KHN0cnVjdCBpOTE1X2dlbV93d19jdHggKnd3LCBib29s
IGludHIpCit7CisJaTkxNV9nZW1fd3dfY3R4X2luaXQod3csIGludHIpOworCXd3LT5sb29wID0g
MTsKK30KKworI2RlZmluZSBmb3JfaTkxNV9nZW1fd3coX3d3LCBfZXJyLCBfaW50cikJCQlcCisJ
Zm9yIChfX2k5MTVfZ2VtX3d3X2luaXQoX3d3LCBfaW50cik7IChfd3cpLT5sb29wOwlcCisJICAg
ICBfZXJyID0gX19pOTE1X2dlbV93d19maW5pKF93dywgX2VycikpCisKICNlbmRpZgotLSAKMi4z
MS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRl
bC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
