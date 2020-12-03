Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24B9C4361A
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 23:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4645D22285
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 23:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4645D22285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FC66E0DD;
	Thu,  3 Dec 2020 23:51:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDE46E0DD
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Dec 2020 23:51:03 +0000 (UTC)
IronPort-SDR: W0xzclSGxKYQ+wu+lDKt+YTjnCk1EcEb4rbwAhhhzrwgNNVrCPTbEC2zlJL9jbfaLPFP5F77Aj
 jzE2F/zQP38Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="161067206"
X-IronPort-AV: E=Sophos;i="5.78,390,1599548400"; d="scan'208";a="161067206"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 15:51:03 -0800
IronPort-SDR: 4ccXkzf9dvcJ4dKwVViV0z/3It69BZ5ZuKjf/TSBCdLxRmRCmRLrMgrVqcOsE7UnJquxrwRTd5
 RCZd4f/0zpdQ==
X-IronPort-AV: E=Sophos;i="5.78,390,1599548400"; d="scan'208";a="550716497"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Dec 2020 15:51:03 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  3 Dec 2020 15:53:53 -0800
Message-Id: <20201203235358.18041-4-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201203235358.18041-1-manasi.d.navare@intel.com>
References: <20201203235358.18041-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 4/9] drm/i915/display/dp: Do not enable PSR
 if VRR is enabled
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

RXZlbiB0aG91Z2ggb3VyIEhXIHN1cHBvcnRzIFBTUiArIFZSUiwgdGhlIGF2YWlsYWJsZSBwYW5l
bHMKZG8gbm90IHdvcmsgcmVsaWFibHkgd2l0aCBQU1IgYW5kIFZSUiB0b2dldGhlci4gU28gaWYg
dXNlcgpyZXF1ZXN0ZWQgVlJSIGFuZCBpcyBzdXBwb3J0ZWQgYnkgSFcgZW5hYmxlIHRoYXQgYW5k
IGRvIG5vdAplbmFibGUgUFNSIGluIHRoYXQgY2FzZS4KCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5
ZW9uZy5tdW5AaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCA3ICsrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYwppbmRleCBkOWEzOTVjNDg2ZDMuLjRiYmQ5MjEzNTY1MSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jCkBAIC04MTEsNiArODExLDEzIEBA
IHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAs
CiAJCSZjcnRjX3N0YXRlLT5ody5hZGp1c3RlZF9tb2RlOwogCWludCBwc3Jfc2V0dXBfdGltZTsK
IAorCS8qCisJICogQ3VycmVudCBQU1IgcGFuZWxzIGRvbnQgd29yayByZWxpYWJseSB3aXRoIFZS
UiBlbmFibGVkCisJICogU28gaWYgVlJSIGlzIGVuYWJsZWQsIGRvIG5vdCBlbmFibGUgUFNSLgor
CSAqLworCWlmIChjcnRjX3N0YXRlLT52cnIuZW5hYmxlKQorCQlyZXR1cm47CisKIAlpZiAoIUNB
Tl9QU1IoZGV2X3ByaXYpKQogCQlyZXR1cm47CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
