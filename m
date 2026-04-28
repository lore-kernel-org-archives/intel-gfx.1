Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E43AFF885A
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 14:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD0710ECF8;
	Tue, 28 Apr 2026 14:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgyZGqMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E819D10ECF8
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777387651; x=1808923651;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7wh+lcA0Px+6xwJpuE5WkOMAhvVYUsIY8AGMXJkqX4Q=;
 b=bgyZGqMzPI0Sq0hC1HLemmKCD1IeHDeT762jsC+MsR0lCuo9c8lB5h6T
 6cmX9lEph2vSoK9TFjxGeXSqSw++VTWNAAi+wWHoUwVGLxY+WSG9hb3K1
 QdWgC2iE9An5yQFZL2nW7RHjTjkZWVRQJNGjpjE9AnOdYyuBFX+Ryh/1i
 tnFki33RZZ9CNGgUuClzUAfgf/8txfjntX5KM9bHJDUaAzEIoBTvbUZ3I
 OpROx64LX8SjftB+vsmVNmjf5CwscEktfU2sp4yn7e03b/nwcAbHemnh6
 lpd5z1FVHRYCkAMGoQbzdH9kSacCbIIKAGkwH8uZF897Pdz5b1foTstTQ g==;
X-CSE-ConnectionGUID: CcY6C/oeQy6uav3NdSg5og==
X-CSE-MsgGUID: ZlLJTYnRQDSZSoJtT4uI7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78409145"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78409145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:47:31 -0700
X-CSE-ConnectionGUID: T9r4+iEkRgSWg3OgvKJgHA==
X-CSE-MsgGUID: FqztJYZ9QHGAHsP8FcCMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="257522503"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:47:29 -0700
Date: Tue, 28 Apr 2026 16:47:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 krzysztof.karas@intel.com
Subject: Re: [PATCH] drm/i915: replace fetch_and_zero() with kernel xchg()
Message-ID: <afDIf6TsiQamhu03@ashyti-mobl2.lan>
References: <75ba7e77fe28617f027ae49a620df8b580cd1000.1777291964.git.sebastian.brzezinka@intel.com>
 <7d18b591154516efd9be14c643bd576678b616bc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d18b591154516efd9be14c643bd576678b616bc@intel.com>
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

Hi Jani,

On Mon, Apr 27, 2026 at 03:26:13PM +0300, Jani Nikula wrote:
> On Mon, 27 Apr 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
> > The i915 local fetch_and_zero() macro is a non-atomic
> > fetch-and-zero operation defined in i915_utils.h and duplicated in
> > display/intel_display_utils.h. Its functionality is equivalent to the
> > kernel-provided xchg().
> 
> While I dislike having the local fetch_and_zero() macro around, the
> usage does not need to be atomic, and there's no need to switch to the
> atomic xchg() at all.
> 
> Using atomic xchg() gives the wrong impression to the reader that the
> atomicity matters when it doesn't.
> 
> So that's a no for this patch.

this change was suggested by me because in a previous patch we
switched from fetch_and_zero to xchg, but then there was a need
for atomic.

I still think the change is valid whenever we think there is a
need for an atomic version of fetch_and_zero().

This patch is intended not to change any behavior, while setting
a political atomic xchg to every fetch_and_zero is actually
changing the overall behavior.

Thanks,
Andi
