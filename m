Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8C8C36008
	for <intel-gfx@archiver.kernel.org>; Sat, 29 Mar 2025 07:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3C10E1A8;
	Sat, 29 Mar 2025 07:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORkDQQ50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BC10E1A8
 for <intel-gfx@lists.freedesktop.org>; Sat, 29 Mar 2025 07:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743232719; x=1774768719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T4KeE3pDtNqJyppuq7x4u519+/Et9sWcnD5hTV1bvak=;
 b=ORkDQQ50iR/I8iw3KILUEbGfS4b1io8ll8T3B8KQBVjk4DoJdfSJ9Kdx
 Q1pLHR3Wll7h83v/1KxCwsFz8i1ovkGEbiwIJIT2UUKeVihGCdlRBGxg6
 YX52cxaiROuHrK77PxT1Id5UQHzgkykCEa2GSyZhhsp2mypMY20ZHCZX1
 vDUfg1taNml6cGSnP1dRkRk9i7FwY8WbRTl98Z/V8oCac/iHElgUY9agn
 DiY4XynKQQciJMKiqmlPWWHplwMoTVzQm9fzPSoCwHuDO36TFioIHfAYI
 z/nNg70cbqslH2OtaKYNnOjoQpQUe/XY9YkczTVNc3kByD6HkN7XTnBZr A==;
X-CSE-ConnectionGUID: 7yOqQrjKQ4W9zPcXasg/Aw==
X-CSE-MsgGUID: jWf/DxXrTUeR7M3AhSMxQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54794265"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; d="scan'208";a="54794265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2025 00:18:39 -0700
X-CSE-ConnectionGUID: Pd0WyBo+TxmVU13ZlHVGxg==
X-CSE-MsgGUID: y8ngFBEVREqE1vXRUiCplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; d="scan'208";a="130858208"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2025 00:18:37 -0700
Date: Sat, 29 Mar 2025 08:18:33 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftest: allow larger memory allocation
Message-ID: <Z-eeySKZOXVESzy1@ashyti-mobl2.lan>
References: <2vie3dumx3ajb7lwhiotxs4wj6zcr2fq6on3ebd2vsm2qb3k6l@s5uny4fry4gr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vie3dumx3ajb7lwhiotxs4wj6zcr2fq6on3ebd2vsm2qb3k6l@s5uny4fry4gr>
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

Hi Mikolaj,

On Fri, Mar 21, 2025 at 03:02:49PM +0100, Mikolaj Wasiak wrote:
> Due to changes in allocator, the size of the allocation for

which change in the allocator?

> contiguous region is not rounded up to a power-of-two and
> instead allocated as is.

The allocator has always been rounded up instead of a power of
two round up.

> Thus, change the part of test that
> expected the allocation to fail.

Is the failure part of the test?

Andi

> Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
