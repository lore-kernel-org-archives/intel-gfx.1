Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D343FC433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Dec 2021 21:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD50A6E041;
	Wed,  8 Dec 2021 21:45:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C076E041
 for <intel-gfx@lists.freedesktop.org>; Wed,  8 Dec 2021 21:45:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="224824017"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="224824017"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 13:26:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="461863282"
Received: from aasyed-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.179.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 13:26:11 -0800
Date: Wed, 8 Dec 2021 13:26:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mullati Siva <siva.mullati@intel.com>
Message-ID: <20211208212610.vha6jfmnoh674kqg@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211208041215.763098-1-siva.mullati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211208041215.763098-1-siva.mullati@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Skip remap_io_mapping() for
 non-x86 platforms
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 09:42:15AM +0530, Mullati Siva wrote:
>From: Siva Mullati <siva.mullati@intel.com>
>
>Only hw that supports mappable aperture would hit this path
>vm_fault_gtt/vm_fault_tmm, So we never hit this function
>remap_io_mapping() in discrete, So skip this code for non-x86
>architectures.
>
>v2: use IS_ENABLED () instead of #if defined
>
>v3: move function prototypes from i915_drv.h to i915_mm.h
>
>v4: added kernel error message in stub function
>
>v5: fixed compilation warnings
>
>v6: checkpatch style
>
>Signed-off-by: Siva Mullati <siva.mullati@intel.com>

the change in gem/ is just adding the additional include - looking at
the other changes, drm-intel-next seems a better place to merge this
since it can be considered as part of the i915_drv.h cleanup going on.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied, thanks.

Lucas De Marchi
