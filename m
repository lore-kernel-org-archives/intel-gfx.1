Return-Path: <SRS0=aXtb=EJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AA2C4742C
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 01:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D325C2074F
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 01:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D325C2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22A6E827;
	Tue,  3 Nov 2020 01:51:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9956E81F
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 Nov 2020 01:51:02 +0000 (UTC)
IronPort-SDR: jBRnwqdztMpUYqvWqQpU3QoPZo4iK33RtLAWsQsFqxaZjWyaKILT0zuMOGwInAYYQoMABMC9Pz
 YZ8sl9ljd4Cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="155971619"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="155971619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 17:51:02 -0800
IronPort-SDR: OwTF62NOCPCtyizqYESEDxQbmclLqFevcJLZJv+PsqmTySHOXeOTA7mMiAWKVmgY1x3pfN8WmM
 YXb0yp7Qsm1A==
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="470597857"
Received: from helsinki.fi.intel.com ([10.237.66.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 17:51:01 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 Nov 2020 03:50:45 +0200
Message-Id: <20201103015045.109306-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20201103015045.109306-1-gwan-gyeong.mun@intel.com>
References: <20201103015045.109306-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/display: Support Multiple
 Transcoders' PSR status on debugfs
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

SW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUgUFNSIHN0YXRlIG9mIGVhY2ggdHJhbnNjb2RlciwgaXQg
YWRkcwppOTE1X3Bzcl9zdGF0dXMgdG8gc3ViLWRpcmVjdG9yeSBvZiBlYWNoIHRyYW5zY29kZXIu
CgpTaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5j
b20+CkNjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0t
CiAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYyAgfCAyMyArKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2Zz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5j
CmluZGV4IGI4N2MzMjFiMmJmNS4uMmM1YzYwOTdkZmQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMKQEAgLTIwOTEsNiAr
MjA5MSwyMyBAQCBzdGF0aWMgaW50IGk5MTVfaGRjcF9zaW5rX2NhcGFiaWxpdHlfc2hvdyhzdHJ1
Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCiB9CiBERUZJTkVfU0hPV19BVFRSSUJVVEUoaTkx
NV9oZGNwX3NpbmtfY2FwYWJpbGl0eSk7CiAKK3N0YXRpYyBpbnQgaTkxNV9wc3Jfc3RhdHVzX3No
b3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQoreworCXN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRlOworCXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAg
PQorCQlpbnRlbF9hdHRhY2hlZF9kcCh0b19pbnRlbF9jb25uZWN0b3IoY29ubmVjdG9yKSk7CisJ
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7
CisKKwlpZiAoY29ubmVjdG9yLT5zdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQp
CisJCXJldHVybiAtRU5PREVWOworCisJaWYgKCFIQVNfUFNSKGRldl9wcml2KSkKKwkJcmV0dXJu
IC1FTk9ERVY7CisKKwlyZXR1cm4gaW50ZWxfcHNyX3N0YXR1cyhtLCBpbnRlbF9kcCk7Cit9CitE
RUZJTkVfU0hPV19BVFRSSUJVVEUoaTkxNV9wc3Jfc3RhdHVzKTsKKwogI2RlZmluZSBMUFNQX0NB
UEFCTEUoQ09ORCkgKENPTkQgPyBzZXFfcHV0cyhtLCAiTFBTUDogY2FwYWJsZVxuIikgOiBcCiAJ
CQkJc2VxX3B1dHMobSwgIkxQU1A6IGluY2FwYWJsZVxuIikpCiAKQEAgLTIyNjYsNiArMjI4Mywx
MiBAQCBpbnQgaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCiAJCQkJICAgIGNvbm5lY3RvciwgJmk5MTVfcHNyX3Npbmtfc3RhdHVzX2Zv
cHMpOwogCX0KIAorCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEyICYmCisJICAgIGNvbm5l
Y3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgeworCQlkZWJ1
Z2ZzX2NyZWF0ZV9maWxlKCJpOTE1X3Bzcl9zdGF0dXMiLCBTX0lSVUdPLCByb290LAorCQkJCSAg
ICBjb25uZWN0b3IsICZpOTE1X3Bzcl9zdGF0dXNfZm9wcyk7CisJfQorCiAJaWYgKGNvbm5lY3Rv
ci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IHx8CiAJ
ICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlB
IHx8CiAJICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9S
X0hETUlCKSB7Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWdmeAo=
