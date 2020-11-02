Return-Path: <SRS0=yb3L=EI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F75C00A89
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 19:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CEB20731
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 19:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70CEB20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAE96E47E;
	Mon,  2 Nov 2020 19:30:37 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31B96E47E
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2020 19:30:36 +0000 (UTC)
IronPort-SDR: ae/gXNRfDsWvhXvSBKKnPedq03kaoEJPBIzzNqHDTgoR2T8SHKrDwBrE/ZF1Y1btYF4RNNB2Xw
 R4mq17iAI+WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148220697"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="148220697"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 11:30:36 -0800
IronPort-SDR: 4FmO8So/WX37BlitlSew0oTILeSSwzwdtwSh4zgYhhmLLr248+K0tlwwvnaUjE7vE0igTKRAYR
 z20wdXZtDI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="352099550"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2020 11:30:35 -0800
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  2 Nov 2020 11:30:34 -0800
Message-Id: <20201102193034.28055-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/ehl: Remove invalid PCI ID
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

VXBkYXRlIHRoZSBFSEwgUENJIElEcyBmcm9tIEJTcGVjLgpSZW1vdmUgdGhlIGludmFsaWQgb25l
cy4KCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5jb20+
ClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgotLS0KIGluY2x1ZGUvZHJtL2k5MTVfcGNpaWRzLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vaTkxNV9wY2lpZHMuaCBi
L2luY2x1ZGUvZHJtL2k5MTVfcGNpaWRzLmgKaW5kZXggN2VlZWNiMDdjOWExLi5hYzg4NGFhYmFl
MDcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2k5MTVfcGNpaWRzLmgKKysrIGIvaW5jbHVkZS9k
cm0vaTkxNV9wY2lpZHMuaApAQCAtNTgxLDcgKzU4MSw2IEBACiAKIC8qIEVITC9KU0wgKi8KICNk
ZWZpbmUgSU5URUxfRUhMX0lEUyhpbmZvKSBcCi0JSU5URUxfVkdBX0RFVklDRSgweDQ1MDAsIGlu
Zm8pLAlcCiAJSU5URUxfVkdBX0RFVklDRSgweDQ1NzEsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RF
VklDRSgweDQ1NTEsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDQ1NDEsIGluZm8pLCBc
Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdm
eAo=
