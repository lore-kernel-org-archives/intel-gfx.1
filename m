Return-Path: <SRS0=QorL=KJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA8FC433ED
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 12:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A811161404
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 12:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A811161404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D576EE6D;
	Fri, 14 May 2021 12:58:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D0F6EE6D
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 May 2021 12:58:29 +0000 (UTC)
IronPort-SDR: Mze7tMnOfkIczk39XQz1zcZkPE3GajfaY357Wm5mTM1hrq4cnbgSMwNaVc6e7D+NpwO4eFr8xT
 7Ym2yI3257cg==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="264094330"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="264094330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 05:58:28 -0700
IronPort-SDR: WF8EP+zOM5U3qQNL9T/+ArkbPvqE5vAPpE9nJr36ZG2kTcKJDvVgvwbg4X5/AZGLi6WrHBeFqA
 oTH1dKG0keng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="431701833"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 14 May 2021 05:58:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 May 2021 15:58:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 14 May 2021 15:57:49 +0300
Message-Id: <20210514125751.17075-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210514125751.17075-1-ville.syrjala@linux.intel.com>
References: <20210514125751.17075-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 12/14] drm/i915: Fix pipe gamma enable/disable
 vs. CxSR on gmch platforms
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxp
a2UgbW9zdCBvdGhlciBwbGFuZSBjb250cm9sIHJlZ2lzdGVyIGJpdHMsIHRoZSBwaXBlIGdhbW1h
CmVuYWJsZSBiaXQgaXMgYWxzbyBibG9ja2VkIGJ5IEN4U1IuIFNvIG1ha2Ugc3VyZSB3ZSBraWNr
IHRoZQptYWNoaW5lIG91dCBvZiBDeFNSIGJlZm9yZSB0cnlpbmcgdG8gY2hhbmdlIHRoYXQgYml0
LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMg
fCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKaW5kZXggZGFiODkyZDIyNTFiLi41NmE2M2Rm
ODFhMmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29s
b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKQEAg
LTEyNTcsNiArMTI1NywxMCBAQCBpbnRlbF9jb2xvcl9hZGRfYWZmZWN0ZWRfcGxhbmVzKHN0cnVj
dCBpbnRlbF9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSkKIAkJCXJldHVybiBQVFJfRVJSKHBs
YW5lX3N0YXRlKTsKIAogCQluZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX3BsYW5lcyB8PSBCSVQocGxh
bmUtPmlkKTsKKworCQkvKiBwbGFuZSBjb250cm9sIHJlZ2lzdGVyIGNoYW5nZXMgYmxvY2tlZCBi
eSBDeFNSICovCisJCWlmIChIQVNfR01DSChkZXZfcHJpdikpCisJCQluZXdfY3J0Y19zdGF0ZS0+
ZGlzYWJsZV9jeHNyID0gdHJ1ZTsKIAl9CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjYuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxp
bmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
