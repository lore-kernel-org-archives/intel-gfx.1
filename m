Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8015C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 08:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7702920829
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 08:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="TN0Q0icJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7702920829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0AC6EA20;
	Fri, 31 Jul 2020 08:51:55 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DD56EA20
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 08:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C75DB3F54A;
 Fri, 31 Jul 2020 10:51:49 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=TN0Q0icJ; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Nw4h-85UObl; Fri, 31 Jul 2020 10:51:48 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 423353F536;
 Fri, 31 Jul 2020 10:51:46 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0A052361FD5;
 Fri, 31 Jul 2020 10:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1596185508; bh=ScqyjcXjoQUDo7gJugpFXO9uHZ8CIYHUwcgJKV+WvSY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=TN0Q0icJ71PuiACC2JpbPOFIry0//W97qSPOXsckXzfmWrfC5ey85clDTAQv0QaMM
 Vl28eXfWXJ2lbEGXRWo1XmRPGG4c92q/pAoVKp83ttX3JSAAVIxOTm1i35cqI/K7Dy
 ZsdJVkFaNgGSuO+a7JRG5C5XUgpBK6l/AOJab6MA=
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200715115147.11866-1-chris@chris-wilson.co.uk>
 <20200715115147.11866-15-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <4a6394c1-7da8-3daa-a53e-d23631fbf9ea@shipmail.org>
Date: Fri, 31 Jul 2020 10:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715115147.11866-15-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 15/66] drm/i915/gem: Break apart the early
 i915_vma_pin from execbuf object lookup
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

Ck9uIDcvMTUvMjAgMTo1MCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEFzIGEgcHJlbHVkZSB0
byB0aGUgbmV4dCBzdGVwIHdoZXJlIHdlIHdhbnQgdG8gcGVyZm9ybSBhbGwgdGhlIG9iamVjdAo+
IGFsbG9jYXRpb25zIHRvZ2V0aGVyIHVuZGVyIHRoZSBzYW1lIGxvY2ssIHdlIGZpcnN0IG11c3Qg
ZGVsYXkgdGhlCj4gaTkxNV92bWFfcGluKCkgYXMgdGhhdCBpbXBsaWNpdGx5IGRvZXMgdGhlIGFs
bG9jYXRpb25zIGZvciB1cywgb25lIGJ5Cj4gb25lLiBBcyBpdCBvbmx5IGRvZXMgdGhlIGFsbG9j
YXRpb25zIG9uZSBieSBvbmUsIGl0IGlzIG5vdCBhbGxvd2VkIHRvCj4gd2FpdC9ldmljdCwgd2hl
cmVhcyBwdWxsaW5nIGFsbCB0aGUgYWxsb2NhdGlvbnMgdG9nZXRoZXIgdGhlIGVudGlyZSBzZXQK
PiBjYW4gYmUgc2NoZWR1bGVkIGFzIG9uZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IFJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxp
biA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZngK
