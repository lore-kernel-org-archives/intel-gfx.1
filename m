Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9738C47095
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 07:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9091C6135D
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 07:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9091C6135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A65D6E408;
	Wed,  9 Jun 2021 07:48:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C76C6E3F5;
 Wed,  9 Jun 2021 07:48:57 +0000 (UTC)
IronPort-SDR: LhpRjwSgmrtLEwh3bRfGL0pimIF/GRiZVtljLvRr7e6JkjlhQ9pKfY48Uu4PP6/3z93P2iNohx
 WsdnZYZU5c+g==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="203170468"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="203170468"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:48:56 -0700
IronPort-SDR: bNbEWc6dlQm1Pu6euELkCrFAfFxYiNA36U6WPAGtbBlvD9MoUcaZsfl1deTewYyUkshvh5u0Q7
 r1fsA+1/kw+g==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419196825"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO [10.252.10.147])
 ([10.252.10.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:48:54 -0700
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <20210609063436.284332-6-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <90884b67-742d-cdf3-4201-fcdf27a596df@intel.com>
Date: Wed, 9 Jun 2021 08:48:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609063436.284332-6-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH v2 5/9] drm/i915/gt: Add a routine to
 iterate over the pagetables of a GTT
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gMDkvMDYvMjAyMSAwNzozNCwgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6Cj4gRnJvbTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gCj4gSW4gdGhlIG5leHQgcGF0
Y2gsIHdlIHdpbGwgd2FudCB0byBsb29rIGF0IHRoZSBkbWEgYWRkcmVzc2VzIG9mCj4gaW5kaXZp
ZHVhbCBwYWdlIHRhYmxlcywgc28gYWRkIGEgcm91dGluZSB0byBpdGVyYXRlIG92ZXIgdGhlbS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
