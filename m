Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7A8C4363A
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 01:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88E62076B
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 01:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88E62076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BB589AB5;
	Tue,  6 Oct 2020 01:36:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77AF89AB5
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 01:36:04 +0000 (UTC)
IronPort-SDR: XtjS60jmFCn8ODB86E2q3hTH8c08ZGD/ZZMTT8UVwPdTFl4mk6vXbjFlxHTSgYUl4fiOs3KgAy
 hghvEBr2/HaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249007678"
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; d="scan'208";a="249007678"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 18:36:02 -0700
IronPort-SDR: cdT6dGp29mB0CLxN/5bWh9mvh/dB0kbT7AnCfQ9tkoJhT5+xyDNPAuOuMH2sF0nGcq8H2EC/1N
 BAxP6qK4ob7A==
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; d="scan'208";a="296829352"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 18:36:00 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 04:35:55 +0300
Message-Id: <20201006013555.1488262-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003001846.1271151-2-imre.deak@intel.com>
References: <20201003001846.1271151-2-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 1/5] drm/i915/skl: Work around incorrect BIOS
 WRPLL PDIV programming
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

VGhlIEJJT1Mgb2YgYXQgbGVhc3Qgb25lIEFTVVMtWjE3ME0gc3lzdGVtIHdpdGggYW4gU0tMIEkg
aGF2ZSBwcm9ncmFtcwp0aGUgMTAxYiBXUlBMTCBQRElWIGRpdmlkZXIgdmFsdWUsIHdoaWNoIGlz
IHRoZSBlbmNvZGluZyBmb3IgUERJVj03IHdpdGgKYml0IzAgaW5jb3JyZWN0bHkgc2V0LgoKVGhp
cyBoYXBwZW5zIHdpdGggdGhlCgoiMzg0MHgyMTYwIjogMzAgMjYyNzUwIDM4NDAgMzg4OCAzOTIw
IDQwMDAgMjE2MCAyMTYzIDIxNjggMjE5MSAweDQ4IDB4OQoKSERNSSBtb2RlIChzY2FsZWQgZnJv
bSBhIDEwMjR4NzY4IHNyYyBmYikgc2V0IGJ5IEJJT1MgYW5kIHRoZQoKcmVmX2Nsb2NrPTI0MDAw
LCBkY29faW50ZWdlcj0zODMsIGRjb19mcmFjdGlvbj01ODAyLCBwZGl2PTcsIHFkaXY9MSwga2Rp
dj0xCgpXUlBMTCBwYXJhbWV0ZXJzIChhc3N1bWluZyBQRElWPTcgd2FzIHRoZSBpbnRlbmRlZCBz
ZXR0aW5nKS4gVGhpcwpjb3JyZXNwb25kcyB0byAyNjI3NDkgUExMIGZyZXF1ZW5jeS9wb3J0IGNs
b2NrLgoKTGF0ZXIgdGhlIGRyaXZlciBzZXRzIHRoZSBzYW1lIG1vZGUgZm9yIHdoaWNoIGl0IGNh
bGN1bGF0ZXMgdGhlIHNhbWUKZGNvX2ludC9kY29fZnJhYy9kaXYgV1JQTEwgcGFyYW1ldGVycyAo
d2l0aCB0aGUgY29ycmVjdCBQRElWPTcgZW5jb2RpbmcpLgoKQmFzZWQgb24gdGhlIGFib3ZlLCBs
ZXQncyBhc3N1bWUgdGhhdCBQRElWPTcgd2FzIGludGVuZGVkIGFuZCB0aGUgSFcKanVzdCBpZ25v
cmVzIGJpdCMwIGluIHRoZSBQRElWIHJlZ2lzdGVyIGZpZWxkIGZvciB0aGlzIHNldHRpbmcsIHRy
ZWF0aW5nCjEwMGIgYW5kIDEwMWIgZW5jb2RpbmdzIHRoZSBzYW1lIHdheS4KCldoaWxlIGF0IGl0
IGFkZCB0aGUgTUlTU0lOR19DQVNFKCkgZm9yIHRoZSBwMCxwMiBkaXZpZGVyIGRlY29kaW5ncy4K
CnYyOiAoVmlsbGUpCi0gQWRkIGEgZGVmaW5lIGZvciB0aGUgaW5jb3JyZWN0IGRpdmlkZXIgdmFs
dWUuCi0gRW1pdCBvbmx5IGEgZGVidWcgbWVzc2FnZSB3aGVuIGRldGVjdGluZyB0aGUgaW5jb3Jy
ZWN0IGRpdmlkZXIgdmFsdWUuCi0gVXNlIGZhbGx0aHJvdWdoIGZyb20gdGhlIGluY29ycmVjdCBk
aXZpZGVyIHZhbHVlIGNhc2UuCi0gQWRkIHRoZSBNSVNTSU5HX0NBU0UoKXMuCgp2MzogUmV0dXJu
IDAgZnJlcSBmb3IgaW5jb3JyZWN0IGRpdmlkZXIgdmFsdWVzLiAoVmlsbGUpCgpDYzogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
SW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYyB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBsbF9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBsbF9tZ3IuYwppbmRleCBlMDg2ODRlMzQwNzguLmZmZjRlMTU0YjM5MSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcGxsX21nci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYwpAQCAtMTYwMiw5ICsx
NjAyLDE5IEBAIHN0YXRpYyBpbnQgc2tsX2RkaV93cnBsbF9nZXRfZnJlcShzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSwKIAljYXNlIERQTExfQ0ZHQ1IyX1BESVZfMzoKIAkJcDAgPSAzOwog
CQlicmVhazsKKwljYXNlIERQTExfQ0ZHQ1IyX1BESVZfN19JTlZBTElEOgorCQkvKgorCQkgKiBJ
bmNvcnJlY3QgQVNVUy1aMTcwTSBCSU9TIHNldHRpbmcsIHRoZSBIVyBzZWVtcyB0byBpZ25vcmUg
Yml0IzAsCisJCSAqIGhhbmRsaW5nIGl0IHRoZSBzYW1lIHdheSBhcyBQRElWXzcuCisJCSAqLwor
CQlkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAiSW52YWxpZCBXUlBMTCBQRElWIGRpdmlkZXIgdmFs
dWUsIGZpeGluZyBpdC5cbiIpOworCQlmYWxsdGhyb3VnaDsKIAljYXNlIERQTExfQ0ZHQ1IyX1BE
SVZfNzoKIAkJcDAgPSA3OwogCQlicmVhazsKKwlkZWZhdWx0OgorCQlNSVNTSU5HX0NBU0UocDAp
OworCQlyZXR1cm4gMDsKIAl9CiAKIAlzd2l0Y2ggKHAyKSB7CkBAIC0xNjIwLDYgKzE2MzAsOSBA
QCBzdGF0aWMgaW50IHNrbF9kZGlfd3JwbGxfZ2V0X2ZyZXEoc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmk5MTUsCiAJY2FzZSBEUExMX0NGR0NSMl9LRElWXzE6CiAJCXAyID0gMTsKIAkJYnJlYWs7
CisJZGVmYXVsdDoKKwkJTUlTU0lOR19DQVNFKHAyKTsKKwkJcmV0dXJuIDA7CiAJfQogCiAJZGNv
X2ZyZXEgPSAocGxsX3N0YXRlLT5jZmdjcjEgJiBEUExMX0NGR0NSMV9EQ09fSU5URUdFUl9NQVNL
KSAqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAppbmRleCA4OGMyMTVjZjk3ZDQuLmQ5MTE1ODM1MjZk
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCkBAIC0xMDI2MSw2ICsxMDI2MSw3IEBAIGVudW0g
c2tsX3Bvd2VyX2dhdGUgewogI2RlZmluZSAgRFBMTF9DRkdDUjJfUERJVl8yICgxIDw8IDIpCiAj
ZGVmaW5lICBEUExMX0NGR0NSMl9QRElWXzMgKDIgPDwgMikKICNkZWZpbmUgIERQTExfQ0ZHQ1Iy
X1BESVZfNyAoNCA8PCAyKQorI2RlZmluZSAgRFBMTF9DRkdDUjJfUERJVl83X0lOVkFMSUQJKDUg
PDwgMikKICNkZWZpbmUgIERQTExfQ0ZHQ1IyX0NFTlRSQUxfRlJFUV9NQVNLCSgzKQogCiAjZGVm
aW5lIERQTExfQ0ZHQ1IxKGlkKQlfTU1JT19QSVBFKChpZCkgLSBTS0xfRFBMTDEsIF9EUExMMV9D
RkdDUjEsIF9EUExMMl9DRkdDUjEpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
