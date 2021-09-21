Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D96C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 08:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3B861131
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 08:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E3B861131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFFD6E914;
	Tue, 21 Sep 2021 08:44:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77876E90D;
 Tue, 21 Sep 2021 08:44:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="308864064"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="308864064"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 01:44:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="549401600"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 01:44:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
In-Reply-To: <20210917165637.t3vdblkgk5rzplyu@gilmour>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1631191763.git.jani.nikula@intel.com>
 <87mtobuzuo.fsf@intel.com> <20210917165637.t3vdblkgk5rzplyu@gilmour>
Date: Tue, 21 Sep 2021 11:44:14 +0300
Message-ID: <87sfxytj1d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH v3 00/13] drm/i915/dp: dp 2.0 enabling prep
 work
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

On Fri, 17 Sep 2021, Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Sep 17, 2021 at 03:54:23PM +0300, Jani Nikula wrote:
>> On Thu, 09 Sep 2021, Jani Nikula <jani.nikula@intel.com> wrote:
>> > v3 of https://patchwork.freedesktop.org/series/93800/ with minor tweaks
>> > and the already merged patches obviously dropped.
>> >
>> > Jani Nikula (13):
>> >   drm/dp: add DP 2.0 UHBR link rate and bw code conversions
>> >   drm/dp: use more of the extended receiver cap
>> >   drm/dp: add LTTPR DP 2.0 DPCD addresses
>> >   drm/dp: add helper for extracting adjust 128b/132b TX FFE preset
>> 
>> Maarten, Maxime, Thomas, can I get an ack to merge these four patches
>> via drm-intel please, or would you prefer a topic branch instead?
>
> Yes, you can merge them through drm-intel

Thanks, I've done that.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
