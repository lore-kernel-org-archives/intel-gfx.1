Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0A4C433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 15:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C85264F5E
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 15:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C85264F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE66E1D6;
	Tue,  2 Feb 2021 15:34:16 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972186E1CF
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 15:34:15 +0000 (UTC)
IronPort-SDR: VI3M+fSXkWJ6Bd+mOGG4am7GRHnZuiH17sA8jH6IZGHaFjMTSKZlg1eFPC+xonIQ99jwPQTQ0F
 xwrSJ7WhOZQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160636867"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="160636867"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 07:34:09 -0800
IronPort-SDR: egif6/bHF8T9l9xIYEpU44CaIdJleZpQcgsB+4HyFzsDewrz9JDT0vuRkSIBCvTf/8Q6Jgd7EF
 uigPVpumSYJA==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="581964372"
Received: from ehorgan-mobl.ger.corp.intel.com ([10.252.13.167])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 07:34:07 -0800
Message-ID: <4b922901edafd6ca0bd056e1d00198508094e775.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Date: Tue, 02 Feb 2021 16:33:49 +0100
In-Reply-To: <20210202152957.9834-1-chris@chris-wilson.co.uk>
References: <20210202152957.9834-1-chris@chris-wilson.co.uk>
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove notion of GEM from
 i915_gem_shrinker_taints_mutex
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

Ck9uIFR1ZSwgMjAyMS0wMi0wMiBhdCAxNToyOSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+
IFNpbmNlIHdlIGRyb3BwZWQgdGhlIHVzZSBvZiBkZXYtPnN0cnVjdF9tdXRleCBmcm9tIGluc2lk
ZSB0aGUKPiBzaHJpbmtlciwKPiB3ZSBubyBsb25nZXIgaW5jbHVkZSB0aGF0IGFzIHBhcnQgb2Yg
b3VyIGZzX3JlY2xhaW0gdGFpbnRpbmcuIFdlIGNhbgo+IGRyb3AgdGhlIGk5MTUgYXJndW1lbnQg
YW5kIHJlYnJhbmQgaXQgYXMgYSBnZW5lcmljIGZzX3JlY2xhaW0KPiB0YWludGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENj
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CgpM
R1RNLiBSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
