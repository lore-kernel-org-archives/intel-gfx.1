Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7A5C41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 18:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C43206F4
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C43206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8692E6E4EA;
	Tue,  6 Oct 2020 18:59:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAFC6E4EA
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 18:59:08 +0000 (UTC)
IronPort-SDR: vmPrsTUjZ1SqUFlVyjBgv/Jp4oTSkbERh9992N3c5Dmw71Scz+kgFXpH+X6rCSryqulgMqpK/5
 dL/yeCgTzqtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="161243097"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161243097"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 11:58:15 -0700
IronPort-SDR: NIz4Q0Co48p37AgpjZND4oC0VBfeHGQgYuuy/cvGqac6DbpH4cP2QHdr0NWrq1J/FPDcptsfI6
 mtfxV5dqPjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="348619527"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 06 Oct 2020 11:58:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Oct 2020 21:58:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 21:58:08 +0300
Message-Id: <20201006185809.4655-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006185809.4655-1-ville.syrjala@linux.intel.com>
References: <20201006185809.4655-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/3] drm/i915: Do drm_mode_config_reset() after
 HPD init
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxT
UENPTiByZXF1aXJlcyBIUEQgZGV0ZWN0aW9uIGxvZ2ljIHRvIGJlIGVuYWJsZWQgd2hlbiB3ZSBj
YWxsCml0cyAucmVzZXQoKSBob29rIGR1cmluZyByZXN1bWUsIHRvIGNoZWNrIHRoZSBsaXZlIHN0
YXRlIG9mIHRoZQpwaW4uIFRvIHRoYXQgZW5kIGxldCdzIHJlb3JkZXIgdGhlIHJlc3VtZSBzZXF1
ZW5jZSBzdWNoIHRoYXQKd2UgZG8gSFBEIGluaXQgYmVmb3JlIHRoZSBlbmNvZGVyIHJlc2V0LgoK
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jIHwgNyArKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2Rydi5jCmluZGV4IGIyYTA1MGQ5MTZlMy4uNjZkZGQ0MTYxODg1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmMKQEAgLTEyMTMsMjEgKzEyMTMsMjAgQEAgc3RhdGljIGludCBpOTE1X2Ry
bV9yZXN1bWUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAkgKiBHUFUgd2lsbCBoYW5nLiBpOTE1
X2dlbV9pbml0X2h3KCkgd2lsbCBpbml0aWF0ZSBiYXRjaGVzIHRvCiAJICogdXBkYXRlL3Jlc3Rv
cmUgdGhlIGNvbnRleHQuCiAJICoKLQkgKiBkcm1fbW9kZV9jb25maWdfcmVzZXQoKSBuZWVkcyBB
VVggaW50ZXJydXB0cy4KLQkgKgogCSAqIE1vZGVzZXQgZW5hYmxpbmcgaW4gaW50ZWxfbW9kZXNl
dF9pbml0X2h3KCkgYWxzbyBuZWVkcyB3b3JraW5nCiAJICogaW50ZXJydXB0cy4KIAkgKi8KIAlp
bnRlbF9ydW50aW1lX3BtX2VuYWJsZV9pbnRlcnJ1cHRzKGRldl9wcml2KTsKIAotCWRybV9tb2Rl
X2NvbmZpZ19yZXNldChkZXYpOwotCiAJaTkxNV9nZW1fcmVzdW1lKGRldl9wcml2KTsKIAogCWlu
dGVsX21vZGVzZXRfaW5pdF9odyhkZXZfcHJpdik7CiAJaW50ZWxfaW5pdF9jbG9ja19nYXRpbmco
ZGV2X3ByaXYpOwogCWludGVsX2hwZF9pbml0KGRldl9wcml2KTsKIAorCS8qIE1heSBuZWVkIEFV
WCBpbnRlcnJ1cHRzIGFuZCBIUEQgZGV0ZWN0aW9uIGVuYWJsZWQgKi8KKwlkcm1fbW9kZV9jb25m
aWdfcmVzZXQoZGV2KTsKKwogCS8qIE1TVCBzaWRlYmFuZCByZXF1aXJlcyBIUEQgaW50ZXJydXB0
cyBlbmFibGVkICovCiAJaW50ZWxfZHBfbXN0X3Jlc3VtZShkZXZfcHJpdik7CiAJaW50ZWxfZGlz
cGxheV9yZXN1bWUoZGV2KTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
