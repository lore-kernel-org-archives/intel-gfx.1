Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DBAC00A89
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 15:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D0C20756
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 15:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D0C20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94F6EDE6;
	Fri, 30 Oct 2020 15:21:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA676EDE6
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 15:21:16 +0000 (UTC)
IronPort-SDR: CHoiAG80ufdjcrKuMouKraZr8Kte8mtMbzoM7iXS3n+DWm60vQG2A4KbEbi4+Zvn2hZpgHaaVM
 3cFoPyePJVyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="155596242"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="155596242"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 08:21:15 -0700
IronPort-SDR: cZldeJkHmMo99aBMfgvGMFeiSpCjosrVEuVoSkUvRmt/ZuuNv2l7rnxeixpx6qm7+yDq4ahvzI
 jtKg5tf+9Okw==
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="537099669"
Received: from sfhansen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.254.46])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 08:21:14 -0700
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-25-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <7a3c1a96-4c7b-8339-4043-533a74985907@linux.intel.com>
Date: Fri, 30 Oct 2020 16:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-25-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 24/61] drm/i915: Take reservation lock
 around i915_vma_pin.
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

Ck9uIDEwLzE2LzIwIDEyOjQ0IFBNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToKPiBXZSBwcmV2
aW91c2x5IGNvbXBsYWluZWQgd2hlbiB3dyA9PSBOVUxMLgo+Cj4gVGhpcyBmdW5jdGlvbiBpcyBu
b3cgb25seSB1c2VkIGluIHNlbGZ0ZXN0cyB0byBwaW4gYW4gb2JqZWN0LAo+IGFuZCB3dyBsb2Nr
aW5nIGlzIG5vdyBmaXhlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogVGhv
bWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWls
aW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
