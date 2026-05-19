Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D419CD4F57
	for <intel-gfx@archiver.kernel.org>; Tue, 19 May 2026 11:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F5D10EC69;
	Tue, 19 May 2026 11:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxfsC7PY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AD910EC69
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 May 2026 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779190401; x=1810726401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4JAuKRNWaFkuq+F8IvCgLGTzy9gPajUfgTB1hC6U/ko=;
 b=IxfsC7PYSas44dO5YbuukTK9c2VWPAdigNkXp9MpwKLa9s1hMtZ/GWg3
 ww+qjX7xd+Nqdpxizm22T5d2fmuQcfBbcYMZunxhLYnsOGrzJfaKEnNr+
 ei6qh3KX1ypVTUQF4Cwo1r5GOkgv7pe7W5UR0UVod5JzZPtLfb6OSnBx1
 AQFTKF8V/Nufsg+eYx1fcwGzvZe8kZbqWTD7fEW8gt1oKqVHp5Ax7mhnr
 iP4VEDtmJP0RevHx7INhh63gIxiMNbdPCui83EwHo2PO/OehpKy1Uh/Hv
 WDPhQ+UfPvlVSfJIiKDJHQVOGHdJkvg9uc0PnJjGnzbhWOS58p7cgkUzw w==;
X-CSE-ConnectionGUID: 4p0eIfrTRFGETloqehAG8w==
X-CSE-MsgGUID: HGRUYnhkT1ed+BtBlQJUFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80185368"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80185368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:33:21 -0700
X-CSE-ConnectionGUID: 0RmcO8ofT3S9D9XKYchs2g==
X-CSE-MsgGUID: TzQhhJ/nQJeLLG4N8G3o3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="240000604"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.15])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:33:19 -0700
Date: Tue, 19 May 2026 13:33:15 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v10 0/2] drm/i915/selftests: Use safe userspace memory
 for mappings
Message-ID: <agxKe1B6nn1yIWNC@ashyti-mobl2.lan>
References: <20260508080214.1979686-1-krzysztof.karas@intel.com>
 <agxKUQDuDthp2WLD@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxKUQDuDthp2WLD@ashyti-mobl2.lan>
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

> > Krzysztof Karas (2):
> >   drm/i915/selftests: Prevent userspace mapping invalidation
> >   drm/i915/selftests: Run vma tests only if current->mm is present
> 
> merged in drm-intel-gt-next.

with the changes we agreed and the suggestion from Michal.

Andi
