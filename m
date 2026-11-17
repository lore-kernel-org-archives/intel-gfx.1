Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26220606A32A
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2026 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgK+aJpm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19A110F761;
	Tue, 17 Nov 2026 16:30:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3C610F7F6
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794933007; x=1826469007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=48qAC6hjDvoPA+ktoaJTaO+V6uH0b+IsTqAcZEORYaY=;
 b=kgK+aJpmUN9s4FFrqFkpbbE6DLBbR2qMhyi4JpGNCGx1A9yPyf7aS++C
 GTQWEqtAA0/LRXz5fUUU7Wz0Hkoz89JrD9G36cV+ErD63MbPLi8wudw1n
 GFO/sJG13mTmKZaZtlVXl4NFFQvsOE9hBB4KzkhzhLpfVbSWB6LmRDEg3
 et6cVbdxRTS1nGFwl7Sepd+YcR0ipIOTK9FqeQubwk6fgbpT0Z3kPCkmd
 e9zGrNSJPBeKUBMQ/IzFDdflZImFZtSGwO4gWkdnGsaabb/4C+ZqWcSwG
 AAsRousWfuVlXRKa5tk6h4eiy3VMP/0WQL5uuNgjwuJ2y67YBhir07hKO g==;
X-CSE-ConnectionGUID: 063UJc0NRI+po/DQmeAKhw==
X-CSE-MsgGUID: 7NdFnGFLSua/Q3Sh2zBehQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3603447"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3603447"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:30:06 -0800
X-CSE-ConnectionGUID: nI/Xu1yWRf6Trta/CRmj2g==
X-CSE-MsgGUID: bKfXSaFNQr62hRPhJvftPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10134016"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:30:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Main Maximilian (BhP/TEF-EAT13)" <Maximilian.Main@de.bosch.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "patrik.jakobsson@intel.com" <patrik.jakobsson@intel.com>, "Schoellhorn
 Martin (BhP/TEF-EAT13)" <Martin.Schoellhorn@de.bosch.com>
Subject: Re: [PATCH] drm/i915/display: Add CH7511 ignore interlane align bit
 quirk for Axiomtek PICO841 (Bosch mPad)
In-Reply-To: <BR0PR10MB43211421F7CC2B157EF79F0472D9722@BR0PR10MB432114.EURPRD10.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <BR0PR10MB43211421F7CC2B157EF79F0472D9722@BR0PR10MB432114.EURPRD10.PROD.OUTLOOK.COM>
Date: Tue, 17 Nov 2026 18:30:01 +0200
Message-ID: <d2e48084ae0385794669ae5141cff9095ac32a93@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026, "Main Maximilian (BhP/TEF-EAT13)" <Maximilian.Main@de.bosch.com> wrote:
> Hello Intel Team,
>
> Since kernel 6.11, the internal display on the Bosch mPad (which is
> built on an Axiomtek PICO841 industrial single-board computer) suffers
> from endless link retraining loops. This causes the panel to
> power-cycle/flicker continuously every 2 seconds.

Please file i915 issues as described at [1].

BR,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



-- 
Jani Nikula, Intel
