Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE0FCA5FA5
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 12:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EA310EEB0;
	Tue, 29 Sep 2026 12:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItxVnuUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F9D10EEA4
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790685839; x=1822221839;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cuM1T8h7bHTj89KMM6sYpPBuNUQ6/HEeTbmta0xoST4=;
 b=ItxVnuUN0mfOJ1tSGs/2CT8SYoWRWtek4N/dBPEHwmc+fUckbBc6Joes
 YBMR2l9CnW56PqW65asDr3Yb/Usbq5KsbqowTHiFWoLWcg3kVzIOSQuc2
 NQt/gnJ7rCR6wbtRH/3cx3DqJctKob1przTVF0hfgud9A1Geak09HQOq7
 4v/+tn3XZDtRV1lm6h78Yj1SpLCSFpsITfcnlkQC/QMz6oAQ64D5XSKZp
 CAti5Rf8kgosKbqeXzryyNc8C+wedWJ1X9gesaLmc1AuGtf7PJSIetmOd
 DNT6NzlgjfzILy06yueF/3z6Oa+ehiyhlX8roN9qU/2LhsXX4iIXUOL6k w==;
X-CSE-ConnectionGUID: Nu4btz+IQK+tCdPWzzEMgg==
X-CSE-MsgGUID: WJpXIr+YRqKH0XgXbKnAhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90622632"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90622632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 05:43:58 -0700
X-CSE-ConnectionGUID: q5J5CXMlS86MH13bRPDinw==
X-CSE-MsgGUID: Sj936NYBQUGLdodPxMd0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="278569880"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 05:43:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Do not destroy uninitialized timer
In-Reply-To: <DLRRUM4IIQX2.2AYNTH45B6AF0@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260929111259.2359138-1-krzysztof.karas@intel.com>
 <DLRRUM4IIQX2.2AYNTH45B6AF0@intel.com>
Date: Tue, 29 Sep 2026 15:43:54 +0300
Message-ID: <890f98a19e790ab09feb3b990330cd52d82a68c2@intel.com>
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

On Tue, 29 Sep 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
> Hi Krzysztof,
>
> On Tue Sep 29, 2026 at 1:12 PM CEST, Krzysztof Karas wrote:
>> If intel_ring_begin() fails in live_emit_pte_full_ring(), then
>> cleanup is performed on an uninitialized timer.
>>
>> Check if the timer has been set up, before trying to remove it.
>>
>> Assisted-by: Copilot-Claude-Opus-5
>> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
>> ---
> How about something like this:

That makes no sense.


>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 5b986a7687d9..7efdc8d9d8cd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -626,7 +626,8 @@ static int live_emit_pte_full_ring(void *arg)
>                 cs = intel_ring_begin(rq, sz);
>                 if (IS_ERR(cs)) {
>                         err = PTR_ERR(cs);
> -                       goto out_rq;
> +                       i915_request_add(rq);
> +                       goto out_unpin;
>                 }
>  
>                 memset32(cs, MI_NOOP, sz);

-- 
Jani Nikula, Intel
