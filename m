Return-Path: <SRS0=maCC=IV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50434C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 15:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126AB619B7
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 15:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 126AB619B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459DD6EAC2;
	Tue, 23 Mar 2021 15:51:29 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174736EA94
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Mar 2021 15:51:20 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Mar 2021 16:50:40 +0100
Message-Id: <20210323155059.628690-52-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v9 51/70] drm/i915/selftests: Prepare context
 selftest for obj->mm.lock removal
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T25seSBuZWVkcyB0byBjb252ZXJ0IGEgc2luZ2xlIGNhbGwgdG8gdGhlIHVubG9ja2VkIHZlcnNp
b24uCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Nl
bGZ0ZXN0X2NvbnRleHQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9z
ZWxmdGVzdF9jb250ZXh0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9jb250
ZXh0LmMKaW5kZXggYTAyZmQ3MDY0NGUyLi5iOWJkZDFkMjMyNDMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X2NvbnRleHQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9zZWxmdGVzdF9jb250ZXh0LmMKQEAgLTg3LDggKzg3LDggQEAgc3RhdGljIGlu
dCBfX2xpdmVfY29udGV4dF9zaXplKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKIAlp
ZiAoZXJyKQogCQlnb3RvIGVycjsKIAotCXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAo
Y2UtPnN0YXRlLT5vYmosCi0JCQkJCWk5MTVfY29oZXJlbnRfbWFwX3R5cGUoZW5naW5lLT5pOTE1
KSk7CisJdmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChjZS0+c3RhdGUt
Pm9iaiwKKwkJCQkJCSBpOTE1X2NvaGVyZW50X21hcF90eXBlKGVuZ2luZS0+aTkxNSkpOwogCWlm
IChJU19FUlIodmFkZHIpKSB7CiAJCWVyciA9IFBUUl9FUlIodmFkZHIpOwogCQlpbnRlbF9jb250
ZXh0X3VucGluKGNlKTsKLS0gCjIuMzEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ2Z4Cg==
