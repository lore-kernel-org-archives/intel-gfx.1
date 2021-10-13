Return-Path: <SRS0=fYpC=PB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E71C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 15:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B74610A2
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 15:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51B74610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A227E6E054;
	Wed, 13 Oct 2021 15:47:33 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AD16E054
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Oct 2021 15:47:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227744810"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227744810"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 08:47:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="441692746"
Received: from sanmathi-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.118.139])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 08:47:24 -0700
Date: Wed, 13 Oct 2021 08:47:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, siva.mullati@intel.com
Message-ID: <20211013154726.wfbhhghy7qq3sg2v@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <cover.1634119597.git.jani.nikula@intel.com>
 <YWa3QeJ3s0+9+fbH@intel.com> <87sfx5xkuq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sfx5xkuq.fsf@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/1] drm/i915: vlv sideband
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

On Wed, Oct 13, 2021 at 01:47:09PM +0300, Jani Nikula wrote:
>On Wed, 13 Oct 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Wed, Oct 13, 2021 at 01:11:58PM +0300, Jani Nikula wrote:
>>> Three main ideas here:
>>>
>>> - vlv sideband only has the name "sideband" in common with the rest of
>>>   intel_sideband.[ch]
>>
>> I wouldn't put it like that. There are two actual sideband
>> implementtions in that file:
>> - vlv/chv iosf sideband (vlv_sideband)
>> - lpt/wpt iosf sideband (intel_sbi)
>>
>> And the third thing in that file is the snb+ pcode mailbox stuff,
>> which has nothing to do with sideband.
>
>Fair enough... but no opposition to the splitting out of vlv/chv iosf
>sideband? vlv_sideband.[ch] like here? I'm fine with renaming too.
>
>I can follow up with lpt/wpt iosf split out (intel_sbi.[ch]?) and snb+
>pcode (intel_pcode.[ch]?).

yeah, I think that if we move intel_pcode.[ch] out, then we probably
don't even have to worry about the iosf_* calls for other archs. The
common stuff would be in pcode and the others would be compiled out for
archs that don't have it (i.e. only x86 adds it).

+Siva, who was looking into this iosf abstraction.

Lucas De Marchi

>
>I think we've just put all of them together way back when this was all
>probably bundled in i915_drv.c or something...
>
>
>BR,
>Jani.
>
>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
