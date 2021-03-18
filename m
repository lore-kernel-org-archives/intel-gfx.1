Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D197CC43381
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 16:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F53D64E81
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 16:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F53D64E81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183A06E907;
	Thu, 18 Mar 2021 16:10:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC16E90A
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Mar 2021 16:10:35 +0000 (UTC)
IronPort-SDR: gvGuVV+AmVnWVzGQACCAdnUyTLaYJ5fUG/vH5CLkUJqj7auFHVwKG562NkWvd081mamYidxNxv
 F+gVfxrZFJBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="176848159"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="176848159"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 09:10:27 -0700
IronPort-SDR: kwJaw5f+6VtMHhHWDp4LGoYEjrrhq/fQ/59X0hVlPIKdTcjjJWqmgbdf/wLBCOOjlqoaGvQjRO
 Z3GtN9V1yHhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="450533288"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2021 09:10:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Mar 2021 18:10:22 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 18 Mar 2021 18:10:10 +0200
Message-Id: <20210318161015.22070-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210318161015.22070-1-ville.syrjala@linux.intel.com>
References: <20210318161015.22070-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 2/7] drm/i915: Remove dead signal level debugs
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklm
IHdlIGV2ZXIgZ2V0IGhlcmUgd2l0aCBib2d1cyBzaWduYWwgbGV2ZWxzIHdlJ3ZlIG1lc3NlZAp1
cCBzb21ld2hlcmUgZWFybGllci4gSnVzdCB1c2UgTUlTU0lOX0NBU0UoKS4KClJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCBkMTk0NWJmZjY5ODAuLjBjZTk2YmQ4N2E0OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwpAQCAtMzMxMCw4ICszMzEwLDcg
QEAgc3RhdGljIHUzMiBzbmJfY3B1X2VkcF9zaWduYWxfbGV2ZWxzKHU4IHRyYWluX3NldCkKIAlj
YXNlIERQX1RSQUlOX1ZPTFRBR0VfU1dJTkdfTEVWRUxfMyB8IERQX1RSQUlOX1BSRV9FTVBIX0xF
VkVMXzA6CiAJCXJldHVybiBFRFBfTElOS19UUkFJTl84MDBfMTIwME1WXzBEQl9TTkJfQjsKIAlk
ZWZhdWx0OgotCQlEUk1fREVCVUdfS01TKCJVbnN1cHBvcnRlZCB2b2x0YWdlIHN3aW5nL3ByZS1l
bXBoYXNpcyBsZXZlbDoiCi0JCQkgICAgICAiMHgleFxuIiwgc2lnbmFsX2xldmVscyk7CisJCU1J
U1NJTkdfQ0FTRShzaWduYWxfbGV2ZWxzKTsKIAkJcmV0dXJuIEVEUF9MSU5LX1RSQUlOXzQwMF82
MDBNVl8wREJfU05CX0I7CiAJfQogfQpAQCAtMzM2Miw4ICszMzYxLDcgQEAgc3RhdGljIHUzMiBp
dmJfY3B1X2VkcF9zaWduYWxfbGV2ZWxzKHU4IHRyYWluX3NldCkKIAkJcmV0dXJuIEVEUF9MSU5L
X1RSQUlOXzgwME1WXzNfNURCX0lWQjsKIAogCWRlZmF1bHQ6Ci0JCURSTV9ERUJVR19LTVMoIlVu
c3VwcG9ydGVkIHZvbHRhZ2Ugc3dpbmcvcHJlLWVtcGhhc2lzIGxldmVsOiIKLQkJCSAgICAgICIw
eCV4XG4iLCBzaWduYWxfbGV2ZWxzKTsKKwkJTUlTU0lOR19DQVNFKHNpZ25hbF9sZXZlbHMpOwog
CQlyZXR1cm4gRURQX0xJTktfVFJBSU5fNTAwTVZfMERCX0lWQjsKIAl9CiB9Ci0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdm
eCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
