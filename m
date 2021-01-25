Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8402DC433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 09:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A5322472
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 09:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A5322472
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E85989DFE;
	Mon, 25 Jan 2021 09:44:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE34489DFE
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 09:44:21 +0000 (UTC)
IronPort-SDR: fDMyb2QNZaxX41477oLdEmJhJ11OyOQekxVqCrr3Rtxv4IwNB99yuoOsyp6/joVwMsUXAdbZwS
 UudSKy/QBIKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264520832"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="264520832"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 01:44:21 -0800
IronPort-SDR: YrFAXAY5Gpf1OnrXZ+hQLKPp/hSbVoYM+1BAfvmozkAAhPQx+8bb4/5lHSCYbBFwhcrvT4thPJ
 Ln2EbMJ3zmVQ==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="429220975"
Received: from maciejho-mobl.ger.corp.intel.com (HELO [10.252.9.229])
 ([10.252.9.229])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 01:44:20 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210123145543.10533-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <88c096bd-5f55-7a6b-dcc8-ae538696f8f7@intel.com>
Date: Mon, 25 Jan 2021 09:44:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123145543.10533-1-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Move freeze/freeze_late next
 to suspend/suspend_late
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
Cc: Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 23/01/2021 14:55, Chris Wilson wrote:
> Push the hibernate pm routines next to the suspend pm routines in
> gem/i915_gem_pm.c. This has the side-effect of putting the wbinvd()
> abusers next to each other.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 30d2bfd09383 ("drm/i915/gem: Almagamate clflushes on freeze")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
