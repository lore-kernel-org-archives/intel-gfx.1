Return-Path: <SRS0=rnDU=G2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FE8C433DB
	for <intel-gfx@archiver.kernel.org>; Sat, 23 Jan 2021 17:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA0622D75
	for <intel-gfx@archiver.kernel.org>; Sat, 23 Jan 2021 17:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA0622D75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470226E200;
	Sat, 23 Jan 2021 17:15:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5479989D8D;
 Sat, 23 Jan 2021 17:15:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C32DA73C9;
 Sat, 23 Jan 2021 17:15:50 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Sat, 23 Jan 2021 17:15:50 -0000
Message-ID: <161142215028.14870.4896705811611092994@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210123153733.18139-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210123153733.18139-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BCI=2C1/8=5D_drm/i915/gt=3A_Show_the?=
 =?utf-8?q?_per-engine_runtime_in_sysfs?=
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

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogc2VyaWVzIHN0YXJ0aW5nIHdpdGggW0NJLDEv
OF0gZHJtL2k5MTUvZ3Q6IFNob3cgdGhlIHBlci1lbmdpbmUgcnVudGltZSBpbiBzeXNmcwpVUkwg
ICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODYyMDcvClN0YXRl
IDogd2FybmluZwoKPT0gU3VtbWFyeSA9PQoKJCBkaW0gY2hlY2twYXRjaCBvcmlnaW4vZHJtLXRp
cAo5NzM4MmY2ZjYzZmYgZHJtL2k5MTUvZ3Q6IFNob3cgdGhlIHBlci1lbmdpbmUgcnVudGltZSBp
biBzeXNmcwpmMGQxNWNmY2RkNmUgZHJtL2k5MTU6IEV4cG9zZSBsaXN0IG9mIGNsaWVudHMgaW4g
c3lzZnMKLTo4NzogV0FSTklORzpGSUxFX1BBVEhfQ0hBTkdFUzogYWRkZWQsIG1vdmVkIG9yIGRl
bGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojODc6IApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAwIGNoZWNrcywg
NDAyIGxpbmVzIGNoZWNrZWQKNTU5ZTJiZDMyNzMzIGRybS9pOTE1OiBVcGRhdGUgY2xpZW50IG5h
bWUgb24gY29udGV4dCBjcmVhdGUKY2ZjYmIwODlkNDdmIGRybS9pOTE1OiBNYWtlIEdFTSBjb250
ZXh0cyB0cmFjayBEUk0gY2xpZW50cwo2NmM1MzdiZjZkNzcgZHJtL2k5MTU6IFRyYWNrIHJ1bnRp
bWUgc3BlbnQgaW4gY2xvc2VkIGFuZCB1bnJlYWNoYWJsZSBHRU0gY29udGV4dHMKODdhYjg4ZjRl
ODU1IGRybS9pOTE1OiBUcmFjayBhbGwgdXNlciBjb250ZXh0cyBwZXIgY2xpZW50Cjk4MjlmMjQw
NjNkZiBkcm0vaTkxNTogVHJhY2sgY29udGV4dCBjdXJyZW50IGFjdGl2ZSB0aW1lCi06MTM0OiBX
QVJOSU5HOkxJTkVfU1BBQ0lORzogTWlzc2luZyBhIGJsYW5rIGxpbmUgYWZ0ZXIgZGVjbGFyYXRp
b25zCiMxMzQ6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2NvbnRleHRfdHlw
ZXMuaDoxMjE6CisJCQl1MzIgbGFzdDsKKwkJCUk5MTVfU0VMRlRFU1RfREVDTEFSRSh1MzIgbnVt
X3VuZGVyZmxvdyk7Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDAgY2hlY2tzLCAyNzMg
bGluZXMgY2hlY2tlZAplZTMxNGI4NWJhZmIgZHJtL2k5MTU6IEV4cG9zZSBwZXItZW5naW5lIGNs
aWVudCBidXN5bmVzcwotOjI1OiBXQVJOSU5HOkNPTU1JVF9MT0dfTE9OR19MSU5FOiBQb3NzaWJs
ZSB1bndyYXBwZWQgY29tbWl0IGRlc2NyaXB0aW9uIChwcmVmZXIgYSBtYXhpbXVtIDc1IGNoYXJz
IHBlciBsaW5lKQojMjU6IAogICAgIFJlbmRlci8zRC8wICAgNjMuNzMlIHzilojilojilojiloji
lojilojilojilojilojilojilojilojilojilojilojilojilojilojiloggICAgICAgICAgIHwg
ICAgICAzJSAgICAgIDAlCgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDAgY2hlY2tzLCAx
NTIgbGluZXMgY2hlY2tlZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
