Return-Path: <SRS0=2qg2=LW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5DDC2B9F4
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Jun 2021 09:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39AAC61C49
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Jun 2021 09:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39AAC61C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DBD6E3AA;
	Mon, 28 Jun 2021 09:21:34 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EAB6E372;
 Mon, 28 Jun 2021 09:21:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="206093120"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="206093120"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:21:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="640831888"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:21:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Mon, 28 Jun 2021 11:21:06 +0200
Message-Id: <20210628092106.55270-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3] drm/i915: Reinstate the mmap ioctl for some
 platforms
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

UmVpbnN0YXRlIHRoZSBtbWFwIGlvY3RsIGZvciBhbGwgY3VycmVudCBpbnRlZ3JhdGVkIHBsYXRm
b3Jtcy4KVGhlIGludGVudGlvbiB3YXMgcmVhbGx5IHRvIGhhdmUgaXQgZGlzYWJsZWQgZm9yIGRp
c2NyZXRlIGdyYXBoaWNzCndoZXJlIHdlIGVuZm9yY2UgYSBzaW5nbGUgbW1hcCBtb2RlLgoKVGhp
cyBmaXhlcyBtZWRpYSBvbiBya2wvYWRsLgoKdjI6Ci0gQWRkZWQgYSBSLUIuCi0gRml4ZWQgdXAg
dGhlIGNvZGUgY29tbWVudCBhIGJpdC4KdjM6Ci0gQWRkZWQgYW4gQS1CLgotIFBvaW50IG91dCBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB0aGVyZSB3YXMgYW4gaXNzdWUgd2l0aCBtZWRpYSBv
bgogIHJrbC9hZGwuCgpGaXhlczogMzVjYmQ5MWViNTQxICgiZHJtL2k5MTU6IERpc2FibGUgbW1h
cCBpb2N0bCBmb3IgZ2VuMTIrIikKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRo
b21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxk
IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
bW1hbi5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9tbWFuLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCmluZGV4
IDY0OTdhMmRiZGFiOS4uYTkwZjc5NmU4NWMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9tbWFuLmMKQEAgLTYyLDEwICs2MiwxMSBAQCBpOTE1X2dlbV9tbWFwX2lvY3RsKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJc3RydWN0IGRybV9pOTE1X2dlbV9v
YmplY3QgKm9iajsKIAl1bnNpZ25lZCBsb25nIGFkZHI7CiAKLQkvKiBtbWFwIGlvY3RsIGlzIGRp
c2FsbG93ZWQgZm9yIGFsbCBwbGF0Zm9ybXMgYWZ0ZXIgVEdMLUxQLiAgVGhpcyBhbHNvCi0JICog
Y292ZXJzIGFsbCBwbGF0Zm9ybXMgd2l0aCBsb2NhbCBtZW1vcnkuCisJLyoKKwkgKiBtbWFwIGlv
Y3RsIGlzIGRpc2FsbG93ZWQgZm9yIGFsbCBkaXNjcmV0ZSBwbGF0Zm9ybXMsCisJICogYW5kIGZv
ciBhbGwgcGxhdGZvcm1zIHdpdGggR1JBUEhJQ1NfVkVSID4gMTIuCiAJICovCi0JaWYgKEdSQVBI
SUNTX1ZFUihpOTE1KSA+PSAxMiAmJiAhSVNfVElHRVJMQUtFKGk5MTUpKQorCWlmIChJU19ER0ZY
KGk5MTUpIHx8IEdSQVBISUNTX1ZFUihpOTE1KSA+IDEyKQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7
CiAKIAlpZiAoYXJncy0+ZmxhZ3MgJiB+KEk5MTVfTU1BUF9XQykpCi0tIAoyLjMxLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWls
aW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
