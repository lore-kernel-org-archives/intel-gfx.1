Return-Path: <SRS0=JclI=ET=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E587C55ABD
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 16:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4265620797
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 16:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4265620797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D674C6E550;
	Fri, 13 Nov 2020 16:28:37 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EB86E550;
 Fri, 13 Nov 2020 16:28:36 +0000 (UTC)
IronPort-SDR: ZbLtWoqRxIDN9uuy5ZO0oTQmzWZmX+f5iSibZZTLc0NZLzGTDWEMDAyaLilHRrS5hEjTllHDFo
 4570q83vBSYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="232113243"
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="232113243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:28:36 -0800
IronPort-SDR: gawGZXHFIISkq6WTUQCWW+xUyfWiHvw/SxDFA3YG7wW9Jz6mdg9En8S58nIpy3KpwLL2OdkYBl
 jPaC9miS5Yvg==
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="474721257"
Received: from shalomzo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.180.188])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:28:34 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Nov 2020 16:27:34 +0000
Message-Id: <20201113162736.2434791-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113162736.2434791-1-tvrtko.ursulin@linux.intel.com>
References: <20201113162736.2434791-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC i-g-t 3/5] lib/igt_device_scan: Remember PCI card
 index after scanning
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkFmdGVyIGRl
dmljZXMgYXJlIHNvcnRlZCBwb3N0IHNjYW5uaW5nLCBhc3NpbmcgYSBjYXJkIGluZGV4IHRvIGVh
Y2ggc28gaXQKY2FuIGJlIGVhc2lseSBhY2Nlc3NlZCBpZiBQQ0kgZmlsdGVyIGZvciBhIGNhcmQg
bmVlZHMgdG8gYmUgcHJpbnRlZCBvdXQuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFs
YUBpbnRlbC5jb20+CkNjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenlu
c2tpQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RldmljZV9zY2FuLmMgfCA0MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2RldmljZV9z
Y2FuLmMgYi9saWIvaWd0X2RldmljZV9zY2FuLmMKaW5kZXggYzBjZDY3NTdmYzI3Li43MjY1MzQw
M2Y3MDUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZGV2aWNlX3NjYW4uYworKysgYi9saWIvaWd0X2Rl
dmljZV9zY2FuLmMKQEAgLTE2Niw2ICsxNjYsNyBAQCBzdHJ1Y3QgaWd0X2RldmljZSB7CiAJY2hh
ciAqdmVuZG9yOwogCWNoYXIgKmRldmljZTsKIAljaGFyICpwY2lfc2xvdF9uYW1lOworCWludCBw
Y2lfaW5kZXg7CiAKIAlzdHJ1Y3QgaWd0X2xpc3RfaGVhZCBsaW5rOwogfTsKQEAgLTYwMSw2ICs2
MDIsMzMgQEAgc3RhdGljIHZvaWQgc29ydF9hbGxfZGV2aWNlcyh2b2lkKQogCWZyZWUoZGV2cyk7
CiB9CiAKK3N0YXRpYyB2b2lkIGluZGV4X3BjaV9kZXZpY2VzKHZvaWQpCit7CisJc3RydWN0IGln
dF9kZXZpY2UgKmRldjsKKworCWlndF9saXN0X2Zvcl9lYWNoX2VudHJ5KGRldiwgJmlndF9kZXZz
LmFsbCwgbGluaykgeworCQlzdHJ1Y3QgaWd0X2RldmljZSAqZGV2MjsKKwkJaW50IGluZGV4ID0g
MDsKKworCQlpZiAoIWlzX3BjaV9zdWJzeXN0ZW0oZGV2KSkKKwkJCWNvbnRpbnVlOworCisJCWln
dF9saXN0X2Zvcl9lYWNoX2VudHJ5KGRldjIsICZpZ3RfZGV2cy5hbGwsIGxpbmspIHsKKwkJCWlm
ICghaXNfcGNpX3N1YnN5c3RlbShkZXYyKSkKKwkJCQljb250aW51ZTsKKworCQkJaWYgKGRldjIg
PT0gZGV2KQorCQkJCWJyZWFrOworCisJCQlpZiAoIXN0cmNhc2VjbXAoZGV2LT52ZW5kb3IsIGRl
djItPnZlbmRvcikgJiYKKwkJCSAgICAhc3RyY2FzZWNtcChkZXYtPmRldmljZSwgZGV2Mi0+ZGV2
aWNlKSkKKwkJCQlpbmRleCsrOworCQl9CisKKwkJZGV2LT5wY2lfaW5kZXggPSBpbmRleDsKKwl9
Cit9CisKIC8qIENvcmUgc2Nhbm5pbmcgZnVuY3Rpb24uCiAgKgogICogQWxsIHNjYW5uZWQgZGV2
aWNlcyBhcmUga2VwdCBpbnNpZGUgaWd0X2RldnMuYWxsIHBvaW50ZXIgYXJyYXkuCkBAIC02NTcs
NiArNjg1LDcgQEAgc3RhdGljIHZvaWQgc2Nhbl9kcm1fZGV2aWNlcyh2b2lkKQogCXVkZXZfdW5y
ZWYodWRldik7CiAKIAlzb3J0X2FsbF9kZXZpY2VzKCk7CisJaW5kZXhfcGNpX2RldmljZXMoKTsK
IAogCWlndF9saXN0X2Zvcl9lYWNoX2VudHJ5KGRldiwgJmlndF9kZXZzLmFsbCwgbGluaykgewog
CQlzdHJ1Y3QgaWd0X2RldmljZSAqZGV2X2R1cCA9IGR1cGxpY2F0ZV9kZXZpY2UoZGV2KTsKQEAg
LTExMDUsMTMgKzExMzQsMTMgQEAgc3RhdGljIHN0cnVjdCBpZ3RfbGlzdF9oZWFkICpmaWx0ZXJf
cGNpKGNvbnN0IHN0cnVjdCBmaWx0ZXJfY2xhc3MgKmZjbHMsCiAJCWlmIChmaWx0ZXItPmRhdGEu
ZGV2aWNlICYmIHN0cmNhc2VjbXAoZmlsdGVyLT5kYXRhLmRldmljZSwgZGV2LT5kZXZpY2UpKQog
CQkJY29udGludWU7CiAKLQkJLyogV2UgZ2V0IG4tdGggY2FyZCAqLwotCQlpZiAoIWNhcmQpIHsK
LQkJCXN0cnVjdCBpZ3RfZGV2aWNlICpkdXAgPSBkdXBsaWNhdGVfZGV2aWNlKGRldik7Ci0JCQlp
Z3RfbGlzdF9hZGRfdGFpbCgmZHVwLT5saW5rLCAmaWd0X2RldnMuZmlsdGVyZWQpOwotCQkJYnJl
YWs7Ci0JCX0KLQkJY2FyZC0tOworCQkvKiBTa2lwIGlmICdjYXJkJyBkb2Vzbid0IG1hdGNoICov
CisJCWlmIChjYXJkICE9IGRldi0+cGNpX2luZGV4KQorCQkJY29udGludWU7CisKKwkJZGV2ID0g
ZHVwbGljYXRlX2RldmljZShkZXYpOworCQlpZ3RfbGlzdF9hZGRfdGFpbCgmZGV2LT5saW5rLCAm
aWd0X2RldnMuZmlsdGVyZWQpOworCQlicmVhazsKIAl9CiAKIAlEQkcoIkZpbHRlciBwY2kgZmls
dGVyZWQgc2l6ZTogJWRcbiIsIGlndF9saXN0X2xlbmd0aCgmaWd0X2RldnMuZmlsdGVyZWQpKTsK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
Cg==
