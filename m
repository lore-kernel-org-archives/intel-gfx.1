Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D5D25B54
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jan 2026 13:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71EE10E6C3;
	Wed, 28 Jan 2026 13:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eX8oiq7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3AE10E6C3
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769605255; x=1801141255;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TxzVMzwdDrstHt41sC0ekSBfAF0IJ+EwkjkKL8LE264=;
 b=eX8oiq7tsB1kA/DvqtZkQaGRSUe3seorvNJnt4yKi52Iq5QJkLhVTy63
 IT4gVX+5mw4WICHpxgddqrqag4jfabU4x/ljPijqhPy9HNdwfhrHD/F2j
 5rPSSgsTZntN79R0gf7fT95lNUVkyM6fA3SbHWgpwerBz2BhrRSlNc8tE
 GZuZkbNM2/zLtyYUrtOosQjDQrNJcsOz8jKsyXW5w3Y7ldvZQOpO4BTwI
 jw1yHOMoZSprhvqG/mkJlPScsydOA+EUDgyn69Ew7k4GX497cco9PTa8V
 D+oyv8ENnijBOmYR0Js66IZwxyZFrwlRWE376PCao9hg/eiBGlGqNJrRm w==;
X-CSE-ConnectionGUID: G6u2xjZURHSOgeTdCq/QHw==
X-CSE-MsgGUID: Av3kgE4rSIyi2flu61e2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88388943"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88388943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:00:54 -0800
X-CSE-ConnectionGUID: 62gUxkF5RCmv6N350tETKQ==
X-CSE-MsgGUID: Yoamv2Z8SiOyt8OJ3hTXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212359876"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:00:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Prevent  heap overflow in i915_l3_write()
In-Reply-To: <LV3PR11MB8768CDDC426609842C4AB789F591A@LV3PR11MB8768.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260128051142.3006076-1-kaushlendra.kumar@intel.com>
 <b0435f60602510e61ba04385e378f2caba9ac366@intel.com>
 <LV3PR11MB8768CDDC426609842C4AB789F591A@LV3PR11MB8768.namprd11.prod.outlook.com>
Date: Wed, 28 Jan 2026 15:00:49 +0200
Message-ID: <6aae6c8a4299b17a68cf5efd5faef21911daa688@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 28 Jan 2026, "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com> wrote:
> On Wed, 28 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Wed, 28 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrote:
>>> +	count = min_t(size_t, GEN7_L3LOG_SIZE - offset, count);
>>
>> This may make count not be a multiple of sizeof(u32) again. Note how 
>> offset is treated below.
>
> Thank you for catching this!
>
> You're absolutely right about the alignment concern. While technically 
> in this specific case (GEN7_L3LOG_SIZE = 0x80, and offset is already 
> validated to be u32-aligned by l3_access_valid()), the subtraction 
> (GEN7_L3LOG_SIZE - offset) would always yield a u32-aligned result.
>
> Anything I am missing here?

No, I missed that l3_access_valid() ensures offset is already aligned.

The whole thing is a bit too convoluted for my liking, but the whole
thing matches i915_l3_read() with this patch, and there's no value in
iterating this further.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel
