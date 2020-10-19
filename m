Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8C7C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 17:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398C92224D
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 17:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398C92224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7992D6EA26;
	Mon, 19 Oct 2020 17:56:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694B6EA26
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2020 17:56:51 +0000 (UTC)
IronPort-SDR: tCForhxXDPvbPZetzRfrjrA6f8G5xONyHTEwklF28H5fbQnfDS/t4afKJCXyvl9XuPjzajyuwN
 QbgOxwNKw/1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="146933887"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="146933887"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 10:56:49 -0700
IronPort-SDR: A+AUpvBgOeQFEwGg7bMqZJGZifxBWX9Y1tHbhiOJVcEri6U5LZoswnCySg+0+dSWi2E80uqu6r
 zkMbRv8YjNeQ==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="347524085"
Received: from sankarvi-mobl1.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.212.43.146])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 10:56:49 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 19 Oct 2020 10:56:09 -0700
Message-Id: <20201019175609.28715-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display/fbc: Implement WA 22010751166
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

VW5kZXJydW5zIGhhcHBlbnMgd2hlbiBwbGFuZSBoZWlnaHQgKyB5IG9mZnNldCBpcyBub3QgYSBt
b2R1bGUgb2YgNAp3aGVuIEZCQyBpcyBlbmFibGVkLgoKU3BlY2lmaWNhdGlvbiBzYXlzIHRoYXQg
aXQgb25seSBhZmZlY3RzIFRHTCBkaXNwbGF5IEMgc3RlcHBpbmcgYW5kCm5ld2VyIGJ1dCB0byBz
aW1wbHkgdGhlIGNoZWNrIGFuZCBhcyBUR0wgaXMgYWxyZWFkeSBpbiBmaW5hbCBjb3N0dW1lcnMK
aGFuZHMsIHByZS1wcm9kdWN0aW9uIGRpc3BsYXkgc3RlcHBpbmcgQSBhbmQgQiB3YXMgYWxzbyBp
bmNsdWRlZC4KCkJTcGVjOiA1Mjg4NyBJQ0wKQlNwZWM6IDUyODg4IEVITC9KU0wKQlNwZWM6IDUy
ODkwLzU1Mzc4IFRHTApCU3BlYzogNTM1MDggREcxCkJTcGVjOiA1MzI3MyBSS0wKU2lnbmVkLW9m
Zi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYyB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2ZiYy5jCmluZGV4IDEzNWY1ZThhNGQ3MC4uYTViMDcyODE2YTdiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMKQEAgLTkwNyw2ICs5MDcsMTMgQEAgc3Rh
dGljIGJvb2wgaW50ZWxfZmJjX2Nhbl9hY3RpdmF0ZShzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykK
IAkJcmV0dXJuIGZhbHNlOwogCX0KIAorCS8qIFdhXzIyMDEwNzUxMTY2OiBpY2wsIGVobCwgdGds
LCBkZzEsIHJrbCAqLworCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDExICYmCisJICAgIChj
YWNoZS0+cGxhbmUuc3JjX2ggKyBjYWNoZS0+cGxhbmUuYWRqdXN0ZWRfeSkgJSA0KSB7CisJCWZi
Yy0+bm9fZmJjX3JlYXNvbiA9ICJwbGFuZSBoZWlnaHQgKyBvZmZzZXQgaXMgbm9uLW1vZHVsbyBv
ZiA0IjsKKwkJcmV0dXJuIGZhbHNlOworCX0KKwogCXJldHVybiB0cnVlOwogfQogCi0tIAoyLjI4
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVs
LWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
