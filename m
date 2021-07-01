Return-Path: <SRS0=QA22=LZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981A4C11F64
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Jul 2021 09:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7986145A
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Jul 2021 09:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7986145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24946EAA6;
	Thu,  1 Jul 2021 09:04:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAD66EAA6
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Jul 2021 09:04:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="205494551"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="205494551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 02:04:07 -0700
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="408865353"
Received: from dfdonlon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 02:04:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  1 Jul 2021 10:03:26 +0100
Message-Id: <20210701090326.1056452-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display: check if compressed_llb was
 allocated
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

SWYgd2UgaGl0IHRoZSBlcnJvciBwYXRoIGhlcmUgd2UgdW5jb25kaXRpb25hbGx5IGNhbGwKaTkx
NV9nZW1fc3RvbGVuX3JlbW92ZV9ub2RlLCBldmVuIHRob3VnaCB3ZSBvbmx5IGFsbG9jYXRlIHRo
ZQpjb21wcmVzc2VkX2xsYiBvbiBvbGRlciBwbGF0Zm9ybXMuIFRoZXJlZm9yZSB3ZSBzaG91bGQg
Zmlyc3QgY2hlY2sgdGhhdAp3ZSBhY3R1YWxseSBhbGxvY2F0ZWQgdGhlIG5vZGUgYmVmb3JlIHRy
eWluZyB0byByZW1vdmUgaXQuCgpSZWZlcmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzM3MDkKRml4ZXM6IDQ2YjJjNDBlMGFmMyAoImRybS9p
OTE1L2ZiYzogQWxsb2NhdGUgbGxiIGJlZm9yZSBjZmIiKQpTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9mYmMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9m
YmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMKaW5kZXggN2Rj
NzJlNGE0NjU2Li44MmVmZmI2NGEzYjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9mYmMuYwpAQCAtNTE2LDcgKzUxNiw4IEBAIHN0YXRpYyBpbnQgaW50ZWxfZmJjX2FsbG9j
X2NmYihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJcmV0dXJuIDA7CiAKIGVy
cl9sbGI6Ci0JaTkxNV9nZW1fc3RvbGVuX3JlbW92ZV9ub2RlKGRldl9wcml2LCAmZmJjLT5jb21w
cmVzc2VkX2xsYik7CisJaWYgKGRybV9tbV9ub2RlX2FsbG9jYXRlZCgmZmJjLT5jb21wcmVzc2Vk
X2xsYikpCisJCWk5MTVfZ2VtX3N0b2xlbl9yZW1vdmVfbm9kZShkZXZfcHJpdiwgJmZiYy0+Y29t
cHJlc3NlZF9sbGIpOwogZXJyOgogCWlmIChkcm1fbW1faW5pdGlhbGl6ZWQoJmRldl9wcml2LT5t
bS5zdG9sZW4pKQogCQlkcm1faW5mb19vbmNlKCZkZXZfcHJpdi0+ZHJtLCAibm90IGVub3VnaCBz
dG9sZW4gc3BhY2UgZm9yIGNvbXByZXNzZWQgYnVmZmVyIChuZWVkICVkIG1vcmUgYnl0ZXMpLCBk
aXNhYmxpbmcuIEhpbnQ6IHlvdSBtYXkgYmUgYWJsZSB0byBpbmNyZWFzZSBzdG9sZW4gbWVtb3J5
IHNpemUgaW4gdGhlIEJJT1MgdG8gYXZvaWQgdGhpcy5cbiIsIHNpemUpOwotLSAKMi4yNi4zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZngg
bWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
