Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D08DC00140
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Aug 2022 11:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAF912B4FE;
	Wed, 10 Aug 2022 11:31:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AA1B32A0;
 Wed, 10 Aug 2022 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660131087; x=1691667087;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+78Ttx6OLArS8x5+jcnkqDyXrHhsIj/SQeymACcvYBo=;
 b=Ma9QECE6WjyQzULmx2kKbZSyko64ePfYlMf9caZdl2PowgLBJDzp4qtt
 AjfEDh3qfu8TDUKLQAFnTEez6Q2tHuiuhzPh34Lx2KvTHuoR0/uUerKsG
 +zK1Vaeg7lidVuW65FX3VedacdrKR7FBKs6R08Osl55T9v2fTDoXzY1P7
 Asi20+A7P8d6eaTH5fabRL8TPYOqeHOF7DIMKZl3RQsaZXJhnxuqjZZrN
 9J8GehRA06dSsja74IbSdbYg2Picr5yYAeWcG938fOeZWr5nAdsjwewM6
 da6UWuzpjzPCFEEkvhSvhffHD/vNDCYsoQehPDsCSp7htgHEovK2nYfzZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="377351385"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="377351385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 04:31:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="664858635"
Received: from iefimov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.49.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 04:31:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <429ca486-6b75-5565-e18a-45a7afa3dd8d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
 <20220805155959.1983584-2-piotr.piorkowski@intel.com>
 <429ca486-6b75-5565-e18a-45a7afa3dd8d@intel.com>
Date: Wed, 10 Aug 2022 14:31:22 +0300
Message-ID: <87y1vwtjw5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Use of BARs names instead
 of numbers
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022, Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> On 05.08.2022 17:59, Piorkowski, Piotr wrote:
>> +/* PCI BARs */
>> +#define GTTMMADR_BAR				0
>> +#define GEN2_GTTMMADR_BAR			1
>> +#define GFXMEM_BAR				2
>> +#define GTT_APERTURE_BAR			GFXMEM_BAR
>> +#define GEN12_LMEM_BAR				GFXMEM_BAR
>
> In INTEL_GVT_PCI_BAR_GTTMMIO we have BAR in prefix, here in suffix.
> I am not sure which onel is better, just pointing out slight incosistency.

Thought about it too, but decided this one's trivial to change if
needed. The main change is switching to macros.

> Anyway:
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks, though I already pushed this. :)

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
