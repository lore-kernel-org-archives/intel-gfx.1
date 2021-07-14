Return-Path: <SRS0=C5oC=MG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D7DC07E9A
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 13:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7764B611C0
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7764B611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABB36E2B4;
	Wed, 14 Jul 2021 13:18:56 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF996E2B4
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 13:18:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210386714"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="210386714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 06:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="571172012"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 14 Jul 2021 06:18:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Jul 2021 16:18:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Jul 2021 16:18:37 +0300
Message-Id: <20210714131837.8978-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714131837.8978-1-ville.syrjala@linux.intel.com>
References: <20210714131837.8978-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 4/4] drm/i915/fbc: Allow FBC + VT-d on SKL/BXT
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
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldp
dGggdGhlIGlvbW11IGRyaXZlciBkaXNhYmxpbmcgVlQtZCBzdXBlcnBhZ2UgaXQgc2hvdWxkIGJl
CnNhZmUgdG8gdXNlIEZCQyBvbiBTS0wvQlhUIHdpdGggVlQtZCBvdGhlcndpc2UgZW5hYmxlZC4K
CkNjOiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+CkNjOiBMdSBCYW9sdSA8
YmFvbHUubHVAbGludXguaW50ZWwuY29tPgpDYzogaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5j
IHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jCmluZGV4IDgyZWZmYjY0YTNi
OS4uZGU0NGY5M2EzM2QwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2ZiYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJj
LmMKQEAgLTE0NDgsMTkgKzE0NDgsNiBAQCBzdGF0aWMgaW50IGludGVsX3Nhbml0aXplX2ZiY19v
cHRpb24oc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQogCXJldHVybiAwOwogfQog
Ci1zdGF0aWMgYm9vbCBuZWVkX2ZiY192dGRfd2Eoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRl
dl9wcml2KQotewotCS8qIFdhRmJjVHVybk9mZkZiY1doZW5IeXBlclZpc29ySXNVc2VkOnNrbCxi
eHQgKi8KLQlpZiAoaW50ZWxfdnRkX2FjdGl2ZSgpICYmCi0JICAgIChJU19TS1lMQUtFKGRldl9w
cml2KSB8fCBJU19CUk9YVE9OKGRldl9wcml2KSkpIHsKLQkJZHJtX2luZm8oJmRldl9wcml2LT5k
cm0sCi0JCQkgIkRpc2FibGluZyBmcmFtZWJ1ZmZlciBjb21wcmVzc2lvbiAoRkJDKSB0byBwcmV2
ZW50IHNjcmVlbiBmbGlja2VyIHdpdGggVlQtZCBlbmFibGVkXG4iKTsKLQkJcmV0dXJuIHRydWU7
Ci0JfQotCi0JcmV0dXJuIGZhbHNlOwotfQotCiAvKioKICAqIGludGVsX2ZiY19pbml0IC0gSW5p
dGlhbGl6ZSBGQkMKICAqIEBkZXZfcHJpdjogdGhlIGk5MTUgZGV2aWNlCkBAIC0xNDc4LDkgKzE0
NjUsNiBAQCB2b2lkIGludGVsX2ZiY19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZf
cHJpdikKIAlpZiAoIWRybV9tbV9pbml0aWFsaXplZCgmZGV2X3ByaXYtPm1tLnN0b2xlbikpCiAJ
CW1rd3JpdGVfZGV2aWNlX2luZm8oZGV2X3ByaXYpLT5kaXNwbGF5Lmhhc19mYmMgPSBmYWxzZTsK
IAotCWlmIChuZWVkX2ZiY192dGRfd2EoZGV2X3ByaXYpKQotCQlta3dyaXRlX2RldmljZV9pbmZv
KGRldl9wcml2KS0+ZGlzcGxheS5oYXNfZmJjID0gZmFsc2U7Ci0KIAlkZXZfcHJpdi0+cGFyYW1z
LmVuYWJsZV9mYmMgPSBpbnRlbF9zYW5pdGl6ZV9mYmNfb3B0aW9uKGRldl9wcml2KTsKIAlkcm1f
ZGJnX2ttcygmZGV2X3ByaXYtPmRybSwgIlNhbml0aXplZCBlbmFibGVfZmJjIHZhbHVlOiAlZFxu
IiwKIAkJICAgIGRldl9wcml2LT5wYXJhbXMuZW5hYmxlX2ZiYyk7Ci0tIAoyLjMxLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWls
aW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
