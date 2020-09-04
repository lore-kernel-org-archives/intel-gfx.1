Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DB3C28E83
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 11:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99838214F1
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 11:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99838214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61D46EB4A;
	Fri,  4 Sep 2020 11:54:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD4C6EB4A;
 Fri,  4 Sep 2020 11:54:01 +0000 (UTC)
IronPort-SDR: /9e4ycY0LX+uw84CUOG8pCoX9EwRX8LrKNGOzv5KxT2oEA8ocvXO242cOnDttdkBjR/bVUhnCM
 wdWXiAhLXCRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="221938790"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="221938790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:00 -0700
IronPort-SDR: BYVMo5AZWAzQldPTvUcDg6WjpJhAvSSDtSGf5H20BwxIBR0RCBvB4HURZMRcTPUQgak9IvY6Z3
 XJhp8lDfAqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="342166923"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 04 Sep 2020 04:53:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:53:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Date: Fri,  4 Sep 2020 14:53:37 +0300
Message-Id: <20200904115354.25336-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 01/18] drm/dp: Dump downstream facing port
 caps
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkl0
IGhlbHBzIHdoZW4gdGhlIGxvZ3MgaGF2ZSBhIGR1bXAgb2YgdGhlIERGUCBjYXBhYmlsaXRpZXMu
Cgp2MjogTW92ZSB0aGUgZHVtcGluZyB0byB0aGUgbmV3IGhlbHBlcgoKU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5k
ZXggMWU3YzYzODg3M2M4Li5jMjFiYmZjM2Q3MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpA
QCAtNTQ1LDggKzU0NSwxMyBAQCBpbnQgZHJtX2RwX3JlYWRfZG93bnN0cmVhbV9pbmZvKHN0cnVj
dCBkcm1fZHBfYXV4ICphdXgsCiAJcmV0ID0gZHJtX2RwX2RwY2RfcmVhZChhdXgsIERQX0RPV05T
VFJFQU1fUE9SVF8wLCBkb3duc3RyZWFtX3BvcnRzLCBsZW4pOwogCWlmIChyZXQgPCAwKQogCQly
ZXR1cm4gcmV0OworCWlmIChyZXQgIT0gbGVuKQorCQlyZXR1cm4gLUVJTzsKIAotCXJldHVybiBy
ZXQgPT0gbGVuID8gMCA6IC1FSU87CisJRFJNX0RFQlVHX0tNUygiJXM6IERQQ0QgREZQOiAlKnBo
XG4iLAorCQkgICAgICBhdXgtPm5hbWUsIGxlbiwgZG93bnN0cmVhbV9wb3J0cyk7CisKKwlyZXR1
cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX3JlYWRfZG93bnN0cmVhbV9pbmZvKTsKIAot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
