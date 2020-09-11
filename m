Return-Path: <SRS0=QVu9=CU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BBEC433E2
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 10:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311BF2076C
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 10:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311BF2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A229897B5;
	Fri, 11 Sep 2020 10:30:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9135989A1F;
 Fri, 11 Sep 2020 10:30:55 +0000 (UTC)
IronPort-SDR: owJPNeTE4Loxr/vrkq5h9npuzhTvP52GMGdnehrPXZzrf8k/6IkZNagzCfPmgYnxc+PsJPevUj
 4USFbrdt/JGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146463190"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="146463190"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 03:30:55 -0700
IronPort-SDR: VvWHDjuD0eWiJcroy8B//p+L6dwY8+ECPVWTEDbMu3ls/eG/AReD0joLWqQJakIJFLSZpcZKu4
 kwP3OzI4Hxog==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="334474687"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 03:30:53 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2020 12:30:17 +0200
Message-Id: <20200911103039.4574-3-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v6 02/24] tests/core_hotunplug: Constify
 dev_bus_addr string
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RGV2aWNlIGJ1cyBhZGRyZXNzIHN0cnVjdHVyZSBmaWVsZCBpcyBhbHdheXMgaW5pdGlhbGl6ZWQg
d2l0aCBhIHBvaW50ZXIKdG8gYSBzdWJzdHJpbmcgb2YgdGhlIGRldmljZSBzeXNmcyBwYXRoIGFu
ZCBuZXZlciB1c2VkIGZvciBpdHMKbW9kaWZpY2F0aW9uLiAgRGVjbGFyZSBpdCBhcyBhIGNvbnN0
YW50IHN0cmluZy4KClNpZ25lZC1vZmYtYnk6IEphbnVzeiBLcnp5c3p0b2ZpayA8amFudXN6Lmty
enlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1pY2hhxYIgV2luaWFyc2tp
IDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9jb3JlX2hvdHVucGx1Zy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvY29yZV9ob3R1bnBsdWcuYyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVn
LmMKaW5kZXggNzQzMTM0NmIxLi5hNDA3MWY1MWUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2NvcmVfaG90
dW5wbHVnLmMKKysrIGIvdGVzdHMvY29yZV9ob3R1bnBsdWcuYwpAQCAtNDQsNyArNDQsNyBAQCBz
dHJ1Y3QgaG90dW5wbHVnIHsKIAkJaW50IHN5c2ZzX2J1czsKIAkJaW50IHN5c2ZzX2RydjsKIAl9
IGZkOwotCWNoYXIgKmRldl9idXNfYWRkcjsKKwljb25zdCBjaGFyICpkZXZfYnVzX2FkZHI7CiB9
OwogCiAvKiBIZWxwZXJzICovCi0tIAoyLjIxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAo=
