Return-Path: <SRS0=PXPa=IP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C745C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 18:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB77B64F04
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 18:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB77B64F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6C16E067;
	Wed, 17 Mar 2021 18:49:08 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC16E067
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 18:49:06 +0000 (UTC)
IronPort-SDR: Jq+2nZ7v5ODbRMwITl+BgUOX/tg515HkArMtrH6AdaF5tlDA/zW2LQuOZDeQpmnm8Ek+gcsDKe
 KVBi+8HZn2HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="253537465"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="253537465"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 11:49:05 -0700
IronPort-SDR: El5N0F38OB5gA9/Zy+oj9TKOhuyGp1TOEfgTj+IDCJ1CE1Ta5u4pJ43iOUZXNCAj7NycvKzlxC
 pNaQ7DxAOqUw==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="511828503"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 11:49:04 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Mar 2021 20:48:58 +0200
Message-Id: <20210317184901.4029798-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/3] drm/i915: Fix DP LTTPR link training
 mode initialization
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyB2MiBvZgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzg4
MDE1LwoKYWxzbyBtYWtpbmcgc3VyZSB0aGF0IExUVFBScyBhcmUgZGV0ZWN0ZWQgYW5kIGluaXRp
YWxpemVkIG9ubHkgaWYgdGhlCkRQQ0QgYW5kIExUVFBSIHJldmlzaW9ucyBhcmUgPiAxLjQgYXMg
cmVxdWlyZWQgYnkgRGlzcGxheSBQb3J0CnNwZWNpZmljYXRpb24uCgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPiAjIHY1LjExCgpJbXJlIERlYWsgKDMpOgogIGRybS9pOTE1L2lsay1nbGs6IEZpeCBs
aW5rIHRyYWluaW5nIG9uIGxpbmtzIHdpdGggTFRUUFJzCiAgZHJtL2k5MTU6IERpc2FibGUgTFRU
UFIgc3VwcG9ydCB3aGVuIHRoZSBEUENEIHJldiA8IDEuNAogIGRybS9pOTE1OiBEaXNhYmxlIExU
VFBSIHN1cHBvcnQgd2hlbiB0aGUgTFRUUFIgcmV2IDwgMS40CgogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMgICB8ICA3ICsrCiAuLi4vZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9saW5rX3RyYWluaW5nLmMgfCA2NiArKysrKysrKysrKysrKy0tLS0tCiAuLi4vZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmggfCAgMiArLQogNCBmaWxlcyBj
aGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
