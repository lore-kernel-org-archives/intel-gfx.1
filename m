Return-Path: <SRS0=LDoR=ND=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00191C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 23:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7B761038
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 23:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E7B761038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDEC6E499;
	Thu, 12 Aug 2021 23:14:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373F36E499
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Aug 2021 23:14:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="195054637"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="195054637"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 16:14:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="422697613"
Received: from testes-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.37.214])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 16:14:12 -0700
Date: Thu, 12 Aug 2021 16:14:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <20210812231411.toiiqfiw2r5mga5f@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210805163647.801064-1-matthew.d.roper@intel.com>
 <20210805163647.801064-6-matthew.d.roper@intel.com>
 <267531628ba0b49b722f4feef31ca57e9ac61e78.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <267531628ba0b49b722f4feef31ca57e9ac61e78.camel@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/9] drm/i915/xehpsdv: factor out
 function to read RP_STATE_CAP
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

On Thu, Aug 12, 2021 at 03:49:17PM -0700, Jose Souza wrote:
>On Thu, 2021-08-05 at 09:36 -0700, Matt Roper wrote:
>> From: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Instead of maintaining the same if ladder in 3 different places, add a
>> function to read RP_STATE_CAP.
>>
>
>gt_perf_status looks a good next candidate to have the same handling as rp_state_cap

I was actually hoping to remove it:
https://patchwork.freedesktop.org/patch/397131/

Discussion there stalled though. +Joonas

Lucas De Marchi
