Return-Path: <SRS0=/3Pa=EQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA2AC388F7
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 10:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F90206B2
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 10:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F90206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A711289704;
	Tue, 10 Nov 2020 10:41:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0042B89704
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 10:41:55 +0000 (UTC)
IronPort-SDR: Da6neWlF78QFSZKrww8fZgXxKfIF32wCZCy25L8B3Cf7lErgZYAk55SntA0s8gbWjh5s612Nuk
 s/R/OrqUNqqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="149230076"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="149230076"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 02:41:55 -0800
IronPort-SDR: gYJwU9pV93VHPcckSpxTSUJsyzSv7IFizEOEPiyYFuck9MpzCZqVxAu07Y7D6iW23uBHtRMkvO
 j+UoGb0w4VfQ==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="473377060"
Received: from ideacone-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.80.124])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 02:41:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20201022222709.29386-5-manasi.d.navare@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201022222709.29386-1-manasi.d.navare@intel.com>
 <20201022222709.29386-5-manasi.d.navare@intel.com>
Date: Tue, 10 Nov 2020 12:41:50 +0200
Message-ID: <87r1p1sdch.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 04/11] drm/i915/display/dp: Add VRR crtc
 state variables
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

T24gVGh1LCAyMiBPY3QgMjAyMCwgTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVs
LmNvbT4gd3JvdGU6Cj4gSW50cm9kdWNlIFZSUiBzdHJ1Y3QgaW4gaW50ZWxfY3J0Y19zdGF0ZSBh
bmQgYWRkCj4gVlJSIGNydGMgc3RhdGUgdmFyaWFibGVzIEVuYWJsZSwgVnRvdGFsbWluIGFuZCBW
dG90YWxtYXgKPiB0byBiZSBkZXJpdmVkIGZyb20gbW9kZSB0aW1pbmdzIGFuZCBWUlIgY3J0YyBw
cm9wZXJ0eS4KCkknZCBzcXVhc2ggdGhpcyB0byB0aGUgcGF0Y2ggYWN0dWFsbHkgdXNpbmcgaXQu
Cgo+Cj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5
cGVzLmggfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVz
LmgKPiBpbmRleCBmNmYwNjI2NjQ5ZTAuLmY2ZjdlYzAyNGRhNyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCj4gQEAgLTEw
OTIsNiArMTA5MiwxMyBAQCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSB7Cj4gIAlzdHJ1Y3QgaW50
ZWxfZHNiICpkc2I7Cj4gIAo+ICAJdTMyIHBzcjJfbWFuX3RyYWNrX2N0bDsKPiArCj4gKwkvKiBW
YXJpYWJsZSBSZWZyZXNoIFJhdGUgc3RhdGUgKi8KPiArCXN0cnVjdCB7Cj4gKwkJYm9vbCBlbmFi
bGU7Cj4gKwkJdTE2IHZ0b3RhbG1pbjsKPiArCQl1MTYgdnRvdGFsbWF4Owo+ICsJfSB2cnI7Cj4g
IH07Cj4gIAo+ICBlbnVtIGludGVsX3BpcGVfY3JjX3NvdXJjZSB7CgotLSAKSmFuaSBOaWt1bGEs
IEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZngK
