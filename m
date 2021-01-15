Return-Path: <SRS0=bvk2=GS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FA0C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 14:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D6523772
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 14:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D6523772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4646E42E;
	Fri, 15 Jan 2021 14:26:36 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1686E428
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Jan 2021 14:26:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23607314-1500050 
 for multiple; Fri, 15 Jan 2021 14:26:25 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Jan 2021 14:26:23 +0000
Message-Id: <20210115142623.29897-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gem: Mark private i915_gem_stolen
 functions as static
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jOjYyNDo1OiBlcnJvcjog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhfX2k5MTVfZ2VtX29iamVjdF9jcmVhdGVfc3Rv
bGVu4oCZIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc10KIGludCBfX2k5MTVfZ2VtX29iamVj
dF9jcmVhdGVfc3RvbGVuKHN0cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9uICptZW0sCiAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fc3RvbGVuLmM6NjQ5OjU6IGVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mF9pOTE1X2dlbV9vYmplY3Rfc3RvbGVuX2luaXTigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5
cGVzXQogaW50IF9pOTE1X2dlbV9vYmplY3Rfc3RvbGVuX2luaXQoc3RydWN0IGludGVsX21lbW9y
eV9yZWdpb24gKm1lbSwKICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hdHRo
ZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMKaW5kZXggMjdkOTViZGRiZjRkLi5iMjIxNDkyNTMxZWYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMKQEAgLTYyMSw5
ICs2MjEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3Rfb3BzIGk5
MTVfZ2VtX29iamVjdF9zdG9sZW5fb3BzID0gewogCS5yZWxlYXNlID0gaTkxNV9nZW1fb2JqZWN0
X3JlbGVhc2Vfc3RvbGVuLAogfTsKIAotaW50IF9faTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9s
ZW4oc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24gKm1lbSwKLQkJCQkgICAgc3RydWN0IGRybV9p
OTE1X2dlbV9vYmplY3QgKm9iaiwKLQkJCQkgICAgc3RydWN0IGRybV9tbV9ub2RlICpzdG9sZW4p
CitzdGF0aWMgaW50IF9faTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4oc3RydWN0IGludGVs
X21lbW9yeV9yZWdpb24gKm1lbSwKKwkJCQkJICAgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3Qg
Km9iaiwKKwkJCQkJICAgc3RydWN0IGRybV9tbV9ub2RlICpzdG9sZW4pCiB7CiAJc3RhdGljIHN0
cnVjdCBsb2NrX2NsYXNzX2tleSBsb2NrX2NsYXNzOwogCXVuc2lnbmVkIGludCBjYWNoZV9sZXZl
bDsKQEAgLTY0NiwxMCArNjQ2LDEwIEBAIGludCBfX2k5MTVfZ2VtX29iamVjdF9jcmVhdGVfc3Rv
bGVuKHN0cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9uICptZW0sCiAJcmV0dXJuIDA7CiB9CiAKLWlu
dCBfaTkxNV9nZW1fb2JqZWN0X3N0b2xlbl9pbml0KHN0cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9u
ICptZW0sCi0JCQkJIHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCi0JCQkJIHJlc291
cmNlX3NpemVfdCBzaXplLAotCQkJCSB1bnNpZ25lZCBpbnQgZmxhZ3MpCitzdGF0aWMgaW50IF9p
OTE1X2dlbV9vYmplY3Rfc3RvbGVuX2luaXQoc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24gKm1l
bSwKKwkJCQkJc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKKwkJCQkJcmVzb3VyY2Vf
c2l6ZV90IHNpemUsCisJCQkJCXVuc2lnbmVkIGludCBmbGFncykKIHsKIAlzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSA9IG1lbS0+aTkxNTsKIAlzdHJ1Y3QgZHJtX21tX25vZGUgKnN0b2xl
bjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z2Z4Cg==
