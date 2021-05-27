Return-Path: <SRS0=HRyj=KW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B6CC4707F
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 10:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEBF76113E
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 10:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEBF76113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8666EE72;
	Thu, 27 May 2021 10:49:02 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC296EE73
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 10:49:01 +0000 (UTC)
Date: Thu, 27 May 2021 10:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1622112539;
 bh=5OzA3IKwQBhMiFfPZ5xOr25zCcrDR+bk3NBhnmg8yY8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jv8EYBDYI54GtdQW4+LQtOmy1CHqvvC2PPxNAGe/UKS9H16FDw1tpha38xaaM6kPO
 q4vM8q6nJmFy6+dLsWAkmLUSYA7xikFjyVQoRDLt2k6VGFXPQsvyh9hq+flaQ9u1yi
 ohVde07iN0BclUzfzaxa8nuURRfnSIdaBRdi0L61pjqh/3Y2uU3QOV+gN6sYzWRhDh
 gjJYEV2BTFdyf0vN9exmX2JLCMCTmo6ZXhnSq+c1GqYaGhE2qQxrFMuEuWk1lBQiTg
 eFWf7TJdu2pQtPDH91fdtAsizMRKOXRUeefwN2Z3LPX7y942Kv7P/6RJS+LVZAboy2
 Xk70dRqr5jt7Q==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Message-ID: <UhXviIJwnJG8qWOGYpAwgqll4W4TPSjVIFdG72MzhY4T2u7xS_Ql7OY-xlkfTR1HIoZ7-U8UhfqDsj62JIu98ESf_CfncvWougxT8JKm0ik=@emersion.fr>
In-Reply-To: <YK91kB0ikqxurHN1@phenom.ffwll.local>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
 <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
 <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
 <a9de44fc-aa7c-60d7-d7ed-2229d41fb306@amd.com>
 <YK91kB0ikqxurHN1@phenom.ffwll.local>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thursday, May 27th, 2021 at 12:33 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > The sync_file is also import/exportable to a certain drm_syncobj timeline
> > point (or as binary signal). So no big deal, we are all compatible here :)
> > I just thought that it might be more appropriate to return a drm_syncobj
> > directly instead of a sync_file.
>
> I think another big potential user for this is a vk-based compositor which
> needs to interact/support implicit synced clients. And compositor world I
> think is right now still more sync_file (because that's where we started
> with atomic kms ioctl).

Yeah, right now compositors can only deal with sync_file. I have a
Vulkan pull request for wlroots [1] that would benefit from this, I
think.

Also it seems like drm_syncobj isn't necessarily going to be the the
sync primitive that ends them all with all that user-space fence
discussion, so long-term I guess we'll need a conversion anyways.

[1]: https://github.com/swaywm/wlroots/pull/2771

> Plus you can convert them to the other form anyway, so really doesn't
> matter much. But for the above reasons I'm leaning slightly towards
> sync_file. Except if compositor folks tell me I'm a fool and why :-)

sync_file is fine from my PoV.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
