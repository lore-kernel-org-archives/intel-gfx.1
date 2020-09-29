Return-Path: <SRS0=bDtt=DG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A3BC4727D
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 23:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD7C20773
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 23:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD7C20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4786E40B;
	Tue, 29 Sep 2020 23:35:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32356E408
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 23:34:57 +0000 (UTC)
IronPort-SDR: G8W2fRPpk18uyLLwB8BBeCOkddvTOmYZAwIIbPZobpO9ogCrJ6ZXsgQciGYPILIBdnydTAfAab
 8t6QxgBmWL+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="149973047"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="149973047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 16:34:57 -0700
IronPort-SDR: l7y7g2b+sj8lzXkNh6mBIPy/19OvSq7Pm09tXlGuXS7VKxrfMXuD0OVTOn56j4zvv0QzGvWR2J
 SQlmPnExQaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="351326765"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 29 Sep 2020 16:34:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Sep 2020 02:34:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 30 Sep 2020 02:34:40 +0300
Message-Id: <20200929233449.32323-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
References: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 02/11] drm/i915: s/old_crtc_state/crtc_state/
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmlu
dGVsX2RwX2VuYWJsZV9wb3J0KCkgaXMgY2FsbGVkIGR1cmluZyB0aGUgZW5hYmxlIHNlcXVlbmNl
LApzbyB0aGVyZSBpcyBub3RoaW5nIG9sZCBhYm91dCB0aGUgcGFzc2VkIGluIGNydGMgc3RhdGUu
ClJlbmFtZSBpdC4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCBmZjk2
NTQwYzg2MTIuLjM1ODZkNzlmNTU5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYwpAQCAtMzg1MCw3ICszODUwLDcgQEAgZzR4X3NldF9saW5rX3RyYWluKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHAsCiB9CiAKIHN0YXRpYyB2b2lkIGludGVsX2RwX2VuYWJsZV9wb3J0
KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCi0JCQkJIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpvbGRfY3J0Y19zdGF0ZSkKKwkJCQkgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3Rh
dGUgKmNydGNfc3RhdGUpCiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0g
ZHBfdG9faTkxNShpbnRlbF9kcCk7CiAKQEAgLTM4NjUsNyArMzg2NSw3IEBAIHN0YXRpYyB2b2lk
IGludGVsX2RwX2VuYWJsZV9wb3J0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCiAJICogZmFp
bCB3aGVuIHRoZSBwb3dlciBzZXF1ZW5jZXIgaXMgZnJlc2hseSB1c2VkIGZvciB0aGlzIHBvcnQu
CiAJICovCiAJaW50ZWxfZHAtPkRQIHw9IERQX1BPUlRfRU47Ci0JaWYgKG9sZF9jcnRjX3N0YXRl
LT5oYXNfYXVkaW8pCisJaWYgKGNydGNfc3RhdGUtPmhhc19hdWRpbykKIAkJaW50ZWxfZHAtPkRQ
IHw9IERQX0FVRElPX09VVFBVVF9FTkFCTEU7CiAKIAlpbnRlbF9kZV93cml0ZShkZXZfcHJpdiwg
aW50ZWxfZHAtPm91dHB1dF9yZWcsIGludGVsX2RwLT5EUCk7Ci0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5n
IGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
