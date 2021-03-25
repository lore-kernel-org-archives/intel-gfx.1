Return-Path: <SRS0=Bn5a=IX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A98C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 21:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B15B619BA
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 21:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B15B619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0C16EE4E;
	Thu, 25 Mar 2021 21:48:14 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB336EE4E
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Mar 2021 21:48:13 +0000 (UTC)
IronPort-SDR: 9kN3HcM6DnTI/sxqHcBTdzlZXVf77XZ8Svh8RJOH3fdye6uOMxp7qH+LLOLC7rqlJTozrmt1+j
 817RibCtq5Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="171004976"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="171004976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 14:48:13 -0700
IronPort-SDR: 877Ho/7u3eZjZe3tcKEWOFcWea80h8oa0TnxPiuaJpUxIYW/dtp1phFUwGnAct05IgGnbbic63
 XmC/IfS1N7Dw==
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="375235613"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 14:48:12 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 25 Mar 2021 23:47:44 +0200
Message-Id: <20210325214808.2071517-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325214808.2071517-1-imre.deak@intel.com>
References: <20210325214808.2071517-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 01/25] drm/i915: Fix rotation setup during
 plane HW readout
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

VGhlIEhXIHBsYW5lIHN0YXRlIGlzIGNsZWFyZWQgYW5kIGluaXRlZCBhZnRlciB3ZSBzdG9yZSB0
aGUgcm90YXRpb24gdG8KaXQsIHNvIHN0b3JlIGl0IGluc3RlYWQgdG8gdGhlIHVhcGkgc3RhdGUg
dG8gbWF0Y2ggd2hhdCB3ZSBkbyB3aXRoIGFsbApvdGhlciBwbGFuZSBzdGF0ZSB1bnRpbCBpbnRl
bF9wbGFuZV9jb3B5X3VhcGlfdG9faHdfc3RhdGUoKSBpcyBjYWxsZWQuCgpSb3RhdGlvbiBmb3Ig
aW5pdGlhbCBGQnMgaXMgbm90IHN1cHBvcnRlZCBhdG0sIGJ1dCBsZXQncyBzdGlsbCBmaXggdGhl
CnBsYW5lIHN0YXRlIHNldHVwIGhlcmUuCgpXaGlsZSBhdCBpdCByZW1vdmUgdGhlIHJlZHVuZGFu
dCBpbnRlbF9zdGF0ZS0+dWFwaS5zcmMvZHN0IGluaXQsIHdoaWNoCndpbGwgYmUgZG9uZSBpbiBp
bnRlbF9wbGFuZV9jb3B5X3VhcGlfdG9faHdfc3RhdGUoKS4KCnYyOiBSZW1vdmUgcmVkdW5kYW50
IGludGVsX3N0YXRlLT51YXBpLnNyYy9kc3QgaW5pdC4gKFZpbGxlKQoKU2lnbmVkLW9mZi1ieTog
SW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKaW5kZXggMTc0OTBkMjlkYzEzMy4uZTM0NWU2NDVh
MTU2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMK
QEAgLTI1MDAsMTEgKzI1MDAsMTEgQEAgaW50ZWxfZmluZF9pbml0aWFsX3BsYW5lX29iaihzdHJ1
Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0YywKIAlyZXR1cm47CiAKIHZhbGlkX2ZiOgotCWludGVs
X3N0YXRlLT5ody5yb3RhdGlvbiA9IHBsYW5lX2NvbmZpZy0+cm90YXRpb247CisJcGxhbmVfc3Rh
dGUtPnJvdGF0aW9uID0gcGxhbmVfY29uZmlnLT5yb3RhdGlvbjsKIAlpbnRlbF9maWxsX2ZiX2dn
dHRfdmlldygmaW50ZWxfc3RhdGUtPnZpZXcsIGZiLAotCQkJCWludGVsX3N0YXRlLT5ody5yb3Rh
dGlvbik7CisJCQkJcGxhbmVfc3RhdGUtPnJvdGF0aW9uKTsKIAlpbnRlbF9zdGF0ZS0+Y29sb3Jf
cGxhbmVbMF0uc3RyaWRlID0KLQkJaW50ZWxfZmJfcGl0Y2goZmIsIDAsIGludGVsX3N0YXRlLT5o
dy5yb3RhdGlvbik7CisJCWludGVsX2ZiX3BpdGNoKGZiLCAwLCBwbGFuZV9zdGF0ZS0+cm90YXRp
b24pOwogCiAJX19pOTE1X3ZtYV9waW4odm1hKTsKIAlpbnRlbF9zdGF0ZS0+dm1hID0gaTkxNV92
bWFfZ2V0KHZtYSk7CkBAIC0yNTIyLDkgKzI1MjIsNiBAQCBpbnRlbF9maW5kX2luaXRpYWxfcGxh
bmVfb2JqKHN0cnVjdCBpbnRlbF9jcnRjICppbnRlbF9jcnRjLAogCXBsYW5lX3N0YXRlLT5jcnRj
X3cgPSBmYi0+d2lkdGg7CiAJcGxhbmVfc3RhdGUtPmNydGNfaCA9IGZiLT5oZWlnaHQ7CiAKLQlp
bnRlbF9zdGF0ZS0+dWFwaS5zcmMgPSBkcm1fcGxhbmVfc3RhdGVfc3JjKHBsYW5lX3N0YXRlKTsK
LQlpbnRlbF9zdGF0ZS0+dWFwaS5kc3QgPSBkcm1fcGxhbmVfc3RhdGVfZGVzdChwbGFuZV9zdGF0
ZSk7Ci0KIAlpZiAocGxhbmVfY29uZmlnLT50aWxpbmcpCiAJCWRldl9wcml2LT5wcmVzZXJ2ZV9i
aW9zX3N3aXp6bGUgPSB0cnVlOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
