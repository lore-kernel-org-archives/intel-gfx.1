Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1F7C2BC11
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 17:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6105620759
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 17:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6105620759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D626B89FBC;
	Mon, 14 Sep 2020 17:47:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA989FBC;
 Mon, 14 Sep 2020 17:47:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5670EA66C9;
 Mon, 14 Sep 2020 17:47:09 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Mon, 14 Sep 2020 17:47:09 -0000
Message-ID: <160010562935.5911.3722509899029602181@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200914131256.89465-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200914131256.89465-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Per_client_engine_busyness?=
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

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogUGVyIGNsaWVudCBlbmdpbmUgYnVzeW5lc3MK
VVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzgxNjUyLwpT
dGF0ZSA6IHdhcm5pbmcKCj09IFN1bW1hcnkgPT0KCiQgZGltIGNoZWNrcGF0Y2ggb3JpZ2luL2Ry
bS10aXAKYWMzYzA3YWI0MmY0IGRybS9pOTE1OiBFeHBvc2UgbGlzdCBvZiBjbGllbnRzIGluIHN5
c2ZzCi06ODQ6IFdBUk5JTkc6RklMRV9QQVRIX0NIQU5HRVM6IGFkZGVkLCBtb3ZlZCBvciBkZWxl
dGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzg0OiAKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKCi06Mjc0OiBXQVJOSU5HOlNQRFhfTElDRU5TRV9UQUc6IEltcHJvcGVy
IFNQRFggY29tbWVudCBzdHlsZSBmb3IgJ2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJtX2Ns
aWVudC5oJywgcGxlYXNlIHVzZSAnLyonIGluc3RlYWQKIzI3NDogRklMRTogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcm1fY2xpZW50Lmg6MToKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBNSVQKCi06Mjc0OiBXQVJOSU5HOlNQRFhfTElDRU5TRV9UQUc6IE1pc3Npbmcgb3IgbWFsZm9y
bWVkIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyIHRhZyBpbiBsaW5lIDEKIzI3NDogRklMRTogZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcm1fY2xpZW50Lmg6MToKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBNSVQKCnRvdGFsOiAwIGVycm9ycywgMyB3YXJuaW5ncywgMCBjaGVja3MsIDM2
OCBsaW5lcyBjaGVja2VkCjVlMjU3YmI1MjZhNCBkcm0vaTkxNTogVXBkYXRlIGNsaWVudCBuYW1l
IG9uIGNvbnRleHQgY3JlYXRlCi06MTk3OiBXQVJOSU5HOk9PTV9NRVNTQUdFOiBQb3NzaWJsZSB1
bm5lY2Vzc2FyeSAnb3V0IG9mIG1lbW9yeScgbWVzc2FnZQojMTk3OiBGSUxFOiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2RybV9jbGllbnQuYzoyMzc6CisJaWYgKCFuYW1lKSB7CisJCWRybV9u
b3RpY2UoJmk5MTUtPmRybSwKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMCBjaGVja3Ms
IDIwMSBsaW5lcyBjaGVja2VkCjAyYTNjZmQ4ZTFkZCBkcm0vaTkxNTogTWFrZSBHRU0gY29udGV4
dHMgdHJhY2sgRFJNIGNsaWVudHMKMjU2NjhkNWQzMTBiIGRybS9pOTE1OiBUcmFjayBydW50aW1l
IHNwZW50IGluIHVucmVhY2hhYmxlIGludGVsX2NvbnRleHRzCjU1NjA0M2YyY2M4NCBkcm0vaTkx
NTogVHJhY2sgcnVudGltZSBzcGVudCBpbiBjbG9zZWQgR0VNIGNvbnRleHRzCjcxZTdiMjViYzQ5
NyBkcm0vaTkxNTogVHJhY2sgYWxsIHVzZXIgY29udGV4dHMgcGVyIGNsaWVudAo5Y2Q2Y2RjNmNm
ODggZHJtL2k5MTU6IEV4cG9zZSBwZXItZW5naW5lIGNsaWVudCBidXN5bmVzcwotOjI1OiBXQVJO
SU5HOkNPTU1JVF9MT0dfTE9OR19MSU5FOiBQb3NzaWJsZSB1bndyYXBwZWQgY29tbWl0IGRlc2Ny
aXB0aW9uIChwcmVmZXIgYSBtYXhpbXVtIDc1IGNoYXJzIHBlciBsaW5lKQojMjU6IAogICAgIFJl
bmRlci8zRC8wICAgNjMuNzMlIHzilojilojilojilojilojilojilojilojilojilojilojiloji
lojilojilojilojilojilojiloggICAgICAgICAgIHwgICAgICAzJSAgICAgIDAlCgp0b3RhbDog
MCBlcnJvcnMsIDEgd2FybmluZ3MsIDAgY2hlY2tzLCAxNjQgbGluZXMgY2hlY2tlZApiNThiYjEz
NjJjNDkgZHJtL2k5MTU6IFRyYWNrIGNvbnRleHQgY3VycmVudCBhY3RpdmUgdGltZQotOjcxOiBD
SEVDSzpMSU5FX1NQQUNJTkc6IFBsZWFzZSBkb24ndCB1c2UgbXVsdGlwbGUgYmxhbmsgbGluZXMK
IzcxOiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9jb250ZXh0LmM6NTA0Ogor
CisKCi06MTM0OiBXQVJOSU5HOkxJTkVfU1BBQ0lORzogTWlzc2luZyBhIGJsYW5rIGxpbmUgYWZ0
ZXIgZGVjbGFyYXRpb25zCiMxMzQ6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X2NvbnRleHRfdHlwZXMuaDo5NjoKKwkJCXUzMiBsYXN0OworCQkJSTkxNV9TRUxGVEVTVF9ERUNM
QVJFKHUzMiBudW1fdW5kZXJmbG93KTsKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMSBj
aGVja3MsIDI0OCBsaW5lcyBjaGVja2VkCjI5MDVkMWVmZTNjZCBkcm0vaTkxNTogUHJlZmVyIHNv
ZnR3YXJlIHRyYWNrZWQgY29udGV4dCBidXN5bmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
