Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138CFC4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 17:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D31F2603E7
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 17:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D31F2603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4546EE08;
	Thu, 29 Jul 2021 17:01:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E116EE03
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 17:00:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212966826"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="212966826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:00:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="417712164"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:00:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Jul 2021 10:00:01 -0700
Message-Id: <20210729170008.2836648-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210729170008.2836648-1-matthew.d.roper@intel.com>
References: <20210729170008.2836648-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 11/18] drm/i915/dg2: DG2 uses the same sseu
 limits as XeHP SDV
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

REcyIHN1cHBvcnRzIGNvbXB1dGUgRFNTIGFuZCBoYXMgdGhlIHNhbWUgbWF4aW11bSBudW1iZXIg
b2YgRFNTIGFuZCBFVQphcyBYZUhQIFNEVi4KClNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDYXogWW9rb3lhbWEgPGNhei55
b2tveWFtYUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9z
c2V1LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9zc2V1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9zc2V1LmMKaW5kZXggNWQzYjhkZmY0NjRjLi5l
YWZmMjIxZGI1YjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3Nz
ZXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9zc2V1LmMKQEAgLTE3MSw3
ICsxNzEsNyBAQCBzdGF0aWMgdm9pZCBnZW4xMl9zc2V1X2luZm9faW5pdChzdHJ1Y3QgaW50ZWxf
Z3QgKmd0KQogCSAqIGFjcm9zcyB0aGUgZW50aXJlIGRldmljZS4gVGhlbiBjYWxjdWxhdGUgb3V0
IHRoZSBEU1MgZm9yIGVhY2gKIAkgKiB3b3JrbG9hZCB0eXBlIHdpdGhpbiB0aGF0IHNvZnR3YXJl
IHNsaWNlLgogCSAqLwotCWlmIChJU19YRUhQU0RWKGd0LT5pOTE1KSkgeworCWlmIChJU19ERzIo
Z3QtPmk5MTUpIHx8IElTX1hFSFBTRFYoZ3QtPmk5MTUpKSB7CiAJCWludGVsX3NzZXVfc2V0X2lu
Zm8oc3NldSwgMSwgMzIsIDE2KTsKIAkJc3NldS0+aGFzX2NvbXB1dGVfZHNzID0gMTsKIAl9IGVs
c2UgewotLSAKMi4yNS40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1nZngK
