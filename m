Return-Path: <SRS0=kkqM=KG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF4EC43460
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 16:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D486134F
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 16:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8D486134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033256EAA7;
	Tue, 11 May 2021 16:52:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721F36EA9C;
 Tue, 11 May 2021 16:51:58 +0000 (UTC)
IronPort-SDR: XScP6whSRXwSLcDO3QJzKMDaW5zyxWvKepM6qmrmS9J5tv0o/mYjaf+0F7NKU0mjvkUYlJS53N
 xSQVFEkGefFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186930936"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186930936"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 09:51:39 -0700
IronPort-SDR: Nge8xNiPYTU28wVSXiiJdr0VS2aYFCd1b0DcWeFxUvGLTY07XwUJFpNMgbHp90iGQc1R54xvMM
 P718QRg3n+HA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="537104748"
Received: from rdavies-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.2.133])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 09:51:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 May 2021 17:51:08 +0100
Message-Id: <20210511165117.428062-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511165117.428062-1-matthew.auld@intel.com>
References: <20210511165117.428062-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 03/12] tests/gem_gpgpu_fill: Convert from
 simple to standard igt_main
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
Cc: thomas.hellstrom@linux.intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgoK
QXMgd2UgbmVlZCB0byBhZGQgbmV3IHRlc3QgdmFyaWFudHMsIGNvbnZlcnQgdGhlIGNvZGUgdG8g
c3RhbmRhcmQKaWd0X21haW4gZm9ybWF0IHNvIHRob3NlIHZhcmlhbnRzIGNhbiBiZSBlYXNpbHkg
YWNjb21tb2RhdGVkLgoKU2lnbmVkLW9mZi1ieTogSmFudXN6IEtyenlzenRvZmlrIDxqYW51c3ou
a3J6eXN6dG9maWtAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0
cy9pOTE1L2dlbV9ncGdwdV9maWxsLmMgfCAyNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9pOTE1L2dlbV9ncGdwdV9maWxsLmMgYi90ZXN0cy9pOTE1L2dlbV9ncGdwdV9m
aWxsLmMKaW5kZXggYzYwNTYyOWYuLjViMTFmYjM1IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dl
bV9ncGdwdV9maWxsLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZ3BncHVfZmlsbC5jCkBAIC0xMjMs
MjAgKzEyMywyNyBAQCBzdGF0aWMgdm9pZCBncGdwdV9maWxsKGRhdGFfdCAqZGF0YSwgaWd0X2Zp
bGxmdW5jX3QgZmlsbCkKIAogCW11bm1hcChwdHIsIGJ1Zi0+c3VyZmFjZVswXS5zaXplKTsKIH0K
LQotaWd0X3NpbXBsZV9tYWluCitpZ3RfbWFpbgogewogCWRhdGFfdCBkYXRhID0gezAsIH07CiAJ
aWd0X2ZpbGxmdW5jX3QgZmlsbF9mbiA9IE5VTEw7CiAKLQlkYXRhLmRybV9mZCA9IGRybV9vcGVu
X2RyaXZlcl9yZW5kZXIoRFJJVkVSX0lOVEVMKTsKLQlkYXRhLmRldmlkID0gaW50ZWxfZ2V0X2Ry
bV9kZXZpZChkYXRhLmRybV9mZCk7Ci0JaWd0X3JlcXVpcmVfZ2VtKGRhdGEuZHJtX2ZkKTsKLQlk
YXRhLmJvcHMgPSBidWZfb3BzX2NyZWF0ZShkYXRhLmRybV9mZCk7CisJaWd0X2ZpeHR1cmUgewor
CQlkYXRhLmRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9yZW5kZXIoRFJJVkVSX0lOVEVMKTsKKwkJ
ZGF0YS5kZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpOworCQlpZ3RfcmVx
dWlyZV9nZW0oZGF0YS5kcm1fZmQpOworCQlkYXRhLmJvcHMgPSBidWZfb3BzX2NyZWF0ZShkYXRh
LmRybV9mZCk7CisKKwkJZmlsbF9mbiA9IGlndF9nZXRfZ3BncHVfZmlsbGZ1bmMoZGF0YS5kZXZp
ZCk7CisKKwkJaWd0X3JlcXVpcmVfZihmaWxsX2ZuLCAibm8gZ3BncHUtZmlsbCBmdW5jdGlvblxu
Iik7CiAKLQlmaWxsX2ZuID0gaWd0X2dldF9ncGdwdV9maWxsZnVuYyhkYXRhLmRldmlkKTsKKwl9
CiAKLQlpZ3RfcmVxdWlyZV9mKGZpbGxfZm4sICJubyBncGdwdS1maWxsIGZ1bmN0aW9uXG4iKTsK
KwlpZ3Rfc3VidGVzdCgiYmFzaWMiKQorCQlncGdwdV9maWxsKCZkYXRhLCBmaWxsX2ZuKTsKIAot
CWdwZ3B1X2ZpbGwoJmRhdGEsIGZpbGxfZm4pOworCWlndF9maXh0dXJlIHsKKwkJYnVmX29wc19k
ZXN0cm95KGRhdGEuYm9wcyk7CisJfQogfQotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
