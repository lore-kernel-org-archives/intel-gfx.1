Return-Path: <SRS0=t6nC=G7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F60C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Jan 2021 16:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1DA64E05
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Jan 2021 16:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1DA64E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F401D6E1F9;
	Thu, 28 Jan 2021 16:00:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C75C6E1F9
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 Jan 2021 15:59:59 +0000 (UTC)
IronPort-SDR: bsBf5DQ3V0DUaAvz98o/Gliglfs6FCt5w+ZgASfT4/l4YJdVdS1PK/QjTEObyiFLuUKc7MkfKp
 BtrVQjL6pizw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="180399256"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="180399256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 07:59:58 -0800
IronPort-SDR: /T2hFtUULmzkVkmJMV9j9+NbKcdPcBKVfUBmIQ9OHQDUwvOeRlKT93RuJAYLPPZXGUjYDiXjKM
 3R/xqeo3oo5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="369899951"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 28 Jan 2021 07:59:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Jan 2021 17:59:55 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 28 Jan 2021 17:59:46 +0200
Message-Id: <20210128155948.13678-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128155948.13678-1-ville.syrjala@linux.intel.com>
References: <20210128155948.13678-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/5] drm/i915: Power up combo PHY lanes for for
 HDMI as well
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkN1
cnJlbnRseSB3ZSBvbmx5IGV4cGxpY2l0bHkgcG93ZXIgdXAgdGhlIGNvbWJvIFBIWSBsYW5lcwpm
b3IgRFAuIFRoZSBzcGVjIHNheXMgd2Ugc2hvdWxkIGRvIGl0IGZvciBIRE1JIGFzIHdlbGwuCgpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGRpLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGku
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKaW5kZXggODhjYzZl
MmZiZTkxLi44ZmJlYjhjMjRlZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGRpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYwpAQCAtNDMzNyw2ICs0MzM3LDggQEAgc3RhdGljIHZvaWQgaW50ZWxfZW5hYmxlX2Rk
aV9oZG1pKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQlpbnRlbF9kZV93cml0
ZShkZXZfcHJpdiwgcmVnLCB2YWwpOwogCX0KIAorCWludGVsX2RkaV9wb3dlcl91cF9sYW5lcyhl
bmNvZGVyLCBjcnRjX3N0YXRlKTsKKwogCS8qIEluIEhETUkvRFZJIG1vZGUsIHRoZSBwb3J0IHdp
ZHRoLCBhbmQgc3dpbmcvZW1waGFzaXMgdmFsdWVzCiAJICogYXJlIGlnbm9yZWQgc28gbm90aGlu
ZyBzcGVjaWFsIG5lZWRzIHRvIGJlIGRvbmUgYmVzaWRlcwogCSAqIGVuYWJsaW5nIHRoZSBwb3J0
LgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
