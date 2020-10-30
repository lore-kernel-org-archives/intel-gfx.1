Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC0AC4363A
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 10:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3822083B
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 10:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3822083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D706ED9B;
	Fri, 30 Oct 2020 10:11:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659716ED9B
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 10:11:39 +0000 (UTC)
IronPort-SDR: fA+fLrW5nJorO6A5jiOcqECYf8yOwjb9/oT6elT9kQahqgSd1vU3kpNIi/nlOoA49BWy+qPecz
 iBMmr3wgwUlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168716673"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="168716673"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 03:11:38 -0700
IronPort-SDR: 83pCjit/arViUuxXtvr3SijOm9LfPythN1MB92mmLns8WESh8NczB6vHqoDzDjpEqO1gAR3pXL
 9YEu+YbjZC7g==
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="527067714"
Received: from bmurphy-mobl.ger.corp.intel.com (HELO [10.249.41.199])
 ([10.249.41.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 03:11:37 -0700
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-15-maarten.lankhorst@linux.intel.com>
 <02b0d2c2-5687-03b1-7741-34a3c2c819ac@shipmail.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <49e1aaa5-cf06-7e72-93e6-d744f7198bc1@linux.intel.com>
Date: Fri, 30 Oct 2020 11:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <02b0d2c2-5687-03b1-7741-34a3c2c819ac@shipmail.org>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 14/61] drm/i915: Reject UNSYNCHRONIZED
 for userptr
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

T3AgMzAtMTAtMjAyMCBvbSAxMDoyNiBzY2hyZWVmIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6
Cj4KPiBPbiAxMC8xNi8yMCAxMjo0MyBQTSwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6Cj4+IFdl
IHNob3VsZCBub3QgYWxsb3cgdGhpcyBhbnkgbW9yZSwgYXMgaXQgd2lsbCBicmVhayB3aXRoIHRo
ZSBuZXcgdXNlcnB0cgo+PiBpbXBsZW1lbnRhdGlvbiwgaXQgY291bGQgc3RpbGwgYmUgbWFkZSB0
byB3b3JrLCBidXQgdGhlcmUncyBubyBwb2ludCBpbgo+PiBkb2luZyBzby4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4KPgo+IElmZGVmcyBkb24ndCBhcHBlYXIgY29uc2lzdGVudCB3aXRoIHRoZSBjb21taXQg
bWVzc2FnZS4gV3JvbmcgcGF0Y2ggb3Igc2VwYXJhdGUgcGF0Y2g/Cj4KPiBBbHNvIHBsZWFzZSBh
ZGQgYSBkaXNjdXNzaW9uIHdoYXQgaW1wYWN0IHRoaXMgaGFzIG9uIGV4aXN0aW5nIHVzZXItc3Bh
Y2UuCj4KPgpSZWdhcmRpbmcgaWZkZWZzLCBhbGwgdGhlIHVzZXJwdHIgY29kZWlzIHVudXNlZCB3
aGVuIG1tdSBub3RpZmVycyBhcmUgbm90IGF2YWlsYWJsZSwgc28gSSBtYWRlIGl0IGNvbmRpdGlv
bmFsIG9uIHRoYXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
