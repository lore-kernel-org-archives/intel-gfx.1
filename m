Return-Path: <SRS0=qSOt=J7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12163C43461
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 14:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4917613C4
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 14:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4917613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E956EB1A;
	Tue,  4 May 2021 14:56:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8E6EB18;
 Tue,  4 May 2021 14:56:11 +0000 (UTC)
IronPort-SDR: oAn4b9/Ep1pm5UUTarJrbI5h7ufdeGWjrFyCvsLDGtDfkr5atkxUG7vh4vtzSoSo1UDFjRF95O
 C5FMSmlXWTOQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="259280363"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="259280363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 07:56:09 -0700
IronPort-SDR: a5y6u8eLfzoTlmH3RBbBzZbslDtwNu7smkGG46CpEjFPkGRJgDXIeOdVLYasTJF4VjNXIVCdqz
 Cr04KJebwGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="531088023"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 04 May 2021 07:56:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 04 May 2021 17:56:03 +0300
Date: Tue, 4 May 2021 17:56:03 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <YJFgg0IQ6Csluoxu@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/9] drm/i915: Associate ACPI connector
 nodes with connector entries
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

SGkgQW5keSwKCj4gPiArLyogTk9URTogVGhlIGNvbm5lY3RvciBvcmRlciBtdXN0IGJlIGZpbmFs
IGJlZm9yZSB0aGlzIGlzIGNhbGxlZC4gKi8KPiA+ICt2b2lkIGludGVsX2FjcGlfYXNzaWduX2Nv
bm5lY3Rvcl9md25vZGVzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQo+ID4gK3sKPiA+
ICsgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3JfbGlzdF9pdGVyIGNvbm5faXRlcjsKPiA+ICsg
ICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSAmaTkxNS0+ZHJtOwo+ID4gKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlICprZGV2ID0gJmRybV9kZXYtPnBkZXYtPmRldjsKPiA+ICsgICAgICAg
c3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSA9IE5VTEw7Cj4gPiArICAgICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4gPiArICAgICAgIHN0cnVjdCBhY3BpX2RldmljZSAq
YWRldjsKPiA+ICsKPiA+ICsgICAgICAgZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZHJt
X2RldiwgJmNvbm5faXRlcik7Cj4gPiArICAgICAgIGRybV9mb3JfZWFjaF9jb25uZWN0b3JfaXRl
cihjb25uZWN0b3IsICZjb25uX2l0ZXIpIHsKPiA+ICsgICAgICAgICAgICAgICAvKiBBbHdheXMg
Z2V0dGluZyB0aGUgbmV4dCwgZXZlbiB3aGVuIHRoZSBsYXN0IHdhcyBub3QKPiA+IHVzZWQuICov
Cj4gPiArICAgICAgICAgICAgICAgZndub2RlID0gZGV2aWNlX2dldF9uZXh0X2NoaWxkX25vZGUo
a2RldiwgZndub2RlKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAoIWZ3bm9kZSkKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+IAo+IFdobyBpcyBkcm9wcGluZyByZWZlcmVuY2Ug
Y291bnRpbmcgb24gZndub2RlID8KPiAKPiBJ4oCZbSBpbiB0aGUgbWlkZGxlIG9mIGEgcGlsZSBv
ZiBmaXhlcyBmb3IgZndub2RlIHJlZmNvdW50aW5nIHdoZW4KPiBmb3JfZWFjaF9jaGlsZCBvciBn
ZXRfbmV4dF9jaGlsZCBpcyB1c2VkLiBTbywgcGxlYXNlIGRvdWJsZSBjaGVjayB5b3UgZHJvcAo+
IGEgcmVmZXJlbmNlLgoKU29ycnkgQW5keS4gVGhpcyBwYXRjaCBpcyBmcm9tIHRpbWUgYmVmb3Jl
IHRoZSBzb2Z0d2FyZSBub2RlcwppbXBsZW1lbnRhdGlvbiBvZiB0aGUgZ2V0X25leHRfY2hpbGQg
Y2FsbGJhY2sgaGFuZGxlZCB0aGUgcmVmIGNvdW50aW5nCnByb3Blcmx5LgoKQnIsCgotLSAKaGVp
a2tpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVs
LWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
