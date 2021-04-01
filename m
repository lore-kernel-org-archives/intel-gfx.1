Return-Path: <SRS0=2Jy7=I6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A45FC433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 12:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4029060FE7
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 12:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4029060FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55536EC9C;
	Thu,  1 Apr 2021 12:03:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3026EC9C;
 Thu,  1 Apr 2021 12:03:01 +0000 (UTC)
IronPort-SDR: JaKwRAl5bCx2FQ0vWmD7buxR9gyJ65d8UVHyBAFH6G0rPqLGsL1g9G3sJvPss+J4urWc0reTcf
 5pUNOmji2WrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="277416393"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="277416393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 05:03:00 -0700
IronPort-SDR: egU+PWkjWjxEnzZs4cMSeNlQxVfxhbfLz41wa79hIBR3NxfFrrpHl0MMSflQndqxompGbVHghg
 52YCXlC59dyQ==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="419177700"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 05:02:59 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lRw3B-00027V-IV; Thu, 01 Apr 2021 15:03:49 +0300
Date: Thu, 1 Apr 2021 15:03:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <YGW2pTimwjHEDf3M@platvala-desk.ger.corp.intel.com>
References: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH i-g-t] gem_watchdog: Fix autotools build
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
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 12:43:16PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Correcting a brain malfunction while typing in Makefile.sources.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/Makefile.sources | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index e992285fedc5..194df8e27dd0 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -464,7 +464,7 @@ TESTS_progs += gem_wait
>  gem_wait_SOURCES = i915/gem_wait.c
>  
>  TESTS_progs += gem_watchdog
> -gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
> +gem_watchdog_SOURCES = i915/gem_watchdog.c
>  
>  TESTS_progs += gem_workarounds
>  gem_workarounds_SOURCES = i915/gem_workarounds.c
> -- 
> 2.27.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
