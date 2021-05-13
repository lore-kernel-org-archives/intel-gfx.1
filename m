Return-Path: <SRS0=vjZp=KI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CCFC433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 13 May 2021 23:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E05A161421
	for <intel-gfx@archiver.kernel.org>; Thu, 13 May 2021 23:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E05A161421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5676EDE5;
	Thu, 13 May 2021 23:25:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2332E6EDE5
 for <intel-gfx@lists.freedesktop.org>; Thu, 13 May 2021 23:25:42 +0000 (UTC)
IronPort-SDR: gRqfmJ8Rvq1IRugYtU1fpF8m2uH4ZueibNyY+D9aBWpRAngP2jUB9OdZ5H1gHEAAGrj2pK81Nn
 vaNNZNwRNpVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="179672435"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="179672435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 16:25:41 -0700
IronPort-SDR: /uEflHyUvsxjt8oVUMozMHtv6/1zykkWsebdVE37hI0+zWtPpLIXsLQSC/U/+7ZIX8U72DS3Nv
 F29+jF+NKPSg==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="392480976"
Received: from psethi-mobl3.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.254.1.112])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 16:25:39 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 13 May 2021 16:28:41 -0700
Message-Id: <20210513232841.147989-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Fix a possible use of uninitialized
 variable in remap_io_sg()
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
Cc: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

SWYgdGhlIGRvIHdoaWxlIGxvb3AgYnJlYWtzIGluICdpZiAoIXNnX2RtYV9sZW4oc2dsKSknIGlu
IHRoZSBmaXJzdAppdGVyYXRpb24sIGVyciBpcyB1bmluaXRpYWxpemVkIGNhdXNpbmcgYSB3cm9u
ZyBjYWxsIHRvIHphcF92bWFfcHRlcygpLgoKRml4ZXM6IGIxMmQ2OTFlYTVlMCAoImk5MTU6IGZp
eCByZW1hcF9pb19zZyB0byB2ZXJpZnkgdGhlIHBncHJvdCIpCkNjOiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KU2lnbmVkLW9mZi1ieTogSmFtZXMgQXVzbXVzIDxqYW1lcy5hdXNtdXNA
aW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21tLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X21tLmMKaW5kZXggNGM4Y2QwOGM2NzJkLi4yNTU3NmZhNzNmZjAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X21tLmMKQEAgLTQ3LDcgKzQ3LDcgQEAgaW50IHJlbWFwX2lvX3NnKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLAogCQlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwgcmVzb3VyY2Vfc2l6
ZV90IGlvYmFzZSkKIHsKIAl1bnNpZ25lZCBsb25nIHBmbiwgbGVuLCByZW1hcHBlZCA9IDA7Ci0J
aW50IGVycjsKKwlpbnQgZXJyID0gMDsKIAogCS8qIFdlIHJlbHkgb24gcHJldmFsaWRhdGlvbiBv
ZiB0aGUgaW8tbWFwcGluZyB0byBza2lwIHRyYWNrX3BmbigpLiAqLwogCUdFTV9CVUdfT04oKHZt
YS0+dm1fZmxhZ3MgJiBFWFBFQ1RFRF9GTEFHUykgIT0gRVhQRUNURURfRkxBR1MpOwotLSAKMi4z
MS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRl
bC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
