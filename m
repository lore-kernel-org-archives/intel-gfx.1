Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5291C4363A
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 18:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54CE20770
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 18:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B54CE20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7EB6ED07;
	Tue, 20 Oct 2020 18:09:59 +0000 (UTC)
X-Greylist: delayed 16570 seconds by postgrey-1.36 at gabe;
 Tue, 20 Oct 2020 18:09:57 UTC
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7926ECF9
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2020 18:09:57 +0000 (UTC)
Date: Tue, 20 Oct 2020 18:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603217395;
 bh=1f6jBppJKscJJn1xROKe6AWEI0Cne3tqfefXgDy95uo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MzznOoY/xCkUT0wCmahzgSIcslQFPNbM+5TU8f5XGVUordYYgSpec2aGCJmNkTy2B
 fY7SqNRPamjKfHAuRwOTgkJINE68lXBrEhB1qPSsLzhDbKDqrHlto2PJNl+kTSJVTs
 VHWALIfOjN3xAtWoMIWw1OhHX5JPWuYbMB3WsC3dqWnO0azDNSwdVVQnpJreIelKQt
 o0QOq/Aa1WLmJukbywEGJYgz2SSfq3Iq2wKGaAYelufcg8rhesObVJdxhFlktK3ATg
 9o+2AzB29NSeF5R/GPe4mAmrmzH9AWZjflhNm1rMcpkiHjtUOLhh19H0kzhkxmxUpi
 1APTcMv1VseNA==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <K04u1xTGpYeMzDUUMi5_UJ3oB-sv3KiG76J5ovQ5RuQCnyIm594KncQxp-oT5kibk6U1bzHuvaoK4nVqASe0GV-u98bZTpAS1sYNpDMUmo0=@emersion.fr>
In-Reply-To: <20201020161427.6941-2-pankaj.laxminarayan.bharadiya@intel.com>
References: <20201020161427.6941-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20201020161427.6941-2-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v7 1/4] drm: Introduce plane and CRTC
 scaling filter properties
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <mripard@kernel.org>,
 "daniels@collabora.com" <daniels@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

For the docs:

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
