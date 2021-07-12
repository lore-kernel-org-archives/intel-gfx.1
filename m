Return-Path: <SRS0=q1oR=ME=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D81C07E99
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Jul 2021 07:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F848610D1
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Jul 2021 07:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F848610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FA889B8F;
	Mon, 12 Jul 2021 07:50:01 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859089B8F
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Jul 2021 07:50:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="231721171"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="231721171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 00:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="493324182"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 12 Jul 2021 00:49:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Jul 2021 10:49:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Jul 2021 10:49:57 +0300
Message-Id: <20210712074957.3741-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH xf86-video-intel] sna: Dump fences also on
 -ENOBUFS
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNp
bmNlIGtlcm5lbCBjb21taXQgNzhkMmFkN2ViNGUxICgiZHJtL2k5MTUvZ3Q6IEZpeAotRURFQURM
SyBoYW5kbGluZyByZWdyZXNzaW9uIikgcnVubmluZyBvdXQgb2YgZmVuY2VzCndpbGwgcmVzdWx0
IGluIC1FTk9CVUZTIGluc3RlYWQgb2YgLUVERUFETEsgKHRoZSBsYXR0ZXIKaGF2aW5nIGJlZW4g
c3RvbGVuIGJ5IHd3IG11dGV4dGVzIGZvciB0aGVpciBpbnRlcm5hbCB1c2UpLgpBZGp1c3QgdGhl
IGZlbmNlIGR1bXBpbmcgdG8gZXhwZWN0IGVpdGhlciBlcnJubyB2YWx1ZS4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
c3JjL3NuYS9rZ2VtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zcmMvc25hL2tnZW0uYyBiL3NyYy9zbmEva2dlbS5j
CmluZGV4IDdiNjQ1ZGE4ZGE1Zi4uYWMwYjYxZDU0ZWM4IDEwMDY0NAotLS0gYS9zcmMvc25hL2tn
ZW0uYworKysgYi9zcmMvc25hL2tnZW0uYwpAQCAtNDI2Myw3ICs0MjYzLDcgQEAgdm9pZCBfa2dl
bV9zdWJtaXQoc3RydWN0IGtnZW0gKmtnZW0pCiAKIAkJaWYgKHJldCA9PSAtRU5PU1BDKQogCQkJ
ZHVtcF9ndHRfaW5mbyhrZ2VtKTsKLQkJaWYgKHJldCA9PSAtRURFQURMSykKKwkJaWYgKHJldCA9
PSAtRURFQURMSyB8fCByZXQgPT0gLUVOT0JVRlMpCiAJCQlkdW1wX2ZlbmNlX3JlZ3Moa2dlbSk7
CiAKIAkJaWYgKERFQlVHX1NZTkMpIHsKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
