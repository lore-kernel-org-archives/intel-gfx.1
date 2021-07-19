Return-Path: <SRS0=F6ds=ML=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67258C07E95
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 23:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B90D61107
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 23:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B90D61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA43589C9A;
	Mon, 19 Jul 2021 23:54:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FA789C9A
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Jul 2021 23:54:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="232927935"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="232927935"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="575608798"
Received: from kialmah1-desk.jf.intel.com ([10.23.15.164])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2021 16:54:56 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 19 Jul 2021 16:59:27 -0700
Message-Id: <20210719235927.283173-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/dp: Add missing TPS4 programming bits
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

Qml0cyAyMDoxOSBhcmUgdXNlZCB0byBzZXQgQ1AyNTIwIFBhdHRlcm5zIDEvMi8zIChyZWZlciB0
byBTcGVjczo1MDQ4NCkuClRQUzQgaXMgQ1AyNTIwIFBhdHRlcm4gMyAocmVmZXIgdG8gRFAyLjAg
c3BhY2VzIFRhYmxlIDMtMTEsIERQQ0QgMDAyNDhoCkxJTktfUVVBTF9QQVRURVJOX1NFTEVDVCwg
YW5kIERQIFBIWSAxLjQgQ1RTIC0gQXBwZW5kaXggQSAtIENvbXBsaWFuY2UKRVlFIFBhdHRlcm4o
Q1AyNTIwOyBOb3JtYXRpdmUpKQoKRm9yIFRQUzQsIHNldHRpbmcgYml0cyAyMDoxOSB0byB2YWx1
ZSAhPSAwMGIsIGxlYWRzIHRvIGEgbm9uLVRQUzQgcGF0dGVybi4KVGhpcyBpcyBjb25maXJtZWQg
dXNpbmcgRFAgU2NvcGUgcnVubmluZyBEUDEuNCBQSFkgQ1RTLgoKVG8gYXZvaWQgYW55IGFjY2lk
ZW50YWwgd3Jvbmcgc2V0dGluZyBvZiBiaXRzIDIwOjE5LCBzZXQgaXQgY29ycmVjdGx5IGZvcgpU
UFM0IExUIHBhdHRlcm4gc2VsZWN0aW9uLiBUaGlzIHByb2dyYW1taW5nIHNlcXVlbmNlIGlzIHRo
ZSBzYW1lIHVzZWQgYnkgRVYuCgpDYzogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGlu
dGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+CkNDOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KQ2M6
IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogS2hhbGVkIEFs
bWFoYWxsYXd5IDxraGFsZWQuYWxtYWhhbGxhd3lAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3JlZy5oICAgICAgICAgIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCmluZGV4IDI2
YTNhYTczZmNjNC4uNTRiNGIyOGZkYzc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RkaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGRpLmMKQEAgLTM0MTIsNiArMzQxMiw4IEBAIHN0YXRpYyB2b2lkIGludGVsX2RkaV9z
ZXRfbGlua190cmFpbihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAogCQlicmVhazsKIAljYXNl
IERQX1RSQUlOSU5HX1BBVFRFUk5fNDoKIAkJdGVtcCB8PSBEUF9UUF9DVExfTElOS19UUkFJTl9Q
QVQ0OworCQl0ZW1wICY9IH5EUF9UUF9DVExfVFJBSU5fUEFUNF9TRUxfTUFTSzsKKwkJdGVtcCB8
PSBEUF9UUF9DVExfVFJBSU5fUEFUNF9TRUxfVFA0YTsKIAkJYnJlYWs7CiAJfQogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZWcuaAppbmRleCA5NDNmZTQ4NWM2NjIuLmE2NTk5OGRmOTk5NCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3JlZy5oCkBAIC0xMDE3Niw2ICsxMDE3NiwxMCBAQCBlbnVtIHNrbF9wb3dlcl9n
YXRlIHsKICNkZWZpbmUgIERQX1RQX0NUTF9NT0RFX1NTVAkJCSgwIDw8IDI3KQogI2RlZmluZSAg
RFBfVFBfQ1RMX01PREVfTVNUCQkJKDEgPDwgMjcpCiAjZGVmaW5lICBEUF9UUF9DVExfRk9SQ0Vf
QUNUCQkJKDEgPDwgMjUpCisjZGVmaW5lICBEUF9UUF9DVExfVFJBSU5fUEFUNF9TRUxfTUFTSwkJ
KDMgPDwgMTkpCisjZGVmaW5lICBEUF9UUF9DVExfVFJBSU5fUEFUNF9TRUxfVFA0YQkJKDAgPDwg
MTkpCisjZGVmaW5lICBEUF9UUF9DVExfVFJBSU5fUEFUNF9TRUxfVFA0YgkJKDEgPDwgMTkpCisj
ZGVmaW5lICBEUF9UUF9DVExfVFJBSU5fUEFUNF9TRUxfVFA0YwkJKDIgPDwgMTkpCiAjZGVmaW5l
ICBEUF9UUF9DVExfRU5IQU5DRURfRlJBTUVfRU5BQkxFCSgxIDw8IDE4KQogI2RlZmluZSAgRFBf
VFBfQ1RMX0ZESV9BVVRPVFJBSU4JCSgxIDw8IDE1KQogI2RlZmluZSAgRFBfVFBfQ1RMX0xJTktf
VFJBSU5fTUFTSwkJKDcgPDwgOCkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
