Return-Path: <SRS0=Bn5a=IX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB90C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 00:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA0E619DC
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 00:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA0E619DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EF26EADC;
	Thu, 25 Mar 2021 00:44:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6796EADC
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Mar 2021 00:44:18 +0000 (UTC)
IronPort-SDR: k6ybni6lF+V60XLqc3LXPftNc2+a6tKXDnCrnTLxTJdXowqUfYoxVvWftCQ3durI6CC28DtCGL
 dFC4MOoWnCfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254805376"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="254805376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 17:44:18 -0700
IronPort-SDR: iHCZguUG5rKv9qlrOcR872YLE+zkEOt9DmDm+ceZJZwa0DIKe0EVxvNw47nGrDkqQUcDLuurlm
 qKVWFXpHjiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="413966455"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 24 Mar 2021 17:44:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 25 Mar 2021 02:44:15 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 25 Mar 2021 02:44:14 +0200
Message-Id: <20210325004415.17432-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915: Fix transposed arguments to
 skl_plane_wm_level()
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFj
Y2lkZW50YWxseSB0cmFuc3Bvc2VkIHRoZSBhcmd1bWVudHMgdG8gc2tsX3BsYW5lX3dtX2xldmVs
KCkKd2hpY2ggaXMgY2F1c2luZyB1cyB0byBtaXN0YWtlbmx5IHRoaW5rIHRoYXQgdGhlIHBsYW5l
IHdhdGVybWFya3MKaGF2ZS9oYXZlIG5vdCBjaGFuZ2VkIHdoZW4gdGhlIG9wcG9zaXRlIG1heSBi
ZSB0cnVlLiBTd2FwIHRoZQphcmd1bWVudHMgc28gdGhpcyBhY3R1YWxseSB3b3Jrcy4KClRoZSBv
dGhlciB1c2VzIG9mIHRoaXMgbG9vayBPSy4KCkNjOiBTdGFuaXNsYXYgTGlzb3Zza2l5IDxzdGFu
aXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KRml4ZXM6IDI4NzFiMmZkZTQ0OSAoImRybS9pOTE1
OiBGaXggVEdMKyBwbGFuZSBTQUdWIHdhdGVybWFyayBwcm9ncmFtbWluZyIpClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYwpp
bmRleCA4MjBmODUwZDVjYmIuLmIyYWVkZTJiZTg5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5j
CkBAIC02MDE3LDggKzYwMTcsOCBAQCBzdGF0aWMgYm9vbCBza2xfcGxhbmVfc2VsZWN0ZWRfd21f
ZXF1YWxzKHN0cnVjdCBpbnRlbF9wbGFuZSAqcGxhbmUsCiAJCSAqIHVzZSBpdC4gSXQgb25seSBn
ZXRzIHVzZWQgZm9yIGNhbGN1bGF0aW5nIHRoZSByZXF1aXJlZAogCQkgKiBkZGIgYWxsb2NhdGlv
bi4KIAkJICovCi0JCWlmICghc2tsX3dtX2xldmVsX2VxdWFscyhza2xfcGxhbmVfd21fbGV2ZWwo
b2xkX3BpcGVfd20sIGxldmVsLCBwbGFuZS0+aWQpLAotCQkJCQkgc2tsX3BsYW5lX3dtX2xldmVs
KG5ld19waXBlX3dtLCBsZXZlbCwgcGxhbmUtPmlkKSkpCisJCWlmICghc2tsX3dtX2xldmVsX2Vx
dWFscyhza2xfcGxhbmVfd21fbGV2ZWwob2xkX3BpcGVfd20sIHBsYW5lLT5pZCwgbGV2ZWwpLAor
CQkJCQkgc2tsX3BsYW5lX3dtX2xldmVsKG5ld19waXBlX3dtLCBwbGFuZS0+aWQsIGxldmVsKSkp
CiAJCQlyZXR1cm4gZmFsc2U7CiAJfQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
