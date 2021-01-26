Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3026C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 00:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5F422DD6
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 00:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B5F422DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038C289F73;
	Tue, 26 Jan 2021 00:18:02 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107EB89FD3
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 00:18:01 +0000 (UTC)
IronPort-SDR: 9hJHol5xZO4libq2qRX0dRYGucDXdgr+RFWvuEmtB93EXDGNlaMZBHY9oEci6302/N/wQ5iSzU
 asROspmMHjSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="179046903"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="179046903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 16:18:00 -0800
IronPort-SDR: HEQOo8cW3hDV2RwTn21cRzv8cjl0CqGyB4nfsWQB7zFti+gIMtR22ugNE35sptQ8pKz1pK4bL1
 xCyjigA55gQQ==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="387598140"
Received: from bmmauck-mobl1.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.254.126.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 16:18:00 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 25 Jan 2021 16:17:44 -0800
Message-Id: <20210126001744.29442-2-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210126001744.29442-1-aditya.swarup@intel.com>
References: <20210126001744.29442-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/1] x86/gpu: Add Alderlake-S stolen memory
 support
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
Cc: bp@suse.de, Lucas De Marchi <lucas.demarchi@intel.com>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2F6IFlva295YW1hIDxjYXoueW9rb3lhbWFAaW50ZWwuY29tPgoKQWxkZXJsYWtlLVMg
aXMgYSBHZW4gMTIgYmFzZWQgaHlicmlkIHByb2Nlc3NvciBhcmNoaXRlY3R1cmUuIEFzIGl0CmJl
bG9uZ3MgdG8gR2VuIDEyIGZhbWlseSwgaXQgdXNlcyB0aGUgc2FtZSBHVFQgc3RvbGVuIG1lbW9y
eSBzZXR0aW5ncwpsaWtlIGl0cyBwcmVkZWNlc3NvcnMgLSBJQ0woR2VuIDExKSBhbmQgVEdMKEdl
biAxMikuIEluaGVyaXQgZ2VuMTEKYW5kIGdlbiA5IHF1aXJrcyBmb3IgZGV0ZXJtaW5pbmcgYmFz
ZSBhbmQgc2l6ZSBvZiBzdG9sZW4gbWVtb3J5LgoKdjI6IEZpeCB0eXBvcyBpbiBjb21taXQgbWVz
c2FnZS4oQm9yaXMgUGV0a292KQoKQnNwZWM6IDUyMDU1CkJzcGVjOiA0OTU4OQpCc3BlYzogNDk2
MzYKCkNjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KQ2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50
ZWwuY29tPgpDYzogeDg2QGtlcm5lbC5vcmcKQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQu
Y29tPiwKQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiwKQ2M6IEJvcmlz
bGF2IFBldGtvdiA8YnBAc3VzZS5kZT4KU2lnbmVkLW9mZi1ieTogQ2F6IFlva295YW1hIDxjYXou
eW9rb3lhbWFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgU3dhcnVwIDxhZGl0eWEu
c3dhcnVwQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVt
YXJjaGlAaW50ZWwuY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a2VybmVsL2Vhcmx5LXF1aXJrcy5jIGIvYXJjaC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jCmlu
ZGV4IGE0YjVhZjAzZGNjMS4uNmVkZDFlMmVlOGFmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJu
ZWwvZWFybHktcXVpcmtzLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jCkBA
IC01NTEsNiArNTUxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGludGVs
X2Vhcmx5X2lkc1tdIF9faW5pdGNvbnN0ID0gewogCUlOVEVMX0VITF9JRFMoJmdlbjExX2Vhcmx5
X29wcyksCiAJSU5URUxfVEdMXzEyX0lEUygmZ2VuMTFfZWFybHlfb3BzKSwKIAlJTlRFTF9SS0xf
SURTKCZnZW4xMV9lYXJseV9vcHMpLAorCUlOVEVMX0FETFNfSURTKCZnZW4xMV9lYXJseV9vcHMp
LAogfTsKIAogc3RydWN0IHJlc291cmNlIGludGVsX2dyYXBoaWNzX3N0b2xlbl9yZXMgX19yb19h
ZnRlcl9pbml0ID0gREVGSU5FX1JFU19NRU0oMCwgMCk7Ci0tIAoyLjI3LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxp
c3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
