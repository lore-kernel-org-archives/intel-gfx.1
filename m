Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3FC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 27 May 2022 23:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB2B10E2C2;
	Fri, 27 May 2022 23:41:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155610E29A
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 May 2022 23:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653694890; x=1685230890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9GziycK0Nwg8xgxpw3yM8qXRvIaL6EEcDCyEVhxmLfo=;
 b=IoWESWqem1u1f9OEC66DlTFHz0WJeHvs2lcIGhIMMvejerWAyfLD+mAy
 SbKyTZwtcHFOD0ljs1m0nQpZA8UccEC4q9WblPqnwmZofjio3140O+MCU
 qPTlk7CAnpKaJqDFcd4PNFZGc5KYjv4n43J4avPmW4aGHTpqMjbKB87CL
 nYbnFskdfpMR0fkVGxRMNHrNUlx4FdfvuGjManH4seSBsSTUHqBQYZhZc
 POGynZxOBAbUPUBDbUEqbi39Hep3hc9m0VKvr5nuHi4H8AVyQ2514SLOq
 8PM9T4aViN/QvChvPAAEBndws76ZYWW+W8Gfri3ogVPvZeaqUVc9rQLR8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="335251797"
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; d="scan'208";a="335251797"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 16:41:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; d="scan'208";a="643813069"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 16:41:29 -0700
Date: Fri, 27 May 2022 16:41:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <YpFhqItqXp6GoEzi@mdroper-desk1.amr.corp.intel.com>
References: <cover.1653591227.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653591227.git.ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/3] drm/i915/gt: Expose per gt defaults
 in sysfs
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

On Thu, May 26, 2022 at 12:00:42PM -0700, Ashutosh Dixit wrote:
> Create a gt/gtN/.defaults directory (similar to
> engine/<engine-name>/.defaults) to expose default parameter values for each
> gt in sysfs. This allows userspace to restore default parameter values
> after they may have changed.

Drive-by comment:  since this is a GT-related change, I think we're
required to Cc: dri-devel as well.

And since this is new ABI, we'd need an open source userspace consumer
or a very clear explanation why this is an exception to the rule (e.g.,
if these are meant to be twiddled directly by the user rather than
accessed by userspace software).


Matt

> 
> Patch 1: Creates the gt/gtN/.defaults directory
> Patch 2: Adds per-gt RPS defaults to gt/gtN/.defaults
> Patch 3: Adds media_freq_factor to gt/gtN/.defaults
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Ashutosh Dixit (3):
>   drm/i915/gt: Create gt/gtN/.defaults for per gt sysfs defaults
>   drm/i915/gt: Expose per-gt RPS defaults in sysfs
>   drm/i915/gt: Expose default value for media_freq_factor in per-gt
>     sysfs
> 
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    | 10 ++--
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.h    |  6 ++
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 64 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    | 11 ++++
>  drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 19 ++++--
>  6 files changed, 103 insertions(+), 10 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
