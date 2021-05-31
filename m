Return-Path: <SRS0=VbzJ=K2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF7EC47097
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 12:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B17D61263
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 12:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B17D61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DFA6E912;
	Mon, 31 May 2021 12:20:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B846E910;
 Mon, 31 May 2021 12:20:21 +0000 (UTC)
IronPort-SDR: i2CnjOJjaWEeKZt6A8xjZjN/z/6MIms7m2NG0hJgRkX7W2IOV2iIHkxrbAxVrRFP9oalpwX4Zk
 xPhJ/T2oHUXA==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="183027522"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="183027522"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:21 -0700
IronPort-SDR: US04Pyyq4Lf3SxHnr5MeDrvrh4aFvWrXG3lgvlm51QcDljrbq3iMJs65TwyNHnqc1wlawDUeEf
 JqGg/tMKBWIw==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="473904019"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Mon, 31 May 2021 14:19:38 +0200
Message-Id: <20210531121940.267032-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 13/15] drm/i915: Disable mmap ioctl for gen12+
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KClRoZSBwbGF0Zm9ybSBzaG91bGQgZXhjbHVzaXZlbHkgdXNlIG1tYXBfb2Zmc2V0LCBvbmUg
bGVzcyBwYXRoIHRvIHdvcnJ5CmFib3V0IGZvciBkaXNjcmV0ZS4KClNpZ25lZC1vZmYtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYyB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fbW1hbi5jCmluZGV4IGY2ZmU1Y2IwMTQzOC4uZmQxYzk3MTRmOGQ4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMKQEAgLTU2LDEwICs1Niwx
NyBAQCBpbnQKIGk5MTVfZ2VtX21tYXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAkJICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKIHsKKwlzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUoZGV2KTsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX21t
YXAgKmFyZ3MgPSBkYXRhOwogCXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmo7CiAJdW5z
aWduZWQgbG9uZyBhZGRyOwogCisJLyogbW1hcCBpb2N0bCBpcyBkaXNhbGxvd2VkIGZvciBhbGwg
cGxhdGZvcm1zIGFmdGVyIFRHTC1MUC4gIFRoaXMgYWxzbworCSAqIGNvdmVycyBhbGwgcGxhdGZv
cm1zIHdpdGggbG9jYWwgbWVtb3J5LgorCSAqLworCWlmIChJTlRFTF9HRU4oaTkxNSkgPj0gMTIg
JiYgIUlTX1RJR0VSTEFLRShpOTE1KSkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJaWYgKGFy
Z3MtPmZsYWdzICYgfihJOTE1X01NQVBfV0MpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4z
MS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRl
bC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
