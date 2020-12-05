Return-Path: <SRS0=rL+1=FJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA4C433FE
	for <intel-gfx@archiver.kernel.org>; Sat,  5 Dec 2020 01:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D8322D71
	for <intel-gfx@archiver.kernel.org>; Sat,  5 Dec 2020 01:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D8322D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE36E2BC;
	Sat,  5 Dec 2020 01:09:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792EE6E239
 for <intel-gfx@lists.freedesktop.org>; Sat,  5 Dec 2020 01:09:07 +0000 (UTC)
IronPort-SDR: 1JHOGMDb3i4VX2/ShFD6ScFkKf6p1nBU9qjtgwzyA5MVMKxgGtXgvqa17tXLIT0WylCQlFBV2U
 UEXn+iIbQ+iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="173571011"
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; d="scan'208";a="173571011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 17:09:07 -0800
IronPort-SDR: HldRSO6kxiihh1u3SOdKw5FZyWzDxBYUAb2Og6Xlk3C45mWQ5unT11NROkNb0BTye1LNPMskVx
 jlUJ6g9O1V0g==
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; d="scan'208";a="369062948"
Received: from msdesadl-mobl1.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.251.12.22])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 17:09:06 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  4 Dec 2020 17:08:34 -0800
Message-Id: <20201205010844.361880-13-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201205010844.361880-1-aditya.swarup@intel.com>
References: <20201205010844.361880-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 12/22] drm/i915/adl_s: Add vbt port and aux
 channel settings for adls
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

