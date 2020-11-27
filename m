Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59641C64E75
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093EB20809
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093EB20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776906EDF9;
	Fri, 27 Nov 2020 14:33:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0DF6EDF9
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2020 14:33:09 +0000 (UTC)
IronPort-SDR: PIAdjzKykVNQaGJl3kfHmVa7v9O3FQOIYoKqBtf0mSVKPtGbTrNdotbSC6IoU7pMErmu4frVAN
 WKYcV8WOQPcA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="190561257"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="190561257"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 06:33:09 -0800
IronPort-SDR: Ra20Lc47VmG3mwF6Ya8l5nJkVlbVB89SXRuazJqYWjQ2MpjoX6vfQKp7s+TGLGK46Z99F0re32
 8ZibNbLVkcew==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="328669990"
Received: from parinmsh-mobl1.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.254.178.102])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 06:33:07 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 06:33:06 -0800
Message-Id: <20201127143306.140047-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127143306.140047-1-jose.souza@intel.com>
References: <20201127143306.140047-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 4/4] HAX/DO_NOT_MERGE_IT: drm/i915/display:
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
IDA2MDApIFwKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ2Z4Cg==
