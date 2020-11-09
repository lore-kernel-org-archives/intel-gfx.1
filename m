Return-Path: <SRS0=npFd=EP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7650CC2D0A3
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 07:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EA220657
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 07:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13EA220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E6A89247;
	Mon,  9 Nov 2020 07:30:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8855989247
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 07:30:05 +0000 (UTC)
IronPort-SDR: OoKwuG89OMVUjUl90payGF/P+v3W9CkUguogkdMzB0V+ZmUFObKbxKIrJdmy64f3sAhSB+g0Cl
 IXZGMRZmjZRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="149040184"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="149040184"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2020 23:30:04 -0800
IronPort-SDR: OuzvNLG1ILM8XLceRsO9qInyhHqlULku6cDvVxAy6WHCFKH61+8WxHb05Lt5qEeYdf3FXjnEwy
 Ebtp+iKIxGbA==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="327170077"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 08 Nov 2020 23:30:04 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sun,  8 Nov 2020 23:32:14 -0800
Message-Id: <20201109073214.26854-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201105223359.28203-4-manasi.d.navare@intel.com>
References: <20201105223359.28203-4-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v8 3/7] drm/i915/dp: Add a wrapper function
 around get_pipe_config
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

Q3JlYXRlIGEgbmV3IGZ1bmN0aW9uIGludGVsX2NydGNfZ2V0X3BpcGVfY29uZmlnKCkKdGhhdCBj
YWxscyBwbGF0Zm9ybSBzcGVjaWZpYyBob29rcyBmb3IgZ2V0X3BpcGVfY29uZmlnKCkKTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UgaGVyZS4KClN1Z2dlc3RlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8
bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAxMCArKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYwppbmRleCA2NGZiMDJjYzVmZjEuLjc2ZDcyNGVmNDcyNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTEx
NDc5LDYgKzExNDc5LDE0IEBAIHN0YXRpYyBib29sIGhzd19nZXRfcGlwZV9jb25maWcoc3RydWN0
IGludGVsX2NydGMgKmNydGMsCiAJcmV0dXJuIGFjdGl2ZTsKIH0KIAorc3RhdGljIGJvb2wgaW50
ZWxfY3J0Y19nZXRfcGlwZV9jb25maWcoc3RydWN0IGludGVsX2NydGMgKmNydGMsCisJCQkJICAg
ICAgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpwaXBlX2NvbmZpZykKK3sKKwlzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGMtPmJhc2UuZGV2KTsKKworCXJl
dHVybiBkZXZfcHJpdi0+ZGlzcGxheS5nZXRfcGlwZV9jb25maWcoY3J0YywgcGlwZV9jb25maWcp
OworfQorCiBzdGF0aWMgdTMyIGludGVsX2N1cnNvcl9iYXNlKGNvbnN0IHN0cnVjdCBpbnRlbF9w
bGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRl
dl9wcml2ID0KQEAgLTE4ODA4LDcgKzE4ODE2LDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfbW9kZXNl
dF9yZWFkb3V0X2h3X3N0YXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCWludGVsX2NydGNf
c3RhdGVfcmVzZXQoY3J0Y19zdGF0ZSwgY3J0Yyk7CiAKIAkJY3J0Y19zdGF0ZS0+aHcuYWN0aXZl
ID0gY3J0Y19zdGF0ZS0+aHcuZW5hYmxlID0KLQkJCWRldl9wcml2LT5kaXNwbGF5LmdldF9waXBl
X2NvbmZpZyhjcnRjLCBjcnRjX3N0YXRlKTsKKwkJCWludGVsX2NydGNfZ2V0X3BpcGVfY29uZmln
KGNydGMsIGNydGNfc3RhdGUpOwogCiAJCWNydGMtPmJhc2UuZW5hYmxlZCA9IGNydGNfc3RhdGUt
Pmh3LmVuYWJsZTsKIAkJY3J0Yy0+YWN0aXZlID0gY3J0Y19zdGF0ZS0+aHcuYWN0aXZlOwotLSAK
Mi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJ
bnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
