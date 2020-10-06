Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1788FC47420
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 14:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA066204EF
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 14:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA066204EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D3D89950;
	Tue,  6 Oct 2020 14:34:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2D6898FD
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 14:34:23 +0000 (UTC)
IronPort-SDR: ZEbhWrrarm1m7xDYSAe1SPQMmYsDOCS4Pk08vpVeEk2xWLKL8Wc8mQ9bIdMPI6pX2tV/qBU0u1
 547NIS3ZsqFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="164585443"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="164585443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 07:34:15 -0700
IronPort-SDR: E5kytR/42ApQtqoohr8D1LpCtyEEsrqHKgBZrd02NGet62yC2MpCmwxlKr1ySdcHX7vvLgwxgb
 pa+xoWtX+QHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="296983685"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 06 Oct 2020 07:34:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Oct 2020 17:34:09 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 17:33:36 +0300
Message-Id: <20201006143349.5561-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006143349.5561-1-ville.syrjala@linux.intel.com>
References: <20201006143349.5561-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 07/20] drm/i915: Use AUX_CH_USBCn for the RKL
 VBT AUX CH setup
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFz
IHdpdGggdGhlIFZCVCBEVk8gcG9ydCwgUktMIHVzZXMgUEhZIGJhc2VkIG1hcHBpbmcgZm9yIHRo
ZQpWQlQgQVVYIENILiBBZGp1c3QgdGhlIGNvZGUgdG8gdXNlIHRoZSBuZXcgQVVYX1VTQkNuIG5h
bWVzCmFuZCBhZGQgYSBjb21tZW50IHRvIGV4cGxhaW4gdGhlIHNpdHVhdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmMgfCA4ICsrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmMKaW5kZXggMTc5MDI5YzNkM2Q1Li43
N2M4NmY1MWMzNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYmlvcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5j
CkBAIC0yNjM2LDEwICsyNjM2LDE0IEBAIGVudW0gYXV4X2NoIGludGVsX2Jpb3NfcG9ydF9hdXhf
Y2goc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAogCQlhdXhfY2ggPSBBVVhfQ0hf
QjsKIAkJYnJlYWs7CiAJY2FzZSBEUF9BVVhfQzoKLQkJYXV4X2NoID0gSVNfUk9DS0VUTEFLRShk
ZXZfcHJpdikgPyBBVVhfQ0hfRCA6IEFVWF9DSF9DOworCQkvKgorCQkgKiBSS0wgVkJUIHVzZXMg
UEhZIGJhc2VkIG1hcHBpbmcuIENvbWJvIFBIWXMgQSxCLEMsRAorCQkgKiBtYXAgdG8gRERJIEEs
QixUQzEsVEMyIHJlc3BlY3RpdmVseS4KKwkJICovCisJCWF1eF9jaCA9IElTX1JPQ0tFVExBS0Uo
ZGV2X3ByaXYpID8gQVVYX0NIX1VTQkMxIDogQVVYX0NIX0M7CiAJCWJyZWFrOwogCWNhc2UgRFBf
QVVYX0Q6Ci0JCWF1eF9jaCA9IElTX1JPQ0tFVExBS0UoZGV2X3ByaXYpID8gQVVYX0NIX0UgOiBB
VVhfQ0hfRDsKKwkJYXV4X2NoID0gSVNfUk9DS0VUTEFLRShkZXZfcHJpdikgPyBBVVhfQ0hfVVNC
QzIgOiBBVVhfQ0hfRDsKIAkJYnJlYWs7CiAJY2FzZSBEUF9BVVhfRToKIAkJYXV4X2NoID0gQVVY
X0NIX0U7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
