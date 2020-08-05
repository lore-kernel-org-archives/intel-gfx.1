Return-Path: <SRS0=TleC=BP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DCAC433E3
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 12:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0556022D03
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 12:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0556022D03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1336E58E;
	Wed,  5 Aug 2020 12:22:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0789CBA
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2020 12:22:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22039468-1500050 
 for multiple; Wed, 05 Aug 2020 13:22:32 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  5 Aug 2020 13:22:03 +0100
Message-Id: <20200805122231.23313-10-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200805122231.23313-1-chris@chris-wilson.co.uk>
References: <20200805122231.23313-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 09/37] drm/i915/gem: Rename execbuf.bind_link to
 unbound_link
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

UmVuYW1lIHRoZSBjdXJyZW50IGxpc3Qgb2YgdW5ib3VuZCBvYmplY3RzIHNvIHRoYXQgd2UgY2Fu
IHRyYWNrIG9mIGFsbApvYmplY3RzIHRoYXQgd2UgbmVlZCB0byBiaW5kLCBhcyB3ZWxsIGFzIHRo
ZSBsaXN0IG9mIGN1cnJlbnRseSB1bmJvdW5kClt1bnByb2Nlc3NlZF0gb2JqZWN0cy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpSZXZpZXdl
ZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jIHwgMTQgKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZm
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKaW5k
ZXggMmRjMzBkYmJkYmYzLi5hNWI2M2FlMTcyNDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwpAQCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3QgZWJf
dm1hIHsKIAogCS8qKiBUaGlzIHZtYSdzIHBsYWNlIGluIHRoZSBleGVjYnVmIHJlc2VydmF0aW9u
IGxpc3QgKi8KIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiAqZXhlYzsKLQlzdHJ1
Y3QgbGlzdF9oZWFkIGJpbmRfbGluazsKKwlzdHJ1Y3QgbGlzdF9oZWFkIHVuYm91bmRfbGluazsK
IAlzdHJ1Y3QgbGlzdF9oZWFkIHJlbG9jX2xpbms7CiAKIAlzdHJ1Y3QgaGxpc3Rfbm9kZSBub2Rl
OwpAQCAtNjA1LDcgKzYwNSw3IEBAIGViX2FkZF92bWEoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAq
ZWIsCiAJCX0KIAl9IGVsc2UgewogCQllYl91bnJlc2VydmVfdm1hKGV2KTsKLQkJbGlzdF9hZGRf
dGFpbCgmZXYtPmJpbmRfbGluaywgJmViLT51bmJvdW5kKTsKKwkJbGlzdF9hZGRfdGFpbCgmZXYt
PnVuYm91bmRfbGluaywgJmViLT51bmJvdW5kKTsKIAl9CiB9CiAKQEAgLTcyNSw3ICs3MjUsNyBA
QCBzdGF0aWMgaW50IGViX3Jlc2VydmUoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIpCiAJCWlm
IChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmViLT5pOTE1LT5kcm0uc3RydWN0X211dGV4KSkK
IAkJCXJldHVybiAtRUlOVFI7CiAKLQkJbGlzdF9mb3JfZWFjaF9lbnRyeShldiwgJmViLT51bmJv
dW5kLCBiaW5kX2xpbmspIHsKKwkJbGlzdF9mb3JfZWFjaF9lbnRyeShldiwgJmViLT51bmJvdW5k
LCB1bmJvdW5kX2xpbmspIHsKIAkJCWVyciA9IGViX3Jlc2VydmVfdm1hKGViLCBldiwgcGluX2Zs
YWdzKTsKIAkJCWlmIChlcnIpCiAJCQkJYnJlYWs7CkBAIC03NTEsMTUgKzc1MSwxNSBAQCBzdGF0
aWMgaW50IGViX3Jlc2VydmUoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIpCiAKIAkJCWlmIChm
bGFncyAmIEVYRUNfT0JKRUNUX1BJTk5FRCkKIAkJCQkvKiBQaW5uZWQgbXVzdCBoYXZlIHRoZWly
IHNsb3QgKi8KLQkJCQlsaXN0X2FkZCgmZXYtPmJpbmRfbGluaywgJmViLT51bmJvdW5kKTsKKwkJ
CQlsaXN0X2FkZCgmZXYtPnVuYm91bmRfbGluaywgJmViLT51bmJvdW5kKTsKIAkJCWVsc2UgaWYg
KGZsYWdzICYgX19FWEVDX09CSkVDVF9ORUVEU19NQVApCiAJCQkJLyogTWFwIHJlcXVpcmUgdGhl
IGxvd2VzdCAyNTZNaUIgKGFwZXJ0dXJlKSAqLwotCQkJCWxpc3RfYWRkX3RhaWwoJmV2LT5iaW5k
X2xpbmssICZlYi0+dW5ib3VuZCk7CisJCQkJbGlzdF9hZGRfdGFpbCgmZXYtPnVuYm91bmRfbGlu
aywgJmViLT51bmJvdW5kKTsKIAkJCWVsc2UgaWYgKCEoZmxhZ3MgJiBFWEVDX09CSkVDVF9TVVBQ
T1JUU180OEJfQUREUkVTUykpCiAJCQkJLyogUHJpb3JpdGlzZSA0R2lCIHJlZ2lvbiBmb3IgcmVz
dHJpY3RlZCBibyAqLwotCQkJCWxpc3RfYWRkKCZldi0+YmluZF9saW5rLCAmbGFzdCk7CisJCQkJ
bGlzdF9hZGQoJmV2LT51bmJvdW5kX2xpbmssICZsYXN0KTsKIAkJCWVsc2UKLQkJCQlsaXN0X2Fk
ZF90YWlsKCZldi0+YmluZF9saW5rLCAmbGFzdCk7CisJCQkJbGlzdF9hZGRfdGFpbCgmZXYtPnVu
Ym91bmRfbGluaywgJmxhc3QpOwogCQl9CiAJCWxpc3Rfc3BsaWNlX3RhaWwoJmxhc3QsICZlYi0+
dW5ib3VuZCk7CiAJCW11dGV4X3VubG9jaygmZWItPmk5MTUtPmRybS5zdHJ1Y3RfbXV0ZXgpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
