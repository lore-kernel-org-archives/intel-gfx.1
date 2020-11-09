Return-Path: <SRS0=npFd=EP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE65C388F7
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 10:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29B420674
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 10:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29B420674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265EB898C4;
	Mon,  9 Nov 2020 10:48:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59661898BF;
 Mon,  9 Nov 2020 10:48:26 +0000 (UTC)
IronPort-SDR: OS/nqU+NRJIGPIzfouB+Tua/ZGhWhEwCVM1Bju8Bp6wyOnBxVtYR0KHv0ZuOexJlBXJnhLgjXu
 lMNWOzh1oP/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="254488940"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="254488940"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 02:48:25 -0800
IronPort-SDR: fNdA/geM9xc9vuSdQ4vh6bjMfvsxU5djA3g5ekLmeYaQAuP9ZSLeAjjFAN22YV1ixq45PCO+OT
 v+AA+pRKKW5w==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="327227164"
Received: from staskuzm-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.255.196.231])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 02:48:23 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Nov 2020 10:48:08 +0000
Message-Id: <20201109104811.3773962-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 0/3] User friendly lsgpu default output
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkFzIHBlciBp
bmRpdmlkdWFsIGNoYW5nZWxvZ3MgZW5kIHJlc3VsdCBpczoKCiAgICAkIGxzZ3B1CiAgICBjYXJk
MCAgICAgICAgICAgICAgICAgICA4MDg2OjE5M0IgICAgZHJtOi9kZXYvZHJpL2NhcmQwCiAgICDi
lJTilIByZW5kZXJEMTI4ICAgICAgICAgICAgICAgICAgICAgICAgIGRybTovZGV2L2RyaS9yZW5k
ZXJEMTI4CgogICAgJCBsc2dwdSAtLXN5c2ZzCiAgICBjYXJkMCAgICAgICAgICAgICAgICAgICA4
MDg2OjE5M0IgICAgc3lzOi9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MDIuMC9kcm0v
Y2FyZDAKICAgIOKUlOKUgHJlbmRlckQxMjggICAgICAgICAgICAgICAgICAgICAgICAgc3lzOi9z
eXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MDIuMC9kcm0vcmVuZGVyRDEyOAoKICAgICQg
bHNncHUgLS1wY2kKICAgIGNhcmQwICAgICAgICAgICAgICAgICAgIDgwODY6MTkzQiAgICBwY2k6
L3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowMi4wCiAgICDilJTilIByZW5kZXJEMTI4
CgpUdnJ0a28gVXJzdWxpbiAoMyk6CiAgaW50ZWxfZ3B1X3RvcDogVXNlciBmcmllbmRseSBkZXZp
Y2UgbGlzdGluZwogIGxzZ3B1OiBVc2VyIGZyaWVuZGx5IGRldmljZSBsaXN0aW5nCiAgbHNncHU6
IEFkZCBmaWx0ZXIgdHlwZSBwcmludC1vdXQgc2VsZWN0aW9uCgogbGliL2lndF9kZXZpY2Vfc2Nh
bi5jIHwgMTU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogbGli
L2lndF9kZXZpY2Vfc2Nhbi5oIHwgIDE2ICsrKystCiB0b29scy9pbnRlbF9ncHVfdG9wLmMgfCAg
IDcgKy0KIHRvb2xzL2xzZ3B1LmMgICAgICAgICB8ICAzOCArKysrKysrKystLQogNCBmaWxlcyBj
aGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZngg
bWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
