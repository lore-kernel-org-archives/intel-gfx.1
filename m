Return-Path: <SRS0=PXPa=IP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0C0C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 11:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B381064E20
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 11:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B381064E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B6189E9E;
	Wed, 17 Mar 2021 11:17:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F70989E9E
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 11:17:55 +0000 (UTC)
IronPort-SDR: 4HjY0kZDB9uqb4OmtHQ5fpc21EgzyFw8DL5RldSmLys4t2vUzRBo7sy7Mmh9iZppxiGhALnQAR
 aXJiG5KMxjoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="177037074"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="177037074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 04:17:55 -0700
IronPort-SDR: qKAZ+8KhOn80iAEBr7H3vSqoD0HfwZCALo9lghFUsln4DTMph7qR2vx12LwCasHapcHPdVdRov
 Od4xYZXJQChg==
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="412606374"
Received: from pompl-mobl.ger.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.252.34.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 04:17:54 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Mar 2021 12:17:43 +0100
Message-Id: <20210317111744.97872-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/1] Drop relocations for new gens
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

UGF0Y2ggbGlrZWx5IGlzIHRlbXBvcmFyeSAtIHVudGlsIEphc29uIHdpbGwgZmlndXJlIG91dCB3
aGVyZQp0byBwdXQgaGlzIGNvZGUgYW5kIGF2b2lkIHVubmVjZXNzYXJ5IHdhbGsgb3ZlciB0aGUg
b2JqZWN0cyBhcnJheS4KSSBuZWVkIHRoaXMgdG8gZmluZCBvdXQgd2hhdCB0ZXN0cyB3aWxsIGZh
aWwgd2hlbiB3ZSBkaXNhbGxvdyAKcGFzc2luZyByZWxvY2F0aW9ucyBkYXRhIGluIGV4ZWNidWYu
CgpDdXJyZW50IHBhdGNoCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80
MjQwNjkvP3Nlcmllcz04Nzk4MCZyZXY9MgpzdGlsbCBhbGxvd3MgcGFzc2luZyByZWxvY2F0aW9u
IGRhdGEuIFNvIHdlIGdvdCBubyAtRUlOVkFMCmZvciBuZXcgaGFyZHdhcmUgd2hhdCBpcyBub3Qg
d2Ugd2FudC4KCldoZW4gcHJlYWQvcHdyaXRlIGRyb3AgKyBhbGxvY2F0b3Igc2VyaWVzIHdpbGwg
YmUgbWVyZ2Ugd2Ugd2FudAp0byByZXJ1biBvZiB0aGF0IHNlcmllcyBhbmQgc2VlIHdoYXQncyBm
YWlsaW5nIG9uIENJLgoKdjI6IGZpeGluZyBpbmNpZGVudGFsbHkgbGVmdCB0ZXN0ZWQgY29tcGFy
aXNvbiAoPCA5KSBpbnN0ZWFkCiAgICBwcm9wZXIgb25lIG9uIG5ld2VyIGdlbnMgKDwgMTIpCgpD
YzogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClpiaWduaWV3IEtlbXBjennFhHNraSAoMSk6CiAg
ZHJtL2k5MTUvZ2VtOiBEcm9wIHJlbG9jYXRpb24gc3VwcG9ydCBvbiBhbGwgbmV3IGhhcmR3YXJl
CgogLi4uL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jICAgIHwgMjIgKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCi0tIAoy
LjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
