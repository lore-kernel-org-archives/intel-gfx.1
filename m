Return-Path: <SRS0=Slz9=JT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F9AC433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Apr 2021 09:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09E66144D
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Apr 2021 09:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09E66144D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C186E147;
	Thu, 22 Apr 2021 09:54:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF836EA66
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Apr 2021 09:54:10 +0000 (UTC)
IronPort-SDR: aQoGgtkU3tqAyzjQ8i8DJBz7lMPJs809vJPmnxhqNh+N1X4N+jHD2CFDhLuK+y7e8ryeSGKw4L
 wu1T58yv71NQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="257170272"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="257170272"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 02:54:09 -0700
IronPort-SDR: Y+gMDYXhQ4vezvB0dYa273UAV+wkDDrqILpz80Qz7UXG9IJhPXPsfMKB/gLF8LRxkgbt69pCSc
 BPxEKy8KWi/A==
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="427870324"
Received: from asmukose-mobl.ccr.corp.intel.com (HELO helsinki.intel.com)
 ([10.252.37.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 02:54:07 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Apr 2021 12:54:01 +0300
Message-Id: <20210422095401.2377644-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display: Disable PSR2 if TGL Display
 stepping is B1 from A0
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

VEdMIFBTUjIgaGFyZHdhcmUgdHJhY2tpbmcgc2hvd3MgbW9tZW50YXJ5IGZsaWNrZXIgYW5kIHNj
cmVlbiBzaGlmdCBpZgpUR0wgRGlzcGxheSBzdGVwcGluZyBpcyBCMSBmcm9tIEEwLgpJdCBoYXMg
YmVlbiBmaXhlZCBmcm9tIFRHTCBEaXNwbGF5IHN0ZXBwaW5nIEMwLgoKSFNERVM6IDE4MDE1OTcw
MDIxCkhTREVTOiAyMjA5MzEzODExCkJTcGVjOiA1NTM3OAoKQ2M6IEpvc8OpIFJvYmVydG8gZGUg
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBN
dW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMKaW5kZXggNGFk
NzU2ZTIzOGM1Li4yY2M5ZWVhYjRiYWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuYwpAQCAtNzM5LDYgKzczOSwxMiBAQCBzdGF0aWMgYm9vbCBpbnRlbF9wc3IyX2Nv
bmZpZ192YWxpZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAogCQlyZXR1cm4gZmFsc2U7CiAJ
fQogCisJLyogV2FfMjIwOTMxMzgxMSAqLworCWlmIChJU19UR0xfRElTUExBWV9TVEVQKGRldl9w
cml2LCBTVEVQX0EwLCBTVEVQX0IxKSkgeworCQlkcm1fZGJnX2ttcygmZGV2X3ByaXYtPmRybSwg
IlBTUjIgaXMgbm90IHN1cHBvcnRlZCB0aGlzIERpc3BsYXkgc3RlcHBpbmdcbiIpOworCQlyZXR1
cm4gZmFsc2U7CisJfQorCiAJLyogV2FfMTYwMTExODEyNTAgKi8KIAlpZiAoSVNfUk9DS0VUTEFL
RShkZXZfcHJpdikgfHwgSVNfQUxERVJMQUtFX1MoZGV2X3ByaXYpKSB7CiAJCWRybV9kYmdfa21z
KCZkZXZfcHJpdi0+ZHJtLCAiUFNSMiBpcyBkZWZlYXR1cmVkIGZvciB0aGlzIHBsYXRmb3JtXG4i
KTsKLS0gCjIuMzAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z2Z4Cg==
