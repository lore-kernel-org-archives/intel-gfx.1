Return-Path: <SRS0=Fgr2=NB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA247C4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Aug 2021 13:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96FB360C51
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Aug 2021 13:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96FB360C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648D689FD3;
	Tue, 10 Aug 2021 13:52:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA10989FA5;
 Tue, 10 Aug 2021 13:52:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="195171653"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="195171653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 06:52:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="515849013"
Received: from allisonc-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.36.250])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 06:52:08 -0700
Date: Tue, 10 Aug 2021 09:52:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "Yuan, Hang" <hang.yuan@intel.com>
Message-ID: <YRKEhyXqzS5UXQTz@intel.com>
References: <20210810050133.GO13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810050133.GO13928@zhen-hp.sh.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
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

On Tue, Aug 10, 2021 at 01:01:33PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's one regression fix for windows VM hang issue on recent drivers.
> 
> Thanks
> --
> The following changes since commit c90b4503ccf42d9d367e843c223df44aa550e82a:
> 
>   drm/i915/gvt: Clear d3_entered on elsp cmd submission. (2021-07-08 16:42:34 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2021-08-10
> 
> for you to fetch changes up to 699aa57b35672c3b2f230e2b7e5d0ab8c2bde80a:
> 
>   drm/i915/gvt: Fix cached atomics setting for Windows VM (2021-08-09 14:42:09 +0800)

pulled, thanks

> 
> ----------------------------------------------------------------
> gvt-fixes-2021-08-10
> 
> - Fix windows VM hang issue for atomics workaround (Zhenyu)
> 
> ----------------------------------------------------------------
> Zhenyu Wang (1):
>       drm/i915/gvt: Fix cached atomics setting for Windows VM
> 
>  drivers/gpu/drm/i915/gvt/handlers.c     | 1 +
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 ++
>  2 files changed, 3 insertions(+)


