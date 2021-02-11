Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0137BC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 08:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD9B64E38
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 08:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAD9B64E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5B989D2F;
	Thu, 11 Feb 2021 08:57:00 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC5189C93;
 Thu, 11 Feb 2021 08:56:59 +0000 (UTC)
IronPort-SDR: G5hlvHZ3DVl9te+k+VvIZnrNcH3QEMyZKCnPf9VI8Kxz7lkKcLsZfWlZqjpP20GBE3Pe1x7M3V
 Mxvit2Te3CmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179653622"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="179653622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 00:56:57 -0800
IronPort-SDR: clnvHx+5JhClvYBPyzFj/9IOPAjqOk5+fwBiikZMh5s1hXRxarJVDYJC8nGBNkqGIuIbIq0lw7
 ssyylZcybyzA==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="397174085"
Received: from hblancoa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.99])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 00:56:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 11 Feb 2021 10:56:50 +0200
Message-ID: <87r1lnc78t.fsf@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PULL] drm-intel-fixes
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKQ2FsbWluZyBkb3duLCBqdXN0IGEgY291cGxlIG9mIENjOiBz
dGFibGUgZml4ZXMgbm93LgoKCmRybS1pbnRlbC1maXhlcy0yMDIxLTAyLTExOgpkcm0vaTkxNSBm
aXhlcyBmb3IgdjUuMTEgZmluYWw6Ci0gRW5zdXJlIFR5cGUtQyBGSUEgaXMgcG93ZXJlZCB3aGVu
IGluaXRpYWxpemluZwotIEZpeCBvdmVybGF5IGZyb250YnVmZmVyIHRyYWNraW5nCgpCUiwKSmFu
aS4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOTJiZjIyNjE0YjIxYTI3MDZm
NDk5M2IyNzgwMTdlNDM3Zjc3ODViMzoKCiAgTGludXggNS4xMS1yYzcgKDIwMjEtMDItMDcgMTM6
NTc6MzggLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
Z2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRl
bC1maXhlcy0yMDIxLTAyLTExCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNWZlYmEw
ZTkwNWM0OTVhMjE3YWVhOWRiNGVhOTEwOTNkOGZlNWRkZToKCiAgZHJtL2k5MTU6IEZpeCBvdmVy
bGF5IGZyb250YnVmZmVyIHRyYWNraW5nICgyMDIxLTAyLTEwIDExOjAzOjU2ICswMjAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMTEgZmluYWw6Ci0gRW5zdXJlIFR5cGUtQyBGSUEg
aXMgcG93ZXJlZCB3aGVuIGluaXRpYWxpemluZwotIEZpeCBvdmVybGF5IGZyb250YnVmZmVyIHRy
YWNraW5nCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkltcmUgRGVhayAoMSk6CiAgICAgIGRybS9pOTE1L3RnbCs6IE1ha2Ug
c3VyZSBUeXBlQyBGSUEgaXMgcG93ZXJlZCB1cCB3aGVuIGluaXRpYWxpemluZyBpdAoKVmlsbGUg
U3lyasOkbMOkICgxKToKICAgICAgZHJtL2k5MTU6IEZpeCBvdmVybGF5IGZyb250YnVmZmVyIHRy
YWNraW5nCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVybGF5LmMgfCAx
NyArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3RjLmMgICAgICB8
IDY3ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4g
U291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngK
