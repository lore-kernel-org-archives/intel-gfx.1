Return-Path: <SRS0=Vm3B=GL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4EBC433DB
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Jan 2021 17:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D98623A61
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Jan 2021 17:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D98623A61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8ED6E859;
	Fri,  8 Jan 2021 17:44:58 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B936E859
 for <intel-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 17:44:57 +0000 (UTC)
IronPort-SDR: aGxSLE7bdDUhJ93+rcOcI1svFQepbhtB47Fyi5xd3ovH1PrKb243JYDZroiiasDS0X9mXJdYtS
 xRimKcjm0FHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="262402169"
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; d="scan'208";a="262402169"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 09:44:56 -0800
IronPort-SDR: Dcorg79vVNBzReQY+cyqJyglzpT5y9ufWfEVKsAReTE7mgvxOpodMyMDWioxldbl8i1TC8vMyY
 /egU4gSNHCpg==
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; d="scan'208";a="362402968"
Received: from rgwhiteh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.205.160])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 09:44:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Gupta\, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
In-Reply-To: <87k0ss220z.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1608648128.git.jani.nikula@intel.com>
 <c261c416dc3e37cbc5e94cb6346d1f64fe4b1469.1608648128.git.jani.nikula@intel.com>
 <9c7ba12c5b764d8a93f1d7afd79bfa53@intel.com> <87k0ss220z.fsf@intel.com>
Date: Fri, 08 Jan 2021 19:44:52 +0200
Message-ID: <87im87xqzv.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 01/13] drm/i915/pps: abstract panel power
 sequencer from intel_dp.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 04 Jan 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 28 Dec 2020, "Gupta, Anshuman" <anshuman.gupta@intel.com> wrote:
>>> -----Original Message-----
>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani
>>> Nikula
>>> Sent: Tuesday, December 22, 2020 8:20 PM
>>> To: intel-gfx@lists.freedesktop.org
>>> Cc: Nikula, Jani <jani.nikula@intel.com>
>>> Subject: [Intel-gfx] [PATCH 01/13] drm/i915/pps: abstract panel power
>>> sequencer from intel_dp.c
>>> 
>>> In a long overdue refactoring, split out all panel sequencer code from
>>> intel_dp.c to new intel_pps.[ch].
>>> 
>>> The first part is mostly just code movement as-is, without cleanups.
>>> 
>>> We need to add a vlv_get_dpll() helper to get at the vlv/chv dpll from
>>> pps code.
>> IMHO functions intel_dp_init_panel_power_sequencer, intel_dp_init_panel_power_sequencer_registers,
>> intel_dp_pps_init suits a intel_edp_* prefix.
>
> This patch just moves code. The rename would be a separate change on
> top. Possibly with intel_pps prefix instead because they're not so much
> about dp or edp as about pps.

I've added some additional renames in v2.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
