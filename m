Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6933EC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 14:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD452312E
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 14:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD452312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E00B89C29;
	Tue, 19 Jan 2021 14:20:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10DC89C29
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 14:20:10 +0000 (UTC)
IronPort-SDR: 3W5Ing270riD4I6VllnTRNDrtE9ORxuklj7cgh4xP2j9SMf7/Juti80QhJ32ppzi3tFn4JvY/j
 D4UJmUoQ8AUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="166598503"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="166598503"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 06:20:09 -0800
IronPort-SDR: yBmByVlyxQ9fYFBZUXMi84jSHG/eVHJvsJIWTZt1zlRMw3oaoQJkUVRiwAkhzNjYUDQV5StmMt
 2tTY61znMQPA==
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="573558639"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 06:20:06 -0800
Date: Tue, 19 Jan 2021 16:20:03 +0200
From: Imre Deak <imre.deak@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20210119142003.GB1199567@ideak-desk.fi.intel.com>
References: <20210114201314.783648-4-imre.deak@intel.com>
 <20210119082936.GG2696@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119082936.GG2696@kadam>
Subject: Re: [Intel-gfx] [PATCH v7 3/3] drm/i915/tgl: Add Clear Color
 support for TGL Render Decompression
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
Cc: Nanley G Chery <nanley.g.chery@intel.com>,
 Rafael Antognolli <rafael.antognolli@intel.com>, kbuild@lists.01.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, kbuild-all@lists.01.org,
 Shashank Sharma <shashank.sharma@intel.com>, intel-gfx@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dan,

On Tue, Jan 19, 2021 at 11:29:37AM +0300, Dan Carpenter wrote:
> Hi Imre,
> 
> url:    https://github.com/0day-ci/linux/commits/Imre-Deak/drm-i915-gen12-Add-display-render-clear-color-decompression-support/20210115-113136
> ...
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna Sripada 2021-01-14  15296  		 */
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna Sripada 2021-01-14  15297  		ret = i915_gem_object_read_from_page(obj,
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna Sripada 2021-01-14  15298  						     fb->offsets[2] + 16,
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna Sripada 2021-01-14 @15299  						     sizeof(&plane_state->ccval),
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna Sripada 2021-01-14  15300  						     &plane_state->ccval);
> 
> This is a bug in Smatch and it's quite complicated to fix...  But the
> sizeof() is still probably wrong.  It should be the size of the u64
> instead of the address.

Yes, thanks for the note, I typoed the sizeof(). It's fixed in:

https://patchwork.freedesktop.org/patch/414552/?series=85877&rev=4

--Imre
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
