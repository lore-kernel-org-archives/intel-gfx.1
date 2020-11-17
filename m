Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA316C63697
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 18:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4918424181
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 18:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4918424181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489F89F1B;
	Tue, 17 Nov 2020 18:51:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97B86E043
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 18:50:54 +0000 (UTC)
IronPort-SDR: 0C4tps85xUXH1t4fVb76mBKA9MGjZkkMECWQ3v4O0G4ltvIMSy/wbfq4Gsly2Jindr9jV1Yw7U
 EktQwTCBF7CA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168412305"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="168412305"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:50:54 -0800
IronPort-SDR: HYZeeqlRkB3P8zNgRlS/BFtCSO4dWzV2MF8GcO1zacNvQIY0J05IvzDoOYnzzdy3lEoc5ouZns
 MNXF49KVDUXg==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="340996919"
Received: from ankithac-mobl1.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.254.101.215])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:50:54 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2020 10:50:29 -0800
Message-Id: <20201117185029.22078-22-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117185029.22078-1-aditya.swarup@intel.com>
References: <20201117185029.22078-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 21/21] drm/i915/adl_s: Update memory bandwidth
 parameters
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGVqYXMgVXBhZGh5YXkgPHRlamFza3VtYXJ4LnN1cmVuZHJha3VtYXIudXBhZGh5YXlA
aW50ZWwuY29tPgoKSnVzdCBsaWtlIFJLTCwgdGhlIEFETF9TIHBsYXRmb3JtIGFsc28gaGFzIGRp
ZmZlcmVudCBtZW1vcnkKY2hhcmFjdGVyaXN0aWNzIGZyb20gcGFzdCBwbGF0Zm9ybXMuICBVcGRh
dGUgdGhlIHZhbHVlcyB1c2VkCmJ5IG91ciBtZW1vcnkgYmFuZHdpZHRoIGNhbGN1bGF0aW9ucyBh
Y2NvcmRpbmdseS4KCkJzcGVjOiA2NDYzMQpDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVy
QGludGVsLmNvbT4KQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
PgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUu
ZGVha0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphc2t1bWFy
eC5zdXJlbmRyYWt1bWFyLnVwYWRoeWF5QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRpdHlh
IFN3YXJ1cCA8YWRpdHlhLnN3YXJ1cEBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9idy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYncuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYwppbmRleCBi
ZDA2MDQwNGQyNDkuLjMyNTIyZWMxZmZiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9idy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYncuYwpAQCAtMjA1LDYgKzIwNSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVs
X3NhX2luZm8gcmtsX3NhX2luZm8gPSB7CiAJLmRpc3BsYXlydGlkcyA9IDEyOCwKIH07CiAKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfc2FfaW5mbyBhZGxzX3NhX2luZm8gPSB7CisJLmRlYnVy
c3QgPSAxNiwKKwkuZGVwcm9nYndsaW1pdCA9IDM4LCAvKiBHQi9zICovCisJLmRpc3BsYXlydGlk
cyA9IDI1NiwKK307CisKIHN0YXRpYyBpbnQgaWNsX2dldF9id19pbmZvKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdiwgY29uc3Qgc3RydWN0IGludGVsX3NhX2luZm8gKnNhKQogewog
CXN0cnVjdCBpbnRlbF9xZ3ZfaW5mbyBxaSA9IHt9OwpAQCAtMzE3LDYgKzMyMyw4IEBAIHZvaWQg
aW50ZWxfYndfaW5pdF9odyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCiAKIAlp
ZiAoSVNfUk9DS0VUTEFLRShkZXZfcHJpdikpCiAJCWljbF9nZXRfYndfaW5mbyhkZXZfcHJpdiwg
JnJrbF9zYV9pbmZvKTsKKwllbHNlIGlmIChJU19BTERFUkxBS0VfUyhkZXZfcHJpdikpCisJCWlj
bF9nZXRfYndfaW5mbyhkZXZfcHJpdiwgJmFkbHNfc2FfaW5mbyk7CiAJZWxzZSBpZiAoSVNfR0VO
KGRldl9wcml2LCAxMikpCiAJCWljbF9nZXRfYndfaW5mbyhkZXZfcHJpdiwgJnRnbF9zYV9pbmZv
KTsKIAllbHNlIGlmIChJU19HRU4oZGV2X3ByaXYsIDExKSkKLS0gCjIuMjcuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcg
bGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
