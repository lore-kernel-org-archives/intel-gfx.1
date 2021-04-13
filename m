Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EF8C433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 17:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8257160FEA
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 17:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8257160FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FC76E841;
	Tue, 13 Apr 2021 17:42:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA7606E841;
 Tue, 13 Apr 2021 17:42:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C5978A7E03;
 Tue, 13 Apr 2021 17:42:53 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Ekstrand" <jason@jlekstrand.net>
Date: Tue, 13 Apr 2021 17:42:53 -0000
Message-ID: <161833577380.8797.13660823296646505253@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210413173259.472405-1-jason@jlekstrand.net>
In-Reply-To: <20210413173259.472405-1-jason@jlekstrand.net>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/pm=3A_Make_the_wm_parameter_of_print=5Fwm=5Flatenc?=
 =?utf-8?q?y_a_pointer?=
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

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogZHJtL2k5MTUvcG06IE1ha2UgdGhlIHdtIHBh
cmFtZXRlciBvZiBwcmludF93bV9sYXRlbmN5IGEgcG9pbnRlcgpVUkwgICA6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODkwMjIvClN0YXRlIDogd2FybmluZwoKPT0g
U3VtbWFyeSA9PQoKJCBkaW0gY2hlY2twYXRjaCBvcmlnaW4vZHJtLXRpcAowM2UyZjVhNmRjNzAg
ZHJtL2k5MTUvcG06IE1ha2UgdGhlIHdtIHBhcmFtZXRlciBvZiBwcmludF93bV9sYXRlbmN5IGEg
cG9pbnRlcgotOjEzOiBXQVJOSU5HOkNPTU1JVF9MT0dfTE9OR19MSU5FOiBQb3NzaWJsZSB1bndy
YXBwZWQgY29tbWl0IGRlc2NyaXB0aW9uIChwcmVmZXIgYSBtYXhpbXVtIDc1IGNoYXJzIHBlciBs
aW5lKQojMTM6IAogICAgICAgIGlubGluZWQgZnJvbSDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKA
mSBhdCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMxMDk6MywKCnRvdGFsOiAwIGVy
cm9ycywgMSB3YXJuaW5ncywgMCBjaGVja3MsIDggbGluZXMgY2hlY2tlZAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxp
c3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
