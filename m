Return-Path: <SRS0=amze=HI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73751C433E0
	for <intel-gfx@archiver.kernel.org>; Sat,  6 Feb 2021 02:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2274A65006
	for <intel-gfx@archiver.kernel.org>; Sat,  6 Feb 2021 02:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2274A65006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB16E6E3B7;
	Sat,  6 Feb 2021 02:10:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2A66E3B7
 for <intel-gfx@lists.freedesktop.org>; Sat,  6 Feb 2021 02:10:34 +0000 (UTC)
IronPort-SDR: ttZifcu8MwFqyhwoEBUkuM9N8gVh2OJrR+fBySm8zup86R7ZeEAAwbyyuhxMm2LSPW1jY3EOZl
 8z2C5mCua4Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="181577449"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="181577449"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 18:10:34 -0800
IronPort-SDR: y8F14SktODfNv4djSwsBeZhhib43AysMWkkFLjvCY6T7rA0GUaWLGdcSQpfFZ1K0zjCCvPHXHn
 AauCBDdk0FRw==
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="394141238"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 18:10:34 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  5 Feb 2021 18:09:12 -0800
Message-Id: <20210206020925.36729-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210206020925.36729-1-daniele.ceraolospurio@intel.com>
References: <20210206020925.36729-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 01/14] drm/i915/pxp: Define PXP component interface
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

VGhpcyB3aWxsIGJlIHVzZWQgZm9yIGNvbW11bmljYXRpb24gYmV0d2VlbiB0aGUgaTkxNSBkcml2
ZXIgYW5kIHRoZSBtZWkKb25lLiBEZWZpbmluZyBpdCBpbiBhIHN0YW5kLWFsb25lIHBhdGNoIHRv
IGF2b2lkIGNpcmN1YWxyIGRlcGVuZGVkZW5jaWVzCmJldHdlZW4gdGhlIHBhdGNoZXMgbW9kaWZ5
aW5nIHRoZSAyIGRyaXZlcnMuCgpTcGxpdCBvdXQgZnJvbSBhbiBvcmlnaW5hbCBwYXRjaCBmcm9t
ICBIdWFuZywgU2VhbiBaCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxk
YW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2k5MTVfY29t
cG9uZW50LmggICAgICAgICB8ICAxICsKIGluY2x1ZGUvZHJtL2k5MTVfcHhwX3RlZV9pbnRlcmZh
Y2UuaCB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
NDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2k5MTVfcHhw
X3RlZV9pbnRlcmZhY2UuaAoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfY29tcG9uZW50
LmggYi9pbmNsdWRlL2RybS9pOTE1X2NvbXBvbmVudC5oCmluZGV4IDU1YzNiMTIzNTgxYi4uYzFl
MmE0M2QyZDFlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9pOTE1X2NvbXBvbmVudC5oCisrKyBi
L2luY2x1ZGUvZHJtL2k5MTVfY29tcG9uZW50LmgKQEAgLTI5LDYgKzI5LDcgQEAKIGVudW0gaTkx
NV9jb21wb25lbnRfdHlwZSB7CiAJSTkxNV9DT01QT05FTlRfQVVESU8gPSAxLAogCUk5MTVfQ09N
UE9ORU5UX0hEQ1AsCisJSTkxNV9DT01QT05FTlRfUFhQCiB9OwogCiAvKiBNQVhfUE9SVCBpcyB0
aGUgbnVtYmVyIG9mIHBvcnQKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfcHhwX3RlZV9p
bnRlcmZhY2UuaCBiL2luY2x1ZGUvZHJtL2k5MTVfcHhwX3RlZV9pbnRlcmZhY2UuaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjBlZmQxNDcwMmI0YgotLS0gL2Rldi9u
dWxsCisrKyBiL2luY2x1ZGUvZHJtL2k5MTVfcHhwX3RlZV9pbnRlcmZhY2UuaApAQCAtMCwwICsx
LDQ1IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovCisvKgorICogQ29weXJp
Z2h0IMKpIDIwMjAgSW50ZWwgQ29ycG9yYXRpb24KKyAqCisgKiBBdXRob3JzOgorICogVml0YWx5
IEx1YmFydCA8dml0YWx5Lmx1YmFydEBpbnRlbC5jb20+CisgKi8KKworI2lmbmRlZiBfSTkxNV9Q
WFBfVEVFX0lOVEVSRkFDRV9IXworI2RlZmluZSBfSTkxNV9QWFBfVEVFX0lOVEVSRkFDRV9IXwor
CisjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KKwor
LyoqCisgKiBzdHJ1Y3QgaTkxNV9weHBfY29tcG9uZW50X29wcyAtIG9wcyBmb3IgUFhQIHNlcnZp
Y2VzLgorICogQG93bmVyOiBNb2R1bGUgcHJvdmlkaW5nIHRoZSBvcHMKKyAqIEBzZW5kOiBzZW5k
cyBkYXRhIHRvIFBYUAorICogQHJlY2VpdmU6IHJlY2VpdmVzIGRhdGEgZnJvbSBQWFAKKyAqLwor
c3RydWN0IGk5MTVfcHhwX2NvbXBvbmVudF9vcHMgeworCS8qKgorCSAqIEBvd25lcjogb3duZXIg
b2YgdGhlIG1vZHVsZSBwcm92ZGluZyB0aGUgb3BzCisJICovCisJc3RydWN0IG1vZHVsZSAqb3du
ZXI7CisKKwlpbnQgKCpzZW5kKShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKm1lc3Nh
Z2UsIHNpemVfdCBzaXplKTsKKwlpbnQgKCpyZWN2KShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQg
KmJ1ZmZlciwgc2l6ZV90IHNpemUpOworfTsKKworLyoqCisgKiBzdHJ1Y3QgaTkxNV9weHBfY29t
cG9uZW50X21hc3RlciAtIFVzZWQgZm9yIGNvbW11bmljYXRpb24gYmV0d2VlbiBpOTE1CisgKiBh
bmQgVEVFIGRyaXZlcnMgZm9yIHRoZSBQWFAgc2VydmljZXMKKyAqIEB0ZWVfZGV2OiBkZXZpY2Ug
dGhhdCBwcm92aWRlIHRoZSBQWFAgc2VydmljZSBmcm9tIFRFRSBCdXMuCisgKiBAcHhwX29wczog
T3BzIGltcGxlbWVudGVkIGJ5IFRFRSBkcml2ZXIsIHVzZWQgYnkgaTkxNSBkcml2ZXIuCisgKi8K
K3N0cnVjdCBpOTE1X3B4cF9jb21wX21hc3RlciB7CisJc3RydWN0IGRldmljZSAqdGVlX2RldjsK
Kwljb25zdCBzdHJ1Y3QgaTkxNV9weHBfY29tcG9uZW50X29wcyAqb3BzOworCisJLyogVG8gcHJv
dGVjdCB0aGUgYWJvdmUgbWVtYmVycy4gKi8KKwlzdHJ1Y3QgbXV0ZXggbXV0ZXg7Cit9OworCisj
ZW5kaWYgLyogX0k5MTVfVEVFX1BYUF9JTlRFUkZBQ0VfSF8gKi8KLS0gCjIuMjkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxp
bmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
