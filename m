Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754BCC7619A
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Apr 2023 09:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB71610E108;
	Wed, 12 Apr 2023 09:34:01 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038D10E108
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Apr 2023 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681292040; x=1712828040;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GZvoNUfb7yVkA2HtMpUMxQDk7VTdx7qW62JUxb0xnks=;
 b=BxwHE1+nJPIQEWbJoM+/YT5PJ15U/bw6VfcTD4c/Vmp9qTiiQynygEVD
 SolV0P0ZvOwy/PZeW/DoSD/CjVIznHA9fovtisCKVPEXzYJ7bXwHmaTZV
 IG5+6mEcTphs32PBFvwKkXfdybof9Fapu5orCJuVs0ucOHGawDDxrHQz1
 TtIK/05oZoHv/ohLK9rwrC1m/FEiB3kn5BPv+8TV1XbtrqjjPgef0hFi8
 jGhEYRDGRPBLhmkiLphvsNcn6kyROWdrJr+3k6+/7zJdHfJgwqngevFhd
 WpmVkAd6EGPdsVjMm+0cRvyYASY0zfIDOvkJqGkby9ZzrzkDtntkKF+Wd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="430134081"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="430134081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 02:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="758172470"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="758172470"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 02:33:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Mika Kahola
 <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <168125326577.3326.16288863179121640086@gjsousa-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230403085043.2219092-1-mika.kahola@intel.com>
 <168125326577.3326.16288863179121640086@gjsousa-mobl2>
Date: Wed, 12 Apr 2023 12:33:54 +0300
Message-ID: <87o7ntcum5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 11 Apr 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Mika Kahola (2023-04-03 05:50:43)
>> @@ -8250,6 +8259,7 @@ void intel_init_display_hooks(struct drm_i915_private *dev_priv)
>>         intel_color_init_hooks(dev_priv);
>>         intel_init_cdclk_hooks(dev_priv);
>>         intel_audio_hooks_init(dev_priv);
>> +  intel_init_pmdemand(dev_priv);
>
> I think intel_init_display_hooks() is meant to call functions setting up
> function pointers, right? That would not be the case for intel_init_pmdemand().
>
> I think we could rename intel_init_pmdemand() to
> intel_pmdemand_init_early() and call it inside i915_driver_early_probe().

Please let's not add new direct calls to display from top level driver
code. See also [1].


BR,
Jani.


[1] https://lore.kernel.org/r/87r0t11g19.fsf@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
