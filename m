Return-Path: <SRS0=/3Pa=EQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE34BC4741F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 17:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CDA2064B
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 17:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CDA2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B8089B7D;
	Tue, 10 Nov 2020 17:56:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8283889B95
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 17:56:32 +0000 (UTC)
IronPort-SDR: B0ulH1rRlVMOcVOXF8zwaXI4P8gbVSJhSImoo3l+yvN5ZhsB4dsajyklm2WW7exjxwr4bwYlzZ
 XEFgEDjk/oFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="170128425"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="170128425"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 09:56:30 -0800
IronPort-SDR: poZNPbkxPkgq8kvn2CGw+5mpPG+hWPKE6bB9bzmILlOxyHUu0cIDqe12tXG8iRs5zjhRb/dmqX
 /mXAuHB2eH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="308148240"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 10 Nov 2020 09:56:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Nov 2020 19:56:27 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 10 Nov 2020 19:56:24 +0200
Message-Id: <20201110175624.3524-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110175624.3524-1-ville.syrjala@linux.intel.com>
References: <20201110175624.3524-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915: Fix checkpatch warns in cursor
 code
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkVs
aW1pbmF0ZSBjaGVja3BhdGNoIHdhcm5pbmdzIGZyb20gaW50ZWxfY3Vyc29yLmM6CldBUk5JTkc6
IFByZWZlciAndW5zaWduZWQgaW50JyB0byBiYXJlIHVzZSBvZiAndW5zaWduZWQnCldBUk5JTkc6
IFByZWZlciAndW5zaWduZWQgaW50JyB0byBiYXJlIHVzZSBvZiAndW5zaWduZWQnCldBUk5JTkc6
IFBvc3NpYmxlIHJlcGVhdGVkIHdvcmQ6ICdieScKClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2N1cnNvci5jCmluZGV4IGQzMDdjNThkYjhmMS4uMjY5N2NjOWRlZGM5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMKQEAgLTQ3Nyw4
ICs0NzcsOCBAQCBzdGF0aWMgdm9pZCBpOXh4X3VwZGF0ZV9jdXJzb3Ioc3RydWN0IGludGVsX3Bs
YW5lICpwbGFuZSwKIAl1bnNpZ25lZCBsb25nIGlycWZsYWdzOwogCiAJaWYgKHBsYW5lX3N0YXRl
ICYmIHBsYW5lX3N0YXRlLT51YXBpLnZpc2libGUpIHsKLQkJdW5zaWduZWQgd2lkdGggPSBkcm1f
cmVjdF93aWR0aCgmcGxhbmVfc3RhdGUtPnVhcGkuZHN0KTsKLQkJdW5zaWduZWQgaGVpZ2h0ID0g
ZHJtX3JlY3RfaGVpZ2h0KCZwbGFuZV9zdGF0ZS0+dWFwaS5kc3QpOworCQlpbnQgd2lkdGggPSBk
cm1fcmVjdF93aWR0aCgmcGxhbmVfc3RhdGUtPnVhcGkuZHN0KTsKKwkJaW50IGhlaWdodCA9IGRy
bV9yZWN0X2hlaWdodCgmcGxhbmVfc3RhdGUtPnVhcGkuZHN0KTsKIAogCQljbnRsID0gcGxhbmVf
c3RhdGUtPmN0bCB8CiAJCQlpOXh4X2N1cnNvcl9jdGxfY3J0YyhjcnRjX3N0YXRlKTsKQEAgLTUw
Nyw3ICs1MDcsNyBAQCBzdGF0aWMgdm9pZCBpOXh4X3VwZGF0ZV9jdXJzb3Ioc3RydWN0IGludGVs
X3BsYW5lICpwbGFuZSwKIAkgKiBjdXJzb3IgdGhhdCBkb2Vzbid0IGFwcGVhciB0byBtb3ZlLCBv
ciBldmVuIGNoYW5nZQogCSAqIHNoYXBlLiBUaHVzIHdlIGFsd2F5cyB3cml0ZSBDVVJCQVNFLgog
CSAqCi0JICogVGhlIG90aGVyIHJlZ2lzdGVycyBhcmUgYXJtZWQgYnkgYnkgdGhlIENVUkJBU0Ug
d3JpdGUKKwkgKiBUaGUgb3RoZXIgcmVnaXN0ZXJzIGFyZSBhcm1lZCBieSB0aGUgQ1VSQkFTRSB3
cml0ZQogCSAqIGV4Y2VwdCB3aGVuIHRoZSBwbGFuZSBpcyBnZXR0aW5nIGVuYWJsZWQgYXQgd2hp
Y2ggdGltZQogCSAqIHRoZSBDVVJDTlRSIHdyaXRlIGFybXMgdGhlIHVwZGF0ZS4KIAkgKi8KLS0g
CjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
