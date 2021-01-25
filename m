Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BE4C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 14:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC7122C9E
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 14:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC7122C9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4536E18F;
	Mon, 25 Jan 2021 14:08:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB606E161
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 14:08:51 +0000 (UTC)
IronPort-SDR: 417JAU773IU5AGB6eZHVLTiyATk3BcKa9/7PTq8NCqo2w6flJuvEqjTCmyPnxulmWWMYD6EabS
 eeAmC5MpgusQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="179879126"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="179879126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 06:08:35 -0800
IronPort-SDR: FavDwQXh0BaKLWRxjBje5mpHZd1/1/9H6YvVXChSM+jGafMvyTVEufxQ3Wfc7mLxG1/Nn98bVk
 mLtJQ5e7IVBw==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="472319599"
Received: from iduggana-mobl.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.254.81.9])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 06:08:34 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 25 Jan 2021 06:07:50 -0800
Message-Id: <20210125140753.347998-8-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210125140753.347998-1-aditya.swarup@intel.com>
References: <20210125140753.347998-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 07/10] drm/i915/adl_s: Initialize display for
 ADL-S
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

SW5pdGlhbGl6ZSBkaXNwbGF5IG91dHB1dHMgZm9yIEFETC1TLiBBREwtUyBoYXMgNSBkaXNwbGF5
Cm91dHB1dHMgLT4gMSBlRFAsIDIgSERNSSBhbmQgMiBEUCsrIG91dHB1dHMuCgp2MjoKLSBVc2Ug
UE9SVF9UQ3ggaW5zdGVhZCBvZiBQT1JUX0QsRS4uIHRvIHN0YXkgY29uc2lzdGVudAogIHdpdGgg
b3RoZXIgcGxhdGZvcm1zLihtZHJvcGVyKQoKQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogTWF0dCBSb3BlciA8
bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVt
YXJjaGlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgU3dhcnVwIDxhZGl0eWEuc3dh
cnVwQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jCmluZGV4IDgzYWMwYTdhNTlmMC4uZWFlYzVjZDFhMTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAtMTM4OTcsNyArMTM4OTcsMTMgQEAg
c3RhdGljIHZvaWQgaW50ZWxfc2V0dXBfb3V0cHV0cyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYpCiAJaWYgKCFIQVNfRElTUExBWShkZXZfcHJpdikpCiAJCXJldHVybjsKIAotCWlm
IChJU19ERzEoZGV2X3ByaXYpIHx8IElTX1JPQ0tFVExBS0UoZGV2X3ByaXYpKSB7CisJaWYgKElT
X0FMREVSTEFLRV9TKGRldl9wcml2KSkgeworCQlpbnRlbF9kZGlfaW5pdChkZXZfcHJpdiwgUE9S
VF9BKTsKKwkJaW50ZWxfZGRpX2luaXQoZGV2X3ByaXYsIFBPUlRfVEMxKTsKKwkJaW50ZWxfZGRp
X2luaXQoZGV2X3ByaXYsIFBPUlRfVEMyKTsKKwkJaW50ZWxfZGRpX2luaXQoZGV2X3ByaXYsIFBP
UlRfVEMzKTsKKwkJaW50ZWxfZGRpX2luaXQoZGV2X3ByaXYsIFBPUlRfVEM0KTsKKwl9IGVsc2Ug
aWYgKElTX0RHMShkZXZfcHJpdikgfHwgSVNfUk9DS0VUTEFLRShkZXZfcHJpdikpIHsKIAkJaW50
ZWxfZGRpX2luaXQoZGV2X3ByaXYsIFBPUlRfQSk7CiAJCWludGVsX2RkaV9pbml0KGRldl9wcml2
LCBQT1JUX0IpOwogCQlpbnRlbF9kZGlfaW5pdChkZXZfcHJpdiwgUE9SVF9UQzEpOwotLSAKMi4y
Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRl
bC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
