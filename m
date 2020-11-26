Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA602C64E75
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 20:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BE221D7F
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 20:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98BE221D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44A6EAB9;
	Thu, 26 Nov 2020 20:29:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC9E6EAB8
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 20:29:48 +0000 (UTC)
IronPort-SDR: HioaXelvVL1FucbcFiDPTddQ7IvuXz19bdm2RIV4YfN4GsbY0QRZK49s7OzFXa40f9vVj/Z5KR
 f/dHm8OwIDyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="171543134"
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; d="scan'208";a="171543134"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 12:29:48 -0800
IronPort-SDR: WZSSStzApX0cqU8mKb3Wvk3WALPVcvWWMdntFvGxBwIOdgqcXwv8DNmbtmQQiVGVw13ngLmlhy
 WSkGn/akkqqw==
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; d="scan'208";a="479459503"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 12:29:46 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 02:33:03 +0530
Message-Id: <20201126210314.7882-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126210314.7882-1-uma.shankar@intel.com>
References: <20201126210314.7882-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v12 04/15] drm/i915/display: Fixes quantization range
 for YCbCr output
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXhlcyB0aGUgcXVhbnRpemF0aW9uIHJhbmdlIGZvciBZQ2JDciBvdXRwdXQg
b24KTHNwY29uIGJhc2VkIGRldmljZXMuCgp2MjogUmUtcGhyYXNlZCB0aGUgZGVzY3JpcHRpb24g
YW5kIGFkZGVkIFZpbGxlJ3MgUmIuCgpTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2xzcGNvbi5jIHwgMTcgKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2xzcGNvbi5jCmluZGV4IGY5ODg5MWYwNThkYS4uN2NiNjVlMGYyNDFlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2xzcGNvbi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMKQEAgLTUyMywxMiAr
NTIzLDE3IEBAIHZvaWQgbHNwY29uX3NldF9pbmZvZnJhbWVzKHN0cnVjdCBpbnRlbF9lbmNvZGVy
ICplbmNvZGVyLAogCWVsc2UKIAkJZnJhbWUuYXZpLmNvbG9yc3BhY2UgPSBIRE1JX0NPTE9SU1BB
Q0VfUkdCOwogCi0JZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZSgmZnJhbWUuYXZp
LAotCQkJCQkgICBjb25uX3N0YXRlLT5jb25uZWN0b3IsCi0JCQkJCSAgIGFkanVzdGVkX21vZGUs
Ci0JCQkJCSAgIGNydGNfc3RhdGUtPmxpbWl0ZWRfY29sb3JfcmFuZ2UgPwotCQkJCQkgICBIRE1J
X1FVQU5USVpBVElPTl9SQU5HRV9MSU1JVEVEIDoKLQkJCQkJICAgSERNSV9RVUFOVElaQVRJT05f
UkFOR0VfRlVMTCk7CisJaWYgKGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgPT0gSU5URUxfT1VU
UFVUX0ZPUk1BVF9SR0IpIHsKKwkJZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZSgm
ZnJhbWUuYXZpLAorCQkJCQkJICAgY29ubl9zdGF0ZS0+Y29ubmVjdG9yLAorCQkJCQkJICAgYWRq
dXN0ZWRfbW9kZSwKKwkJCQkJCSAgIGNydGNfc3RhdGUtPmxpbWl0ZWRfY29sb3JfcmFuZ2UgPwor
CQkJCQkJICAgSERNSV9RVUFOVElaQVRJT05fUkFOR0VfTElNSVRFRCA6CisJCQkJCQkgICBIRE1J
X1FVQU5USVpBVElPTl9SQU5HRV9GVUxMKTsKKwl9IGVsc2UgeworCQlmcmFtZS5hdmkucXVhbnRp
emF0aW9uX3JhbmdlID0gSERNSV9RVUFOVElaQVRJT05fUkFOR0VfREVGQVVMVDsKKwkJZnJhbWUu
YXZpLnljY19xdWFudGl6YXRpb25fcmFuZ2UgPSBIRE1JX1lDQ19RVUFOVElaQVRJT05fUkFOR0Vf
TElNSVRFRDsKKwl9CiAKIAlyZXQgPSBoZG1pX2luZm9mcmFtZV9wYWNrKCZmcmFtZSwgYnVmLCBz
aXplb2YoYnVmKSk7CiAJaWYgKHJldCA8IDApIHsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
