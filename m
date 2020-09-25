Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E6DC4363D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 08:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49BCC2086A
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 08:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49BCC2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2B56E0D7;
	Fri, 25 Sep 2020 08:42:03 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAFB6E0D7;
 Fri, 25 Sep 2020 08:42:01 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22532098-1500050 
 for multiple; Fri, 25 Sep 2020 09:41:49 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Sep 2020 09:41:48 +0100
Message-Id: <20200925084148.351563-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] lib: Only avoid relocations with
 full-ppgtt
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

V2UgY2FuIG9ubHkgYXNzaWduZWQgcmFuZG9tIGFkZHJlc3NlcyB3aXRoIGltcHVuaXR5IGlmIHdl
IGtub3cgd2UgaGF2ZQpjb21wbGV0ZSBjb250cm9sIG92ZXIgdGhlIHBwR1RULiBJZiB0aGUgcHBH
VFQgaXMgc2hhcmVkLCBlaXRoZXIgYWxpYXNlZAp3aXRoIHRoZSBnbG9iYWwgR1RUIG9yIHNpbXBs
eSB0aGUgZ2xvYmFsIEdUVCBvbiBhbmNpZW50IEhXLCB0aGVuIHdlIGhhdmUKdG8gYmUgY2FyZWZ1
bCBpbiBjYXNlIHRoZXkgYXJlIG9iamVjdHMgYWxyZWFkeSBmaXhlZCBpbiBwbGFjZSBpbnNpZGUg
dGhlCkdUVCwgZS5nLiBhY3RpdmUgZnJhbWVidWZmZXJzLiBBcyB0aGUgcmVsb2NhdGlvbiBjb2Rl
IGlzIHN0aWxsCmF2YWlsYWJsZSwgb25seSBlbmZvcmNlIG5vLXJlbG9jYXRpb25zIGJ5IGRlZmF1
bHQgd2hlbiB0aGUgY29udGV4dCBoYXMKaXRzIG93biBwcEdUVC4KCkNsb3NlczogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8yNDkxClNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Ci0tLQogbGliL2lu
dGVsX2JhdGNoYnVmZmVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYyBiL2xp
Yi9pbnRlbF9iYXRjaGJ1ZmZlci5jCmluZGV4IGJlNzY0NjQ2ZS4uNDJkN2NkMjUxIDEwMDY0NAot
LS0gYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYworKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIu
YwpAQCAtMTMwNiw3ICsxMzA2LDcgQEAgX19pbnRlbF9iYl9jcmVhdGUoaW50IGk5MTUsIHVpbnQz
Ml90IHNpemUsIGJvb2wgZG9fcmVsb2NzKQogICovCiBzdHJ1Y3QgaW50ZWxfYmIgKmludGVsX2Ji
X2NyZWF0ZShpbnQgaTkxNSwgdWludDMyX3Qgc2l6ZSkKIHsKLQlyZXR1cm4gX19pbnRlbF9iYl9j
cmVhdGUoaTkxNSwgc2l6ZSwgZmFsc2UpOworCXJldHVybiBfX2ludGVsX2JiX2NyZWF0ZShpOTE1
LCBzaXplLCAhZ2VtX3VzZXNfZnVsbF9wcGd0dChpOTE1KSk7CiB9CiAKIC8qKgotLSAKMi4yOC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
