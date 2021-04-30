Return-Path: <SRS0=IWb8=J3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B26C433ED
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Apr 2021 15:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0733061459
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Apr 2021 15:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0733061459
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1C56E4B6;
	Fri, 30 Apr 2021 15:34:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD916E4B6
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Apr 2021 15:34:48 +0000 (UTC)
IronPort-SDR: VUslMTFIZLaJOB8TZMTC8SixekxwmwXloRcXKpk2Iq/sEZ/2wxL7XDd+7B1+lJ6ZUfEbMpd1Ax
 tJRckowNjVbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="258581719"
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; d="scan'208";a="258581719"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 08:34:47 -0700
IronPort-SDR: ygefv8WC2RGfPN/kdQMhVXnjl+ZDAJVp6h0TvkD9wuVtdaXL8u3UVgh3DrVclzA/boEHytCSGF
 43WuMKnXFoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; d="scan'208";a="459487281"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 30 Apr 2021 08:34:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Apr 2021 18:34:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 30 Apr 2021 18:34:39 +0300
Message-Id: <20210430153444.29270-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/5] drm/i915: cdclk cleanups
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkEg
ZmV3IGVhc3kgY2xlYW51cHMgdG8gdGhlIGNkY2xrIGNvZGUuCgpWaWxsZSBTeXJqw6Rsw6QgKDUp
OgogIGRybS9pOTE1OiBFeHRyYWN0IHNvbWUgaGVscGVycyB0byBjb21wdXRlIGNkY2xrIHJlZ2lz
dGVyIHZhbHVlcwogIGRybS9pOTE1OiBVc2UgaW50ZWxfZGVfcm13KCkgaW4gYmR3IGNkY2xrIHBy
b2dyYW1taW5nCiAgZHJtL2k5MTU6IFVzZSBpbnRlbF9kZV9ybXcoKSBpbiBza2wgY2RjbGsgcHJv
Z3JhbW1pbmcKICBkcm0vaTkxNTogVXNlIGludGVsX2RlX3JtdygpIGluIGJ4dC9nbGsvY25sKyBj
ZGNsayBwcm9ncmFtbWluZwogIGRybS9pOTE1OiBVc2UgaW50ZWxfZGVfd2FpdF9mb3JfKigpIGlu
IGNubCsgY2RjbGsgcHJvZ3JhbW1pbmcKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2NkY2xrLmMgfCAyMzggKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTA2IGluc2VydGlvbnMoKyksIDEzMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5n
IGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
