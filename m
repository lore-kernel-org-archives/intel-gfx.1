Return-Path: <SRS0=C5oC=MG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C86C12002
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 22:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2043C613C9
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 22:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2043C613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB99E6E4AA;
	Wed, 14 Jul 2021 22:24:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296896E4AA
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 22:24:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="207417738"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="207417738"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 15:24:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="412931329"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 14 Jul 2021 15:24:46 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Jul 2021 15:34:14 -0700
Message-Id: <20210714223414.9849-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display: Fix shared dpll mismatch for
 bigjoiner slave
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

Q3VycmVudGx5IHdoZW4gd2UgZG8gdGhlIEhXIHN0YXRlIHJlYWRvdXQsIHdlIGRvbnQgc2V0IHRo
ZSBzaGFyZWQgZHBsbCB0byBOVUxMCmZvciB0aGUgYmlnam9pbmVyIHNsYXZlIHdoaWNoIHNob3Vs
ZCBub3QgaGF2ZSBhIERQTEwgYXNzaWduZWQuIFNvIGl0IGhhcwpzb21lIGdhcmJhZ2Ugd2hpbGUg
dGhlIEhXIHN0YXRlIHJlYWRvdXQgaXMgTlVMTC4gU28gZXhwbGljaXRseSByZXNldAp0aGUgc2hh
cmVkIGRwbGwgZm9yIGJpZ2pvaW5lciBzbGF2ZSBwaXBlLgoKQnVnOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzM0NjUKQ2M6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBBbmtpdCBOYXV0aXlhbCA8YW5r
aXQuay5uYXV0aXlhbEBpbnRlbC5jb20+ClRlc3RlZC1CeTogU3dhdGkgU2hhcm1hIDxzd2F0aTIu
c2hhcm1hQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQu
bmF2YXJlQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXkuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKaW5kZXggNjVkZGI2
Y2ExNmU2Li5jMjc0YmZiOGU1NDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jCkBAIC05MDA2LDYgKzkwMDYsMTAgQEAgdmVyaWZ5X2NydGNfc3RhdGUo
c3RydWN0IGludGVsX2NydGMgKmNydGMsCiAJaWYgKCFuZXdfY3J0Y19zdGF0ZS0+aHcuYWN0aXZl
KQogCQlyZXR1cm47CiAKKwlpZiAobmV3X2NydGNfc3RhdGUtPmJpZ2pvaW5lcl9zbGF2ZSkKKwkJ
LyogTm8gUExMcyBzZXQgZm9yIHNsYXZlICovCisJCXBpcGVfY29uZmlnLT5zaGFyZWRfZHBsbCA9
IE5VTEw7CisKIAlpbnRlbF9waXBlX2NvbmZpZ19zYW5pdHlfY2hlY2soZGV2X3ByaXYsIHBpcGVf
Y29uZmlnKTsKIAogCWlmICghaW50ZWxfcGlwZV9jb25maWdfY29tcGFyZShuZXdfY3J0Y19zdGF0
ZSwKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z2Z4Cg==
