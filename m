Return-Path: <SRS0=edJA=EY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99416C5519F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 09:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA432467D
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 09:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA432467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBFE6E2DE;
	Wed, 18 Nov 2020 09:18:15 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011256E2DE
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2020 09:18:13 +0000 (UTC)
IronPort-SDR: 7uk3PtkgeP40HZRYPnJH4lHKLAVWXabL2Z53+0j3DHIAMvFGHaWG0FKjakJg8ML1kk/nsUXTQ5
 boST6EiZb5mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="235236284"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="235236284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 01:18:13 -0800
IronPort-SDR: n7k5IkpzFM9mj+ORDCZJLSlHs4l1QH3xuF90J5SzMD65PwJrU41lK8WyMM7DRSU7JfzzlkiRex
 DjaSW2nWBzfA==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="534177106"
Received: from dlmurray-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.82.13])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 01:18:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>
In-Reply-To: <20201117193114.ujqf4mgu3z2pzkab@ldmartin-desk1>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201117185029.22078-1-aditya.swarup@intel.com>
 <20201117185029.22078-3-aditya.swarup@intel.com>
 <20201117193114.ujqf4mgu3z2pzkab@ldmartin-desk1>
Date: Wed, 18 Nov 2020 11:18:08 +0200
Message-ID: <87mtzfowfj.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 02/21] drm/i915/tgl: Fix macros for TGL SOC
 based WA
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

On Tue, 17 Nov 2020, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Nov 17, 2020 at 10:50:10AM -0800, Aditya Swarup wrote:
>>@@ -1579,9 +1579,9 @@ static inline const struct i915_rev_steppings *
>> tgl_revids_get(struct drm_i915_private *dev_priv)
>> {
>> 	if (IS_TGL_U(dev_priv) || IS_TGL_Y(dev_priv))
>>-		return tgl_uy_revids;
>>+		return tgl_uy_revids + INTEL_REVID(dev_priv);
>
> oohh, no. You have to at least check you are not accessing out of
> bounds. New HW running on old kernel should not access create invalid
> accesses like this.

And this is just one reason why exposing arrays directly as an interface
to the rest of the driver is a bad idea. Basically I look at *all*
externs in the driver with suspicion, and they're all exceptions that
should not be repeated. The revid arrays are a direct invitation to keep
adding more and more extern arrays. And more ways to go out of bounds.

I'd rather we seek for ways to either nuke the revid arrays altogether,
or encapsulate them within a .c file with static scope.

And for that .c file... the arrays are now in gt/intel_workarounds.c
which is a really weird place for stuff that's used for generic stepping
info, and particularly for *display* stepping info.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
