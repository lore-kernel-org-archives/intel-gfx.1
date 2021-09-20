Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591E4C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 07:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2084D60F26
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 07:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2084D60F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB496E409;
	Mon, 20 Sep 2021 07:42:03 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93966E406;
 Mon, 20 Sep 2021 07:42:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="223126102"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="223126102"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 00:42:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="548604539"
Received: from svandens-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.216.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 00:41:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Anshuman Gupta <anshuman.gupta@intel.com>
In-Reply-To: <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-15-matthew.auld@intel.com> <87im3hh8sy.fsf@intel.com>
 <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2>
Date: Mon, 20 Sep 2021 10:41:54 +0300
Message-ID: <87czp3vgl9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
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

On Fri, 17 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, May 17, 2021 at 02:57:33PM +0300, Jani Nikula wrote:
>>On Mon, 12 Apr 2021, Matthew Auld <matthew.auld@intel.com> wrote:
>>> From: Anshuman Gupta <anshuman.gupta@intel.com>
>>>
>>> Sanitize OPROM header, CPD signature and OPROM PCI version.
>>> OPROM_HEADER, EXPANSION_ROM_HEADER and OPROM_MEU_BLOB structures
>>> and PCI struct offsets are provided by GSC counterparts.
>>> These are yet to be Documented in B.Spec.
>>> After successful sanitization, extract VBT from opregion
>>> image.
>>
>>So I don't understand what the point is with two consecutive patches
>>where the latter rewrites a lot of the former.
>
> I actually wonder what's the point of this. Getting it from spi is
> already the fallback and looks much more complex. Yes, it's pretty
> detailed and document the format pretty well, but it still looks more
> complex than the initial code. Do you see additional benefit in this
> one?

The commit message doesn't really explain much. Anshuman?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
