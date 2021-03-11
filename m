Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96B9C433E9
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 13:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53CE864F97
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 13:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53CE864F97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90436ECE3;
	Thu, 11 Mar 2021 13:49:24 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A006ECA6
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 13:48:54 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 14:42:07 +0100
Message-Id: <20210311134249.588632-28-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311134249.588632-1-maarten.lankhorst@linux.intel.com>
References: <20210311134249.588632-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v8 27/69] drm/i915: Make __engine_unpark()
 compatible with ww locking.
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

VGFrZSB0aGUgd3cgbG9jayBhcm91bmQgZW5naW5lX3VucGFyay4gQmVjYXVzZSBvZiB0aGUKbWFu
eSBtYW55IHBsYWNlcyB3aGVyZSBycG0gaXMgdXNlZCwgSSBjaG9zZSB0aGUgc2FmZXN0IG9wdGlv
bgphbmQgdXNlZCBhIHRyeWxvY2sgdG8gb3Bwb3J0dW5pc3RpY2FsbHkgdGFrZSB0aGlzIGxvY2sg
Zm9yCl9fZW5naW5lX3VucGFyay4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9lbmdpbmVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9w
bS5jCmluZGV4IDI3ZDlkMTdiMzVjYi4uYmRkYzVjOThmYjA0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9lbmdpbmVfcG0uYwpAQCAtMjcsMTIgKzI3LDE2IEBAIHN0YXRpYyB2b2lk
IGRiZ19wb2lzb25fY2Uoc3RydWN0IGludGVsX2NvbnRleHQgKmNlKQogCQlpbnQgdHlwZSA9IGk5
MTVfY29oZXJlbnRfbWFwX3R5cGUoY2UtPmVuZ2luZS0+aTkxNSk7CiAJCXZvaWQgKm1hcDsKIAor
CQlpZiAoIWk5MTVfZ2VtX29iamVjdF90cnlsb2NrKG9iaikpCisJCQlyZXR1cm47CisKIAkJbWFw
ID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCB0eXBlKTsKIAkJaWYgKCFJU19FUlIobWFw
KSkgewogCQkJbWVtc2V0KG1hcCwgQ09OVEVYVF9SRURaT05FLCBvYmotPmJhc2Uuc2l6ZSk7CiAJ
CQlpOTE1X2dlbV9vYmplY3RfZmx1c2hfbWFwKG9iaik7CiAJCQlpOTE1X2dlbV9vYmplY3RfdW5w
aW5fbWFwKG9iaik7CiAJCX0KKwkJaTkxNV9nZW1fb2JqZWN0X3VubG9jayhvYmopOwogCX0KIH0K
IAotLSAKMi4zMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
