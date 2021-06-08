Return-Path: <SRS0=F+1B=LC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45DCC47082
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 05:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 968D961029
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 05:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 968D961029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100F489EF7;
	Tue,  8 Jun 2021 05:43:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641D389D61
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Jun 2021 05:43:24 +0000 (UTC)
IronPort-SDR: oD+SSB4FbRG77xYEci5V8mm4pDeRaxb9jqbVqOzM2iaQ375h9e2CE6bOg2xwL/Ae58O00fPt5Z
 1MtK132h0WVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204799318"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="204799318"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 22:43:23 -0700
IronPort-SDR: 6UdjRjHbqCP2eNWp/JNEZ7IpIO2nSoscb5zpxgs+NO1UdxDi2NE/Wt4i5lzI5aIUWnfiQztmIr
 tAGLDlktma2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="440336475"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2021 22:43:21 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, x86@kernel.org, jose.souza@intel.com
Date: Tue,  8 Jun 2021 11:04:11 +0530
Message-Id: <20210608053411.394166-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH V3] x86/gpu: add JasperLake to gen11 early quirks
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

TGV0J3MgcmVzZXJ2ZSBKU0wgc3RvbGVuIG1lbW9yeSBmb3IgZ3JhcGhpY3MuCgpKYXNwZXJMYWtl
IGlzIGEgZ2VuMTEgcGxhdGZvcm0gd2hpY2ggaXMgY29tcGF0aWJsZSB3aXRoCklDTC9FSEwgY2hh
bmdlcy4KClJlcXVpcmVkIGR1ZSB0byBiZWxvdyByZWZlcmVuY2UgcGF0Y2g6Cgpjb21taXQgMjRl
YTA5OGI3YzBkODBiNTZkNjJhMjAwNjA4ZTBiMDI5MDU2YmFmNgpkcm0vaTkxNS9qc2w6IFNwbGl0
IEVITC9KU0wgcGxhdGZvcm0gaW5mbyBhbmQgUENJIGlkcwoKVjI6CiAgICAtIEFkZGVkIG1haW50
YWluZXIgbGlzdCBpbiBjYwogICAgLSBBZGRlZCBwYXRjaCByZWYgaW4gY29tbWl0IG1lc3NhZ2UK
VjE6CiAgICAtIEFkZGVkIENjOiB4ODZAa2VybmVsLm9yZwoKQ2M6IFRob21hcyBHbGVpeG5lciA8
dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNj
OiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhw
YUB6eXRvci5jb20+CkNjOiB4ODZAa2VybmVsLm9yZwpDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0
ZWphc2t1bWFyeC5zdXJlbmRyYWt1bWFyLnVwYWRoeWF5QGludGVsLmNvbT4KLS0tCiBhcmNoL3g4
Ni9rZXJuZWwvZWFybHktcXVpcmtzLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYyBiL2FyY2gv
eDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYwppbmRleCBiNTUzZmZlOWI5ODUuLjM4ODM3ZGFkNDZl
NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jCisrKyBiL2FyY2gv
eDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYwpAQCAtNTQ5LDYgKzU0OSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBpbnRlbF9lYXJseV9pZHNbXSBfX2luaXRjb25zdCA9IHsK
IAlJTlRFTF9DTkxfSURTKCZnZW45X2Vhcmx5X29wcyksCiAJSU5URUxfSUNMXzExX0lEUygmZ2Vu
MTFfZWFybHlfb3BzKSwKIAlJTlRFTF9FSExfSURTKCZnZW4xMV9lYXJseV9vcHMpLAorCUlOVEVM
X0pTTF9JRFMoJmdlbjExX2Vhcmx5X29wcyksCiAJSU5URUxfVEdMXzEyX0lEUygmZ2VuMTFfZWFy
bHlfb3BzKSwKIAlJTlRFTF9SS0xfSURTKCZnZW4xMV9lYXJseV9vcHMpLAogCUlOVEVMX0FETFNf
SURTKCZnZW4xMV9lYXJseV9vcHMpLAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZngK
