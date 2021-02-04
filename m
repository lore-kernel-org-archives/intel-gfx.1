Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE86C433DB
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 17:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C5664E27
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 17:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73C5664E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0926E9CB;
	Thu,  4 Feb 2021 17:57:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12406E9CB
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 17:57:13 +0000 (UTC)
IronPort-SDR: 2cyMo3c7QNzq0veCK0bSG0hpKXXzkWvikN9ZxZ8JNAWu604NvwMAr8IiGFwbPsrbIiNulKudzH
 KMsPf9nALQIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="245366786"
X-IronPort-AV: E=Sophos;i="5.81,152,1610438400"; d="scan'208";a="245366786"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 09:57:12 -0800
IronPort-SDR: 2rN3PGrpbcA3up3pMgE3LshMAo5Xg5sGr/90r87N0ecieSKbrfr9gdC6patoNC3HQADt0B57C/
 xtWN8slmTbaA==
X-IronPort-AV: E=Sophos;i="5.81,152,1610438400"; d="scan'208";a="508221367"
Received: from gkpatel-mobl1.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.255.79.143])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 09:57:10 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Feb 2021 09:58:30 -0800
Message-Id: <20210204175830.97857-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display: Remove PSR2 on JSL and EHL
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
Cc: Edmund Dea <edmund.j.dea@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogRWRtdW5kIERlYSA8ZWRtdW5kLmouZGVhQGludGVsLmNvbT4KCldoaWxlIEpTTCBhbmQg
RUhMIGVEUCB0cmFuc2NvZGVyIHN1cHBvcnRzIFBTUjIsIHRoZSBwaHkgb2YgdGhpcwpwbGF0Zm9y
bXMgb25seSBzdXBwb3J0cyBlRFAgMS4zLCBzbyByZW1vdmluZyBQU1IyIHN1cHBvcnQgYXMgdGhp
cwpmZWF0dXJlIHdhcyBhZGRlZCBpbiBlRFAgMS40LgoKU2lnbmVkLW9mZi1ieTogRWRtdW5kIERl
YSA8ZWRtdW5kLmouZGVhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMKaW5kZXggMmMz
NjViNzc4Zjc0Li5jY2NiOGFmZjQzMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuYwpAQCAtNzE4LDYgKzcxOCwxMiBAQCBzdGF0aWMgYm9vbCBpbnRlbF9wc3IyX2Nv
bmZpZ192YWxpZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAogCWlmICghZGV2X3ByaXYtPnBz
ci5zaW5rX3BzcjJfc3VwcG9ydCkKIAkJcmV0dXJuIGZhbHNlOwogCisJLyogSlNMIGFuZCBFSEwg
b25seSBzdXBwb3J0cyBlRFAgMS4zICovCisJaWYgKElTX0pTTF9FSEwoZGV2X3ByaXYpKSB7CisJ
CWRybV9kYmdfa21zKCZkZXZfcHJpdi0+ZHJtLCAiUFNSMiBub3Qgc3VwcG9ydGVkIGJ5IHBoeVxu
Iik7CisJCXJldHVybiBmYWxzZTsKKwl9CisKIAlpZiAoIXRyYW5zY29kZXJfaGFzX3BzcjIoZGV2
X3ByaXYsIGNydGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyKSkgewogCQlkcm1fZGJnX2ttcygmZGV2
X3ByaXYtPmRybSwKIAkJCSAgICAiUFNSMiBub3Qgc3VwcG9ydGVkIGluIHRyYW5zY29kZXIgJXNc
biIsCi0tIAoyLjMwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
