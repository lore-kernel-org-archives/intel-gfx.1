Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F74C63798
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 19:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B3B2222E
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 19:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B3B2222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FFA6E08E;
	Tue, 17 Nov 2020 19:45:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87A86E06E
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 19:44:55 +0000 (UTC)
IronPort-SDR: X5UZ+6KA4fID3YDNn6I+L7KuS7uaYeh4sqkoAruEe10Hl1NuIFre+/gwDW5K+ETdXoOx+QXF+d
 rnwZpXBCwg+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="232612535"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="232612535"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 11:44:53 -0800
IronPort-SDR: MNIfUSgGrvwQy3v5349omlRS7UYudQTVVyAuUJ7nHhV9WP7olGrVDDhDFQ7LIJAIXM2z9HJNOn
 T3C33uZpU66A==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="359034192"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 17 Nov 2020 11:44:53 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2020 11:47:10 -0800
Message-Id: <20201117194718.11462-8-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201117194718.11462-1-manasi.d.navare@intel.com>
References: <20201117194718.11462-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 07/15] drm/i915: Add crtcs affected by bigjoiner to
 the state
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1h
a2Ugc3VyZSBib3RoIGNydGNzIHBhcnRpY2lwYXRpbmcgaW4gdGhlIGJpZ2pvaW5lciBzdHVmZgph
cmUgaW4gdGhlIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hbmFzaSBOYXZhcmUgPG1hbmFz
aS5kLm5hdmFyZUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5jCmluZGV4IDY4YzRmNmNjYTgyZC4uMDc4NDQ5NWUyMzEwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAtMTU0NjEsNiArMTU0NjEs
MjcgQEAgc3RhdGljIGludCBpbnRlbF9hdG9taWNfY2hlY2tfYXN5bmMoc3RydWN0IGludGVsX2F0
b21pY19zdGF0ZSAqc3RhdGUpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgaW50ZWxfYmln
am9pbmVyX2FkZF9hZmZlY3RlZF9jcnRjcyhzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0
ZSkKK3sKKwljb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsKKwlzdHJ1
Y3QgaW50ZWxfY3J0YyAqY3J0YzsKKwlpbnQgaTsKKworCWZvcl9lYWNoX25ld19pbnRlbF9jcnRj
X2luX3N0YXRlKHN0YXRlLCBjcnRjLCBjcnRjX3N0YXRlLCBpKSB7CisJCXN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlICpsaW5rZWRfY3J0Y19zdGF0ZTsKKworCQlpZiAoIWNydGNfc3RhdGUtPmJpZ2pv
aW5lcikKKwkJCWNvbnRpbnVlOworCisJCWxpbmtlZF9jcnRjX3N0YXRlID0gaW50ZWxfYXRvbWlj
X2dldF9jcnRjX3N0YXRlKCZzdGF0ZS0+YmFzZSwKKwkJCQkJCQkJY3J0Y19zdGF0ZS0+Ymlnam9p
bmVyX2xpbmtlZF9jcnRjKTsKKwkJaWYgKElTX0VSUihsaW5rZWRfY3J0Y19zdGF0ZSkpCisJCQly
ZXR1cm4gUFRSX0VSUihsaW5rZWRfY3J0Y19zdGF0ZSk7CisJfQorCisJcmV0dXJuIDA7Cit9CisK
IC8qKgogICogaW50ZWxfYXRvbWljX2NoZWNrIC0gdmFsaWRhdGUgc3RhdGUgb2JqZWN0CiAgKiBA
ZGV2OiBkcm0gZGV2aWNlCkBAIC0xNTQ4Niw2ICsxNTUwNywxMCBAQCBzdGF0aWMgaW50IGludGVs
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJCWdvdG8g
ZmFpbDsKIAorCXJldCA9IGludGVsX2JpZ2pvaW5lcl9hZGRfYWZmZWN0ZWRfY3J0Y3Moc3RhdGUp
OworCWlmIChyZXQpCisJCWdvdG8gZmFpbDsKKwogCWZvcl9lYWNoX29sZG5ld19pbnRlbF9jcnRj
X2luX3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwKIAkJCQkJICAgIG5ld19jcnRj
X3N0YXRlLCBpKSB7CiAJCWlmICghbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkpIHsKLS0g
CjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
