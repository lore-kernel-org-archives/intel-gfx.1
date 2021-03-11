Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B571C433E9
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 22:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B7B64F26
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 22:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B7B64F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D6B6F393;
	Thu, 11 Mar 2021 22:36:59 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12D76EEA7
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 22:36:49 +0000 (UTC)
IronPort-SDR: 6o+zAxqn+u+PitkWFsx1EjmevAsnPXsRYP8e6JOwCrRfml1fK3H9FVJmLgbGq/pN7xmxM9SvjA
 ne8U78+dQ3Jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="250116449"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="250116449"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:36:47 -0800
IronPort-SDR: Ejg9QyKfaFaOE20GSwm0NNg4Co+VBh/ieqlGmoQEB/tUYEQL445LieBaQtT5970/+XbZjt1FUv
 E7qG9bx/u4tQ==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="438852754"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:36:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 14:36:11 -0800
Message-Id: <20210311223632.3191939-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210311223632.3191939-1-matthew.d.roper@intel.com>
References: <20210311223632.3191939-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 35/56] drm/i915/adl_p: Enable modular fia
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
ZGV4IDg1OTUyZjM5YTEzZC4uNWYwMzIxNWEwM2U0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
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
Z3B1L2RybS9pOTE1L2k5MTVfcGNpLmMKaW5kZXggZGJhNmJlZGQyNThlLi43MjJlZDczMDEyOGIg
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
