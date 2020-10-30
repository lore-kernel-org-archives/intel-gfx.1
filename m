Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C8CC4363A
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 14:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886742076E
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 14:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="gYHc/Z80"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886742076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50C66EDDB;
	Fri, 30 Oct 2020 14:18:42 +0000 (UTC)
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030B6EDDB
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 14:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A32293F50F;
 Fri, 30 Oct 2020 15:18:39 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="gYHc/Z80";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NN7eGM7AzJQr; Fri, 30 Oct 2020 15:18:38 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6240C3F37D;
 Fri, 30 Oct 2020 15:18:36 +0100 (CET)
Received: from localhost.localdomain (jfdmzpr03-ext.jf.intel.com
 [134.134.139.72])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4CA6A361802;
 Fri, 30 Oct 2020 15:18:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1604067516; bh=Xl1KYt1l6+TrDFBt2Y1kdlyDB1e7fYkd8ayDs6+of1M=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=gYHc/Z80wChBPSYmtJ35LxjLMWEfQqFZoBFpmv7qA768K4dlHwZfk6TJ53SWh9Bdm
 JDJGcwgYvJ74Pmj9NNZeOGelcpOxamc5LN/Jw3VLiHhB4yvoBHyaE0L0BkOUP3bNa5
 P6l6FVK3JwDDV509ACo7u75K9E5OhtNXyl95iQ4M=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-15-maarten.lankhorst@linux.intel.com>
 <02b0d2c2-5687-03b1-7741-34a3c2c819ac@shipmail.org>
 <49e1aaa5-cf06-7e72-93e6-d744f7198bc1@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <210262c8-e5b9-8f15-b0ce-b0816eab8277@shipmail.org>
Date: Fri, 30 Oct 2020 15:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <49e1aaa5-cf06-7e72-93e6-d744f7198bc1@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 14/61] drm/i915: Reject UNSYNCHRONIZED
 for userptr
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ck9uIDEwLzMwLzIwIDExOjExIEFNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToKPiBPcCAzMC0x
MC0yMDIwIG9tIDEwOjI2IHNjaHJlZWYgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPj4gT24g
MTAvMTYvMjAgMTI6NDMgUE0sIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+Pj4gV2Ugc2hvdWxk
IG5vdCBhbGxvdyB0aGlzIGFueSBtb3JlLCBhcyBpdCB3aWxsIGJyZWFrIHdpdGggdGhlIG5ldyB1
c2VycHRyCj4+PiBpbXBsZW1lbnRhdGlvbiwgaXQgY291bGQgc3RpbGwgYmUgbWFkZSB0byB3b3Jr
LCBidXQgdGhlcmUncyBubyBwb2ludCBpbgo+Pj4gZG9pbmcgc28uCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPj4gSWZkZWZzIGRvbid0IGFwcGVhciBjb25zaXN0ZW50IHdpdGggdGhlIGNvbW1pdCBtZXNz
YWdlLiBXcm9uZyBwYXRjaCBvciBzZXBhcmF0ZSBwYXRjaD8KPj4KPj4gQWxzbyBwbGVhc2UgYWRk
IGEgZGlzY3Vzc2lvbiB3aGF0IGltcGFjdCB0aGlzIGhhcyBvbiBleGlzdGluZyB1c2VyLXNwYWNl
Lgo+Pgo+Pgo+IFJlZ2FyZGluZyBpZmRlZnMsIGFsbCB0aGUgdXNlcnB0ciBjb2RlaXMgdW51c2Vk
IHdoZW4gbW11IG5vdGlmZXJzIGFyZSBub3QgYXZhaWxhYmxlLCBzbyBJIG1hZGUgaXQgY29uZGl0
aW9uYWwgb24gdGhhdC4KClllcyBJIGhhdmUgbm90aGluZyBhZ2FpbnN0IHRoZSBjYW5nZSBpdHNl
bGYuIEJ1dCB0aGlzIGlzIGEgZml4dXAgY2hhbmdlIAp0aGF0IGhhcyBub3RoaW5nIHRvIGRvIHdp
dGggcmVqZWN0aW5nIFVOU1lOQ0hST05JWkVEIGFuZCB0aHVzIGl0IHNob3VsZCAKYmUgbW92ZWQg
dG8gYSBzZXBhcmF0ZSBjb21taXQgb3IgcGVyaGFwcyBzcXVhc2hlZCBpbiB0aGUgYmlnIHVzZXJw
dHIgCnJld3JpdGU/CgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ2Z4Cg==
