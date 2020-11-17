Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E38C2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 19:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D0F02463D
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 19:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D0F02463D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AA26E08C;
	Tue, 17 Nov 2020 19:44:59 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537996E063
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 19:44:55 +0000 (UTC)
IronPort-SDR: SHYdJr5Kx5oBGRuUheJJ0uOkWf/xQuA4B+Ong9BVKBEihVyva7Dul/HCQlTFIKreaAQVJO3235
 av7F5EbsfwIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="232612541"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="232612541"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 11:44:53 -0800
IronPort-SDR: 7gaKaFDVARF5noY7c9uoB+p4UslETJU9oh0DoNtlAzzO/91YFiQ87DWhdngawEplo5NeFIsHoz
 ZwYJnB6AA8+g==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="359034208"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 17 Nov 2020 11:44:53 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2020 11:47:16 -0800
Message-Id: <20201117194718.11462-14-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201117194718.11462-1-manasi.d.navare@intel.com>
References: <20201117194718.11462-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 13/15] drm/i915: Fix cursor src/dst rectangle with
 bigjoiner
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGNhbid0IGNhbGwgZHJtX3BsYW5lX3N0YXRlX3NyYygpIHRoaXMgbGF0ZSBmb3IgdGhlIHNsYXZl
IHBsYW5lIHNpbmNlCml0IHdvdWxkIGNvbnN1bHQgdGhlIHdyb25nIHVhcGkgc3RhdGUuIFdlJ3Zl
IGFscmVheWQgZG9uZSB0aGUgY29ycmVjdAp1YXBpLT5odyBjb3B5IGVhcmxpZXIsIHNvIGxldCdz
IGp1c3QgcHJlc2VydmUgdGhlIHVuY2xpcHBlZCBzcmMvZHN0CnJlY3RzIHVzaW5nIGEgdGVtcCBj
b3B5IGFjcm9zcyB0aGUgaW50ZWxfYXRvbWljX3BsYW5lX2NoZWNrX2NsaXBwaW5nKCkKY2FsbC4K
ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwg
NiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwppbmRleCA0
ZDExZDViMDYwNmIuLmFjZDY0ZTc4OGEzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTExNjg5LDYgKzExNjg5LDggQEAgc3RhdGljIGludCBp
bnRlbF9jaGVja19jdXJzb3Ioc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCiB7
CiAJY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+aHcuZmI7
CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KHBsYW5lX3N0YXRlLT51
YXBpLnBsYW5lLT5kZXYpOworCWNvbnN0IHN0cnVjdCBkcm1fcmVjdCBzcmMgPSBwbGFuZV9zdGF0
ZS0+dWFwaS5zcmM7CisJY29uc3Qgc3RydWN0IGRybV9yZWN0IGRzdCA9IHBsYW5lX3N0YXRlLT51
YXBpLmRzdDsKIAlpbnQgcmV0OwogCiAJaWYgKGZiICYmIGZiLT5tb2RpZmllciAhPSBEUk1fRk9S
TUFUX01PRF9MSU5FQVIpIHsKQEAgLTExNzA0LDggKzExNzA2LDggQEAgc3RhdGljIGludCBpbnRl
bF9jaGVja19jdXJzb3Ioc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCiAJCXJl
dHVybiByZXQ7CiAKIAkvKiBVc2UgdGhlIHVuY2xpcHBlZCBzcmMvZHN0IHJlY3RhbmdsZXMsIHdo
aWNoIHdlIHByb2dyYW0gdG8gaHcgKi8KLQlwbGFuZV9zdGF0ZS0+dWFwaS5zcmMgPSBkcm1fcGxh
bmVfc3RhdGVfc3JjKCZwbGFuZV9zdGF0ZS0+dWFwaSk7Ci0JcGxhbmVfc3RhdGUtPnVhcGkuZHN0
ID0gZHJtX3BsYW5lX3N0YXRlX2Rlc3QoJnBsYW5lX3N0YXRlLT51YXBpKTsKKwlwbGFuZV9zdGF0
ZS0+dWFwaS5zcmMgPSBzcmM7CisJcGxhbmVfc3RhdGUtPnVhcGkuZHN0ID0gZHN0OwogCiAJcmV0
ID0gaW50ZWxfY3Vyc29yX2NoZWNrX3N1cmZhY2UocGxhbmVfc3RhdGUpOwogCWlmIChyZXQpCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
