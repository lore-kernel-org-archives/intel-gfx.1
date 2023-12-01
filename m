Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D35C10DC1
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Dec 2023 13:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779E610E0A9;
	Mon,  4 Dec 2023 13:53:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50310E10C;
 Fri,  1 Dec 2023 16:26:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="378549819"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="378549819"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 08:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="746062462"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="746062462"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 08:26:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andy@kernel.org>) id 1r96LO-000000012MT-0Y76;
 Fri, 01 Dec 2023 18:26:22 +0200
Date: Fri, 1 Dec 2023 18:26:21 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ZWoJLSw2Up_jcuRz@smile.fi.intel.com>
References: <20231201161130.23976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201161130.23976-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 04 Dec 2023 13:53:48 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dsi: Use devm_gpiod_get() for all
 GPIOs
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 05:11:30PM +0100, Hans de Goede wrote:
> soc_gpio_set_value() already uses devm_gpiod_get(), lets be consistent
> and use devm_gpiod_get() for all GPIOs.
> 
> This allows removing the intel_dsi_vbt_gpio_cleanup() function,
> which only function was to put the GPIO-descriptors.

Fine by me, but I'm not to judge if it is a right approach or not.
In my series I have reused existing call... Anyway, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


