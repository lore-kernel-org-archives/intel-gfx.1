Return-Path: <SRS0=YXNx=ED=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8517CC388F7
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0050424844
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0050424844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228A66E598;
	Wed, 28 Oct 2020 21:33:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DAB6E58B
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 21:33:33 +0000 (UTC)
IronPort-SDR: DpEaZfBEOfpnLyx7OADETHy87Yk0wgu15wWFU4LTeBkj6Zo9guKnryClGfpzfumcIm6X4sgjQz
 6Ye6EWsq8jbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="253041492"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="253041492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 14:33:25 -0700
IronPort-SDR: V1xGxOV6x3U9yuFKhPCWPsy5ciElWwkte5YR74YFuuf9dtj3jaqxTYwJOqNrWDwlVbDbsCHQaQ
 A0Z37cIIHKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="424850363"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 28 Oct 2020 14:33:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Oct 2020 23:33:23 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Oct 2020 23:33:04 +0200
Message-Id: <20201028213323.5423-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 00/19] drm/i915: Futher cleanup around hpd
 pins and port identfiers
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
YmFzZSBvZiB0aGUgcmVtYWluaW5nIGhwZCBjbGVhbnVwIHNlcmllcy4gQWxtb3N0IHN0YXJ0ZWQK
bWVyZ2luZyBmcm9tIHRoZSBzdGFydCBidXQgdGhlbiByZWFsaXplZCBzb21lIGRnMSBzdHVmZiBs
YW5kZWQKd2hpY2ggbmVlZGVkIHNvbWUgdHdlYWtpbmcuIFNvIGZpZ3VyZWQgYmVzdCByZXBvc3Qg
dGhlIHdob2xlIHRoaW5nCm9uZSBtb3JlIHRpbWUuCgpPbmx5IGEgZmV3IHBhdGNoZXMgbWlzc2lu
ZyBhbmQgci1iIEkgdGhpbmsuCgpNYWluIGNoYW5nZXMgc2luY2UgbGFzdCB0aW1lOgotIGRnMSBj
aGFuZ2VzCi0gdXBkYXRlZCB0aGUgcmtsIHBvcnQtPmhwZCBwaW4gZnVuY3Rpb24gYXMgd2VsbAot
IEx1Y2FzJ3MgSE9UUExVR19NQVNLIHJlbmFtZQoKVmlsbGUgU3lyasOkbMOkICgxOSk6CiAgZHJt
L2k5MTU6IHMvUE9SVF9UQy9UQ19QT1JUXy8KICBkcm0vaTkxNTogQWRkIFBPUlRfVENuIGFsaWFz
ZXMgdG8gZW51bSBwb3J0CiAgZHJtL2k5MTU6IEdpdmUgRERJIGVuY29kZXJzIGV2ZW4gYmV0dGVy
IG5hbWVzCiAgZHJtL2k5MTU6IEludHJvZHVjZSBBVVhfQ0hfVVNCQ24KICBkcm0vaTkxNTogUGlt
cCBBVVggQ0ggbmFtZXMKICBkcm0vaTkxNTogVXNlIEFVWF9DSF9VU0JDbiBmb3IgdGhlIFJLTCBW
QlQgQVVYIENIIHNldHVwCiAgZHJtL2k5MTU6IFBhcmFtZXRyaXplIEJYVF9ERV9QT1JUX0hQX0RE
SSB3aXRoIGhwZF9waW4KICBkcm0vaTkxNTogSW50cm9kdWNlIEdFTjhfREVfUE9SVF9IT1RQTFVH
KCkKICBkcm0vaTkxNTogcy9wb3J0L2hwZF9waW4vIGZvciBpY3ArIGRkaSBocGQgYml0cwogIGRy
bS9pOTE1OiBzL3RjX3BvcnQvaHBkX3Bpbi8gaW4gR0VOMTFfe1RDLFRCVH1fSE9UUExVRygpCiAg
ZHJtL2k5MTU6IHMvdGNfcG9ydC9ocGRfcGluLyBpbiBpY3ArIFRDIGhvdHBsdWcgYml0cwogIGRy
bS9pOTE1OiBSZWxvY2F0ZSBpbnRlbF9ocGRfe2VuYWJsZWQsaG90cGx1Z31faXJxcygpCiAgZHJt
L2k5MTU6IFNwbGl0IGdlbjExX2hwZF9kZXRlY3Rpb25fc2V0dXAoKSBpbnRvIHRjIHZzLiB0YnQg
dmFyaWFudHMKICBkcm0vaTkxNTogRG9uJ3QgZW5hYmxlIGhwZCBkZXRlY3Rpb24gbG9naWMgZnJv
bSBpcnFfcG9zdGluc3RhbGwoKQogIGRybS9pOTE1OiBSZW5hbWUgJ3RtcF9tYXNrJwogIGRybS9p
OTE1OiBSZW1vdmUgdGhlIHBlci1wbGFmb3JtIElJUiBIUEQgbWFza2luZwogIGRybS9pOTE1OiBF
bmFibGUgaHBkIGxvZ2ljIG9ubHkgZm9yIHBvcnRzIHRoYXQgYXJlIHByZXNlbnQKICBkcm0vaTkx
NTogVXNlIEdFTjNfSVJRX0lOSVQoKSB0byBpbml0IHNvdXRoIGludGVycnVwdHMgaW4gaWNwKwog
IGRybS9pOTE1OiBHZXQgcmlkIG9mIGlieF9pcnFfcHJlX3Bvc3RpbnN0YWxsKCkKCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYyAgICB8ICAxOCArLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyAgICAgfCAgMzkgKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgIDMwICstCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCB8ICAzMCArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAgNjYgKystCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3RjLmMgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2Rpc3BsYXkuYyAgICAgICAgICAgfCAgMTUgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfaXJxLmMgICAgICAgICAgICAgIHwgNTY1ICsrKysrKysrKystLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgIHwgMTIzICsrLS0KIDkgZmls
ZXMgY2hhbmdlZCwgNTAzIGluc2VydGlvbnMoKyksIDM4NSBkZWxldGlvbnMoLSkKCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVs
LWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
