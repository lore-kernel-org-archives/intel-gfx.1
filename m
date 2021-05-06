Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F29C43461
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 16:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B1461075
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 16:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B1461075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46516ECD0;
	Thu,  6 May 2021 16:19:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C96ECD0
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 May 2021 16:19:51 +0000 (UTC)
IronPort-SDR: ZF/2OfBA2KIg/uYE6RuWtwvZ8i+HBkjo262be5wrBtmAMfFkqANrYvtIk7JIVFypxmkv6WKRk4
 JI1g/ScwO44g==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="195395952"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="195395952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 09:19:50 -0700
IronPort-SDR: rGjG8LoTjfQnh9fpndE4DEeITXYVj73eFimHzh/ZVtkWrcjBSG5GTvraEIwVGjVpZ0T2mS02eg
 RbVY6dJTJpmQ==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="407072220"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 09:19:49 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  6 May 2021 19:19:29 +0300
Message-Id: <20210506161930.309688-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506161930.309688-1-imre.deak@intel.com>
References: <20210506161930.309688-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 09/10] drm/i915/adl_p: Require a minimum of 8
 tiles stride for DPT FBs
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

VGhlIHNwZWNpZmljYXRpb24gb25seSByZXF1aXJlcyBEUFQgRkIgc3RyaWRlcyB0byBiZSBQT1Qg
YWxpZ25lZCwgYnV0CnRoZXJlIHNlZW1zIHRvIGJlIGFsc28gYSBtaW5pbXVtIG9mIDggc3RyaWRl
IHRpbGUgcmVxdWlyZW1lbnQuIFNjYW5uaW5nCm91dCBGQnMgd2l0aCA8IDggc3RyaWRlIHRpbGVz
IHdpbGwgcmVzdWx0IGluIHBpcGUgZmF1bHRzIChldmVuIHRob3VnaAp0aGUgc3RyaWRlIGlzIFBP
VCBhbGlnbmVkKS4KClNpZ25lZC1vZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNv
bT4KQWNrZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+ClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuYyB8IDYgKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9mYi5jCmluZGV4IDkyNzQ0MGVkMTRmNDguLjI5YzU1OGZiYjM5
N2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMKQEAgLTYwMSw3ICs2
MDEsMTEgQEAgcGxhbmVfdmlld19kc3Rfc3RyaWRlX3RpbGVzKGNvbnN0IHN0cnVjdCBpbnRlbF9m
cmFtZWJ1ZmZlciAqZmIsIGludCBjb2xvcl9wbGFuZSwKIAkJCSAgICB1bnNpZ25lZCBpbnQgcGl0
Y2hfdGlsZXMpCiB7CiAJaWYgKGludGVsX2ZiX25lZWRzX3BvdF9zdHJpZGVfcmVtYXAoZmIpKQot
CQlyZXR1cm4gcm91bmR1cF9wb3dfb2ZfdHdvKHBpdGNoX3RpbGVzKTsKKwkJLyoKKwkJICogQURM
X1AsIHRoZSBvbmx5IHBsYXRmb3JtIG5lZWRpbmcgYSBQT1Qgc3RyaWRlIGhhcyBhIG1pbmltdW0K
KwkJICogb2YgOCBzdHJpZGUgdGlsZXMuCisJCSAqLworCQlyZXR1cm4gcm91bmR1cF9wb3dfb2Zf
dHdvKG1heChwaXRjaF90aWxlcywgOHUpKTsKIAllbHNlCiAJCXJldHVybiBwaXRjaF90aWxlczsK
IH0KLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z2Z4Cg==
