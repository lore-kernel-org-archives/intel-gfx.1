Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18321C00A89
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 08:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C2B20739
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 08:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C2B20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFFD6ED04;
	Fri, 30 Oct 2020 08:31:38 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E926ED04
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 08:31:36 +0000 (UTC)
IronPort-SDR: WmRz8EH0E/sFspkdu3jHL86iArt2eyXT0V7G/fFeWQyqvowBBzE74xEFa3Cv5up+0df3QaWN7g
 l8xNLt7MQH1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="167795088"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="167795088"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 01:31:35 -0700
IronPort-SDR: BPc7g/lsOHGg9ueuK+adijo1yVsVMZ92k5Kf1SyNNydOGVVyBLTPdWBzk35piGWUkfX32W0qYD
 d4S5rkJlwn/A==
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="351790522"
Received: from oc5mblwhs02.amr.corp.intel.com (HELO
 Win10-45-1tb161.SSPE.ch.intel.com) ([10.249.254.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 01:31:35 -0700
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-8-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <a1d7eccd-12ff-5d5b-b08d-c40f36d9a3df@linux.intel.com>
Date: Fri, 30 Oct 2020 09:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-8-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 07/61] drm/i915: Move HAS_STRUCT_PAGE to
 obj->flags
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

Ck9uIDEwLzE2LzIwIDEyOjQzIFBNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToKPiBXZSB3YW50
IHRvIHJlbW92ZSB0aGUgY2hhbmdpbmcgb2Ygb3BzIHN0cnVjdHVyZSBmb3IgYXR0YWNoaW5nCj4g
cGh5cyBwYWdlcywgc28gd2UgbmVlZCB0byBraWxsIG9mZiBIQVNfU1RSVUNUX1BBR0UgZnJvbSBv
cHMtPmZsYWdzLAo+IGFuZCBwdXQgaXQgaW4gdGhlIGJvLgo+Cj4gVGhpcyB3aWxsIHJlbW92ZSBh
IHBvdGVudGlhbCByYWNlIG9mIGRlcmVmZXJlbmNpbmcgdGhlIHdyb25nIG9iai0+b3BzCj4gd2l0
aG91dCB3dyBtdXRleCBoZWxkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBUaG9tYXMg
SGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcg
bGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
