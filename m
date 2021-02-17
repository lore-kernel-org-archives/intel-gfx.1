Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8030BC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 17:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E07864D5D
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 17:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E07864D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EA06E5B4;
	Wed, 17 Feb 2021 17:05:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8436E5B4
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 17:05:42 +0000 (UTC)
IronPort-SDR: DRy93lERA83eMTT6VX8doX5QPp9Es+tlwNCHwsreuGpXMORtsmXhlczcZSMzabLw1swu0xeAwU
 52bpOFYAx1+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183379334"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="183379334"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 09:04:08 -0800
IronPort-SDR: jyb0wBUoTduP2cstsb7SaV+XCyeEsEB7NLxd/L/Hg/AnwcW4y9Sk1OUa0NOri3Rr78lhDy4lbk
 8lNjPzjLQJ8Q==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="494197024"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 09:04:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Feb 2021 19:03:33 +0200
Message-Id: <61fb7c20fcc7b11fb5a82a5dedeb8180ada78a99.1613580193.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613580193.git.jani.nikula@intel.com>
References: <cover.1613580193.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 03/12] drm/i915/bios: limit default outputs by
 platform on missing VBT
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
Cc: jani.nikula@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

UHJlLURESSBhbmQgbm9uLUNIViBhcmVuJ3QgdXNpbmcgdGhlIGluZm9ybWF0aW9uIGNyZWF0ZWQg
aGVyZSBhbnl3YXksIHNvCmRvbid0IGJvdGhlciBzZXR0aW5nIHRoZSBkZWZhdWx0cyBmb3IgdGhl
bS4gVGhpcyBzaG91bGQgYmUgYQpub24tZnVuY3Rpb25hbCBjaGFuZ2UsIGJ1dCBpcyBzZXBhcmF0
ZWQgaGVyZSB0byBjYXRjaCBhbnkgcmVncmVzc2lvbnMgaW4KYSBzaW5nbGUgY29tbWl0LgoKQ2M6
IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFu
aSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Jpb3MuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9i
aW9zLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYwppbmRleCBh
ODcxMmZlOGJmM2UuLmU5Y2IxNWFhMmY1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9iaW9zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9iaW9zLmMKQEAgLTIwNTgsNiArMjA1OCw5IEBAIGluaXRfdmJ0X21pc3NpbmdfZGVm
YXVsdHMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpCiB7CiAJZW51bSBwb3J0IHBvcnQ7
CiAKKwlpZiAoIUhBU19EREkoaTkxNSkgJiYgIUlTX0NIRVJSWVZJRVcoaTkxNSkpCisJCXJldHVy
bjsKKwogCWZvcl9lYWNoX3BvcnQocG9ydCkgewogCQlzdHJ1Y3QgZGRpX3ZidF9wb3J0X2luZm8g
KmluZm8gPQogCQkJJmk5MTUtPnZidC5kZGlfcG9ydF9pbmZvW3BvcnRdOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZngg
bWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
