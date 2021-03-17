Return-Path: <SRS0=PXPa=IP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4282C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 16:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D8264F53
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 16:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D8264F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C982C6E83D;
	Wed, 17 Mar 2021 16:37:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAAD6E83D
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 16:37:38 +0000 (UTC)
IronPort-SDR: IWSwg1YnZsH2HtJTIcqoXfazoAzFOpyO3YdnkZYRJEWMQTvY6biWk4cNmMHHtt9/3hkqL58kYm
 7ZtXYQHdqkVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189548370"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="189548370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 09:37:36 -0700
IronPort-SDR: +oppAPWDfjyzc/F8atuEMtFwU5oRwvPq17ya39+eOFh6eRPieDPOeDDbGvdw3uSxYs7OEQrBBm
 3mLmdoPwcTeA==
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="450161483"
Received: from jpferrer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.46.99])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 09:37:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:36:45 +0200
Message-Id: <5c9c9743af1c7265a2c976d582b7a6685ec0c414.1615998927.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615998927.git.jani.nikula@intel.com>
References: <cover.1615998927.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 06/14] drm/i915/bios: limit default outputs
 to ports A through F
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHR3byBtYWluIGNhc2VzIHdoZXJlIHRoZSBkZWZhdWx0IG91dHB1dHMgYXJlIHVz
ZWZ1bCB3aGVuIHRoZQpWQlQgaXMgbWlzc2luZzoKCi0gVGhlcmUgYXJlIHNvbWUgRERJLXBsYXRm
b3JtIENocm9tZWJvb2tzIG91dCB0aGVyZSB0aGF0IGRvIG5vdCBoYXZlIGEKICBWQlQsIHdoaWNo
IHdvcmtlZCBieSBjb2luY2lkZW5jZSBiZWNhdXNlIG9mIHRoZSBkZWZhdWx0IG91dHB1dHMuIFRo
ZQogIG1hY2hpbmVzIG5lZWQgdG8gY29udGludWUgdG8gd29yay4KCi0gRWFybHkgcGxhdGZvcm0g
ZW5hYmxpbmcgd2hlbiB0aGUgVkJUIG1pZ2h0IG5vdCBiZSBhdmFpbGFibGUuIChUaGlzCiAgY291
bGQgYmUgY2lyY3VtdmVudGVkIGJ5IHVzaW5nIHRoZSBpOTE1LnZidF9maXJtd2FyZSBwYXJhbWV0
ZXIuKQoKUHJlcGFyZSBmb3IgZ2VuZXJhdGluZyBmYWtlIGNoaWxkIGRldmljZXMgZm9yIHRoZSBk
ZWZhdWx0IG91dHB1dHMgYnkKbGltaXRpbmcgdGhlIG51bWJlciBvZiBvdXRwdXRzLiBXZSBkb24n
dCB3YW50IHRvIGdlbmVyYXRlIGV4Y2Vzc2l2ZQphbW91bnRzIG9mIGZha2UgY2hpbGQgZGV2aWNl
cy4gVGhpcyBjb3VsZCBiZSBwZXJoYXBzIGJlIGxpbWl0ZWQgZXZlbgptb3JlIGluIHRoZSBmdXR1
cmUsIGJ1dCBtYXRjaCB3aGF0J3MgcG9zc2libGUgb24gYWxsIERESSBwbGF0Zm9ybXMuCgpOb3Rl
IHRoYXQgbGltaXRpbmcgdGhlIGRlZmF1bHRzIHRvIG5vbi1UeXBlQyBwb3J0cyBpbiBjb21taXQK
ODI4Y2NiMzFjZjQxICgiZHJtL2k5MTUvaWNsOiBBZGQgVHlwZUMgcG9ydHMgb25seSBpZiBWQlQg
aXMgcHJlc2VudCIpIGlzCmEgbW9yZSBzdHJpY3QgbGltaXQsIGFuZCBtYWtlcyB0aGlzIGEgbm8t
b3Agb24gcmVjZW50IHBsYXRmb3Jtcy4KCnYyOiBSZXdyb3RlIGNvbW1pdCBtZXNzYWdlCgpDYzog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogTHVjYXMg
RGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9iaW9zLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYmlvcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9i
aW9zLmMKaW5kZXggYjBmOGQ5NTJlZDllLi40NGNkMjUwMzM1MzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jCkBAIC0yMDgxLDExICsyMDgxLDEyIEBAIHN0YXRp
YyB2b2lkCiBpbml0X3ZidF9taXNzaW5nX2RlZmF1bHRzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICppOTE1KQogewogCWVudW0gcG9ydCBwb3J0OworCWludCBwb3J0cyA9IFBPUlRfQSB8IFBPUlRf
QiB8IFBPUlRfQyB8IFBPUlRfRCB8IFBPUlRfRSB8IFBPUlRfRjsKIAogCWlmICghSEFTX0RESShp
OTE1KSAmJiAhSVNfQ0hFUlJZVklFVyhpOTE1KSkKIAkJcmV0dXJuOwogCi0JZm9yX2VhY2hfcG9y
dChwb3J0KSB7CisJZm9yX2VhY2hfcG9ydF9tYXNrZWQocG9ydCwgcG9ydHMpIHsKIAkJc3RydWN0
IGRkaV92YnRfcG9ydF9pbmZvICppbmZvID0KIAkJCSZpOTE1LT52YnQuZGRpX3BvcnRfaW5mb1tw
b3J0XTsKIAkJZW51bSBwaHkgcGh5ID0gaW50ZWxfcG9ydF90b19waHkoaTkxNSwgcG9ydCk7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
