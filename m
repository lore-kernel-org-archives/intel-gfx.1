Return-Path: <SRS0=tFHw=MF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D7C07E95
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 20:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D9986101D
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 20:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D9986101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA489EF7;
	Tue, 13 Jul 2021 20:02:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B98689EF7
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Jul 2021 20:02:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="208417500"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="208417500"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 13:02:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="630154691"
Received: from juhyungn-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.129.73])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 13:02:15 -0700
Date: Tue, 13 Jul 2021 13:02:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20210713200214.oerr3ekv5ykjdeil@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210710033724.2459367-1-matthew.d.roper@intel.com>
 <20210710033724.2459367-8-matthew.d.roper@intel.com>
 <20210713195707.4t4rzkdonc7pphhe@ldmartin-desk2>
 <20210713195953.GH951094@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713195953.GH951094@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 07/12] drm/i915/icl: Use revid->stepping
 tables
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 12:59:53PM -0700, Matt Roper wrote:
>On Tue, Jul 13, 2021 at 12:57:07PM -0700, Lucas De Marchi wrote:
>> On Fri, Jul 09, 2021 at 08:37:19PM -0700, Matt Roper wrote:
>> > Switch ICL to use a revid->stepping table as we're trying to do on all
>> > platforms going forward.  While we're at it, let's include some
>> > additional steppings that have popped up, even if we don't yet have any
>> > workarounds tied to those steppings (we probably need to audit our
>> > workaround list soon to see if any of the bounds have moved or if new
>> > workarounds have appeared).
>> >
>> > Note that the current bspec table is missing information about how to
>> > map PCI revision ID to GT/display steppings; it only provides an SoC
>> > stepping.  The mapping to GT/display steppings (which aren't always the
>> > same as the SoC stepping) used to be in the bspec, but was apparently
>> > dropped during an update in Nov 2019; I've made my changes here based on
>> > an older bspec snapshot that still had the necessary information.  We've
>> > requested that the missing information be restored.
>> >
>> > I'm only including the production revids in the table here since we're
>> > past the point at which we usually stop trying to support pre-production
>> > hardware.  An appropriate check is added to
>> > intel_detect_preproduction_hw() to print an error and taint the kernel
>> > just in case someone still tries to load the driver on old
>> > pre-production hardware.
>> >
>> > v2:
>> > - Drop pre-production steppings and add error/taint at startup when
>> >   loading on pre-production hardware.
>>
>> oh... I forgot to send my review. Here is the commend I had:
>>
>> It seems we are not actually dropping the WAs. We have several applying
>> only to A0 or A0/B0. From your first paragraph, is the intention to do
>> an audit of the WA ranges later?  Because we are currently running
>> without applying those WAs, so those are effectively dead code.
>
>The actual dropping of workarounds for pre-production steppings happens
>in patch #12.  But a more in-depth audit will be done in the future.

ahh, ok. Makes sense then.

Thanks
Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>
>-- 
>Matt Roper
>Graphics Software Engineer
>VTT-OSGC Platform Enablement
>Intel Corporation
>(916) 356-2795
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
