Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F46DF9936C
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Apr 2026 11:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7D110F0AC;
	Thu, 23 Apr 2026 11:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNa4FMRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCDA10F0AC
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Apr 2026 11:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776942374; x=1808478374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TQ/VHANtvarEUlAIUwp04wikx3cggk5ifD18inmWvBQ=;
 b=JNa4FMRpbEj4f6RzjzY6bAvFKJls0l6t9Uh5fi/LCoQlwsam/bIpm5Nq
 M36a7XB7bUlyJURE8MlTA+UyPKNG+gXOQB0yhVLP1EfMucYbLEVevgyXh
 cCmdaDff0t2OijuJpbDOkbV+XX1iAJ/rRvbcTsccAhSn4JJ1yO6OaE/FR
 UvZX/AgWnvdT4V8CWi35qX98/XG9LS5LFd33jOK2S6Jzu+bH+fvJTCOY6
 PftqW+1iOP5JmJc9EC3wpKt8cMRUQglacuVVQWGn9N7xr7YLdlmUSLrV6
 1TRxLV7jasMeWUSx1euqfmmRBxvVg4Tolu/Dw+RNo7u+/QLWksjCXllwV A==;
X-CSE-ConnectionGUID: ZcXCh4RoQkyNoms4kp4JSQ==
X-CSE-MsgGUID: xA2Fs9mITPq7Fu60enauow==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77970042"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77970042"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:06:14 -0700
X-CSE-ConnectionGUID: Ljt1/sO1QXerR9zzsKsN8w==
X-CSE-MsgGUID: zGzbV+nUQmKPEbESFt8iVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="226106812"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:06:12 -0700
Date: Thu, 23 Apr 2026 14:06:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@igalia.com>
Subject: Re: =?utf-8?B?4pyTIGk5MTUuQ0kuRnVsbDogc3Vj?=
 =?utf-8?Q?cess_for_drm=2Fi915=2Fdisplay?= =?utf-8?Q?=3A?= Detect AuxCCS
 support via display parent interface (rev2)
Message-ID: <aen9IeS4tR5ZaWes@intel.com>
References: <20251209120034.9143-1-tursulin@igalia.com>
 <176537861842.74285.17574222990617448082@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176537861842.74285.17574222990617448082@a3b018990fe9>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Dec 10, 2025 at 02:56:58PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/display: Detect AuxCCS support via display parent interface (rev2)
> URL   : https://patchwork.freedesktop.org/series/158691/
> State : success
> 
<snip>
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#6095]) +44 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_158691v2/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          [PASS][62] -> [SKIP][63] ([i915#6095]) +57 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17651/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_158691v2/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

OK,so we did see the DG2 CCS regression already in pre-merge results.
This should have been properly checked before pushing the series.

Sadly the black hole has eaten the results so I can't anymore check
how bad the results page looked visually.

-- 
Ville Syrjälä
Intel
