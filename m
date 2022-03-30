Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AEDC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Mar 2022 09:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588910EE2A;
	Wed, 30 Mar 2022 09:53:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1149F10EE2A
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Mar 2022 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648634006; x=1680170006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N8LturUrJfRcPdznQpmrIxzRsSJuXGsrStM8+gu+av0=;
 b=O4u+hV5Qy7st1pD0ZOPqGgfd6aeq65tVf+gX8GVQ5bsSIcIUwR5VZrAS
 rcuaB/2SmDPULZYcylBKUyXVbFAnQ30SMdnkzyc1NUmOC9mf9CSOmyHQP
 zWi3q4ZnirOatPA9JIxZ7D+oeIm7GYweOYz0bU1kOtlALTBT0V9E7vKFl
 LbwWpoXCt+13gU7UyVzGDXUW16nhxFYvof3brZ8yv8eggUEjdi8tpzeO/
 qx9ZmtY2GiAyCIuLAQIbS7td7c3VbgTchc3eDREQHnAIuMt1ZErDA9K0B
 +pJzatLK1U8kTDxZHYzuCKphXWqhVsRhnA7YgfBywjhPs63vSQo3tQOXl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258334434"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="258334434"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 02:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565468555"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga008.jf.intel.com with SMTP; 30 Mar 2022 02:53:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Mar 2022 12:53:22 +0300
Date: Wed, 30 Mar 2022 12:53:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <YkQokpy3cuXgXjnf@intel.com>
References: <20220315233856.30255-1-manasi.d.navare@intel.com>
 <YjODhPSLKXsOfWGv@intel.com>
 <20220317190541.GA5382@labuser-Z97X-UD5H>
 <YjOIiM+3GrKETf3a@intel.com>
 <20220330000034.GA30948@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220330000034.GA30948@labuser-Z97X-UD5H>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/: Refactor hsw_crtc_enable
 for bigjoiner cleanup
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 05:00:39PM -0700, Navare, Manasi wrote:
> Hi Ville,
> 
> I was looking at your suggestion of extracting the per pipe stuff out.
> Currently in hsw_crtc_enable: the Only non per pipe stuff which gets enabled for the encoders is :
> encoder specific is pre_pll_enable(), enable_shared_dpll, encoders_pre_enable and configure_cpu_transcoder() - All of this 
> can be put in a function hsw_encoder_configure() or something that can still be called from with hsw_crtc_enable

I don't see a need to move that stuff anywhere. Just leave it
in hsw_crtc_enable() IMO.

> 
> Then the remaining can go into a per pipe function that can be called for each slave pipe

This is what I have been suggesting.

But I think there's also some per-pipe stuff currently in the
the encoder hooks, and some of that is only done for the master
there whereaas the slave part I think are somewhere else. We
should attempt to fix that as well so that every step is done
in a consistent manner for every pipe be it master or slave.

-- 
Ville Syrjälä
Intel
