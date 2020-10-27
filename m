Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F541C388F9
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 14:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2D7206DC
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 14:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F2D7206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79796EB74;
	Tue, 27 Oct 2020 14:28:16 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3F16EB74
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 14:28:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22818232-1500050 
 for multiple; Tue, 27 Oct 2020 14:28:06 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Oct 2020 14:28:03 +0000
Message-Id: <20201027142803.3940-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Start timeline with a wrap
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T25jZSB1cG9uIGEgdGltZSB3ZSB1c2VkIHRvIGRvIHRoaXMgYnkgZGVmYXVsdCwgYmFjayB3aGVu
IGl0IHdhcyBhCmdsb2JhbCBzZXFubyB3aXRoIGEgZ2xvYmFsIGJhcnJpZXIgb24gd3JhcC4gU2lu
Y2UgdGhlIHN3aXRjaCBvZgpwZXItY2xpZW50IHRpbWVsaW5lcywgaGFuZGxpbmcgdGhlIHdyYXAg
aXMgY2hlYXBlciBhbmQgeWV0IG1vcmUKY29tcGxpY2F0ZWQsIGFuZCBzbyB3b3J0aCBlbmNvdXJh
Z2luZyBlYXJseSB3cmFwcyBvbmNlIG1vcmUuCgpTdWdnZXN0ZWQtYnk6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfdGltZWxpbmUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfdGltZWxpbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3RpbWVsaW5lLmMKaW5kZXggN2VhOTRkMjAxZmU2
Li5mMGJiMWMwM2I0ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X3RpbWVsaW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfdGltZWxpbmUu
YwpAQCAtMjYzLDYgKzI2Myw5IEBAIHN0YXRpYyBpbnQgaW50ZWxfdGltZWxpbmVfaW5pdChzdHJ1
Y3QgaW50ZWxfdGltZWxpbmUgKnRpbWVsaW5lLAogCXRpbWVsaW5lLT5od3NwX2dndHQgPSBpOTE1
X3ZtYV9nZXQoaHdzcCk7CiAJR0VNX0JVR19PTih0aW1lbGluZS0+aHdzcF9vZmZzZXQgPj0gaHdz
cC0+c2l6ZSk7CiAKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfRFJNX0k5MTVfREVCVUdfR0VNKSkK
KwkJdGltZWxpbmUtPnNlcW5vID0gLTEwdTsgLyogd3JhcCBhZnRlciBhIGZldyByZXF1ZXN0cyAq
LworCiAJdGltZWxpbmUtPmZlbmNlX2NvbnRleHQgPSBkbWFfZmVuY2VfY29udGV4dF9hbGxvYygx
KTsKIAogCW11dGV4X2luaXQoJnRpbWVsaW5lLT5tdXRleCk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5n
IGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
