Return-Path: <SRS0=d1l9=PC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5377CC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 14:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0653E610EA
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 14:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0653E610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EFF6E174;
	Thu, 14 Oct 2021 14:17:01 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50416E174
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Oct 2021 14:17:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="208487580"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="208487580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 07:17:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="492015823"
Received: from rwambsga-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.210.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 07:16:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <874k9jwvhn.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211007203517.3364336-1-imre.deak@intel.com>
 <20211007203517.3364336-2-imre.deak@intel.com> <874k9jwvhn.fsf@intel.com>
Date: Thu, 14 Oct 2021 17:16:55 +0300
Message-ID: <87y26vvgh4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 01/11] drm/i915: Add a table with a
 descriptor for all i915 modifiers
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

On Thu, 14 Oct 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 07 Oct 2021, Imre Deak <imre.deak@intel.com> wrote:
>> +} intel_modifiers[] = {
>> +	{
>> +		.id = DRM_FORMAT_MOD_LINEAR,
>> +		.display_versions = DISPLAY_VER_MASK_ALL,
>
> What is this going to look like when display version mask isn't fine
> grained enough to cover all the platforms? Do we have cases like that
> already?

Day-dreaming, would be nice if we could turn our IS_PLATFORM() macros to
functions, and pass them as function pointers in places like this. Or
have lambda functions here.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
