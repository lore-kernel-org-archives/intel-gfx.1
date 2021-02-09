Return-Path: <SRS0=0Its=HL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9353BC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 10:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C4464E6F
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 10:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C4464E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610F86EAC2;
	Tue,  9 Feb 2021 10:27:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AED6EAC2
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Feb 2021 10:27:17 +0000 (UTC)
IronPort-SDR: y8qHKI832n0vG7/ShmlQUiZsuK40GYMA5iOLumDf092FE/r/QWCSIVUQEnZ7bkMYT8mTMSp4GQ
 TmJJWdTJFXtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="266693842"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="266693842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 02:27:16 -0800
IronPort-SDR: I1z0SabwPGvXb2krN8bwK6oiQQC0ktLONu35Hh68cQCuCtfEuDZQmhoNj5HCDZf62w56Aa72e0
 CfeKQuobny+w==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="396062735"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 02:27:15 -0800
Date: Tue, 9 Feb 2021 12:27:11 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, g@ideak-desk.fi.intel.com
Message-ID: <20210209102711.GA18480@ideak-desk.fi.intel.com>
References: <20210129080043.24614-1-anshuman.gupta@intel.com>
 <20210204182809.GC750296@ideak-desk.fi.intel.com>
 <aa661df54d8847d0926e8edf61710fcf@intel.com>
 <20210205120451.GA921144@ideak-desk.fi.intel.com>
 <aabf782fb5f44932ac7e314ae727b119@intel.com>
 <1c3fa41298ad4534afd0eee40ed6e4c6@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c3fa41298ad4534afd0eee40ed6e4c6@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/debugfs: HDCP capability enc NULL
 check
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 07:39:17AM +0200, Gupta, Anshuman wrote:
> > > > > > [...]
> > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > index ae1371c36a32..58af323d189a 100644
> > > > > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > @@ -135,11 +135,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
> > > > > >  /* Is HDCP1.4 capable on Platform and Sink */
> > > > > > bool intel_hdcp_capable(struct intel_connector *connector)  {
> > > > > > -	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> > > > > > +	struct intel_digital_port *dig_port;
> > > > > >  	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
> > > > > >  	bool capable = false;
> > > > > >  	u8 bksv[5];
> > > > > >
> > > > > > +	if (!connector->encoder)
> > > > > > +		return -ENODEV;
> > > > >
> > > > > I assume this is needed when called from i915_hdcp_sink_capability
> > > > > debugfs entry. That one is lacking the locking for the connector,
> > > > > but is that entry really needed? We print the same info already
> > > > > from the i915_display_info entry which has the proper locking and
> > > > > encoder check.
> > > >
> > > > Historically HDCP capability added to i915_display_info later to
> > > > debug CI machine as i915_display_info available as CI logs.  Now the
> > > > plans i915_display_info  should only show the monitor capability.
> > > > and i915_hdcp_sink_capability will check both sink and platform
> > > > capability.
> > >
> > > Ok, in any case the encoder NULL check and the required locking should
> > > be done in i915_hdcp_sink_capability_show().
>
> Need one input, AFAIU we do require
> drm_modeset_lock(&dev_priv->drm.mode_config.connection_mutex, NULL)
> lock in i915_hdcp_sink_capability ?

Yes, and there's also drm_modeset_lock_single_interruptible() that could
be used.

--Imre
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
