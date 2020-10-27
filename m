Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A724EC388F9
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 11:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC58121655
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 11:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="MJuDE7YM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC58121655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072A189F33;
	Tue, 27 Oct 2020 11:07:17 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C529C89FA0
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 11:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 474AE3F6AD;
 Tue, 27 Oct 2020 12:07:14 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=MJuDE7YM; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyfRqutJf30Z; Tue, 27 Oct 2020 12:07:13 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2C8723F5F1;
 Tue, 27 Oct 2020 12:07:12 +0100 (CET)
Received: from Win10-768gb107.SSPE.ch.intel.com (jfdmzpr04-ext.jf.intel.com
 [134.134.137.73])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 17AEA3600BE;
 Tue, 27 Oct 2020 12:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1603796832; bh=y7dXHcLFzmC/h2y4X8Dymis/JNx1SVJm2dxo6kqvGQo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=MJuDE7YM7Bo19LELFjGCG2H5gvAI+kYYCLrRiBsRGqAfltbzxxgKZwg1/bEAcDXjh
 C9wjSp1koL7MYJ30yvS+gUYXalbz8LL6KbhjjeSqSbRRh/wU3M63beHJBPHeSSZm0v
 LWfqOzFAtin8c4DDpTZHo/IBW71953KQrPXatgY0=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
 <20201015112627.1142745-6-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <8cd56014-415b-e8ad-4288-c7d0458fb87b@shipmail.org>
Date: Tue, 27 Oct 2020 12:07:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015112627.1142745-6-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v3 05/63] drm/i915: Ensure we hold the
 object mutex in pin correctly.
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

Ck9uIDEwLzE1LzIwIDE6MjUgUE0sIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+IEN1cnJlbnRs
eSB3ZSBoYXZlIGEgbG90IG9mIHBsYWNlcyB3aGVyZSB3ZSBob2xkIHRoZSBnZW0gb2JqZWN0IGxv
Y2ssCj4gYnV0IGhhdmVuJ3QgeWV0IGJlZW4gY29udmVydGVkIHRvIHRoZSB3dyBkYW5jZS4gQ29t
cGxhaW4gbG91ZGx5IGFib3V0Cj4gdGhvc2UgcGxhY2VzLgo+Cj4gaTkxNV92bWFfcGluIHNob3Vs
ZG4ndCBoYXZlIHRoZSBvYmogbG9jayBoZWxkLCBzbyB3ZSBjYW4gZG8gYSB3dyBkYW5jZSwKPiB3
aGlsZSBpOTE1X3ZtYV9waW5fd3cgc2hvdWxkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxp
bmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
