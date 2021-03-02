Return-Path: <SRS0=7YZZ=IA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6AAC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 10:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E3764EE8
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 10:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0E3764EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344EA892A6;
	Tue,  2 Mar 2021 10:25:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8679892A6
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Mar 2021 10:25:06 +0000 (UTC)
IronPort-SDR: LB4H0zYZq05FZqbh2cLXrLgNiOWC66DJotXCmM6DcTZzZ4yScOkahUKQHbWU4aMhGb9r64g1Ae
 lsm+XyqL7auQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186097019"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186097019"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 02:25:06 -0800
IronPort-SDR: f6OvFREgsPAfgmd4Cz1Bu7XUFjYTOmj/JUYx3NJM/yZSSqnlVPur07Ij4ryjUUkhA2YF3VXfjy
 kBCG7SUBC9rg==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="398948239"
Received: from rwathan-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.106])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 02:25:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar\, Uma" <uma.shankar@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
In-Reply-To: <87eeh8f3et.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1613054234.git.jani.nikula@intel.com>
 <6fb9f831672c951c00d92f1176bd42d3b0f30145.1613054234.git.jani.nikula@intel.com>
 <485ac3466f8945afa89a79d4d979f0d1@intel.com> <87eeh8f3et.fsf@intel.com>
Date: Tue, 02 Mar 2021 12:25:00 +0200
Message-ID: <87czwhq2df.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 6/9] drm/i915/mso: add splitter state
 readout for platforms that support it
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
Cc: "Varide, Nischal" <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 22 Feb 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 22 Feb 2021, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>>> index 71611b596c88..5564db512d22 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>>> @@ -1161,6 +1161,13 @@ struct intel_crtc_state {
>>>  		u8 pipeline_full;
>>>  		u16 flipline, vmin, vmax;
>>>  	} vrr;
>>> +
>>> +	/* Stream Splitter for eDP MSO */
>>> +	struct {
>>> +		bool enable;
>>> +		u8 link_count;
>>> +		u8 pixel_overlap;
>>> +	} splitter;
>>
>> For DSI which also has this in common along with MSO, may be we can
>> take these link_count and pixel_overlap out of splitter which is more
>> of a MSO feature. Thoughts ?
>
> Ville suggested the same I think.

Coming back to this. DSI does not actually use crtc state for this
currently. But it does use the display stream splitter. The register is
different, but the functionality is roughly the same.

I suggest we keep the "splitter" substruct as above, and convert DSI
code to use it in follow-up.

In early versions of the patch the substruct was called "mso"; I think
"splitter" is better, and captures both MSO and DSI cases.

I'll send v4 with the other suggested changes.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
