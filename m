Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E2CC4363D
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 13:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF0921741
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 13:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF0921741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358B66EC9C;
	Tue, 20 Oct 2020 13:33:53 +0000 (UTC)
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600566EC9C
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2020 13:33:51 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 9F8442007F59
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2020 13:33:49 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="f8JFuCgn"
Date: Tue, 20 Oct 2020 13:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603200824;
 bh=/qrUNfD2un69gxG7TsoELDfBz6AJjk4bWWrDR11SIRo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=f8JFuCgnNviWjNP2rrge7mRkY1WE1nSs7L1IBv/xF1kqJgwpaSGwMprxWNmeKLD1R
 ajQLe3gvIGPjr551eSJJfkxW6s7Tz4mk64OwgFu0G6BZbKt3bdqnOGelUapxajOp0R
 g9vj5LGF3Uve5fvREpmC9qaEUa6SuOJ0AANVBwpQXiM8NV+WqIYoWv+K+dEqvHsqDb
 HLPPy2y4EdFOyt5katxxjEy+orKf/o+T6v9snRnWuuEhTePt4nxzl1K2+U0DnJy+Az
 +ec6xoPH7Qvsd79QZeTt+WW0LcPUdecZ/P8g4PlF8lYOsSekxGjhFwXW008J8MaYsN
 R30N/EBAw60kg==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <SPCOniYxuZnmPvS-BpjG2y_Hb_qbNbLe07PpRGY0XCmm8F4SsMsG6uEM84YRiVoLUvDrYpiIAGE6T99HNs3h4X6Vk49TVsBZna-VfgLoNlI=@emersion.fr>
In-Reply-To: <vAUfKEENNAi4ZswHsZfaOx4XnRIPIaMJkD4soWMaRs5uMwMW8gTwVDm0yMbfOSk6E8yjFanRUUe1asYjMgg-bOOOUI_pvJlcNtCQhNzR418=@emersion.fr>
References: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
 <vAUfKEENNAi4ZswHsZfaOx4XnRIPIaMJkD4soWMaRs5uMwMW8gTwVDm0yMbfOSk6E8yjFanRUUe1asYjMgg-bOOOUI_pvJlcNtCQhNzR418=@emersion.fr>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v6 0/5] Introduce drm scaling filter property
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
Cc: "daniels@collabora.com" <daniels@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lorusak@gmail.com" <lorusak@gmail.com>,
 "themagnificentmrg@gmail.com" <themagnificentmrg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tuesday, October 13, 2020 4:26 PM, Simon Ser <contact@emersion.fr> wrote:

> On Monday, October 12, 2020 8:41 PM, Pankaj Bharadiya pankaj.laxminarayan.bharadiya@intel.com wrote:
>
> > Now, Sameer has implemented Integer scaling in Kodi Retro gaming
> > framework which demonstrate how Integer scaling gives distinctive
> > look to pixel art games when played on higher resolution monitors.
> > Kodi patches are reviewed and accepted for merge now.
> > Here is the userspace patch series link:
> > https://github.com/xbmc/xbmc/pull/18194
>
> As a side note, these user-space patches hard-code the kernel enum
> values [1]. This is something which we discussed some time ago [2],
> the result of the discussion is that user-space shouldn't do that.

Sameer has submitted a pull request [1] to fix this. Thanks, this looks
good to me from a uAPI usage point-of-view!

[1]: https://github.com/xbmc/xbmc/pull/18567
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
