Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C71C43327
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Jul 2026 13:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB1F10F352;
	Thu,  2 Jul 2026 13:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLaRHgzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6B810F352
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782998569; x=1814534569;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=DuZTGFGDJK+iYL4DwRFUs2YGPmaZ4n3sQFImelszsL4=;
 b=XLaRHgzHXfaAKjJUxOHe3tTJCV09Z3gULIA6VJ4g7lxLXUY+6tN381l9
 sVEhiU7SCftwQ4TkinALGQsjM9y+7kgeZKQsMCZRGlqcl/WmU4+qvHvJz
 nkkiEsfpHrzM9BWHxEb19Yls/4D8iWVPs3fz2gp0jDLAIvmBkmjZw4A5N
 riIfQei51UjEaHbGL+q2LqndvvJXMNTYv7wfrxpqjfyuVNNKMgRIUuUrV
 Z2wLqw7+k5m6Vc+taoqDdj8G0VJyBdhc9/ooVi4lnlpeL5sj2bDbISphd
 xJ3F625fiZ0q0BmjUSrlQP+JfMUZ+gaNnfs6mhkyBQtJ5f0cr+oRhoZrr Q==;
X-CSE-ConnectionGUID: jRMn32fsQTK64rw88gibpg==
X-CSE-MsgGUID: Szw0BV3NTrCi1n0rB5xmKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101293161"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="101293161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:22:49 -0700
X-CSE-ConnectionGUID: nFl0ohM9RlOHTQd9pabD4w==
X-CSE-MsgGUID: ljstb2EkToC61mjLQd0uBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="257209113"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.26])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:22:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/i915/display: reduce clock_gating interface
 between core and display
In-Reply-To: <20260630090829.2778879-1-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260630090829.2778879-1-luciano.coelho@intel.com>
Date: Thu, 02 Jul 2026 16:22:43 +0300
Message-ID: <3867d5b88afe3eddf142480892344d2c24a12007@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 30 Jun 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> As a follow up to my previous clock-gating patches, this series
> reduces the interface between core and display by combining all the
> platform-specific exported functions and letting the display code
> decide what to do for each platform.
>
> To do that I created an _init_early(), to hold functions that are
> called at the beginning of the clock gating initialization and another
> one to call the later functions, namely _init_late().

As-is, this feels like forward progress, and I like the reduction of
interfaces.

But what I'm really interested in, can we take steps further, and stop
the back and forth calling of the functions between i915 and display?

For example, display hsw_disable_pc8() calls intel_clock_gating_init()
with the comment /* Many display registers don't survive PC8+ */ but
then it does so much more than just display. And it also calls back to
display.

Could i915 core call its own clock gating functions where needed, and
display call its own clock gating functions where needed, and not call
from one to the other at all? Separate the two completely, at a level or
two higher.


BR,
Jani.


-- 
Jani Nikula, Intel
