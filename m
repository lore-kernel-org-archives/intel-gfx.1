Return-Path: <SRS0=NnJ0=BU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7950FC433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 18:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A0982080C
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 18:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A0982080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36A89F6B;
	Mon, 10 Aug 2020 18:08:55 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9789F6B
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 18:08:54 +0000 (UTC)
IronPort-SDR: +4aCpjomGv2DEMH5bQETbW+DLAL/xwyt5vECZdfo6pXVqPe/1ZyuqBmo7jWE2Emieo/Np/NXls
 8etaxkQijGrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="238422162"
X-IronPort-AV: E=Sophos;i="5.75,458,1589266800"; d="scan'208";a="238422162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 11:08:53 -0700
IronPort-SDR: HlLYH5avn57vTPNCL/mEbDFAPVcHxU0P5dQ37z807pVhTIh3Jw88jhP0NzxGrGuuqQRe8Qvrb7
 dPY7KGXhAEtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,458,1589266800"; d="scan'208";a="469131627"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by orsmga005.jf.intel.com with ESMTP; 10 Aug 2020 11:08:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 10 Aug 2020 11:08:51 -0700
Message-Id: <20200810180851.2746267-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Don't try to check max stride for
 disabled/non-existent display
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

VXNlcnNwYWNlIG1heSBzdGlsbCBjcmVhdGUgR0VNIGR1bWIgYnVmZmVycyBldmVuIG9uIHBsYXRm
b3JtcyB3aXRoCmRpc2FibGVkIG9yIG5vbi1leGlzdGVudCBkaXNwbGF5LiAgV2hlbiBjcmVhdGlu
ZyBkdW1iIGJ1ZmZlcnMgd2UgdHJ5IHRvCmNoZWNrIHRoZSBtYXggZmIgc3RyaWRlIGZvciB0aGUg
cGxhdGZvcm0gYnkgbG9va2luZyBhdCB0aGUgZmlyc3QgcGlwZSBvbgp0aGUgcGxhdGZvcm0uICBX
ZSBwcmV2aW91c2x5IGZpeGVkIGEgY3Jhc2ggcmVsYXRlZCB0byBhY2Nlc3NpbmcgdGhlCm5vbi1l
eGlzdGVudCBQSVBFX0EgaW4gY29tbWl0IDhhYzQ5NWY2MjRhNCAoImRybS9pOTE1OiBEb24ndCBv
b3BzIGluCmR1bWJfY3JlYXRlIGlvY3RsIGlmIHdlIGhhdmUgbm8gY3J0Y3MiKSBidXQgdGhlIGNy
YXNoIGlzIGJhY2sgYXMgb2YKY29tbWl0IGVhZTNkYTI3YmE4NCAoImRybS9pOTE1OiBHZXQgZmly
c3QgY3J0YyBpbnN0ZWFkIG9mIFBJUEVfQSBjcnRjIikKYmVjYXVzZSB3ZSBub3cgdHJ5IHRvIGl0
ZXJhdGUgb3ZlciB0aGUgW3VuaW5pdGlhbGl6ZWRdIGNydGMgbGlzdC4KCkZpeGVzOiBlYWUzZGEy
N2JhODQgKCJkcm0vaTkxNTogR2V0IGZpcnN0IGNydGMgaW5zdGVhZCBvZiBQSVBFX0EgY3J0YyIp
CkNjOiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPgpDYzogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
TWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYwppbmRleCA1MjJjNzcyYTIxMTEuLjQ3ODM5YmFmY2ZlNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTI3MjMsNiArMjcyMyw5IEBA
IHUzMiBpbnRlbF9wbGFuZV9mYl9tYXhfc3RyaWRlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiwKIAlzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YzsKIAlzdHJ1Y3QgaW50ZWxfcGxhbmUg
KnBsYW5lOwogCisJaWYgKCFIQVNfRElTUExBWShkZXZfcHJpdikgfHwgIUlOVEVMX0RJU1BMQVlf
RU5BQkxFRChkZXZfcHJpdikpCisJCXJldHVybiAwOworCiAJLyoKIAkgKiBXZSBhc3N1bWUgdGhl
IHByaW1hcnkgcGxhbmUgZm9yIHBpcGUgQSBoYXMKIAkgKiB0aGUgaGlnaGVzdCBzdHJpZGUgbGlt
aXRzIG9mIHRoZW0gYWxsLAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1nZngK
