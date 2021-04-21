Return-Path: <SRS0=MVSk=JS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057B4C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 21:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8731F61425
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 21:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8731F61425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB68C6E030;
	Wed, 21 Apr 2021 21:59:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4422A6E030;
 Wed, 21 Apr 2021 21:59:50 +0000 (UTC)
IronPort-SDR: UvJJGErCgKmpp6jJi6caaWOxTI1sTrNUWQ3hC4vSpeKa/aSfvpVCcvdiW52wfybgO/I5bQEPEE
 MY45mN5zWcYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="192598191"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="192598191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 14:59:49 -0700
IronPort-SDR: YZDxQTFOfAfFmeaWXfr0Y9iSw8vCHV3hVvaIkuQCc59xCIO65tpgueNb3g9vzhQUoTMJ1tcO4C
 N4tB2blaPqIg==
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="401620987"
Received: from ftimarch-mobl2.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.254.35.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 14:59:48 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Apr 2021 15:02:23 -0700
Message-Id: <20210421220224.200729-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to
 better mach eDP spec
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RFBfUFNSX0VOX0NGRyBiaXQgNSBha2EgIlNlbGVjdGl2ZSBVcGRhdGUgUmVnaW9uIFNjYW4gTGlu
ZSBDYXB0dXJlCkluZGljYXRpb24iIGluIGVEUCBzcGVjIGhhcyBhIGFtYmlndW91cyBuYW1lLCBz
byByZW5hbWluZyB0byBiZXR0ZXIKbWF0Y2ggc3BlY2lmaWNhdGlvbi4KCldoaWxlIGF0IGl0LCBy
ZXBsYWNpbmcgYml0IHNoaXQgYnkgQklUKCkgbWFjcm8gYW5kIGFkZGluZyB0aGUgdmVyc2lvbgpz
b21lIHJlZ2lzdGVycyB3ZXJlIGFkZGVkIHRvIGVEUCBzcGVjaWZpY2F0aW9uLgoKQ2M6IDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6
IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgMTYgKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggMWU4NWMyMDIxZjJmLi5kNmY2YTA4NGExOTAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTY4Nywx
NCArNjg3LDE0IEBAIHN0cnVjdCBkcm1fZGV2aWNlOwogI2RlZmluZSBEUF9EU0NfRU5BQkxFICAg
ICAgICAgICAgICAgICAgICAgICAweDE2MCAgIC8qIERQIDEuNCAqLwogIyBkZWZpbmUgRFBfREVD
T01QUkVTU0lPTl9FTiAgICAgICAgICAgICAgICAoMSA8PCAwKQogCi0jZGVmaW5lIERQX1BTUl9F
Tl9DRkcJCQkgICAgMHgxNzAgICAvKiBYWFggMS4yPyAqLwotIyBkZWZpbmUgRFBfUFNSX0VOQUJM
RQkJCSAgICAoMSA8PCAwKQotIyBkZWZpbmUgRFBfUFNSX01BSU5fTElOS19BQ1RJVkUJICAgICgx
IDw8IDEpCi0jIGRlZmluZSBEUF9QU1JfQ1JDX1ZFUklGSUNBVElPTgkgICAgKDEgPDwgMikKLSMg
ZGVmaW5lIERQX1BTUl9GUkFNRV9DQVBUVVJFCQkgICAgKDEgPDwgMykKLSMgZGVmaW5lIERQX1BT
Ul9TRUxFQ1RJVkVfVVBEQVRFCSAgICAoMSA8PCA0KQotIyBkZWZpbmUgRFBfUFNSX0lSUV9IUERf
V0lUSF9DUkNfRVJST1JTICAgICAoMSA8PCA1KQotIyBkZWZpbmUgRFBfUFNSX0VOQUJMRV9QU1Iy
CQkgICAgKDEgPDwgNikgLyogZURQIDEuNGEgKi8KKyNkZWZpbmUgRFBfUFNSX0VOX0NGRwkJCQkw
eDE3MCAgIC8qIFhYWCAxLjI/ICovCisjIGRlZmluZSBEUF9QU1JfRU5BQkxFCQkJCUJJVCgwKQor
IyBkZWZpbmUgRFBfUFNSX01BSU5fTElOS19BQ1RJVkUJCUJJVCgxKQorIyBkZWZpbmUgRFBfUFNS
X0NSQ19WRVJJRklDQVRJT04JCUJJVCgyKQorIyBkZWZpbmUgRFBfUFNSX0ZSQU1FX0NBUFRVUkUJ
CQlCSVQoMykKKyMgZGVmaW5lIERQX1BTUl9TVV9SRUdJT05fU0NBTkxJTkVfQ0FQVFVSRQlCSVQo
NCkgLyogZURQIDEuNGEgKi8KKyMgZGVmaW5lIERQX1BTUl9JUlFfSFBEX1dJVEhfQ1JDX0VSUk9S
UwkJQklUKDUpIC8qIGVEUCAxLjRhICovCisjIGRlZmluZSBEUF9QU1JfRU5BQkxFX1BTUjIJCQlC
SVQoNikgLyogZURQIDEuNGEgKi8KIAogI2RlZmluZSBEUF9BREFQVEVSX0NUUkwJCQkgICAgMHgx
YTAKICMgZGVmaW5lIERQX0FEQVBURVJfQ1RSTF9GT1JDRV9MT0FEX1NFTlNFICAgKDEgPDwgMCkK
LS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
Cg==
