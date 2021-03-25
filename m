Return-Path: <SRS0=Bn5a=IX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A53C433E6
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 18:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC6F61A24
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 18:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACC6F61A24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F1E6EE33;
	Thu, 25 Mar 2021 18:08:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFDC6EE27
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Mar 2021 18:07:33 +0000 (UTC)
IronPort-SDR: I+sNJJ+V2NkNd5qBz/+dgdvbAgZd/cGFbtzROdn+WHYXZWBI2XlKtI0hN/mFezTjls6iaRt/9o
 y4Uv6AIX1WCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178112551"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="178112551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 11:07:33 -0700
IronPort-SDR: C1Y1UP1XT2J7odBipVtREFP8WvURGNnBCCo8fqeXaF9tBAIAoTKqXxVot8YXS9hXPuFLAevkq5
 qE7U+a3thSBA==
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="453176662"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 11:07:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 25 Mar 2021 11:06:59 -0700
Message-Id: <20210325180720.401410-30-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210325180720.401410-1-matthew.d.roper@intel.com>
References: <20210325180720.401410-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 29/50] drm/i915/adl_p: Enable modular fia
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
Cc: me@freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgpBbGRl
cmxha2UgUCBoYXZlIG1vZHVsYXIgRklBIGxpa2UgVEdMIGJ1dCBpdCBpcyBhbHdheXMgbW9kdWxh
ciBpbiBhbGwKc2t1cywgbm90IGxpa2UgVEdMIHRoYXQgd2UgaGFkIHRvIHJlYWQgYSByZWdpc3Rl
ciB0byBjaGVjayBpZiBpdCBpcwptb25vbGl0aGljIG9yIG1vZHVsYXIuCgpCU3BlYzogNTU0ODAK
QlNwZWM6IDUwNTcyCkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBDbGludG9uIFRheWxvciA8Q2xpbnRvbi5BLlRheWxvckBpbnRlbC5jb20+ClNp
Z25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90Yy5jIHwgNCArKysrCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF90Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90Yy5jCmlu
ZGV4IDdiYWUwMTkzYWEwZi4uOGY2MGE5NDg1MmYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF90Yy5jCkBAIC03MzQsNiArNzM0LDEwIEBAIHRjX2hhc19tb2R1bGFyX2ZpYShz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwgc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAq
ZGlnCiAJaWYgKCFJTlRFTF9JTkZPKGk5MTUpLT5kaXNwbGF5Lmhhc19tb2R1bGFyX2ZpYSkKIAkJ
cmV0dXJuIGZhbHNlOwogCisJLyogVE9ETzogY2hlY2sgaWYgaW4gcmVhbCBIVyBNT0RVTEFSX0ZJ
QV9NQVNLIGlzIHNldCwgaWYgc28gcmVtb3ZlIHRoaXMgYmxvY2sgKi8KKwlpZiAoSVNfQUxERVJM
QUtFX1AoaTkxNSkpCisJCXJldHVybiB0cnVlOworCiAJd2FrZXJlZiA9IHRjX2NvbGRfYmxvY2so
ZGlnX3BvcnQpOwogCXZhbCA9IGludGVsX3VuY29yZV9yZWFkKCZpOTE1LT51bmNvcmUsIFBPUlRf
VFhfREZMRVhEUFNQKEZJQTEpKTsKIAl0Y19jb2xkX3VuYmxvY2soZGlnX3BvcnQsIHdha2VyZWYp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcGNpLmMKaW5kZXggMWNlYjNjZDQwNjhkLi4zOWNiZmRmN2M1MGUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGNpLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYwpAQCAtOTUxLDYgKzk1MSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gYWRsX3BfaW5mbyA9IHsKIAlYRV9MUERfRkVBVFVS
RVMsCiAJUExBVEZPUk0oSU5URUxfQUxERVJMQUtFX1ApLAogCS5yZXF1aXJlX2ZvcmNlX3Byb2Jl
ID0gMSwKKwkuZGlzcGxheS5oYXNfbW9kdWxhcl9maWEgPSAxLAogCS5wbGF0Zm9ybV9lbmdpbmVf
bWFzayA9CiAJCUJJVChSQ1MwKSB8IEJJVChCQ1MwKSB8IEJJVChWRUNTMCkgfCBCSVQoVkNTMCkg
fCBCSVQoVkNTMiksCiAJLnBwZ3R0X3NpemUgPSA0OCwKLS0gCjIuMjUuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
