Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41534C433E6
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 16:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D054A22AAD
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 16:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D054A22AAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2C189BE8;
	Mon, 11 Jan 2021 16:37:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BAD89BE8
 for <intel-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 16:37:26 +0000 (UTC)
IronPort-SDR: YbOZ9qJpOeDtNSBJPxnTnw8YvYBCAzKzYOQvorym7B6X9NlggOLtzf6aRiyJL7wkjUwkQ4VnT1
 0/xnjX2BFWtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="262673556"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="262673556"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 08:37:25 -0800
IronPort-SDR: SbgacM7ZbZLtuZSBmQ/ah8kVM9h0qQXg5ashHhnXkbTyZ1N+R/fAMfmIhmPFc10Bz6CPpQ/zRN
 wxwDtbdewHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="423846698"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 11 Jan 2021 08:37:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 11 Jan 2021 18:37:21 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 11 Jan 2021 18:37:03 +0200
Message-Id: <20210111163711.12913-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111163711.12913-1-ville.syrjala@linux.intel.com>
References: <20210111163711.12913-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 03/11] drm/i915: Drop redundant parens
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRy
b3AgdGhlIHBvaW50bGVzcyBleHRyYSBwYXJlbnMuCgpDYzogS2FydGhpayBCIFMgPGthcnRoaWsu
Yi5zQGludGVsLmNvbT4KQ2M6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEua3Vsa2FybmlAaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9pcnEuYwppbmRleCBkZDE5NzEwNDBiYmMuLjQ0ODQ2MDlkODcwZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2lycS5jCkBAIC0yMDc5LDcgKzIwNzksNyBAQCBzdGF0aWMgdm9pZCBpdmJfZGlz
cGxheV9pcnFfaGFuZGxlcihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCWlu
dGVsX29wcmVnaW9uX2FzbGVfaW50cihkZXZfcHJpdik7CiAKIAlmb3JfZWFjaF9waXBlKGRldl9w
cml2LCBwaXBlKSB7Ci0JCWlmIChkZV9paXIgJiAoREVfUElQRV9WQkxBTktfSVZCKHBpcGUpKSkK
KwkJaWYgKGRlX2lpciAmIERFX1BJUEVfVkJMQU5LX0lWQihwaXBlKSkKIAkJCWludGVsX2hhbmRs
ZV92YmxhbmsoZGV2X3ByaXYsIHBpcGUpOwogCX0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0
CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
