Return-Path: <SRS0=0Its=HL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58BFC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 02:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A25564E5A
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 02:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A25564E5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8046EA77;
	Tue,  9 Feb 2021 02:19:27 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77196EA77
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Feb 2021 02:19:26 +0000 (UTC)
IronPort-SDR: tDmbJobJw7MnPh5XsuvEcXPK9dqLdfil3jbIYlcapE++Fbrq/TiEWIeTrGYbAmd4Y0OE0UFFKT
 l50dVGGygclw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243313112"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243313112"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 18:19:24 -0800
IronPort-SDR: 1jbcVHYf39RRD4rtwe6dTx0zixvQAT3ZaLNzTf3lO5YW7n7PaCNbvXzS62dYaliSt5B3ja3ekm
 PUMNIvOe1B+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="395864610"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 08 Feb 2021 18:19:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Feb 2021 04:19:21 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Feb 2021 04:19:17 +0200
Message-Id: <20210209021918.16234-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209021918.16234-1-ville.syrjala@linux.intel.com>
References: <20210209021918.16234-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/3] drm/i915: Fix overlay frontbuffer tracking
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
Cc: stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGRvbid0IGhhdmUgYSBwZXJzaXN0ZW50IGZiIGhvbGRpbmcgYSByZWZlcmVuY2UgdG8gdGhlIGZy
b250YnVmZmVyCm9iamVjdCwgc28gZXZlcnkgdGltZSB3ZSBkbyB0aGUgZ2V0K3B1dCB3ZSB0aHJv
dyB0aGUgZnJvbnRidWZmZXIgb2JqZWN0CmltbWVkaWF0ZWx5IGF3YXkuIEFuZCBzbyB0aGUgbmV4
dCB0aW1lIGFyb3VuZCB3ZSBnZXQgYSBwcmlzdGluZQpmcm9udGJ1ZmZlciBvYmplY3Qgd2l0aCBi
aXRzPT0wIGV2ZW4gZm9yIHRoZSBvbGQgdm1hLiBUaGlzIGNvbmZ1c2VzCnRoZSBmcm9udGJ1ZmZl
ciB0cmFja2luZyBjb2RlIHdoaWNoIHVuZGVyc3RhbmRhYmx5IGV4cGVjdHMgdGhlIG9sZApmcm9u
dGJ1ZmZlciB0byBoYXZlIHRoZSBvdmVybGF5J3MgYml0IHNldC4KCkZpeCB0aGlzIGJ5IGhhbmdp
bmcgb24gdG8gdGhlIGZyb250YnVmZmVyIHJlZmVyZW5jZSB1bnRpbCB0aGUgbmV4dApmbGlwLiBB
bmQganVzdCB0byBtYWtlIHRoaXMgYSBiaXQgbW9yZSBjbGVhciBsZXQncyB0cmFjayB0aGUgZnJv
bnRidWZmZXIKZXhwbGljaXRseSBpbnN0ZWFkIG9mIGp1c3QgZ3JhYmJpbmcgaXQgdmlhIHRoZSBv
bGQgdm1hLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGlu
ZW5AbGludXguaW50ZWwuY29tPgpDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaW50ZWwvLS9pc3N1ZXMvMTEzNgpGaXhlczogZGE0MjEwNGY1ODlkICgiZHJtL2k5MTU6
IEhvbGQgcmVmZXJlbmNlIHRvIGludGVsX2Zyb250YnVmZmVyIGFzIHdlIHRyYWNrIGFjdGl2aXR5
IikKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX292ZXJsYXku
YyB8IDE3ICsrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfb3ZlcmxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9v
dmVybGF5LmMKaW5kZXggOWMwMTEzZjE1YjU4Li5lZjhmNDRmNWU3NTEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfb3ZlcmxheS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfb3ZlcmxheS5jCkBAIC0xODMsNiArMTgzLDcgQEAg
c3RydWN0IGludGVsX292ZXJsYXkgewogCXN0cnVjdCBpbnRlbF9jcnRjICpjcnRjOwogCXN0cnVj
dCBpOTE1X3ZtYSAqdm1hOwogCXN0cnVjdCBpOTE1X3ZtYSAqb2xkX3ZtYTsKKwlzdHJ1Y3QgaW50
ZWxfZnJvbnRidWZmZXIgKmZyb250YnVmZmVyOwogCWJvb2wgYWN0aXZlOwogCWJvb2wgcGZpdF9h
Y3RpdmU7CiAJdTMyIHBmaXRfdnNjYWxlX3JhdGlvOyAvKiBzaGlmdGVkLXBvaW50IG51bWJlciwg
KDE8PDEyKSA9PSAxLjAgKi8KQEAgLTI4MywyMSArMjg0LDE5IEBAIHN0YXRpYyB2b2lkIGludGVs
X292ZXJsYXlfZmxpcF9wcmVwYXJlKHN0cnVjdCBpbnRlbF9vdmVybGF5ICpvdmVybGF5LAogCQkJ
CSAgICAgICBzdHJ1Y3QgaTkxNV92bWEgKnZtYSkKIHsKIAllbnVtIHBpcGUgcGlwZSA9IG92ZXJs
YXktPmNydGMtPnBpcGU7Ci0Jc3RydWN0IGludGVsX2Zyb250YnVmZmVyICpmcm9tID0gTlVMTCwg
KnRvID0gTlVMTDsKKwlzdHJ1Y3QgaW50ZWxfZnJvbnRidWZmZXIgKmZyb250YnVmZmVyID0gTlVM
TDsKIAogCWRybV9XQVJOX09OKCZvdmVybGF5LT5pOTE1LT5kcm0sIG92ZXJsYXktPm9sZF92bWEp
OwogCi0JaWYgKG92ZXJsYXktPnZtYSkKLQkJZnJvbSA9IGludGVsX2Zyb250YnVmZmVyX2dldChv
dmVybGF5LT52bWEtPm9iaik7CiAJaWYgKHZtYSkKLQkJdG8gPSBpbnRlbF9mcm9udGJ1ZmZlcl9n
ZXQodm1hLT5vYmopOworCQlmcm9udGJ1ZmZlciA9IGludGVsX2Zyb250YnVmZmVyX2dldCh2bWEt
Pm9iaik7CiAKLQlpbnRlbF9mcm9udGJ1ZmZlcl90cmFjayhmcm9tLCB0bywgSU5URUxfRlJPTlRC
VUZGRVJfT1ZFUkxBWShwaXBlKSk7CisJaW50ZWxfZnJvbnRidWZmZXJfdHJhY2sob3ZlcmxheS0+
ZnJvbnRidWZmZXIsIGZyb250YnVmZmVyLAorCQkJCUlOVEVMX0ZST05UQlVGRkVSX09WRVJMQVko
cGlwZSkpOwogCi0JaWYgKHRvKQotCQlpbnRlbF9mcm9udGJ1ZmZlcl9wdXQodG8pOwotCWlmIChm
cm9tKQotCQlpbnRlbF9mcm9udGJ1ZmZlcl9wdXQoZnJvbSk7CisJaWYgKG92ZXJsYXktPmZyb250
YnVmZmVyKQorCQlpbnRlbF9mcm9udGJ1ZmZlcl9wdXQob3ZlcmxheS0+ZnJvbnRidWZmZXIpOwor
CW92ZXJsYXktPmZyb250YnVmZmVyID0gZnJvbnRidWZmZXI7CiAKIAlpbnRlbF9mcm9udGJ1ZmZl
cl9mbGlwX3ByZXBhcmUob3ZlcmxheS0+aTkxNSwKIAkJCQkgICAgICAgSU5URUxfRlJPTlRCVUZG
RVJfT1ZFUkxBWShwaXBlKSk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAo=
