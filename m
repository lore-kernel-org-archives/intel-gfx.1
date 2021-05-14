Return-Path: <SRS0=QorL=KJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7B3C433ED
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 12:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19650613B5
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 12:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19650613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7E46EE5F;
	Fri, 14 May 2021 12:58:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FA46EE5F
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 May 2021 12:58:04 +0000 (UTC)
IronPort-SDR: j8GmrPRBwIotZVd2qTWiNiE/lEOUhKHRXm/Ud5F5aZ/1fiIpluT54c/9PrfwCxcns9PxieI1As
 hzTpNBjTX+Bg==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="199862113"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="199862113"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 05:57:56 -0700
IronPort-SDR: JMEsAQ/2CMjjJyfFqvedolHZgmg/gPc7RZbHa9H9LNgpvtJxDVtQoZDo8wZZMCiXClX9ElTfFF
 gLbpiywA4ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="436369910"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 14 May 2021 05:57:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 May 2021 15:57:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 14 May 2021 15:57:37 +0300
Message-Id: <20210514125751.17075-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 00/14] drm/i915: g4x/vlv/chv CxSR/wm
 fixes/cleanups
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkZp
eCBzb21lIHJlbWFpbmluZyBpc3N1ZXMgYXJvdW5kIHBsYW5lIHVwZGF0ZXMgdnMuIEN4U1Igb24K
Z21jaCBwbGF0Zm9ybXMuIEFsc28gdGhyb3cgaW4gYSBmZXcgd2F0ZXJtYXJrIGZpeGVzL2NsZWFu
dXBzLAphbmQgZmluYWxseSBmbGlwIG9uIGF0b21pYyBmb3IgZzR4IHNpbmNlIGV2ZXJ5dGhpbmcg
aXMgcmVhZHkuCgpWaWxsZSBTeXJqw6Rsw6QgKDE0KToKICBkcm0vaTkxNTogcy9jcnRjX3N0YXRl
L25ld19jcnRjX3N0YXRlLyBldGMuCiAgZHJtL2k5MTU6IEZpeCBnNHggY3hzciBlbmFibGUgY29u
ZGl0aW9uCiAgZHJtL2k5MTU6IFVzZSB1OCBjb25zaXN0ZW50bHkgZm9yIGFjdGl2ZV9wbGFuZXMg
Yml0bWFzawogIGRybS9pOTE1OiBBcHBseSBXYVVzZTMyQnBwRm9yU1JXTSB0byBlbGsgYXMgd2Vs
bCBhcyBjdGcKICBkcm0vaTkxNTogRml4IEhQTEwgd2F0ZXJtYXJrIHJlYWRvdXQgZm9yIGc0eAog
IGRybS9pOTE1OiBTcGxpdCBnNHhfY29tcHV0ZV9waXBlX3dtKCkgaW50byB0d28KICBkcm0vaTkx
NTogU3BsaXQgdmx2X2NvbXB1dGVfcGlwZV93bSgpIGludG8gdHdvCiAgZHJtL2k5MTU6IFNpbXBs
aWZ5IHVwIGc0eCB3YXRlcm1hcmsgc2FuaXRhdGlvbgogIGRybS9pOTE1OiBTaW1wbGlmeSB1cCB2
bHYgd2F0ZXJtYXJrIHNhbml0YXRpb24KICBkcm0vaTkxNTogQWRkIG1pc3NpbmcgaW52YWxpZGF0
ZSB0byBnNHggd20gcmVhZG91dAogIGRybS9pOTE1OiBGaXggZzR4L3Zsdi9jaHYgQ3hTUiB2cy4g
Zm9ybWF0L3RpbGluZy9yb3RhdGlvbiBjaGFuZ2VzCiAgZHJtL2k5MTU6IEZpeCBwaXBlIGdhbW1h
IGVuYWJsZS9kaXNhYmxlIHZzLiBDeFNSIG9uIGdtY2ggcGxhdGZvcm1zCiAgZHJtL2k5MTU6IFdy
aXRlIHdhdGVybWFya3MgZm9yIGRpc2FibGVkIHBpcGVzIG9uIGdtY2ggcGxhdGZvcm1zCiAgZHJt
L2k5MTU6IEVuYWJsZSBhdG9taWMgYnkgZGVmYXVsdCBvbiBjdGcvZWxrCgogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAgODkgKysrKy0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcnYuYyAgICAgICAgICAgICAgfCAgIDcgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX3BtLmMgICAgICAgICAgICAgIHwgMjMyICsrKysrKysrKystLS0tLS0tLS0K
IDQgZmlsZXMgY2hhbmdlZCwgMTkzIGluc2VydGlvbnMoKyksIDEzOSBkZWxldGlvbnMoLSkKCi0t
IAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
