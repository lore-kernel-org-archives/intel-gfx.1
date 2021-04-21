Return-Path: <SRS0=MVSk=JS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992B2C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 11:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A831613F6
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 11:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A831613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AE66E982;
	Wed, 21 Apr 2021 11:03:09 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47B66E982
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Apr 2021 11:03:07 +0000 (UTC)
IronPort-SDR: ORFoB2l9Rdgy0VDayPx6PqoF1uaVGFCA482Imuzug5GKyCYBTvvwSUQe0FuBlXNn0yPRp29Diz
 HnV6uk87Xwmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="259632726"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="259632726"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 04:03:06 -0700
IronPort-SDR: HNEObM6qyWd2kt9sYCugGRXNdtd+x24R/7VPUP43HWkjeAK2R7dw8scO1kJSm64AsLKx6AAiCp
 pc/AbYeIJOQA==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="420950825"
Received: from uchalilx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 04:03:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210325180720.401410-1-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210325180720.401410-1-matthew.d.roper@intel.com>
Date: Wed, 21 Apr 2021 14:03:01 +0300
Message-ID: <87wnsv99y2.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 00/50] Introduce Alder Lake-P
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
Cc: me@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 25 Mar 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> The previous version of this series was here:
>         https://lists.freedesktop.org/archives/intel-gfx/2021-March/262168.html
>
> The preparation patches that convert display/ to use DISPLAY_VER()
> instead of INTEL_GEN() have landed on drm-tip now, so this is mostly
> just a straightforward rebase of the remaining patches.  I think there
> was only one minor functional fix to the last patch of the series (PSR
> changes).

When this series starts getting ready to merge, please use the
topic/adl-p-enabling branch, so we can merge it to both drm-intel-next
and drm-intel-gt-next.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
