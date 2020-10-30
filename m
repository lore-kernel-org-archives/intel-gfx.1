Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2537EC4741F
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 15:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0ECF20756
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 15:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0ECF20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06216EDF1;
	Fri, 30 Oct 2020 15:17:23 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD68F6EDF1
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 15:17:22 +0000 (UTC)
IronPort-SDR: 4T3QZfFHQTFEX8gN3Aya1lDOHZqc9kwyese4RaCcWhpBkfWRxvHbD0A8S8MxsQqLcDVrISAhDv
 qcFMOaXf5kiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="168716920"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="168716920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 08:17:22 -0700
IronPort-SDR: jw279OuL+8EFpI2HEbNvEbCqffdHgc/UQfiPGjEyp0SzRx4XM5MeAmzQ42SOjLVvuPitJHafPw
 riD4WUNfxs9w==
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="537098313"
Received: from sfhansen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.254.46])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 08:17:21 -0700
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-24-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <65c08a9f-2ad3-9001-be28-cbc8892dda4f@linux.intel.com>
Date: Fri, 30 Oct 2020 16:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-24-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 23/61] drm/i915: Move pinning to inside
 engine_wa_list_verify()
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

Ck9uIDEwLzE2LzIwIDEyOjQ0IFBNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToKPiBUaGlzIHNo
b3VsZCBiZSBkb25lIGFzIHBhcnQgb2YgdGhlIHd3IGxvb3AsIGluIG9yZGVyIHRvIHJlbW92ZSBh
Cj4gaTkxNV92bWFfcGluIHRoYXQgbmVlZHMgd3cgaGVsZC4KPgo+IE5vdyBvbmx5IGk5MTVfZ2d0
dF9waW4oKSBjYWxsZXJzIHJlbWFpbmluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
