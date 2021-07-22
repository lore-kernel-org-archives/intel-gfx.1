Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6098DC63799
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 05:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4D461001
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 05:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4D461001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0D16EEB9;
	Thu, 22 Jul 2021 05:39:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C546E85E
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Jul 2021 05:39:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="208456080"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="208456080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 22:39:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470415098"
Received: from jkandi-mobl.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.209.170.189])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 22:39:26 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Jul 2021 22:43:38 -0700
Message-Id: <20210722054338.12891-10-jose.souza@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722054338.12891-1-jose.souza@intel.com>
References: <20210722054338.12891-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 10/10] drm/i915/display/tgl+: Use PPS index from
 vbt
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

VGlnZXJsYWtlIGFuZCBuZXdlciBoYXMgdHdvIGluc3RhbmNlcyBvZiBQUFMsIHRvIHN1cHBvcnQg
dXAgdG8gdHdvCmVEUCBwYW5lbHMuCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHBzLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHBzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bwcy5jCmluZGV4IGY0YzE1YTFmMzFkMTUuLmVl
OTJmNDE2ODM0ZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcHBzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wcHMuYwpA
QCAtMzY4LDcgKzM2OCw4IEBAIHN0YXRpYyB2b2lkIGludGVsX3Bwc19nZXRfcmVnaXN0ZXJzKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCiAKIAltZW1zZXQocmVncywgMCwgc2l6ZW9mKCpyZWdz
KSk7CiAKLQlpZiAoSVNfR0VNSU5JTEFLRShkZXZfcHJpdikgfHwgSVNfQlJPWFRPTihkZXZfcHJp
dikpCisJaWYgKElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpIHx8IElTX0JST1hUT04oZGV2X3ByaXYp
IHx8CisJICAgIERJU1BMQVlfVkVSKGRldl9wcml2KSA+PSAxMikKIAkJcHBzX2lkeCA9IGJ4dF9w
b3dlcl9zZXF1ZW5jZXJfaWR4KGludGVsX2RwKTsKIAllbHNlIGlmIChJU19WQUxMRVlWSUVXKGRl
dl9wcml2KSB8fCBJU19DSEVSUllWSUVXKGRldl9wcml2KSkKIAkJcHBzX2lkeCA9IHZsdl9wb3dl
cl9zZXF1ZW5jZXJfcGlwZShpbnRlbF9kcCk7Ci0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
