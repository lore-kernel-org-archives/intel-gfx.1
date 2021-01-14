Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC766C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 08:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F499239FD
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 08:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F499239FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3C86E061;
	Thu, 14 Jan 2021 08:46:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08EF6E061
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 08:46:09 +0000 (UTC)
IronPort-SDR: MwXrt2/dIhFtDYGfuGi4p4rzTin3L5AD/ULE65BrxnXsBS2S65PrWOIRigrcYbzI+cJL+qh8ba
 Gx4QAXdE3AVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="177552632"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="177552632"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 00:46:08 -0800
IronPort-SDR: JmVZcG1au6e8taob8XfOMetK1xSQ+6nUlhQ1+cqSHo5ZBHAtFd8InNTIvT9R0LZJS3NIfjP5MW
 XOKIDLqAFsUQ==
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="353823491"
Received: from dforourk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.254.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 00:46:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
In-Reply-To: <20210113114405.GP11717@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1610127741.git.jani.nikula@intel.com>
 <031b26bf4a680cf3a436d368108380064b8b541f.1610127741.git.jani.nikula@intel.com>
 <20210113114405.GP11717@intel.com>
Date: Thu, 14 Jan 2021 10:46:03 +0200
Message-ID: <87czy7rjn8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 14/17] drm/i915/pps: refactor init
 abstractions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> On 2021-01-08 at 19:44:22 +0200, Jani Nikula wrote:
>> @@ -1366,20 +1352,21 @@ void intel_pps_encoder_reset(struct intel_dp *intel_dp)
>>  		 * Reinit the power sequencer, in case BIOS did something nasty
> 		IMHO above comment would need a improvement, or nuke it ?
> 		as intel_pps_encoder_reset() will also get called from intel_pps_init()	
> 		unlike only while resuming from suspend.

How about this?

-                * Reinit the power sequencer, in case BIOS did something nasty
-                * with it.
+                * Reinit the power sequencer also on the resume path, in case
+                * BIOS did something nasty with it.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
