Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914CAC6377C
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5621F60FF3
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5621F60FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DF26E422;
	Wed, 21 Jul 2021 22:00:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B79C6E9C8
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 22:00:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297085331"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="297085331"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 15:00:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="496733343"
Received: from unknown (HELO rdvivi-mobl4.intel.com) ([10.212.44.180])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 15:00:28 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Jul 2021 18:00:23 -0400
Message-Id: <20210721220023.268194-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/bios: Fix ports mask
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

UE9SVF9BIHRvIFBPUlRfRiBhcmUgcmVndWxhciBpbnRlZ2VycyBkZWZpbmVkIGluIHRoZSBlbnVt
IHBvcnQsCndoaWxlIGZvcl9lYWNoX3BvcnRfbWFza2VkIHJlcXVpcmVzIGEgYml0IG1hc2sgZm9y
IHRoZSBwb3J0cy4KCkN1cnJlbnQgZ2l2ZW4gbWFzazogMGIxMTEKRGVzaXJlZCBtYXNrOiAwYjEx
MTExMQoKSSBub3RpY2VkIHRoaXMgd2hpbGUgQ2hyaXN0b3BoIHdhcyByZXBvcnRpbmcgYSBidWcg
Zm91bmQgb24gaGVhZGxlc3MKR1ZUIGNvbmZpZ3VyYXRpb24gd2hpY2ggYmlzZWN0IGJsYW1lZCBj
b21taXQgM2FlMDRjMGM3ZTYzICgiZHJtL2k5MTUvYmlvczoKbGltaXQgZGVmYXVsdCBvdXRwdXRz
IHRvIHBvcnRzIEEgdGhyb3VnaCBGIikKCkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJh
ZGVhZC5vcmc+CkZpeGVzOiAzYWUwNGMwYzdlNjMgKCJkcm0vaTkxNS9iaW9zOiBsaW1pdCBkZWZh
dWx0IG91dHB1dHMgdG8gcG9ydHMgQSB0aHJvdWdoIEYiKQpDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jCmluZGV4IDViNjkyMmUyOGVmMi4uOGJiZWI1
OTc4YmY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jp
b3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYwpAQCAt
MjE2Niw3ICsyMTY2LDggQEAgc3RhdGljIHZvaWQKIGluaXRfdmJ0X21pc3NpbmdfZGVmYXVsdHMo
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpCiB7CiAJZW51bSBwb3J0IHBvcnQ7Ci0JaW50
IHBvcnRzID0gUE9SVF9BIHwgUE9SVF9CIHwgUE9SVF9DIHwgUE9SVF9EIHwgUE9SVF9FIHwgUE9S
VF9GOworCWludCBwb3J0cyA9IEJJVChQT1JUX0EpIHwgQklUKFBPUlRfQikgfCBCSVQoUE9SVF9D
KSB8IFwKKwkJICAgIEJJVChQT1JUX0QpIHwgQklUKFBPUlRfRSkgfCBCSVQoUE9SVF9GKTsKIAog
CWlmICghSEFTX0RESShpOTE1KSAmJiAhSVNfQ0hFUlJZVklFVyhpOTE1KSkKIAkJcmV0dXJuOwot
LSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
