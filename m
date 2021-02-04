Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AB0C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 19:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59C860235
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 19:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59C860235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AB16EE55;
	Thu,  4 Feb 2021 19:44:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220266EE55
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 19:44:56 +0000 (UTC)
IronPort-SDR: MzcYWRXF6ALh0/q/OSwsd1SynKKJOOSyXILP9RItFOZ7aSxXGrLqSH4MUdHdIg4z7dikbDUMr+
 JnG4dGg23wag==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="180542429"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="180542429"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 11:44:49 -0800
IronPort-SDR: 4j9/2aT4vTXJh7hrNIkUtvuH0UOCaS7pLbQAIvIBsYLup5C0zO4Mo/YoMHNd3gErv8dWh18pPK
 jyi+l63Gxyaw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="360076735"
Received: from dbmayer-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.1])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 11:44:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210127030548.29296-1-airlied@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210127030548.29296-1-airlied@gmail.com>
Date: Thu, 04 Feb 2021 21:44:44 +0200
Message-ID: <874kirfwib.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [rfc v10] refactor intel_display.c + a bit more
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

On Wed, 27 Jan 2021, Dave Airlie <airlied@gmail.com> wrote:
> This is a repost of the last series, rebased to include the VRR
> and GEN12 CCS changes.
>
> It also has to scaler and ddi pll state movement patches that need
> review, I think the rest should be pretty good to push sooner so
> I don't fall into any more rebase traps.

It started conflicting on day 1. :(

Rebased and resent -> [1].

BR,
Jani.


[1] http://lore.kernel.org/r/cover.1612467466.git.jani.nikula@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
