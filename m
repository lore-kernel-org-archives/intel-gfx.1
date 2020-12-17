Return-Path: <SRS0=1oYm=FV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D346C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Dec 2020 01:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91488206F4
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Dec 2020 01:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91488206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FDC8972D;
	Thu, 17 Dec 2020 01:49:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8CF489709;
 Thu, 17 Dec 2020 01:49:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A66FBA0BCB;
 Thu, 17 Dec 2020 01:49:41 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Huang, Sean Z" <sean.z.huang@intel.com>
Date: Thu, 17 Dec 2020 01:49:41 -0000
Message-ID: <160816978167.2012.16815100672189168600@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201217013940.21263-1-sean.z.huang@intel.com>
In-Reply-To: <20201217013940.21263-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJ?=
 =?utf-8?q?ntroduce_Intel_PXP_component_-_Mesa_single_session_=28rev10=29?=
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

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogSW50cm9kdWNlIEludGVsIFBYUCBjb21wb25l
bnQgLSBNZXNhIHNpbmdsZSBzZXNzaW9uIChyZXYxMCkKVVJMICAgOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzg0NjIwLwpTdGF0ZSA6IGZhaWx1cmUKCj09IFN1bW1h
cnkgPT0KCkNBTEwgICAgc2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoCiAgQ0FMTCAgICBzY3JpcHRz
L2F0b21pYy9jaGVjay1hdG9taWNzLnNoCiAgREVTQ0VORCAgb2JqdG9vbAogIENISyAgICAgaW5j
bHVkZS9nZW5lcmF0ZWQvY29tcGlsZS5oCiAgSERSVEVTVCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9w
eHAvaW50ZWxfcHhwX3R5cGVzLmgKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxjb21tYW5kLWxpbmU+
OgouL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdHlwZXMuaDozNToxNTogZXJy
b3I6IGZpZWxkIOKAmG11dGV44oCZIGhhcyBpbmNvbXBsZXRlIHR5cGUKICBzdHJ1Y3QgbXV0ZXgg
bXV0ZXg7CiAgICAgICAgICAgICAgIF5+fn5+CmRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxl
OjMxNDogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9w
eHBfdHlwZXMuaGRydGVzdCcgZmFpbGVkCm1ha2VbNF06ICoqKiBbZHJpdmVycy9ncHUvZHJtL2k5
MTUvcHhwL2ludGVsX3B4cF90eXBlcy5oZHJ0ZXN0XSBFcnJvciAxCnNjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6NDk2OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2k5MTUnIGZhaWxl
ZAptYWtlWzNdOiAqKiogW2RyaXZlcnMvZ3B1L2RybS9pOTE1XSBFcnJvciAyCnNjcmlwdHMvTWFr
ZWZpbGUuYnVpbGQ6NDk2OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtJyBmYWls
ZWQKbWFrZVsyXTogKioqIFtkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDIKc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDo0OTY6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dwdScgZmFpbGVkCm1ha2Vb
MV06ICoqKiBbZHJpdmVycy9ncHVdIEVycm9yIDIKTWFrZWZpbGU6MTgwNTogcmVjaXBlIGZvciB0
YXJnZXQgJ2RyaXZlcnMnIGZhaWxlZAptYWtlOiAqKiogW2RyaXZlcnNdIEVycm9yIDIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFp
bGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
