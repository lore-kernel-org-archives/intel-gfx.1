Return-Path: <SRS0=AGhj=HO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9B7C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 18:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C875B64E8E
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 18:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C875B64E8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9FB6EEAA;
	Fri, 12 Feb 2021 18:20:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5164A6EEA6
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Feb 2021 18:20:43 +0000 (UTC)
IronPort-SDR: 0B4TUdKaxoDCHmPfq4GotKJFfTTbs9F0vQ16A0JsxXiihmzBHDQBYY9ihyC2GNt+uHXUc98e4J
 7bbuJY/z9PQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="161599191"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="161599191"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 10:20:39 -0800
IronPort-SDR: 7rwwPROuUR9AH2hiBPy/ooin3kOv+EBZJKH0pe0wHoSTecpe3Er6goYJw2e/O2wynhL8BYALhN
 tco83elfUJBQ==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="491231839"
Received: from sarcot-mobl1.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.254.56.203])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 10:20:38 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Feb 2021 10:22:00 -0800
Message-Id: <20210212182201.155043-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210212182201.155043-1-jose.souza@intel.com>
References: <20210212182201.155043-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/3] drm/i915: Remove dead code from
 skl_pipe_wm_get_hw_state()
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

VGhlcmUgaXMgbm90aGluZyBlbHNlIHRvIGJlIGV4ZWN1dGVkIGFmdGVyIHRoaXMgaWYgYmxvY2su
CgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jIHwgMyAtLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jCmluZGV4IDhj
NDJmYTUxYzBmNi4uOGNjNjdmOWM0ZTU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMKQEAgLTYx
ODIsOSArNjE4Miw2IEBAIHZvaWQgc2tsX3BpcGVfd21fZ2V0X2h3X3N0YXRlKHN0cnVjdCBpbnRl
bF9jcnRjICpjcnRjLAogCiAJCXNrbF93bV9sZXZlbF9mcm9tX3JlZ192YWwodmFsLCAmd20tPnRy
YW5zX3dtKTsKIAl9Ci0KLQlpZiAoIWNydGMtPmFjdGl2ZSkKLQkJcmV0dXJuOwogfQogCiB2b2lk
IHNrbF93bV9nZXRfaHdfc3RhdGUoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQot
LSAKMi4zMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
