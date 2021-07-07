Return-Path: <SRS0=YrHI=L7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338BEC07E95
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 20:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE5161CBB
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 20:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE5161CBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54CC6E1CE;
	Wed,  7 Jul 2021 20:21:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BE16E115;
 Wed,  7 Jul 2021 20:21:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209421836"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="209421836"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 13:21:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="560382207"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.109.109])
 ([10.209.109.109])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 13:21:36 -0700
To: Matthew Brost <matthew.brost@intel.com>
References: <20210706222010.101522-1-matthew.brost@intel.com>
 <20210706222010.101522-7-matthew.brost@intel.com>
 <9834f3c0-a1a3-9b1a-d291-732501b7a013@intel.com>
 <20210707175015.GA17157@DUT029-TGLY.fm.intel.com>
 <9f72e74d-f2ae-65ba-cb0d-fc1a7b4df08c@intel.com>
 <20210707185653.GA23375@DUT029-TGLY.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <d24a8167-309a-7a3e-8778-f12776f11bba@intel.com>
Date: Wed, 7 Jul 2021 13:21:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707185653.GA23375@DUT029-TGLY.fm.intel.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/guc: Optimize CTB writes and
 reads
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 7/7/2021 11:56, Matthew Brost wrote:
<snip>
> Ok, I sent it but I looks like patchworks didn't like it. Anyways we
> should be able to review that patch.
>
> Matt
Maybe because it came out as 6/56 instead of 6/7? Also, not sure if it 
needs to be in reply to 0/7 or 6/7?

John.

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
