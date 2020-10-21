Return-Path: <SRS0=oW1W=D4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFCDC55178
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 13:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9C8208B3
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 13:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE9C8208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F566EB13;
	Wed, 21 Oct 2020 13:32:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FBF6EB13
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 13:32:28 +0000 (UTC)
IronPort-SDR: VvdwILNiuwVJrScjjITn0bKQRPycU3gCARJLgb8yLtU5QdruXINQDOWs/T6SJjhc1iON68Soud
 O1avNom4zQxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="154317758"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="154317758"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 06:32:28 -0700
IronPort-SDR: ZNtS9K6gaXBwIiQQ3G1yU8Zj3WX8FDovX09AkV57FeSSGfNnhNXU/vOdf0ZFKc+HgElwn43qC+
 vF+gyujlMLfQ==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="316372464"
Received: from snadathu-mobl.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.252.137.153])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 06:32:27 -0700
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2020 06:31:57 -0700
Message-Id: <20201021133213.328994-3-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201021133213.328994-1-aditya.swarup@intel.com>
References: <20201021133213.328994-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 02/18] x86/gpu: add ADL_S stolen memory support
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

RnJvbTogQ2F6IFlva295YW1hIDxjYXoueW9rb3lhbWFAaW50ZWwuY29tPgoKQURMX1MgcmUtdXNl
cyB0aGUgc2FtZSBzdG9sZW4gbWVtb3J5IHJlZ2lzdGVycyBhcyBUR0wgYW5kIElDTC4KCkJzcGVj
OiA1MjA1NQpCc3BlYzogNDk1ODkKQnNwZWM6IDQ5NjM2CgpDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+CkNjOiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2
YXRzYUBpbnRlbC5jb20+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpD
YzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IElt
cmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2F6IFlva295YW1h
IDxjYXoueW9rb3lhbWFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgU3dhcnVwIDxh
ZGl0eWEuc3dhcnVwQGludGVsLmNvbT4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwvZWFybHktcXVpcmtz
LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYyBiL2FyY2gveDg2L2tlcm5lbC9lYXJseS1xdWly
a3MuYwppbmRleCBhNGI1YWYwM2RjYzEuLjZlZGQxZTJlZThhZiAxMDA2NDQKLS0tIGEvYXJjaC94
ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9lYXJseS1xdWly
a3MuYwpAQCAtNTUxLDYgKzU1MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCBpbnRlbF9lYXJseV9pZHNbXSBfX2luaXRjb25zdCA9IHsKIAlJTlRFTF9FSExfSURTKCZnZW4x
MV9lYXJseV9vcHMpLAogCUlOVEVMX1RHTF8xMl9JRFMoJmdlbjExX2Vhcmx5X29wcyksCiAJSU5U
RUxfUktMX0lEUygmZ2VuMTFfZWFybHlfb3BzKSwKKwlJTlRFTF9BRExTX0lEUygmZ2VuMTFfZWFy
bHlfb3BzKSwKIH07CiAKIHN0cnVjdCByZXNvdXJjZSBpbnRlbF9ncmFwaGljc19zdG9sZW5fcmVz
IF9fcm9fYWZ0ZXJfaW5pdCA9IERFRklORV9SRVNfTUVNKDAsIDApOwotLSAKMi4yNy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFp
bGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
