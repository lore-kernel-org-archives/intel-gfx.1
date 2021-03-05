Return-Path: <SRS0=4j6q=ID=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC71DC433DB
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Mar 2021 16:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA0264FE8
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Mar 2021 16:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA0264FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362ED6EB65;
	Fri,  5 Mar 2021 16:01:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460496EB65
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Mar 2021 16:01:21 +0000 (UTC)
IronPort-SDR: EgD0N/yk8PlVedZ/gl57qqFk/a1/S8O+DLhPaF0EnUEKUwHI9neUJS7Cyt7w8aR67A9EB2qbDt
 E3WCChbmwQYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9914"; a="184296337"
X-IronPort-AV: E=Sophos;i="5.81,225,1610438400"; d="scan'208";a="184296337"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2021 08:01:16 -0800
IronPort-SDR: mQhHyAhxRDndWxowZWVML/gz4Rck3nl1udcMr61w7PTnxm+L6ismHSYql2FYDLFigg+U89vZJb
 TzLFC4txrm4g==
X-IronPort-AV: E=Sophos;i="5.81,225,1610438400"; d="scan'208";a="408354209"
Received: from lmarquet-mobl1.ger.corp.intel.com (HELO [10.252.62.84])
 ([10.252.62.84])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2021 08:01:13 -0800
To: "Chiou, Cooper" <cooper.chiou@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20200916180745.627-1-cooper.chiou@intel.com>
 <20210302062700.6025-1-cooper.chiou@intel.com>
 <0c8ef2fb-34b0-98ea-12bb-fc300172799c@linux.intel.com>
 <161484956454.28586.15932692857365863465@build.alporthouse.com>
 <161485897632.28586.2630377954645968923@build.alporthouse.com>
 <161490560153.13701.1838349946598091390@build.alporthouse.com>
 <40dd702b-c71c-0b99-93e6-0e120ef7715d@linux.intel.com>
 <161494684568.15221.13792200139079395463@build.alporthouse.com>
 <SA2PR11MB49696180125900E3CCB090049D969@SA2PR11MB4969.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <194e43a3-2425-f5de-a8db-ad86bac19a66@linux.intel.com>
Date: Fri, 5 Mar 2021 16:01:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <SA2PR11MB49696180125900E3CCB090049D969@SA2PR11MB4969.namprd11.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Enable
 WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Tseng,
 William" <william.tseng@intel.com>, "Chen, Rong A" <rong.a.chen@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDA1LzAzLzIwMjEgMTU6MjQsIENoaW91LCBDb29wZXIgd3JvdGU6Cj4gQWZ0ZXIgc3dpdGNo
ZWQgdG8gZmZzIGZyb20gZmxzIGluICJwYXRjaCB2NSIoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy84MTc2NC8jcmV2NyksIG5vdyBDSSByZXN1bHQgaXMgUEFTUyBubyBy
ZWdyZXNzaW9uIGluIHdhX3ZlcmlmeSB3YXJuaW5nLgo+IAo+IEBDaGVuLCBSb25nCj4gQ291bGQg
eW91IHBsZWFzZSBydW4g4oCccGhvcm9uaXgtdGVzdC1zdWl0ZS5zdXBlcnR1eGthcnQuMTAyNHg3
NjguRnVsbHNjcmVlbi5VbHRpbWF0ZS4xLkdyYW5QYXJhZGlzb0lzbGFuZC5mcmFtZXNfcGVyX3Nl
Y29uZOKAnSB3aXRoIHRoaXMgbGF0ZXN0IHBhdGNoIHY1IG9uIHRlc3QgYm94IHRvIHNlZSBpZiBh
bnkgcGVyZm9ybWFuY2UgaW1wYWN0LiAKCldlIG5lZWQgdGVzdGluZyBvbiBtb3JlIHRoYXQgb25l
IGJveCBJJ20gYWZyYWlkLiBOZWVkIHRvIGNvdmVyIGRpZmZlcmVudCAKZnVzaW5nIGNvbmZpZ3Mg
b2YgR2VuOSB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaC4gSSBkb24ndCBoYXZlIGFueSAKdXNl
ZnVsIGlkZWFzIG9uIGhvdyB0byBkbyBpdCB0aG91Z2guIDooCgpSZWdhcmRzLAoKVHZydGtvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
