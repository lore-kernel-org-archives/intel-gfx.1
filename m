Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129F1CAC598
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Sep 2025 10:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8182310E6EB;
	Tue, 16 Sep 2025 10:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bCB7aUI8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77F10E6EB
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Sep 2025 10:41:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A1C68600AE;
 Tue, 16 Sep 2025 10:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE1EC4CEEB;
 Tue, 16 Sep 2025 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758019317;
 bh=AU4jUxK/mQseaXnTxulo4sruAtv5VQoPr6ktnErkto0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCB7aUI8LipqmEvMZgxYyt2hC1chVeyw5PKLZofnNC7dffqig9yQHW3zy32pW8xgn
 tzEs7YgFz5gt54Bktf5fapvxDRJsDg5i9onmoejPoG36/miZebbmLgvANoZXJjuob0
 ZOH1Dplm9HxtpIwSlbiWhjVFTsBUxk26PzfYat/hQiS3xpIcLGlIc4GRfIakuKpi92
 vhB0DC8UWomRBHd8v+UP0upSevW6KE+iKnrKfOmaiQ/d/KLgSYcTAWDehgp+BS22f8
 /nM59+yUguznvfY8RsF331wHBseToYM0WMli/Di8Sc0b1ibGZ0/+6vXe1v2dU+VkoA
 tE9+1B9esjcUQ==
Date: Tue, 16 Sep 2025 12:41:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3 0/5] drm: Miscellaneous fixes in drm code
Message-ID: <ujmn35bh2gknev3aibfz7zcc3biknnnkrw6aejtt5kvfd22w7x@ggniulqi4o42>
References: <cover.1757576103.git.krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757576103.git.krzysztof.karas@intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Krzysztof,

with that list of people Cc'ed it's probable that the series
won't reach the right people.

Please Cc the people you have marked as "CC:" in your commit,
including the kernel stable mailing list (git-send-email would
take care of it unless you have explicitely added the
"suppress-cc=all" flag from your git-send-email).
Inclide the dri-devel mailing list also for intel-gfx patches
and, finally, the drm maintainers responsible for applying the
patches (you can rely, but not fully trust, get_maintainer.pl).

Thanks,
Andi

On Tue, Sep 16, 2025 at 06:32:21AM +0000, Krzysztof Karas wrote:
> v3:
>  * Change the casts in the last patch in the series.
> 
> v2 (Jani Nikula):
>  * Remove i915 patches from drm series.
>  * Split the last patch into 3 separate changes.
> 
> Krzysztof Karas (5):
>   drm: Avoid suspicious operations in drm_fb_dma_get_gem_addr()
>   drm: Do not attempt to round_up() zeros in drm_suballoc_try_alloc()
>   drm: Avoid undefined behavior on u16 multiplication in 
>     drm_vram_helper_mode_valid_internal()
>   drm: Avoid undefined behavior on u16 multiplication  in
>     mipi_dbi_dev_init()
>   drm: Avoid undefined behavior on u16 multiplication in 
>     drm_crtc_vblank_helper_get_vblank_timestamp_internal()
> 
>  drivers/gpu/drm/drm_fb_dma_helper.c   | 7 +++++--
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c        | 2 +-
>  drivers/gpu/drm/drm_suballoc.c        | 6 ++++--
>  drivers/gpu/drm/drm_vblank.c          | 2 +-
>  5 files changed, 12 insertions(+), 7 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> -- 
> Best Regards,
> Krzysztof
