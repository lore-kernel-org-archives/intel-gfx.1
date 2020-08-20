Return-Path: <SRS0=S5Fm=B6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BBEC433E3
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 14:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0E58207DE
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 14:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0E58207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CD6E953;
	Thu, 20 Aug 2020 14:53:15 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BC76E944;
 Thu, 20 Aug 2020 14:53:12 +0000 (UTC)
IronPort-SDR: cIphLg+s463SZnK7rdVX4eT+Ym+dZ7YnEAO2nHWkrZ+7BKtcytco/deDTvmAhEIR9B3vLrW1Vl
 ifAh0Mv8gDlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="240136255"
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; d="scan'208";a="240136255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 07:53:11 -0700
IronPort-SDR: GLwMoLhm8NQ/l6P9HQ5u/HA2mw7ksomdvyf8ERgjbCmLKIFHVuW09sCAI5Ltm3ke4C7M3nHGz9
 OmkMn4/1Blbw==
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; d="scan'208";a="472679759"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 07:53:09 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Aug 2020 16:52:08 +0200
Message-Id: <20200820145215.13238-13-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200820145215.13238-1-janusz.krzysztofik@linux.intel.com>
References: <20200820145215.13238-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v3 12/19] tests/core_hotunplug: Fail
 subtests on device close errors
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

U2luY2UgaGVhbHRoIGNoZWNrcyBhcmUgbm93IHJ1biBmcm9tIGZvbGxvdy11cCBmaXh0dXJlIHNl
Y3Rpb25zLCBpdCBpcwpzYWZlIHRvIGZhaWwgc3VidGVzdHMgd2l0aG91dCB0aGUgbmVlZCB0byBh
Ym9ydCB0aGUgdGVzdCBleGVjdXRpb24uICBEbwp0aGF0IG9uIGRldmljZSBjbG9zZSBlcnJvcnMg
aW5zdGVhZCBvZiBqdXN0IGVtaXR0aW5nIHdhcm5pbmdzLgoKdjM6IFJlZnJlc2guCgpTaWduZWQt
b2ZmLWJ5OiBKYW51c3ogS3J6eXN6dG9maWsgPGphbnVzei5rcnp5c3p0b2Zpa0BsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBp
bnRlbC5jb20+Ci0tLQogdGVzdHMvY29yZV9ob3R1bnBsdWcuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZV9ob3R1bnBsdWcu
YyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKaW5kZXggMTQ1NTkzNjgzLi5lMDQ4ZjNhMTUgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKKysrIGIvdGVzdHMvY29yZV9ob3R1bnBs
dWcuYwpAQCAtMTUzLDYgKzE1Myw3IEBAIHN0YXRpYyB2b2lkIGRldmljZV91bnBsdWcoc3RydWN0
IGhvdHVucGx1ZyAqcHJpdiwgY29uc3QgY2hhciAqcHJlZml4KQogCWlndF9yZXNldF90aW1lb3V0
KCk7CiAKIAlwcml2LT5mZC5zeXNmc19kZXYgPSBjbG9zZV9zeXNmcyhwcml2LT5mZC5zeXNmc19k
ZXYpOworCWlndF9hc3NlcnRfZXEocHJpdi0+ZmQuc3lzZnNfZGV2LCAtMSk7CiB9CiAKIC8qIFJl
LWRpc2NvdmVyIHRoZSBkZXZpY2UgYnkgcmVzY2FubmluZyBpdHMgYnVzICovCkBAIC0yNzAsNiAr
MjcxLDcgQEAgc3RhdGljIHZvaWQgaG90dW5iaW5kX2xhdGVjbG9zZShzdHJ1Y3QgaG90dW5wbHVn
ICpwcml2KQogCiAJaWd0X2RlYnVnKCJsYXRlIGNsb3NpbmcgdGhlIHVuYm91bmQgZGV2aWNlIGlu
c3RhbmNlXG4iKTsKIAlwcml2LT5mZC5kcm0gPSBjbG9zZV9kZXZpY2UocHJpdi0+ZmQuZHJtKTsK
KwlpZ3RfYXNzZXJ0X2VxKHByaXYtPmZkLmRybSwgLTEpOwogfQogCiBzdGF0aWMgdm9pZCBob3R1
bnBsdWdfbGF0ZWNsb3NlKHN0cnVjdCBob3R1bnBsdWcgKnByaXYpCkBAIC0yODIsNiArMjg0LDcg
QEAgc3RhdGljIHZvaWQgaG90dW5wbHVnX2xhdGVjbG9zZShzdHJ1Y3QgaG90dW5wbHVnICpwcml2
KQogCiAJaWd0X2RlYnVnKCJsYXRlIGNsb3NpbmcgdGhlIHJlbW92ZWQgZGV2aWNlIGluc3RhbmNl
XG4iKTsKIAlwcml2LT5mZC5kcm0gPSBjbG9zZV9kZXZpY2UocHJpdi0+ZmQuZHJtKTsKKwlpZ3Rf
YXNzZXJ0X2VxKHByaXYtPmZkLmRybSwgLTEpOwogfQogCiAvKiBNYWluICovCi0tIAoyLjIxLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdm
eCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
