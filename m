Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4DDC43461
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 16:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9352064E
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 16:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9352064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE9D6EC8F;
	Fri,  4 Sep 2020 16:50:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F372D6EC88;
 Fri,  4 Sep 2020 16:50:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 438C0106F;
 Fri,  4 Sep 2020 09:50:51 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C323F66F;
 Fri,  4 Sep 2020 09:50:51 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id D87B468324C; Fri,  4 Sep 2020 17:50:49 +0100 (BST)
Date: Fri, 4 Sep 2020 17:50:49 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200904165049.GU159988@e110455-lin.cambridge.arm.com>
References: <20200830174410.256533-1-rodrigosiqueiramelo@gmail.com>
 <20200904110918.GM159988@e110455-lin.cambridge.arm.com>
 <20200904115605.GW7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904115605.GW7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t v9 0/4] Add support for testing
 writeback connectors
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
Cc: melissa.srw@gmail.com, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDQsIDIwMjAgYXQgMDI6NTY6MDVQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBGcmksIFNlcCAwNCwgMjAyMCBhdCAxMjowOToxOFBNICswMTAwLCBMaXZpdSBE
dWRhdSB3cm90ZToKPiA+IE9uIFN1biwgQXVnIDMwLCAyMDIwIGF0IDAxOjQ0OjA2UE0gLTA0MDAs
IFJvZHJpZ28gU2lxdWVpcmEgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gCj4gPiBIaSwKPiA+IAo+ID4g
Q2FuIHRoaXMgc2VyaWVzIGJlIG1lcmdlZD8KPiAKPiBUaGFua3MgZm9yIHRoZSBwb2tlLiBJdCdz
IG1lcmdlZCBub3cuCgpDaGVlcnMhCgo+IAo+ID4gTmVpdGhlciBtZSBub3IgQnJpYW4gbWFuYWdl
ZCB0byBnZXQgYWNjZXB0ZWQKPiA+IGluIHRoZSBpLWctdCBjb21taXR0ZXJzIGxpc3QsIHNvIEkg
Y2Fubm90IHB1c2ggaXQuCj4gCj4gTGV0J3MgZml4IHRoYXQuIFBsZWFzZSBhcHBseSBpbiBnaXRs
YWIuCgpJJ3ZlIGRvbmUgdGhhdCBub3cuIFRoYW5rcyEKCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4g
Cj4gCj4gLS0gCj4gUGV0cmkgTGF0dmFsYQoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3
b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8Cnwg
Z2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAg
ICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
