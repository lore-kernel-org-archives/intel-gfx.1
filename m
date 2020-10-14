Return-Path: <SRS0=eTAM=DV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD05C433E7
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 10:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60968208B3
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 10:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60968208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974A16E429;
	Wed, 14 Oct 2020 10:32:09 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07BA6E429
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 10:32:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22711367-1500050 
 for multiple; Wed, 14 Oct 2020 11:31:53 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Oct 2020 11:31:52 +0100
Message-Id: <20201014103152.21935-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Fixup tgl mocs for PTE tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Rm9yY2luZyBtb2NzOjEgW3VzZWQgZm9yIG91ciB3aW5zeXMgZm9sbG93cy1wdGUgbW9kZV0gdG8g
YmUgY2FjaGVkCmNhdXNlZCBkaXNwbGF5IGdsaXRjaGVzLiBUaG91Z2ggaXQgaXMgZG9jdW1lbnRl
ZCBhcyBkZXByZWNhdGVkIChhbmQgc28KbGlrZWx5IGJlaGF2ZXMgYXMgdW5jYWNoZWQpIHVzZSB0
aGUgZm9sbG93LXB0ZSBiaXQgYW5kIGZvcmNlIGl0IG91dCBvZgpMMyBjYWNoZS4KCkZpeGVzOiA0
ZDhhNWNmZTNiMTMgKCJkcm0vaTkxNS9ndDogSW5pdGlhbGl6ZSByZXNlcnZlZCBhbmQgdW5zcGVj
aWZpZWQgTU9DUyBpbmRpY2VzIikKVGVzdGNhc2U6IGlndC9rbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmcKVGVzdGNhc2U6IGlndC9rbXNfYmlnX2ZiClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogQXlheiBBIFNpZGRpcXVpIDxheWF6LnNpZGRp
cXVpQGludGVsLmNvbT4KQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwu
Y29tPgpDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBKb29uYXMgTGFo
dGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfbW9jcy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9tb2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9tb2Nz
LmMKaW5kZXggMzkxNzlhM2VlZTk4Li4wOTNiMzJkYjM0MjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX21vY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9pbnRlbF9tb2NzLmMKQEAgLTI0Myw4ICsyNDMsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9pOTE1X21vY3NfZW50cnkgdGdsX21vY3NfdGFibGVbXSA9IHsKIAkgKiBvbmx5LCBfX2luaXRf
bW9jc190YWJsZSgpIHRha2UgY2FyZSB0byBwcm9ncmFtIHVudXNlZCBpbmRleCB3aXRoCiAJICog
dGhpcyBlbnRyeS4KIAkgKi8KLQlNT0NTX0VOVFJZKDEsIExFXzNfV0IgfCBMRV9UQ18xX0xMQyB8
IExFX0xSVU0oMyksCi0JCSAgIEwzXzNfV0IpLAorCU1PQ1NfRU5UUlkoSTkxNV9NT0NTX1BURSwK
KwkJICAgTEVfMF9QQUdFVEFCTEUgfCBMRV9UQ18wX1BBR0VUQUJMRSwKKwkJICAgTDNfMV9VQyks
CiAJR0VOMTFfTU9DU19FTlRSSUVTLAogCiAJLyogSW1wbGljaXRseSBlbmFibGUgTDEgLSBIREM6
TDEgKyBMMyArIExMQyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1nZngK
