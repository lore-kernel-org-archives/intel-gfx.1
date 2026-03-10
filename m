Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE80FD2D89
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Mar 2026 13:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9DC10E6FB;
	Tue, 10 Mar 2026 13:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbNW5AXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24E510E6FB
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773149875; x=1804685875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TxgRLcnSu2TjSQoom2xl7h5MEItFWslNhhqzhAqzVDg=;
 b=XbNW5AXfXZHagXQYFbQuUQ/zviZPsEdGEFtpWEZNtApmdZC5hylvPm9k
 7NX6zFF1Fg5LGM/4RCmPpejUNbxCUBsrUoi6mdKo8cyeZeVKIfoY4TE5I
 2TKNjD7vErP/BkuP2Tc+ggeHHcTo0UTgDJau0bMbHgyRsJfxt6rkv1786
 MXafkJ10C1x0pWD1wF6Xxhsj9l8JsrjBnztFmh1FdIFHoTjT1GqTZrco5
 QqOGFWxEBFn/3jCozbFk6fiy8z7YbiXP4+PIAyqd3LEvVbuwNpf+jK76Z
 Wf3b1WTtF6dx2S2J4DMfTiIteqP2YPozsc2fsdoE9zUdNqHH6391Y/L1Y g==;
X-CSE-ConnectionGUID: Ilfk+b0bTZa2yz1CfKMqlA==
X-CSE-MsgGUID: cUZz9BuIQNyydeG7uXqVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91577904"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="91577904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:37:54 -0700
X-CSE-ConnectionGUID: jSCtev4MQ2+MbRMSyjbdKw==
X-CSE-MsgGUID: NOZrwHhGSZKSrIYOnoK4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="216895282"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.60])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:37:51 -0700
Date: Tue, 10 Mar 2026 14:37:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v7 0/2] Miscellaneous fixes in drm code
Message-ID: <abAerdMOOa8TEV0U@ashyti-mobl2.lan>
References: <20260226104033.2073002-1-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226104033.2073002-1-krzysztof.karas@intel.com>
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

Ping, is there anyone looking at these patches?

On Thu, Feb 26, 2026 at 10:40:31AM +0000, Krzysztof Karas wrote:
> v7:
>  * Rebase and add maintainers to CC;
> 
> v6 (Jani Nikula):
>  * Remove the last patch from the series;
> 
> v5 (Jani Nikula):
>  * Split first two patches;
> 
> v4:
>  * Rebase and remove unnecessary patches.
> 
> v3:
>  * Change the casts in the last patch in the series.
> 
> v2 (Jani Nikula):
>  * Remove i915 patches from drm series.
>  * Split the last patch into 3 separate changes.
> 
> Krzysztof Karas (2):
>   drm: Warn before division by 0 would occur
>   drm: Avoid suspicious operations in drm_fb_dma_get_gem_addr()
> 
>  drivers/gpu/drm/drm_fb_dma_helper.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
