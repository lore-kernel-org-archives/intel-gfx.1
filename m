Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ED0C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 17:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F3E64DF0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 17:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F3E64DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F9D6E5A0;
	Wed, 17 Feb 2021 17:04:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87776E5A0
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 17:04:40 +0000 (UTC)
IronPort-SDR: S+eGjmFDn2o7YSQbXYuSk2UtZrEDhZ/78dbfyzPTt7W6vGmAtBVnlI05xT3THPACq21fzGHsji
 OPYo7sFIvN/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163034423"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="163034423"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 09:04:13 -0800
IronPort-SDR: n3pCqYrgqHcO9BK3qvwbzNrx3oIzXqSdWgkxrE0+v+QWGYfOt9T2c8ps/oZVpT2QjKqgntSHrB
 i0+H633QQoHw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="378058610"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 09:04:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Feb 2021 19:03:34 +0200
Message-Id: <bf2f1c9527e17310d69a818e09a7212df4ada347.1613580193.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613580193.git.jani.nikula@intel.com>
References: <cover.1613580193.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 04/12] drm/i915/bios: limit default outputs to
 ports A through F
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

V2l0aCB0aGUgZGVmYXVsdHMgbGltaXRlZCB0byBub24tVHlwZUMgcG9ydHMgaW4gY29tbWl0IDgy
OGNjYjMxY2Y0MQooImRybS9pOTE1L2ljbDogQWRkIFR5cGVDIHBvcnRzIG9ubHkgaWYgVkJUIGlz
IHByZXNlbnQiKSwgdGhpcyBzaG91bGQgYmUKYSBuby1vcCwgYnV0IGNsYXJpZmllcyB0aGUgY29k
ZSBhbmQgcHJlcGFyZXMgZm9yIHN1YnNlcXVlbnQgY2hhbmdlcy4KCkNjOiBMdWNhcyBEZSBNYXJj
aGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9iaW9zLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Ymlvcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmMKaW5kZXgg
ZTljYjE1YWEyZjVhLi5iOWQ5OTMyNGQ2NmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYmlvcy5jCkBAIC0yMDU3LDExICsyMDU3LDEyIEBAIHN0YXRpYyB2b2lkCiBpbml0
X3ZidF9taXNzaW5nX2RlZmF1bHRzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQogewog
CWVudW0gcG9ydCBwb3J0OworCWludCBwb3J0cyA9IFBPUlRfQSB8IFBPUlRfQiB8IFBPUlRfQyB8
IFBPUlRfRCB8IFBPUlRfRSB8IFBPUlRfRjsKIAogCWlmICghSEFTX0RESShpOTE1KSAmJiAhSVNf
Q0hFUlJZVklFVyhpOTE1KSkKIAkJcmV0dXJuOwogCi0JZm9yX2VhY2hfcG9ydChwb3J0KSB7CisJ
Zm9yX2VhY2hfcG9ydF9tYXNrZWQocG9ydCwgcG9ydHMpIHsKIAkJc3RydWN0IGRkaV92YnRfcG9y
dF9pbmZvICppbmZvID0KIAkJCSZpOTE1LT52YnQuZGRpX3BvcnRfaW5mb1twb3J0XTsKIAkJZW51
bSBwaHkgcGh5ID0gaW50ZWxfcG9ydF90b19waHkoaTkxNSwgcG9ydCk7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
