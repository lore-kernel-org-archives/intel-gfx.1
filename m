Return-Path: <SRS0=ktOb=HY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90E2C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 21:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7709364E25
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 21:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7709364E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E236E096;
	Mon, 22 Feb 2021 21:29:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30956E096
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 21:29:01 +0000 (UTC)
IronPort-SDR: aE95jvr+B22wBzEfHu5pvssQ8LOw0nNomijQs8Nxv1ex8X4KLnS7aV1/5MAJqWs/UUv9NyAqfQ
 0B7ThdcFxMUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="171738640"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="171738640"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:29:00 -0800
IronPort-SDR: 55qm+d5N2Jn6gnFokbYzAdfxDjo+4EN8JAWK22398aaxduutkug4UY/2gVmyQB0p5AIKJrZMYt
 wLuSHgFrOmiQ==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="402798114"
Received: from helsinki.fi.intel.com ([10.237.66.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:28:58 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 22 Feb 2021 23:30:06 +0200
Message-Id: <20210222213006.1609085-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3] drm/i915/display: Do not allow DC3CO if PSR
 SF is enabled
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

RXZlbiB0aG91Z2ggR0VOMTIrIEhXIHN1cHBvcnRzIFBTUiArIERDM0NPLCBETUMncyBIVyBEQzND
TyBleGl0IG1lY2hhbmlzbQpoYXMgYW4gaXNzdWUgd2l0aCB1c2luZyBvZiBTZWxlY3RpdmUgRmVj
dGggYW5kIFBTUjIgbWFudWFsIHRyYWNraW5nLgpBbmQgYXMgc29tZSBHRU4xMisgcGxhdGZvcm1z
IChSS0wsIEFETC1TKSBkb24ndCBzdXBwb3J0IFBTUjIgSFcgdHJhY2tpbmcsClNlbGVjdGl2ZSBG
ZXRjaCB3aWxsIGJlIGVuYWJsZWQgYnkgZGVmYXVsdCBvbiB0aGF0IHBsYXRmb3Jtcy4KVGhlcmVm
b3JlIGlmIHRoZSBzeXN0ZW0gZW5hYmxlcyBQU1IgU2VsZWN0aXZlIEZldGNoIC8gUFNSIG1hbnVh
bCB0cmFja2luZywKaXQgZG9lcyBub3QgYWxsb3cgREMzQ08gZGMgc3RhdGUsIGluIHRoYXQgY2Fz
ZS4KCldoZW4gdGhpcyBEQzNDTyBleGl0IGlzc3VlIGlzIGFkZHJlc3NlZCB3aGlsZSBQU1IgU2Vs
ZWN0aXZlIEZldGNoIGlzCmVuYWJsZWQsIHRoaXMgcmVzdHJpY3Rpb24gc2hvdWxkIGJlIHJlbW92
ZWQuCgp2MjogQWRkcmVzcyBKb3NlJ3MgcmV2aWV3IGNvbW1lbnQuCiAgLSBGaXggdHlwbwogIC0g
TW92ZSBjaGVjayByb3V0aW5lIG9mIERDM0NPIGFiaWxpdHkgdG8KICAgIHRnbF9kYzNjb19leGl0
bGluZV9jb21wdXRlX2NvbmZpZygpCnYzOiBDaGFuZ2UgdGhlIGNoZWNrIHJvdXRpbmUgb2YgZW5h
YmxlbWVudCBvZiBwc3IyIHNlbCBmZXRjaC4gKEpvc2UpCgpDYzogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNjOiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4u
Z3VwdGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3ll
b25nLm11bkBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9wc3IuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jCmluZGV4IDdjNmU1NjFmODZjMS4u
Y2Q0MzQyODVlM2I3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMK
QEAgLTY1NCw2ICs2NTQsMTMgQEAgdGdsX2RjM2NvX2V4aXRsaW5lX2NvbXB1dGVfY29uZmlnKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7CiAJdTMyIGV4aXRfc2NhbmxpbmVzOwogCisJLyoK
KwkgKiBETUMncyBEQzNDTyBleGl0IG1lY2hhbmlzbSBoYXMgYW4gaXNzdWUgd2l0aCBTZWxlY3Rp
dmUgRmVjdGgKKwkgKiBUT0RPOiB3aGVuIHRoZSBpc3N1ZSBpcyBhZGRyZXNzZWQsIHRoaXMgcmVz
dHJpY3Rpb24gc2hvdWxkIGJlIHJlbW92ZWQuCisJICovCisJaWYgKGNydGNfc3RhdGUtPmVuYWJs
ZV9wc3IyX3NlbF9mZXRjaCkKKwkJcmV0dXJuOworCiAJaWYgKCEoZGV2X3ByaXYtPmNzci5hbGxv
d2VkX2RjX21hc2sgJiBEQ19TVEFURV9FTl9EQzNDTykpCiAJCXJldHVybjsKIAotLSAKMi4zMC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
