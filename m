Return-Path: <SRS0=PnqF=LJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AA0C48BDF
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 11:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F12F6145C
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 11:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F12F6145C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D13989C19;
	Tue, 15 Jun 2021 11:45:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C18389C17;
 Tue, 15 Jun 2021 11:45:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1252DA0169;
 Tue, 15 Jun 2021 11:45:26 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ramalingam C" <ramalingam.c@intel.com>
Date: Tue, 15 Jun 2021 11:45:26 -0000
Message-ID: <162375752607.8816.14777251350341755207@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBp?=
 =?utf-8?q?915_TTM_sync_accelerated_migration_and_clear_=28rev2=29?=
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

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogaTkxNSBUVE0gc3luYyBhY2NlbGVyYXRlZCBt
aWdyYXRpb24gYW5kIGNsZWFyIChyZXYyKQpVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvOTE0NjMvClN0YXRlIDogZmFpbHVyZQoKPT0gU3VtbWFyeSA9PQoK
Q0FMTCAgICBzY3JpcHRzL2NoZWNrc3lzY2FsbHMuc2gKICBDQUxMICAgIHNjcmlwdHMvYXRvbWlj
L2NoZWNrLWF0b21pY3Muc2gKICBERVNDRU5EIG9ianRvb2wKICBDSEsgICAgIGluY2x1ZGUvZ2Vu
ZXJhdGVkL2NvbXBpbGUuaAogIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX3R0bS5vCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYzogSW4gZnVu
Y3Rpb24g4oCYaTkxNV90dG1fYWNjZWxfbW92ZeKAmToKZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3R0bS5jOjI5NTozMjogZXJyb3I6IOKAmHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dOKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmG1lbeKAmQogICB0dG1fbWFuYWdlcl90eXBlKGJv
LT5iZGV2LCBiby0+bWVtLm1lbV90eXBlKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmM6MzMwOjEwOiBlcnJv
cjog4oCYc3RydWN0IHR0bV9idWZmZXJfb2JqZWN04oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCY
bWVt4oCZCiAgICAgICAgYm8tPm1lbS5tZW1fdHlwZSA+PSBJOTE1X1BMX0xNRU0wLAogICAgICAg
ICAgXn4Kc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNzI6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLm8nIGZhaWxlZAptYWtlWzRdOiAqKiog
W2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0ub10gRXJyb3IgMQpzY3JpcHRz
L01ha2VmaWxlLmJ1aWxkOjUxNTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9p
OTE1JyBmYWlsZWQKbWFrZVszXTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNV0gRXJyb3IgMgpz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUxNTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1
L2RybScgZmFpbGVkCm1ha2VbMl06ICoqKiBbZHJpdmVycy9ncHUvZHJtXSBFcnJvciAyCnNjcmlw
dHMvTWFrZWZpbGUuYnVpbGQ6NTE1OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUnIGZh
aWxlZAptYWtlWzFdOiAqKiogW2RyaXZlcnMvZ3B1XSBFcnJvciAyCk1ha2VmaWxlOjE4NDQ6IHJl
Y2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzJyBmYWlsZWQKbWFrZTogKioqIFtkcml2ZXJzXSBFcnJv
ciAyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50
ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
