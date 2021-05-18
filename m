Return-Path: <SRS0=F/h7=KN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF36C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 16:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED6361209
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 16:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED6361209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C20B6EC30;
	Tue, 18 May 2021 16:28:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674E86EC0A;
 Tue, 18 May 2021 16:28:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0A8C61209;
 Tue, 18 May 2021 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621355335;
 bh=rJWHXoFNdp4vZFFlf2wVu8qVP3eJI+kKMs6FURJto7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mz+L9Thx5wJwjW+bdjc+0+hLc9PhxwiIkU2AA002cBpRvQIpQrQb+v9iS1NtOTLUY
 732B1nvnIfRU8KxT6X8flQ4MliIBvAh9ElTsc8ESS4fRB5tkGZ6JQ4SwgrHWSI8+64
 i3F2b8FSzsZeuKfOHeRft9sWwghNWdb3NpqdvuAM=
Date: Tue, 18 May 2021 18:28:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dri-devel@lists.freedesktop.org
Message-ID: <YKPrRW+zBC8Wmjgz@kroah.com>
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: remove local storage of
 debugfs file
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 06:17:05PM +0200, Greg Kroah-Hartman wrote:
> There is no need to keep the dentry around for the debugfs kvmgt cache
> file, as we can just look it up when we want to remove it later on.
> Simplify the structure by removing the dentry and relying on debugfs
> to find the dentry to remove when we want to.
> 
> By doing this change, we remove the last in-kernel user that was storing
> the result of debugfs_create_long(), so that api can be cleaned up.
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Note, I can take this through my debugfs tree if wanted, that way I can
clean up the debugfs_create_long() api at the same time.  Otherwise it's
fine, I can wait until next -rc1 for that to happen.

thanks,

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
