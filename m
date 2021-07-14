Return-Path: <SRS0=C5oC=MG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71080C07E9A
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 13:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 154F1611C0
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 13:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 154F1611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58626E2A3;
	Wed, 14 Jul 2021 13:18:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DE66E2A3
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 13:18:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="190720377"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="190720377"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 06:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="505253480"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 14 Jul 2021 06:18:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Jul 2021 16:18:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Jul 2021 16:18:35 +0300
Message-Id: <20210714131837.8978-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714131837.8978-1-ville.syrjala@linux.intel.com>
References: <20210714131837.8978-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 2/4] iommu/vt-d: Disable superpage for
 Broxton igfx
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkJy
b3h0b24gaGFzIGtub3duIGlzc3VlcyB3aXRoIFZULWQgc3VwZXJwYWdlLiBOYW1lbHkgZnJhbWUg
YnVmZmVyCmNvbXByZXNzaW9uIChGQkMpIGNhbid0IGJlIHNhZmVseSB1c2VkIHdoZW4gc3VwZXJw
YWdlIGlzIGVuYWJsZWQuCkN1cnJlbnRseSB3ZSdyZSBkaXNhYmxpbmcgRkJDIGVudGlyZWx5IHdo
ZW4gVlQtZCBpcyBhY3RpdmUsIGJ1dApJIHRoaW5rIGp1c3QgZGlzYWJsaW5nIHN1cGVycGFnZSB3
b3VsZCBiZSBiZXR0ZXIgc2luY2UgRkJDIGNhbgpzYXZlIHNvbWUgcG93ZXIuCgpUT0RPOiB3b3Vs
ZCBiZSBuaWNlIHRvIHVzZSB0aGUgbWFjcm9zIGZyb20gaW5jbHVkZS9kcm0vaTkxNV9wY2lpZHMu
aCwKICAgICAgYnV0IGNhbid0IGRvIHRoYXQgd2l0aCBERUNMQVJFX1BDSV9GSVhVUF9IRUFERVIo
KQoKQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IEx1IEJhb2x1
IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+CkNjOiBpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aW9tbXUvaW50ZWwvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYwppbmRleCAw
OGJhNDEyMDUzZTMuLmVmNzE3OTA4NjQ3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9pbnRl
bC9pb21tdS5jCisrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYwpAQCAtNTY4MSw2ICs1
NjgxLDEzIEBAIHN0YXRpYyB2b2lkIHF1aXJrX3NraXBfaWdmeF9zdXBlcnBhZ2Uoc3RydWN0IHBj
aV9kZXYgKmRldikKIAlpb21tdV9za2lwX2lnZnhfc3VwZXJwYWdlID0gMTsKIH0KIAorLyogQnJv
eHRvbiBpZ2Z4IGhhcyBpc3N1ZXMgd2l0aCBzdXBlcnBhZ2UgKi8KK0RFQ0xBUkVfUENJX0ZJWFVQ
X0hFQURFUihQQ0lfVkVORE9SX0lEX0lOVEVMLCAweDBBODQsIHF1aXJrX3NraXBfaWdmeF9zdXBl
cnBhZ2UpOworREVDTEFSRV9QQ0lfRklYVVBfSEVBREVSKFBDSV9WRU5ET1JfSURfSU5URUwsIDB4
MUE4NCwgcXVpcmtfc2tpcF9pZ2Z4X3N1cGVycGFnZSk7CitERUNMQVJFX1BDSV9GSVhVUF9IRUFE
RVIoUENJX1ZFTkRPUl9JRF9JTlRFTCwgMHgxQTg1LCBxdWlya19za2lwX2lnZnhfc3VwZXJwYWdl
KTsKK0RFQ0xBUkVfUENJX0ZJWFVQX0hFQURFUihQQ0lfVkVORE9SX0lEX0lOVEVMLCAweDVBODQs
IHF1aXJrX3NraXBfaWdmeF9zdXBlcnBhZ2UpOworREVDTEFSRV9QQ0lfRklYVVBfSEVBREVSKFBD
SV9WRU5ET1JfSURfSU5URUwsIDB4NUE4NSwgcXVpcmtfc2tpcF9pZ2Z4X3N1cGVycGFnZSk7CisK
IC8qIEdlbWluaWxha2UgaWdmeCBhcHBlYXJzIHRvIGhhdmUgaXNzdWVzIHdpdGggc3VwZXJwYWdl
ICovCiBERUNMQVJFX1BDSV9GSVhVUF9IRUFERVIoUENJX1ZFTkRPUl9JRF9JTlRFTCwgMHgzMTg0
LCBxdWlya19za2lwX2lnZnhfc3VwZXJwYWdlKTsKIERFQ0xBUkVfUENJX0ZJWFVQX0hFQURFUihQ
Q0lfVkVORE9SX0lEX0lOVEVMLCAweDMxODUsIHF1aXJrX3NraXBfaWdmeF9zdXBlcnBhZ2UpOwot
LSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
