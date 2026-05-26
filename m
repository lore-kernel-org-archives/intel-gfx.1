Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E14CD5BC8
	for <intel-gfx@archiver.kernel.org>; Tue, 26 May 2026 14:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B334C10E48B;
	Tue, 26 May 2026 14:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpnSf/XP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0F10E48B
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 May 2026 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779804442; x=1811340442;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xH5xGLD2yVhN3CPfj4B6d76pLue48/cO+xZRlrtQ1Ng=;
 b=DpnSf/XP5wo8kV6oQJZpItCDVAttRkCCbhJLpghH8teXrvLpclLKjGrv
 ZyFFdS9sdVvc7W03GOBW5f+mt5VWDZWqLheb7/aMYGA3d05ML3NNmmRV4
 iAE+2iRjjxGc6y7xL+XgqCd3k78sK9kpmt6aNzuXxv5zogsFuej9HQGlQ
 gVmuyxLDcUj/SBvB/fF/9ZbOY+hze3lxEAjsn1S+Lf6UGDDSI3lCJQ6P3
 sjTbS3htbNOwm12NFKxX+SFHaUEVdAso9fm+zrusg63Kioy1zCvnK9k2w
 k3YXdwgmHeOBrBp71xcKlDiz3SB5tYjYXtwHKoRb6jZIcoXuXHQkHTzc/ g==;
X-CSE-ConnectionGUID: mCfpvTYlQdOWV6x6VQXLYA==
X-CSE-MsgGUID: kxmSW4spRQ6vdXdAJB4irQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91725684"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91725684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:07:21 -0700
X-CSE-ConnectionGUID: PuO5oFr5QaiYMl55OmGy5g==
X-CSE-MsgGUID: YdYyiE7VQfGBpsnLr3cTxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="243757296"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:07:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: relocate intel_hpd_cancel_work() call
In-Reply-To: <ad9f755c-7beb-c72f-a81c-8f4c624219c9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260516101852.1373108-1-jani.nikula@intel.com>
 <ad9f755c-7beb-c72f-a81c-8f4c624219c9@intel.com>
Date: Tue, 26 May 2026 17:07:17 +0300
Message-ID: <99258a121698344114428db2435c2d558fbe941a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 26 May 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On Sat, 16 May 2026, Jani Nikula wrote:
>> The i915 and xe calls to display, in particular for
>> probe/cleanup/suspend/resume, need to be unified. It does not help to
>> have the related calls scattered around. As a small step forward,
>> relocate the intel_hpd_cancel_work() call from intel_irq_uninstall() to
>> i915_driver_remove().
>>
>> Note that the other intel_irq_uninstall() call sites don't need the
>> call, as they're on error paths where hotplug hasn't been enabled yet.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Thanks, pushed to din.

BR,
Jani.

--=20
Jani Nikula, Intel
