Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AC3C433E0
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 11:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046FD64E7A
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 11:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046FD64E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACED89A92;
	Mon,  8 Feb 2021 11:11:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E6F89057
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 11:11:49 +0000 (UTC)
IronPort-SDR: hc2AKtETubt2qyVFSwAES90IRTLnwQL7TiGkWqJ1FEIQdQlw1Ypi8pOeMdFwfRlhYDPa7/dVwM
 Ieiq8XYlnATQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="160850487"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="160850487"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:11:47 -0800
IronPort-SDR: BAqlyonuvIggVHkpLTvJBEooZ8LdU8yeVKtjGZfVei+tvrLfHprqWYZEc0u4TOnAEl/OZx1ph8
 C6C0nR+6RV3A==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="395346140"
Received: from abodrova-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.34.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:11:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <87lfbyett1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210208055554.24357-1-ankit.k.nautiyal@intel.com>
 <87lfbyett1.fsf@intel.com>
Date: Mon, 08 Feb 2021 13:11:42 +0200
Message-ID: <87h7mmerv5.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] i915: Fix HAS_LSPCON macro for platforms
 between GEN9 and GEN10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 08 Feb 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Subject prefix: drm/i915:
>
> On Mon, 08 Feb 2021, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Legacy LSPCON chip from MCA and Parade is only used for platforms
>> between GEN9 and GEN10. Fixing the HAS_LSPCON macro to reflect the same.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> I cringe at the VBT having the bit set anyway, but
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

And pushed, thanks for the patch. Fixed the subject while applying.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/i915_drv.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 4fc9a8691873..fd04fc434ca6 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1763,7 +1763,7 @@ tgl_stepping_get(struct drm_i915_private *dev_priv)
>>  
>>  #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
>>  
>> -#define HAS_LSPCON(dev_priv) (INTEL_GEN(dev_priv) >= 9)
>> +#define HAS_LSPCON(dev_priv) (IS_GEN_RANGE(dev_priv, 9, 10))
>>  
>>  /* DPF == dynamic parity feature */
>>  #define HAS_L3_DPF(dev_priv) (INTEL_INFO(dev_priv)->has_l3_dpf)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
