Return-Path: <SRS0=JBua=CK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060C9C433E2
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2020 01:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D68D520707
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2020 01:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D68D520707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6846E558;
	Tue,  1 Sep 2020 01:06:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8B46E536
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2020 01:06:41 +0000 (UTC)
IronPort-SDR: IAdaV+Tpr0ZjQl5crFO/uEE2AGpstHV6M0iGlUONXRtCceIX62f1ie0hYiXD9ak2No5MYolH4W
 N+irSKuJVO9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="156343632"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="156343632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 18:06:41 -0700
IronPort-SDR: EVSz2BVg/kVEAqinW5LupP0WNGtpvmXBUsdn5IeUj57ghiObsUpioHqme7NI/WayghNAvWO4f9
 dnwG4N0CJOFg==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="476977345"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-MOBL2.intel.com)
 ([10.24.14.51])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 18:06:40 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 31 Aug 2020 18:09:24 -0700
Message-Id: <20200901010924.235808-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901010924.235808-1-jose.souza@intel.com>
References: <20200901010924.235808-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/4] HAX/DO_NOT_MERGE_IT: drm/i915/display:
 Enable PSR2 selective fetch for testing
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

RW5hYmxpbmcgaXQgdG8gY2hlY2sgaWYgaXQgY2F1c2VzIHJlZ3Jlc3Npb25zIGluIENJIGJ1dCB0
aGUgZmVhdHVyZSBpcwpzdGlsbCBub3QgcmVhZHkgdG8gYmUgZW5hYmxlZCBieSBkZWZhdWx0LgoK
U2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaCB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3BhcmFtcy5oCmluZGV4IDMzMGMwM2UyYjRmNy4uYjhiMTkyNzBjMzM5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfcGFyYW1zLmgKQEAgLTU0LDcgKzU0LDcgQEAgc3RydWN0IGRybV9wcmludGVy
OwogCXBhcmFtKGludCwgZW5hYmxlX2ZiYywgLTEsIDA2MDApIFwKIAlwYXJhbShpbnQsIGVuYWJs
ZV9wc3IsIC0xLCAwNjAwKSBcCiAJcGFyYW0oYm9vbCwgcHNyX3NhZmVzdF9wYXJhbXMsIGZhbHNl
LCAwNjAwKSBcCi0JcGFyYW0oYm9vbCwgZW5hYmxlX3BzcjJfc2VsX2ZldGNoLCBmYWxzZSwgMDYw
MCkgXAorCXBhcmFtKGJvb2wsIGVuYWJsZV9wc3IyX3NlbF9mZXRjaCwgdHJ1ZSwgMDYwMCkgXAog
CXBhcmFtKGludCwgZGlzYWJsZV9wb3dlcl93ZWxsLCAtMSwgMDQwMCkgXAogCXBhcmFtKGludCwg
ZW5hYmxlX2lwcywgMSwgMDYwMCkgXAogCXBhcmFtKGludCwgaW52ZXJ0X2JyaWdodG5lc3MsIDAs
IDA2MDApIFwKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ2Z4Cg==
