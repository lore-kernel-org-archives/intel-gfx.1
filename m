Return-Path: <SRS0=3Rq4=PR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78FCC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 17:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E71261038
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 17:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E71261038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4406EA77;
	Fri, 29 Oct 2021 17:43:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850466EA77;
 Fri, 29 Oct 2021 17:43:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10152"; a="217628331"
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="217628331"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 10:43:41 -0700
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="724956253"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 10:43:41 -0700
Date: Fri, 29 Oct 2021 10:39:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
Message-ID: <20211029173905.GA35332@jons-linux-dev-box>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021234044.3071069-3-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/8]
 tests/i915/gem_exec_capture: Cope with larger page sizes
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

On Thu, Oct 21, 2021 at 04:40:38PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> At some point, larger than 4KB page sizes were added to the i915
> driver. This included adding an informational line to the buffer
> entries in error capture logs. However, the error capture test was not
> updated to skip this string, thus it would silently abort processing.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 53649cdb2..47ca64dd6 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -484,6 +484,12 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  		addr |= strtoul(str + 1, &str, 16);
>  		igt_assert(*str++ == '\n');
>  
> +		/* gtt_page_sizes = 0x00010000 */
> +		if (strncmp(str, "gtt_page_sizes = 0x", 19) == 0) {
> +			str += 19 + 8;
> +			igt_assert(*str++ == '\n');
> +		}

Can you explain this logic to me, for the life of me I can't figure out
what this doing. That probably warrent's a more detailed comment too.

Matt 

> +
>  		if (!(*str == ':' || *str == '~'))
>  			continue;
>  
> -- 
> 2.25.1
> 