LSBBREwtUyBkcml2ZXIgaW50ZXJuYWwgbWFwcGluZyB1c2VzIFBPUlQgRCwgRSwgRiwgRyBmb3Ig
Q29tYm8gcGh5IEIsIEMsIEQgYW5kIEUuCi0gQWRkIEFETFMgc3BlY2lmaWMgcG9ydCBtYXBwaW5n
cyBmb3IgdmJ0IHBvcnQgZHZvIHNldHRpbmdzLgotIFNlbGVjdCBhcHByb3ByaWF0ZSBBVVggQ0gg
c3BlY2lmaWMgdG8gQURMUyBiYXNlZCBvbiBwb3J0IG1hcHBpbmcuCgpDYzogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNj
OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpDYzogTHVjYXMgRGUgTWFy
Y2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFkaXR5YSBTd2Fy
dXAgPGFkaXR5YS5zd2FydXBAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYmlvcy5jIHwgNTcgKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jCmluZGV4IDlkYzY3YzAzZmZjMC4uOGYxNjZmNDli
NmNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3Mu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYwpAQCAtMTcw
OSw4ICsxNzA5LDI2IEBAIHN0YXRpYyBlbnVtIHBvcnQgZHZvX3BvcnRfdG9fcG9ydChzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCVtQT1JUX1RDMV0gPSB7IERWT19QT1JUX0hE
TUlDLCBEVk9fUE9SVF9EUEMsIC0xIH0sCiAJCVtQT1JUX1RDMl0gPSB7IERWT19QT1JUX0hETUlE
LCBEVk9fUE9SVF9EUEQsIC0xIH0sCiAJfTsKKwkvKgorCSAqIEFsZGVybGFrZSBTIHBvcnRzIHVz
ZWQgaW4gdGhlIGRyaXZlciBhcmUgUE9SVF9BLCBQT1JUX0QsIFBPUlRfRSwKKwkgKiBQT1JUX0Yg
YW5kIFBPUlRfRywgd2UgbmVlZCB0byBtYXAgdGhhdCB0byBjb3JyZWN0IFZCVCBzZWN0aW9ucy4K
KwkgKi8KKwlzdGF0aWMgY29uc3QgaW50IGFkbHNfcG9ydF9tYXBwaW5nW11bM10gPSB7CisJCVtQ
T1JUX0FdID0geyBEVk9fUE9SVF9IRE1JQSwgRFZPX1BPUlRfRFBBLCAtMSB9LAorCQlbUE9SVF9C
XSA9IHsgLTEgfSwKKwkJW1BPUlRfQ10gPSB7IC0xIH0sCisJCVtQT1JUX1RDMV0gPSB7IERWT19Q
T1JUX0hETUlCLCBEVk9fUE9SVF9EUEIsIC0xIH0sCisJCVtQT1JUX1RDMl0gPSB7IERWT19QT1JU
X0hETUlDLCBEVk9fUE9SVF9EUEMsIC0xIH0sCisJCVtQT1JUX1RDM10gPSB7IERWT19QT1JUX0hE
TUlELCBEVk9fUE9SVF9EUEQsIC0xIH0sCisJCVtQT1JUX1RDNF0gPSB7IERWT19QT1JUX0hETUlF
LCBEVk9fUE9SVF9EUEUsIC0xIH0sCisJfTsKIAotCWlmIChJU19ERzEoZGV2X3ByaXYpIHx8IElT
X1JPQ0tFVExBS0UoZGV2X3ByaXYpKQorCWlmIChJU19BTERFUkxBS0VfUyhkZXZfcHJpdikpCisJ
CXJldHVybiBfX2R2b19wb3J0X3RvX3BvcnQoQVJSQVlfU0laRShhZGxzX3BvcnRfbWFwcGluZyks
CisJCQkJCSAgQVJSQVlfU0laRShhZGxzX3BvcnRfbWFwcGluZ1swXSksCisJCQkJCSAgYWRsc19w
b3J0X21hcHBpbmcsCisJCQkJCSAgZHZvX3BvcnQpOworCWVsc2UgaWYgKElTX0RHMShkZXZfcHJp
dikgfHwgSVNfUk9DS0VUTEFLRShkZXZfcHJpdikpCiAJCXJldHVybiBfX2R2b19wb3J0X3RvX3Bv
cnQoQVJSQVlfU0laRShya2xfcG9ydF9tYXBwaW5nKSwKIAkJCQkJICBBUlJBWV9TSVpFKHJrbF9w
b3J0X21hcHBpbmdbMF0pLAogCQkJCQkgIHJrbF9wb3J0X21hcHBpbmcsCkBAIC0yNjY3LDI3ICsy
Njg1LDQ0IEBAIGVudW0gYXV4X2NoIGludGVsX2Jpb3NfcG9ydF9hdXhfY2goc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2LAogCQlyZXR1cm4gYXV4X2NoOwogCX0KIAorCS8qCisJICog
UktML0RHMSBWQlQgdXNlcyBQSFkgYmFzZWQgbWFwcGluZy4gQ29tYm8gUEhZcyBBLEIsQyxECisJ
ICogbWFwIHRvIERESSBBLEIsVEMxLFRDMiByZXNwZWN0aXZlbHkuCisJICoKKwkgKiBBREwtUyBW
QlQgdXNlcyBQSFkgYmFzZWQgbWFwcGluZy4gQ29tYm8gUEhZcyBBLEIsQyxELEUKKwkgKiBtYXAg
dG8gRERJIEEsVEMxLFRDMixUQzMsVEM0IHJlc3BlY3RpdmVseS4KKwkgKi8KIAlzd2l0Y2ggKGlu
Zm8tPmFsdGVybmF0ZV9hdXhfY2hhbm5lbCkgewogCWNhc2UgRFBfQVVYX0E6CiAJCWF1eF9jaCA9
IEFVWF9DSF9BOwogCQlicmVhazsKIAljYXNlIERQX0FVWF9COgotCQlhdXhfY2ggPSBBVVhfQ0hf
QjsKKwkJaWYgKElTX0FMREVSTEFLRV9TKGRldl9wcml2KSkKKwkJCWF1eF9jaCA9IEFVWF9DSF9V
U0JDMTsKKwkJZWxzZQorCQkJYXV4X2NoID0gQVVYX0NIX0I7CiAJCWJyZWFrOwogCWNhc2UgRFBf
QVVYX0M6Ci0JCS8qCi0JCSAqIFJLTC9ERzEgVkJUIHVzZXMgUEhZIGJhc2VkIG1hcHBpbmcuIENv
bWJvIFBIWXMgQSxCLEMsRAotCQkgKiBtYXAgdG8gRERJIEEsQixUQzEsVEMyIHJlc3BlY3RpdmVs
eS4KLQkJICovCi0JCWF1eF9jaCA9IChJU19ERzEoZGV2X3ByaXYpIHx8IElTX1JPQ0tFVExBS0Uo
ZGV2X3ByaXYpKSA/Ci0JCQlBVVhfQ0hfVVNCQzEgOiBBVVhfQ0hfQzsKKwkJaWYgKElTX0FMREVS
TEFLRV9TKGRldl9wcml2KSkKKwkJCWF1eF9jaCA9IEFVWF9DSF9VU0JDMjsKKwkJZWxzZSBpZiAo
SVNfREcxKGRldl9wcml2KSB8fCBJU19ST0NLRVRMQUtFKGRldl9wcml2KSkKKwkJCWF1eF9jaCA9
IEFVWF9DSF9VU0JDMTsKKwkJZWxzZQorCQkJYXV4X2NoID0gQVVYX0NIX0M7CiAJCWJyZWFrOwog
CWNhc2UgRFBfQVVYX0Q6Ci0JCWF1eF9jaCA9IChJU19ERzEoZGV2X3ByaXYpIHx8IElTX1JPQ0tF
VExBS0UoZGV2X3ByaXYpKSA/Ci0JCQlBVVhfQ0hfVVNCQzIgOiBBVVhfQ0hfRDsKKwkJaWYgKElT
X0FMREVSTEFLRV9TKGRldl9wcml2KSkKKwkJCWF1eF9jaCA9IEFVWF9DSF9VU0JDMzsKKwkJZWxz
ZSBpZiAoSVNfREcxKGRldl9wcml2KSB8fCBJU19ST0NLRVRMQUtFKGRldl9wcml2KSkKKwkJCWF1
eF9jaCA9IEFVWF9DSF9VU0JDMjsKKwkJZWxzZQorCQkJYXV4X2NoID0gQVVYX0NIX0Q7CiAJCWJy
ZWFrOwogCWNhc2UgRFBfQVVYX0U6Ci0JCWF1eF9jaCA9IEFVWF9DSF9FOworCQlpZiAoSVNfQUxE
RVJMQUtFX1MoZGV2X3ByaXYpKQorCQkJYXV4X2NoID0gQVVYX0NIX1VTQkM0OworCQllbHNlCisJ
CQlhdXhfY2ggPSBBVVhfQ0hfRTsKIAkJYnJlYWs7CiAJY2FzZSBEUF9BVVhfRjoKIAkJYXV4X2No
ID0gQVVYX0NIX0Y7Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWdmeAo=
