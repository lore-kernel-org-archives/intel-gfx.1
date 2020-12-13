Return-Path: <SRS0=c36g=FR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A13C4361B
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Dec 2020 18:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C47123123
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Dec 2020 18:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C47123123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3D389E38;
	Sun, 13 Dec 2020 18:39:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5B89C6A
 for <intel-gfx@lists.freedesktop.org>; Sun, 13 Dec 2020 18:39:25 +0000 (UTC)
IronPort-SDR: Z/vTGRNz15LuDxWS+Dafr+0r1HbmHvYRMupevCAMnHzmtHQgXWX0wc+moBbGwiu+1OYqClI1YM
 pBKGprKXSuqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="172054614"
X-IronPort-AV: E=Sophos;i="5.78,416,1599548400"; d="scan'208";a="172054614"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 10:39:24 -0800
IronPort-SDR: 2p2xePzbiyjl9Oi6V54PykjynfZOse0ZlAzheG0i5HT8GOKBWbuTIw1Ow7YJ+Sydk4Y7LMVdm9
 rQVoOWmhn0mA==
X-IronPort-AV: E=Sophos;i="5.78,416,1599548400"; d="scan'208";a="410649995"
Received: from ihazan-mobl1.ger.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.255.70.79])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 10:39:20 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sun, 13 Dec 2020 10:39:26 -0800
Message-Id: <20201213183930.349592-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213183930.349592-1-jose.souza@intel.com>
References: <20201213183930.349592-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v5 2/6] drm/i915/display: Check plane damage
 clips
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

Q2FsbCB0aGUgZnVuY3Rpb24gdGhhdCB2YWxpZGF0ZXMgZXZlcnkgZGFtYWdlIGNsaXBzIG9mIGVh
Y2ggcGxhbmUuCkFzIGluIGNvbW1pdCAwOTNhM2EzMDAwMDkgKCJkcm0vaTkxNTogQWRkIHBsYW5l
IGRhbWFnZSBjbGlwcyBwcm9wZXJ0eSIpCnRoaXMgcHJvcGVydHkgd2FzIG9ubHkgZW5hYmxlZCBm
b3IgZ2VuMTIrIG9ubHkgY2hlY2tpbmcgaXQgZm9yIGdlbjEyCnRvby4KCnYyOgotIGFkZCBsb2dz
IHRvIHVuZGVyc3BhY2UgdW5kZXJzdGFuZCB3aHkgY29tbWl0IHdhcyByZWplY3RlZAoKQ2M6IEd3
YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Nwcml0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9zcHJpdGUuYwppbmRleCBiN2UyMDg4MTYwNzQuLmNiODYyYmI4ZDZmYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCkBAIC0yNDkyLDYgKzI0OTIsMTMg
QEAgc3RhdGljIGludCBza2xfcGxhbmVfY2hlY2soc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNy
dGNfc3RhdGUsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAorCWlmIChJTlRFTF9HRU4oZGV2
X3ByaXYpID49IDEyKSB7CisJCXJldCA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX2Rh
bWFnZShjcnRjX3N0YXRlLT51YXBpLnN0YXRlLAorCQkJCQkJCSAgICZwbGFuZV9zdGF0ZS0+dWFw
aSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KKwogCS8qIEhXIG9ubHkgaGFzIDgg
Yml0cyBwaXhlbCBwcmVjaXNpb24sIGRpc2FibGUgcGxhbmUgaWYgaW52aXNpYmxlICovCiAJaWYg
KCEocGxhbmVfc3RhdGUtPmh3LmFscGhhID4+IDgpKQogCQlwbGFuZV9zdGF0ZS0+dWFwaS52aXNp
YmxlID0gZmFsc2U7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWdmeAo=
