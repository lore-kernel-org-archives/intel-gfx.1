Return-Path: <SRS0=9WF3=MB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F30C07E99
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Jul 2021 16:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D40613BF
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Jul 2021 16:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D40613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36996E919;
	Fri,  9 Jul 2021 16:47:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11656E919
 for <intel-gfx@lists.freedesktop.org>; Fri,  9 Jul 2021 16:47:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="209548528"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="209548528"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 09:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="492603155"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 09 Jul 2021 09:47:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Jul 2021 19:47:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  9 Jul 2021 19:47:46 +0300
Message-Id: <20210709164750.9465-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/4] iommu/vt-d: Disable igfx iommu superpage on
 bxt/skl/glk
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
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
cmFuIGludG8gc29tZSBraW5kIG9mIGZhaWwgd2l0aCBWVC1kIHN1cGVycGFnZSBvbiBHZW1pbmxh
a2UgaWdmeCwKc28gd2l0aG91dCBhbnkgYmV0dGVyIGlkZWFzIGxldCdzIGp1c3QgZGlzYWJsZSBp
dC4KCkFkZGl0aW9uYWxseSBTa3lsYWtlL0Jyb3h0b24gaWdmeCBoYXZlIGtub3duIGlzc3VlcyB3
aXRoIFZULWQKc3VwZXJwYWdlIGFzIHdlbGwsIHNvIGxldCdzIGRpc2FibGUgaXQgdGhlcmUgYXMg
d2VsbC4gVGhpcyBzaG91bGQKbGV0IHVzIHJlLWVuYWJsZSBmcmFtZSBidWZmZXIgY29tcHJlc3Np
b24gKEZCQykgZm9yIHNvbWUgZXh0cmEKcG93ZXIgc2F2aW5ncyB3aGVuIHRoZSBkaXNwbGF5IGlz
IG9uLgoKQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IEx1IEJh
b2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+CkNjOiBpb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwoKVmlsbGUgU3lyasOkbMOkICg0KToKICBpb21tdS92dC1kOiBEaXNhYmxlIHN1
cGVycGFnZSBmb3IgR2VtaW5pbGFrZSBpZ2Z4CiAgaW9tbXUvdnQtZDogRGlzYWJsZSBzdXBlcnBh
Z2UgZm9yIEJyb3h0b24gaWdmeAogIGlvbW11L3Z0LWQ6IERpc2FibGUgc3VwZXJwYWdlIGZvciBT
a3lsYWtlIGlnZngKICBkcm0vaTkxNS9mYmM6IEFsbG93IEZCQyArIFZULWQgb24gU0tML0JYVAoK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMgfCAxNiAtLS0tLS0tLS0K
IGRyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYyAgICAgICAgICAgICAgfCA0NCArKysrKysrKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngK
