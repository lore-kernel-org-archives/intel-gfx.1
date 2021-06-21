Return-Path: <SRS0=oyEe=LP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA42BC4743C
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 10:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91026610EA
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 10:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91026610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3386A89D46;
	Mon, 21 Jun 2021 10:55:40 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05A489E3F;
 Mon, 21 Jun 2021 10:55:38 +0000 (UTC)
IronPort-SDR: CSZs35lQtXmfGfJrNFkXfyvX/h3kRz5x1cfdfpJvTF2kGaZUjgU4As5g7NVn3FmrGcjdO8UTRq
 DlEGx3eSel7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="267959828"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="267959828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 03:55:38 -0700
IronPort-SDR: NXbV9wE3YxDvUjddWYd3bdgWZFAY8YRcNF8rauyzUDEKxqPbSxSRTadKXu8hf+prP/DrqXCY2T
 k3lXLy2VHW+Q==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="422899876"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 03:55:36 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lvHcX-0004td-Al; Mon, 21 Jun 2021 13:57:37 +0300
Date: Mon, 21 Jun 2021 13:57:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Message-ID: <YNBwoaw3fgYfxsXS@platvala-desk.ger.corp.intel.com>
References: <20210531153922.4683-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531153922.4683-1-shawn.c.lee@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Avoid
 SIGSEGV when release DRM connector.
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 charlton.lin@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 31, 2021 at 11:39:22PM +0800, Lee Shawn C wrote:
> Got SIGSEGV fault while running kms_dp_dsc test but did not
> connect DP DSC capable monitor on eDP/DP port. This test daemon
> should "SKIP" test without any problem. We found kms_dp_dsc
> can't get proper drmModeConnector and caused this SIGSEGV fault
> when release it. Make sure drmModeConnector is available before
> free it can avoid this issue.
> 
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_dp_dsc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
> index 2446fd82bba3..ea7c9f4f72ce 100644
> --- a/tests/kms_dp_dsc.c
> +++ b/tests/kms_dp_dsc.c
> @@ -262,7 +262,7 @@ igt_main
>  	data_t data = {};
>  	igt_output_t *output;
>  	drmModeRes *res;
> -	drmModeConnector *connector;
> +	drmModeConnector *connector = NULL;
>  	int i, test_conn_cnt, test_cnt;
>  	int tests[] = {DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DisplayPort};
>  
> @@ -311,7 +311,8 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		drmModeFreeConnector(connector);
> +		if (connector)
> +			drmModeFreeConnector(connector);
>  		drmModeFreeResources(res);
>  		close(data.debugfs_fd);
>  		close(data.drm_fd);
> -- 
> 2.17.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
