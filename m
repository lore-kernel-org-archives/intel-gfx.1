Return-Path: <SRS0=a3P7=L6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5FFC07E96
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 09:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8547060E0B
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 09:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8547060E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD7889D02;
	Tue,  6 Jul 2021 09:07:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EB889B0D;
 Tue,  6 Jul 2021 09:07:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="230810006"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="230810006"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:07:06 -0700
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="486078626"
Received: from yunhanch-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.214.173.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:07:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Jul 2021 10:05:58 +0100
Message-Id: <20210706090559.1589544-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] dma-fence: export dma_fence_might_wait
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

SXQgbWlnaHQgYmUgdXNlZnVsIGZvciBkcml2ZXJzIHRvIGFubm90YXRlIGEgcGF0aCB3aGVyZSBo
aXR0aW5nIHRoZQphY3R1YWwgd2FpdCBwYXRoIG1pZ2h0IGJlIGRpZmZpY3VsdCBvciB1bmxpa2Vs
eSB0aHJvdWdoIG5vcm1hbCB0ZXN0aW5nLgoKU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIHwgMTkg
KysrKysrKysrKysrKysrKy0tLQogaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCAgIHwgIDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLmMKaW5kZXggY2UwZjVlZmY1NzVkLi5mMmNkMDM2YjUyNDMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMKQEAgLTMzNSw2ICszMzUsMjEgQEAgdm9pZCBfX2RtYV9mZW5jZV9taWdodF93YWl0KHZvaWQp
CiB9CiAjZW5kaWYKIAorLyoqCisgKiBkbWFfZmVuY2VfbWlnaHRfd2FpdCAtIGVudGVyaW5nIGEg
c2VjdGlvbiB3aGljaCBtaWdodCB3YWl0IG9uIERNQSBmZW5jZQorICogY3JpdGljYWwgc2VjdGlv
bi4KKyAqCisgKiBUaGlzIGlzIGFsc28gcG90ZW50aWFsbHkgdXNlZnVsIGZvciBkcml2ZXJzIHRv
IGNhbGwgZGlyZWN0bHksIHdoZW4gYW5ub3RhdGluZworICogYSBwYXRoIHdoZXJlIGhpdHRpbmcg
dGhlIGFjdHVhbCB3YWl0IHBhdGggbWlnaHQgYmUgZGlmZmljdWx0IG9yIHVubGlrZWx5CisgKiB0
aHJvdWdoIG5vcm1hbCB0ZXN0aW5nLgorICovCit2b2lkIGRtYV9mZW5jZV9taWdodF93YWl0KHZv
aWQpCit7CisJbWlnaHRfc2xlZXAoKTsKKwlfX2RtYV9mZW5jZV9taWdodF93YWl0KCk7Cit9CitF
WFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9taWdodF93YWl0KTsKKwogCiAvKioKICAqIGRtYV9mZW5j
ZV9zaWduYWxfdGltZXN0YW1wX2xvY2tlZCAtIHNpZ25hbCBjb21wbGV0aW9uIG9mIGEgZmVuY2UK
QEAgLTQ5NSw5ICs1MTAsNyBAQCBkbWFfZmVuY2Vfd2FpdF90aW1lb3V0KHN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlLCBib29sIGludHIsIHNpZ25lZCBsb25nIHRpbWVvdXQpCiAJaWYgKFdBUk5fT04o
dGltZW91dCA8IDApKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCW1pZ2h0X3NsZWVwKCk7Ci0KLQlf
X2RtYV9mZW5jZV9taWdodF93YWl0KCk7CisJZG1hX2ZlbmNlX21pZ2h0X3dhaXQoKTsKIAogCXRy
YWNlX2RtYV9mZW5jZV93YWl0X3N0YXJ0KGZlbmNlKTsKIAlpZiAoZmVuY2UtPm9wcy0+d2FpdCkK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmggYi9pbmNsdWRlL2xpbnV4L2Rt
YS1mZW5jZS5oCmluZGV4IDZmZmI0YjJjNjM3MS4uMzdiZjRiZWVkOTNmIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgK
QEAgLTM3MCw2ICszNzAsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2ZlbmNlX2VuZF9zaWdu
YWxsaW5nKGJvb2wgY29va2llKSB7fQogc3RhdGljIGlubGluZSB2b2lkIF9fZG1hX2ZlbmNlX21p
Z2h0X3dhaXQodm9pZCkge30KICNlbmRpZgogCit2b2lkIGRtYV9mZW5jZV9taWdodF93YWl0KHZv
aWQpOworCiBpbnQgZG1hX2ZlbmNlX3NpZ25hbChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSk7CiBp
bnQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpOwogaW50
IGRtYV9mZW5jZV9zaWduYWxfdGltZXN0YW1wKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCBrdGlt
ZV90IHRpbWVzdGFtcCk7Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWdmeAo=
