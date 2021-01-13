Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEB7C433E6
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 15:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F95623339
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 15:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F95623339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9486EA8E;
	Wed, 13 Jan 2021 15:04:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E372E6EA8E
 for <Intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 15:04:56 +0000 (UTC)
IronPort-SDR: v2ZEv/JakLmquqv7m3wMH6ytp/jfTzgOHnxBbwdfi82KdL3nx44sO0oflwuxALqTcH3477hHvy
 ECWHJboT8/HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="196851116"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="196851116"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:04:51 -0800
IronPort-SDR: TFmTx9ZyRrbuadfjNogUoWHRFIDfHKcn5V6aDdTktxZQVMHG2jKbjS/JKyBl7vsF/HMeGF3STO
 X9nm7i069xGQ==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="353507417"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:04:44 -0800
Date: Wed, 13 Jan 2021 17:04:40 +0200
From: Imre Deak <imre.deak@intel.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Message-ID: <20210113150440.GA371457@ideak-desk.fi.intel.com>
References: <20200822064837.3276-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200822064837.3276-1-khaled.almahallawy@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: DPTX writes
 Swing/Pre-emphs(DPCD 0x103-0x106) requested during PHY Layer testing.
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
Reply-To: imre.deak@intel.com
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Aug 21, 2020 at 11:48:37PM -0700, Khaled Almahallawy wrote:
> Source needs to write DPCD 103-106 after receiving a PHY request to change
> swing/pre-emphasis after reading DPCD 206-207. This is especially needed if
> there is a retimer between source and sink and the retimer implements AUX_CH
> interception scheme to manage DP PHY settings (e.g. adjusting Swing/Pre-emphasis
> equalization level) for DP output channel . If the source doesn't write to
> DPCD 103-106, the retimer may not output the requested swing/pre-emphasis and
> eventually we fail compliance.
> 
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 79c27f91f42c..5044201ca742 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5503,6 +5503,9 @@ void intel_dp_process_phy_request(struct intel_dp *intel_dp)
>  
>  	intel_dp_autotest_phy_ddi_enable(intel_dp, data->num_lanes);
>  
> +	drm_dp_dpcd_write(&intel_dp->aux, DP_TRAINING_LANE0_SET,
> +				intel_dp->train_set, intel_dp->lane_count);

This should be rebased on a recent change using instead
crtc_state->lane_count. That's also not completely correct since it's
not guaranteed that the output is enabled (having up-to-date link params
in crtc_state) at the time of this test request. Also
compliance.test_data.phytest has its own link params that may be
different from the ones in crtc_state.

I'm also not sure how intel_dp_autotest_phy_ddi_disable()/enable()
affects the vswing/pre-emp setting of the source (DPTX) that got inited
when the output was last enabled. The vs/pe programming sequence should
be also part of the port enabling. Maybe the HW retains the config
across the the above port disable/enable calls and so this happens not
to be a problem.

There's been a discussion earlier that instead of open-coding here all
the port enabling/disabling and link training programming sequences the
driver's actual modesetting and link training code should be used
instead, making those aware of the modified PHY test request link
parameters. I suppose until that's done we could still merge this patch
with the above intel_dp/crtc_state fix after you can confirm that this
PHY test functionality actually works atm.

--Imre

> +
>  	drm_dp_set_phy_test_pattern(&intel_dp->aux, data,
>  				    link_status[DP_DPCD_REV]);
>  }
> -- 
> 2.17.1
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
