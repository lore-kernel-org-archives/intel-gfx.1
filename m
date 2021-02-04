Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566F9C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 15:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD7E64E27
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 15:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD7E64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBFF6EDB4;
	Thu,  4 Feb 2021 15:32:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D1D6EDB4
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 15:32:43 +0000 (UTC)
IronPort-SDR: 3aIzhYon+GBLGXy7MjShPcScDck/+wIazIK2CnOflp1aGEsDv47RKGiPliXxRP1Td9xH9ZY6di
 EbkecKr1/mlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="161017283"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; d="scan'208";a="161017283"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 07:32:41 -0800
IronPort-SDR: 8cC2fHtkF7oE8vLhHYxbbmr5iXIja6Hr0Gu0K9l7ipWq66r9QX9TMCatn0KIHGJfFqZK7OKuqK
 x99ZuhHMQo1g==
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; d="scan'208";a="483276047"
Received: from gkpatel-mobl1.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.255.79.143])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 07:32:39 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Feb 2021 07:33:57 -0800
Message-Id: <20210204153357.39681-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Make psr_safest_params and
 enable_psr2_sel_fetch parameters read only
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

QnkgbWlzdGFrZSB0aG9zZSAyIHBhcmFtZXRlcnMgd2VyZSBkZWZpbmVkIGFzIHJlYWQgYW5kIHdy
aXRlIGluIHRoZQouaCBmaWxlIHdoaWxlIGluIHRoZSAuYyBmaWxlIGl0IGlzIHJlYWQgb25seS4K
VGhlIGludGVudGlvbiBoZXJlIHdhcyB0byBiZSByZWFkIG9ubHkgdG8gYXZvaWQgdGhlIG5lZWQg
b2YgYWRkaXRpb25hbApoYW5kbGluZy4KCkNjOiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25n
Lm11bkBpbnRlbC5jb20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaCB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5oIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9wYXJhbXMuaAppbmRleCBmMDMxOTY2YWY1YjcuLjQ4ZjQ3ZTQ0ZTg0OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5oCkBAIC01NCw4ICs1NCw4IEBAIHN0cnVjdCBkcm1f
cHJpbnRlcjsKIAlwYXJhbShpbnQsIGVuYWJsZV9kYywgLTEsIDA0MDApIFwKIAlwYXJhbShpbnQs
IGVuYWJsZV9mYmMsIC0xLCAwNjAwKSBcCiAJcGFyYW0oaW50LCBlbmFibGVfcHNyLCAtMSwgMDYw
MCkgXAotCXBhcmFtKGJvb2wsIHBzcl9zYWZlc3RfcGFyYW1zLCBmYWxzZSwgMDYwMCkgXAotCXBh
cmFtKGJvb2wsIGVuYWJsZV9wc3IyX3NlbF9mZXRjaCwgZmFsc2UsIDA2MDApIFwKKwlwYXJhbShi
b29sLCBwc3Jfc2FmZXN0X3BhcmFtcywgZmFsc2UsIDA0MDApIFwKKwlwYXJhbShib29sLCBlbmFi
bGVfcHNyMl9zZWxfZmV0Y2gsIGZhbHNlLCAwNDAwKSBcCiAJcGFyYW0oaW50LCBkaXNhYmxlX3Bv
d2VyX3dlbGwsIC0xLCAwNDAwKSBcCiAJcGFyYW0oaW50LCBlbmFibGVfaXBzLCAxLCAwNjAwKSBc
CiAJcGFyYW0oaW50LCBpbnZlcnRfYnJpZ2h0bmVzcywgMCwgMDYwMCkgXAotLSAKMi4zMC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZngg
bWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
