Return-Path: <SRS0=v1fV=H2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C8FC433E9
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Feb 2021 14:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CD864ED6
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Feb 2021 14:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76CD864ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1FD6EAD1;
	Wed, 24 Feb 2021 14:42:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470206EACF
 for <intel-gfx@lists.freedesktop.org>; Wed, 24 Feb 2021 14:42:29 +0000 (UTC)
IronPort-SDR: lUrNnpFs9YegrCgOZzREIHRmZwZCAeLpjrQfO+oRFeePf9sLk+kKcQcSjbe9/qcYuIfQ6itmOn
 MJZimwKCqa4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="164408213"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="164408213"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 06:42:24 -0800
IronPort-SDR: b0AtozzDudSu0uNEuCpMumJGkhI1DM2hUm48pA1UryuK7TXpdQh7IxRNGSmj/qXG+hVnkXKgG7
 gFp07NgQ8Vkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="442105970"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 24 Feb 2021 06:42:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Feb 2021 16:42:17 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 24 Feb 2021 16:42:09 +0200
Message-Id: <20210224144214.24803-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224144214.24803-1-ville.syrjala@linux.intel.com>
References: <20210224144214.24803-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/6] drm/i915: Call primary encoder's
 .get_config() from MST .get_config()
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClN0
b3AgYXNzdW1pbmcgaW50ZWxfZGRpX2dldF9jb25maWcoKSBpcyBhbGwgd2UgbmVlZCBmcm9tIHRo
ZSBwcmltYXJ5CmVuY29kZXIsIGFuZCBpbnN0ZWFkIGNhbGwgaXQgdmlhIHRoZSAuZ2V0X2NvbmZp
ZygpIHZmdW5jLiBUaGlzCndpbGwgYWxsb3cgY3VzdG9taXplZCAuZ2V0X2NvbmZpZygpIGZvciB0
aGUgcHJpbWFyeSwgd2hpY2ggSSBwbGFuCnRvIHVzZSB0byBoYW5kbGUgdGhlIGRpZmZlcmVuY2Vz
IGluIHRoZSBjbG9jayByZWFkb3V0IGJldHdlZW4gdmFyaW91cwpwbGF0Zm9ybXMuCgpTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwppbmRleCA4ZTMxNjE0NmI2ZDEuLjkw
Njg2MGFkOGViOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jCkBAIC01OTEsNyArNTkxLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHBfbXN0X2VuY19nZXRf
Y29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCXN0cnVjdCBpbnRlbF9kcF9t
c3RfZW5jb2RlciAqaW50ZWxfbXN0ID0gZW5jX3RvX21zdChlbmNvZGVyKTsKIAlzdHJ1Y3QgaW50
ZWxfZGlnaXRhbF9wb3J0ICpkaWdfcG9ydCA9IGludGVsX21zdC0+cHJpbWFyeTsKIAotCWludGVs
X2RkaV9nZXRfY29uZmlnKCZkaWdfcG9ydC0+YmFzZSwgcGlwZV9jb25maWcpOworCWRpZ19wb3J0
LT5iYXNlLmdldF9jb25maWcoJmRpZ19wb3J0LT5iYXNlLCBwaXBlX2NvbmZpZyk7CiB9CiAKIHN0
YXRpYyBib29sIGludGVsX2RwX21zdF9pbml0aWFsX2Zhc3RzZXRfY2hlY2soc3RydWN0IGludGVs
X2VuY29kZXIgKmVuY29kZXIsCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAo=
