Return-Path: <SRS0=UgYw=MJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0098EC12002
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Jul 2021 01:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A91B261040
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Jul 2021 01:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A91B261040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC026E9F9;
	Sat, 17 Jul 2021 01:08:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1406E9F9
 for <intel-gfx@lists.freedesktop.org>; Sat, 17 Jul 2021 01:08:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="232656458"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="232656458"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 18:08:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="431385299"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-mobl2.intel.com)
 ([10.24.14.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 18:08:15 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Jul 2021 18:12:27 -0700
Message-Id: <20210717011227.204494-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717011227.204494-1-jose.souza@intel.com>
References: <20210717011227.204494-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/4] drm/i915/display/psr2: Force a PSR exit in
 the frontbuffer modification flushes
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

VGhlIENVUlNVUkZMSVZFKCkgd3JpdGUgZG8gbm90IHdvcmtzIHdpdGggUFNSMiBzZWxlY3RpdmUg
ZmV0Y2gsIHRoZQpvbmx5IHdheSB0byB1cGRhdGUgc2NyZWVuIGlzIHRvIHByb2dyYW0gUFNSMiBw
bGFuZSBhbmQgdHJhbnNjb2RlcgpyZWdpc3RlcnMgZHVyaW5nIHRoZSB2YmxhbmsuCgpXZSBjb3Vs
ZCB1c2UgdGhlIGZyb250YnVmZmVyIGRpcnR5IGFyZWFzIHNldCBieSB1c2Vyc3BhY2Ugd2l0aApk
cm1Nb2RlRGlydHlGQigpIGJ1dCB3ZSB3b3VsZCBzdGlsbCBuZWVkIHRvIHdhaXQgZm9yIHRoZSB2
YmxhbmsgdG8KcHJvcGVybHkgdXBkYXRlIHRoZSBQU1IyIHJlZ2lzdGVycy4KV2hhdCBJIHRoaW5r
IGlzIG5vdCB3b3J0aHkgdGhlIGRldmVsb3BtZW50IHRpbWUgY29uc2lkZXJpbmcgdGhhdCB0aGVy
ZQppcyBzbyBmZXcgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyB0aGF0IG1ha2VzIHVzZSBvZiB0aGlz
IG9sZCBtZXRob2QuCgpTbyBoZXJlIGZvcmNpbmcgYSBQU1IgZXhpdCBpbiB0aGlzIGNhc2UsIHRo
aXMgd2lsbCBndWFyYXRlZSB0aGF0IHBhbmVsCndpbGwgYmUgcHJvcGVybHkgdXBkYXRlZC4KCkNj
OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYwppbmRleCAxYzQxMDQyODQxZmIxLi43MzE2OTY3YWJhOTRiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMKQEAgLTE0NDgsNyArMTQ0
OCw3IEBAIHN0YXRpYyB2b2lkIHBzcl9mb3JjZV9od190cmFja2luZ19leGl0KHN0cnVjdCBpbnRl
bF9kcCAqaW50ZWxfZHApCiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0g
ZHBfdG9faTkxNShpbnRlbF9kcCk7CiAKLQlpZiAoRElTUExBWV9WRVIoZGV2X3ByaXYpID49IDkp
CisJaWYgKERJU1BMQVlfVkVSKGRldl9wcml2KSA+PSA5ICYmICFpbnRlbF9kcC0+cHNyLnBzcjJf
c2VsX2ZldGNoX2VuYWJsZWQpCiAJCS8qCiAJCSAqIERpc3BsYXkgV0EgIzA4ODQ6IHNrbCsKIAkJ
ICogVGhpcyBkb2N1bWVudGVkIFdBIGZvciBieHQgY2FuIGJlIHNhZmVseSBhcHBsaWVkCi0tIAoy
LjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
