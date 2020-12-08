Return-Path: <SRS0=GdbL=FM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF99C433FE
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 10:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F4D23A9D
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 10:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F4D23A9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390BA6E0BF;
	Tue,  8 Dec 2020 10:33:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0D46E0BE;
 Tue,  8 Dec 2020 10:33:28 +0000 (UTC)
IronPort-SDR: LEose4KbvIOt/UNuuEs1O3knvaZebS5LrGw2lhyPig0uDMsocVCwDuvkdxwLikW9Fch3sbyrz9
 tFlQaZRVPnWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="258576513"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="258576513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:33:26 -0800
IronPort-SDR: cACYdinbxwL7OyT6e2bbk3UfFRP09uka5HcEub/UX5XyGz/LFq3LfXWl92ONECeEhy0ej0fEV5
 jjn6HYVJYrsA==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="317739141"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:33:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
Date: Tue, 08 Dec 2020 12:33:20 +0200
Message-ID: <87tuswa8pb.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v4 00/16] Add support for DP-HDMI2.1 PCON
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 08 Dec 2020, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> This patch series attempts to add support for a DP-HDMI2.1 Protocol
> Convertor. The VESA spec for the HDMI2.1 PCON are proposed in Errata
> E5 to DisplayPort_v2.0:
> https://vesa.org/join-vesamemberships/member-downloads/?action=stamp&fileid=42299
> The details are mentioned in:
> VESA DP-to-HDMI PCON Specification Standalone Document
> https://groups.vesa.org/wg/DP/document/15651
>
> This series starts with adding support for FRL (Fixed Rate Link)
> Training between the PCON and HDMI2.1 sink.
> As per HDMI2.1 specification, a new data-channel or lane is added in
> FRL mode, by repurposing the TMDS clock Channel. Through FRL, higher
> bit-rate can be supported, ie. up to 12 Gbps/lane (48 Gbps over 4
> lanes).
>
> With these patches, the HDMI2.1 PCON can be configured to achieve FRL
> training based on the maximum FRL rate supported by the panel, source
> and the PCON.
> The approach is to add the support for FRL training between PCON and
> HDMI2.1 sink and gradually add other blocks for supporting higher
> resolutions and other HDMI2.1 features, that can be supported by pcon
> for the sources that do not natively support HDMI2.1.
>
> This is done before the DP Link training between the source and PCON
> is started. In case of FRL training is not achieved, the PCON will
> work in the regular TMDS mode, without HDMI2.1 feature support.
> Any interruption in FRL training between the PCON and HDMI2.1 sink is
> notified through IRQ_HPD. On receiving the IRQ_HPD the concerned DPCD
> registers are read and FRL training is re-attempted.
>
> Currently, we have tested the FRL training and are able to enable 4K
> display with TGL Platform + Realtek PCON RTD2173 with HDMI2.1 supporting
> panel.

Per IRC chat with Maarten and Daniel, once all the reviews are in, I'll
add a topic branch and apply the patches there, so we can merge the
branch to both drm-misc-next and drm-intel-next.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
