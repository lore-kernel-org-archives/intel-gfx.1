Return-Path: <SRS0=b/6W=GX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AF8C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 21:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D8052242A
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 21:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D8052242A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6AC89D60;
	Wed, 20 Jan 2021 21:31:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B76DB89C59;
 Wed, 20 Jan 2021 21:31:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AFCC4A0099;
 Wed, 20 Jan 2021 21:31:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Wed, 20 Jan 2021 21:31:56 -0000
Message-ID: <161117831669.8790.7107901745405620347@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210120154019.5146-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210120154019.5146-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm/i915/gem=3A_Allow_importing_of_shmemfs_objects_into_any_devi?=
 =?utf-8?q?ce?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogZHJtL2k5MTUvZ2VtOiBBbGxvdyBpbXBvcnRp
bmcgb2Ygc2htZW1mcyBvYmplY3RzIGludG8gYW55IGRldmljZQpVUkwgICA6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODYwOTMvClN0YXRlIDogZmFpbHVyZQoKPT0g
U3VtbWFyeSA9PQoKQ0FMTCAgICBzY3JpcHRzL2NoZWNrc3lzY2FsbHMuc2gKICBDQUxMICAgIHNj
cmlwdHMvYXRvbWljL2NoZWNrLWF0b21pY3Muc2gKICBERVNDRU5EICBvYmp0b29sCiAgQ0hLICAg
ICBpbmNsdWRlL2dlbmVyYXRlZC9jb21waWxlLmgKICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9kbWFidWYubwpkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fZG1hYnVmLmM6IEluIGZ1bmN0aW9uIOKAmGk5MTVfZ2VtX3ByaW1lX2ltcG9ydOKAmToKZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jOjI1MDo3OiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYaTkxNV9nZW1fb2JqZWN0X2lzX3NobWVt
4oCZOyBkaWQgeW91IG1lYW4g4oCYaTkxNV9nZW1fb2JqZWN0X2lzX3RpbGVk4oCZPyBbLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgaWYgKGk5MTVfZ2VtX29iamVjdF9p
c19zaG1lbShvYmopKQogICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgICBpOTE1
X2dlbV9vYmplY3RfaXNfdGlsZWQKY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBl
cnJvcnMKc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNzk6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLm8nIGZhaWxlZAptYWtlWzRdOiAq
KiogW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYub10gRXJyb3IgMQpz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ5NjogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1
L2RybS9pOTE1JyBmYWlsZWQKbWFrZVszXTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNV0gRXJy
b3IgMgpzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ5NjogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZl
cnMvZ3B1L2RybScgZmFpbGVkCm1ha2VbMl06ICoqKiBbZHJpdmVycy9ncHUvZHJtXSBFcnJvciAy
CnNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk2OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9n
cHUnIGZhaWxlZAptYWtlWzFdOiAqKiogW2RyaXZlcnMvZ3B1XSBFcnJvciAyCk1ha2VmaWxlOjE4
MDU6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzJyBmYWlsZWQKbWFrZTogKioqIFtkcml2ZXJz
XSBFcnJvciAyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
Cg==
