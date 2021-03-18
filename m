Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA96C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 06:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE8F64F10
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 06:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE8F64F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8C46E85E;
	Thu, 18 Mar 2021 06:51:35 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E56E558;
 Thu, 18 Mar 2021 06:51:33 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DD4C899;
 Thu, 18 Mar 2021 07:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616050291;
 bh=OLav/Aa/2rCDA1aYy29j1rYQIHc2mBshyrRFKtSkDtE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ETXnBrAYqVNh0HydaYQCo69fuMrN/pWxZ1Badqh9lWYbe9D/ou4JES4ttn4gK4qD7
 rzY4qYeOpoWx31O+CJc74W5n8yWgPP0eOxozWM/3/C4RKwfzJdIcumNPePPMfgEodb
 15IT8KwzdACVQk2xjrm5CDb6QuLgyFw2bWUbOIXw=
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20210318120221.6dc8f33b@canb.auug.org.au>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <d9a7932c-b988-905c-d1e8-2cbe10fa9f29@ideasonboard.com>
Date: Thu, 18 Mar 2021 08:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318120221.6dc8f33b@canb.auug.org.au>
Content-Language: en-US
Subject: Re: [Intel-gfx] linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
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
Cc: Menglong Dong <dong.menglong@zte.com.cn>,
 Junlin Yang <yangjunlin@yulong.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 18/03/2021 03:02, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>    drivers/gpu/drm/omapdrm/dss/dsi.c
> 
> between commit:
> 
>    690911544275 ("drm/omap: dsi: fix unsigned expression compared with zero")
> 
> from the drm-misc-fixes tree and commit:
> 
>    bbd13d6a7b2e ("drm/omap: dsi: fix unreachable code in dsi_vc_send_short()")
> 
> from the drm tree.
> 
> I fixed it up (these do basically the same thing, so I used the former
> version) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
Yes, I messed that up. I accidentally merged a fix to drm-misc-fixes, 
but almost similar fix was already in drm-misc-next. Sorry about that.

  Tomi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
