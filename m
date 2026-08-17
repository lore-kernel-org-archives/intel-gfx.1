Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5589DC5B572
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 12:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62EA10E7B9;
	Mon, 17 Aug 2026 12:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0AKyVVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BD710E7B9
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786971318; x=1818507318;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rtxLFkS2w/V59WhKgWCoLv/lA23Z767AvZR5fYDo9eY=;
 b=G0AKyVVgy4wzSgt8flwEF9119rJpxrZlpd6p0etpH8+MLwWwjF+SoGwq
 tYebxLX6jAIgxA/hz6BYiSWxLqbINwRTzPjtUuq8gm2Sz8+JRWlGhuKqh
 1q1JV7UQSsIDW0ImlClURTIcThzT5o+CMl6gC+0bHwUnOQmrTVcE3vNVW
 iODcTrDGmZ+Je9pft+GMsBpPt1fABKjqCQnxkmj9XMvcUyIntB0pMrAsC
 mLsCwwf9astLe36Uamx+TTPFOMGt1I1deX94ZqvUj9JgkgMdnJBeoliS9
 MFRQFSkoVcNdtirHnDeyCUAbnNg8uktyc5CtpPzMI2kAU0gtUQtaWhuml g==;
X-CSE-ConnectionGUID: z5NW77D9Sya9yBfyp1nawQ==
X-CSE-MsgGUID: 9AYsZtrZTtm2MN0h5QBx6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91123221"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91123221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:55:18 -0700
X-CSE-ConnectionGUID: jEkqh0kSSSKbfTK39PV8Vw==
X-CSE-MsgGUID: hJg2Pr2lSzO4bJJmu3QWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="266890224"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:55:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: nomorsukses@gmail.com, regressions@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
In-Reply-To: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
Date: Mon, 17 Aug 2026 15:55:13 +0300
Message-ID: <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
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

On Thu, 06 Aug 2026, "nomorsukses@gmail.com" <nomorsukses@gmail.com> wrote:
> I would like to report a possible kernel regression affecting the
> internal display brightness on my Dell Latitude 7390.

Please file a bug as described at [1].

BR,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



-- 
Jani Nikula, Intel
