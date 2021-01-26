Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182C0C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 18:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D384B22286
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 18:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D384B22286
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDAE6E092;
	Tue, 26 Jan 2021 18:47:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8200D6E092
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 18:47:54 +0000 (UTC)
IronPort-SDR: O035JDPxKGDeevNYA/koO6GStm0ijO+NqT4cGgygWvIE1IZ7TX2E4qXAc6rlhuayNcY0TzrM+G
 /5MJthw3C5LQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="179170791"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="179170791"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 10:47:54 -0800
IronPort-SDR: GPjM3yChTkdc+sem6FXpmnXSmjQixlIhzdDuva4FQu8wchAmYgXpBW4Am4FeRUIwv9029iqUEL
 qduI7dDwZzGQ==
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="410249491"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Jan 2021 10:47:53 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 26 Jan 2021 10:52:24 -0800
Message-Id: <20210126185224.32340-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display/vrr: Skip the VRR HW state
 readout on DSI transcoder
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

RFNJIHRyYW5zY29kZXIgZG9lcyBub3Qgc3VwcG9ydCBWUlIgYW5kIGhlbmNlIHNraXAgdGhlIEhX
IHN0YXRlCnJlYWRvdXQgaWYgaXRzIGEgRFNJIHRyYW5zY29kZXIuCgpGaXhlczogYzdmMGY0Mzcy
YjMwICgiZHJtL2k5MTUvZGlzcGxheTogQWRkIEhXIHN0YXRlIHJlYWRvdXQgZm9yIFZSUiIpCkNj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSmFu
aSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFZhbmRpdGEgS3Vsa2Fy
bmkgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2
YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYwppbmRleCA2NTI0MGZhMDc0Y2MuLmFlYThjNWIzYTdmZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTg5NzgsNyArODk3
OCw3IEBAIHN0YXRpYyBib29sIGhzd19nZXRfcGlwZV9jb25maWcoc3RydWN0IGludGVsX2NydGMg
KmNydGMsCiAJCWludGVsX2dldF90cmFuc2NvZGVyX3RpbWluZ3MoY3J0YywgcGlwZV9jb25maWcp
OwogCX0KIAotCWlmIChIQVNfVlJSKGRldl9wcml2KSkKKwlpZiAoSEFTX1ZSUihkZXZfcHJpdikg
JiYgIXRyYW5zY29kZXJfaXNfZHNpKHBpcGVfY29uZmlnLT5jcHVfdHJhbnNjb2RlcikpCiAJCWlu
dGVsX3Zycl9nZXRfY29uZmlnKGNydGMsIHBpcGVfY29uZmlnKTsKIAogCWludGVsX2dldF9waXBl
X3NyY19zaXplKGNydGMsIHBpcGVfY29uZmlnKTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
