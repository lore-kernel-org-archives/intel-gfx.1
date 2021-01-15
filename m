Return-Path: <SRS0=bvk2=GS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2A6C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 10:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B949235F9
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 10:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B949235F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99566E1B7;
	Fri, 15 Jan 2021 10:19:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F60F6E1B7
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Jan 2021 10:19:29 +0000 (UTC)
IronPort-SDR: ypCMzyYKvMiSeu+xQd0qe7+oQu9WR3SZFWt6TfDk3NH48iRpn9pVz0B3Oku7WtyDSdQ52vAj3/
 TeE8umgYgqJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="178616005"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="178616005"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 02:19:28 -0800
IronPort-SDR: NNjsnK/3nSuo/oyUkrjsHatjd/23Wo4FJr7qgVZyNfhBP9+mMhRF1ktphxKTCw7mr28jnOMQnU
 bMTzZyoY1+qQ==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="364538637"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.213.120.203])
 ([10.213.120.203])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 02:19:26 -0800
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210111163711.12913-1-ville.syrjala@linux.intel.com>
 <20210111163711.12913-4-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <144b97b4-e792-2ff9-3b63-20611d7c1c7c@intel.com>
Date: Fri, 15 Jan 2021 15:49:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210111163711.12913-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 03/11] drm/i915: Drop redundant parens
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gMS8xMS8yMDIxIDEwOjA3IFBNLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBEcm9wIHRoZSBw
b2ludGxlc3MgZXh0cmEgcGFyZW5zLgo+Cj4gQ2M6IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0Bp
bnRlbC5jb20+Cj4gQ2M6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2lycS5jCj4gaW5kZXggZGQxOTcxMDQwYmJjLi40NDg0NjA5ZDg3MGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPiBAQCAtMjA3OSw3ICsyMDc5LDcgQEAgc3RhdGljIHZv
aWQgaXZiX2Rpc3BsYXlfaXJxX2hhbmRsZXIoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2LAo+ICAgCQlpbnRlbF9vcHJlZ2lvbl9hc2xlX2ludHIoZGV2X3ByaXYpOwo+ICAgCj4gICAJ
Zm9yX2VhY2hfcGlwZShkZXZfcHJpdiwgcGlwZSkgewo+IC0JCWlmIChkZV9paXIgJiAoREVfUElQ
RV9WQkxBTktfSVZCKHBpcGUpKSkKPiArCQlpZiAoZGVfaWlyICYgREVfUElQRV9WQkxBTktfSVZC
KHBpcGUpKQo+ICAgCQkJaW50ZWxfaGFuZGxlX3ZibGFuayhkZXZfcHJpdiwgcGlwZSk7Cj4gICAJ
fQo+ICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
