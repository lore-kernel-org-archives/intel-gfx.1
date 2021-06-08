Return-Path: <SRS0=F+1B=LC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4055DC4743D
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 09:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C83961185
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 09:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C83961185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDED96EB93;
	Tue,  8 Jun 2021 09:50:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBA96EB91;
 Tue,  8 Jun 2021 09:50:03 +0000 (UTC)
IronPort-SDR: pzqnwBbBI1rrb5aW8gb404Jh0t6+ty2GMiTGp8jZ8ZF0mTLHQVwW5vqWMgL+q/Sf6/ub8b2o0A
 X3/GuxM+lOZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="192135873"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="192135873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:50:02 -0700
IronPort-SDR: 5p26V7VOzfpAOcgTgG/MGlF2Kd27ZSUbUNq9wxqmXst40fHV0FJcRMrKo7LVZGxxCjkN1NPPrG
 uzokEHed8kUg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="447836973"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.115])
 ([10.249.254.115])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:50:01 -0700
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210608084428.142676-1-matthew.auld@intel.com>
 <20210608084428.142676-7-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <03674b49-d1a0-133f-0ad7-0c062536bac0@linux.intel.com>
Date: Tue, 8 Jun 2021 11:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608084428.142676-7-matthew.auld@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 6/6] drm/i915/ttm: restore min_page_size
 behaviour
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDYvOC8yMSAxMDo0NCBBTSwgTWF0dGhldyBBdWxkIHdyb3RlOgo+IFdlIG5vdyBoYXZlIGJv
LT5wYWdlX2FsaWdubWVudCB3aGljaCBwZXJmZWN0bHkgZGVzY3JpYmVzIHdoYXQgd2UgbmVlZCBp
Zgo+IHdlIGhhdmUgbWluIHBhZ2Ugc2l6ZSByZXN0cmljdGlvbnMgZm9yIGxtZW0uIFdlIGNhbiBh
bHNvIGRyb3AgdGhlIGZsYWcKPiBoZXJlLCBzaW5jZSB0aGlzIGlzIHRoZSBkZWZhdWx0IGJlaGF2
aW91ciBmb3IgYWxsIG9iamVjdHMuCj4KPiB2MihUaG9tYXMpOgo+ICAgICAgLSBiby0+cGFnZV9h
bGlnbm1lbnQgaXMgaW4gcGFnZSB1bml0cwo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxk
IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
