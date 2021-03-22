Return-Path: <SRS0=R2gn=IU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98D7C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 11:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 535F86198D
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 11:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 535F86198D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBD96E44A;
	Mon, 22 Mar 2021 11:55:53 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796AD6E44C
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 11:55:52 +0000 (UTC)
IronPort-SDR: m8t1dQ7l7A12bOyEZ7qE+O6X54vUz+OQN+X1N0fHMTnSKaf3J2FfNo8dKmgmL4Oie8ESVa+Hep
 6JQnyYQSAMbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="187931196"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="187931196"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 04:55:49 -0700
IronPort-SDR: /nuweD9N8TMxHsgsQcQm/Xv4F+NnSwyRNqoDz8dgtsAn27Aq/x/3wyOHsW3T9diOClNZM5YDuj
 lVSu+Kl1J+qQ==
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="414457216"
Received: from sbramhax-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.53.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 04:55:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
In-Reply-To: <161619569000.8629.1222908291030519887@emeril.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <161619569000.8629.1222908291030519887@emeril.freedesktop.org>
Date: Mon, 22 Mar 2021 13:55:45 +0200
Message-ID: <871rc7767y.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm/i915=3A_uAPI_clean-ups_part_2?=
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

On Fri, 19 Mar 2021, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/i915: uAPI clean-ups part 2
> URL   : https://patchwork.freedesktop.org/series/88196/
> State : failure
>
> == Summary ==
>
> Applying: drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
> Applying: drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
> Applying: drm/i915: Drop the CONTEXT_CLONE API
> Applying: drm/i915: Implement SINGLE_TIMELINE with a syncobj
> error: sha1 information is lacking or useless (drivers/gpu/drm/i915/gem/i915_gem_context.c).
> error: could not build fake ancestor
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> Patch failed at 0004 drm/i915: Implement SINGLE_TIMELINE with a syncobj
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

CI runs on top of drm-tip branch. What's this based on?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
