Return-Path: <SRS0=0RYq=D5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0B3C4363A
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 08:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FA421481
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FA421481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969AD6F53E;
	Thu, 22 Oct 2020 08:16:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697FA6F53E
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 08:16:23 +0000 (UTC)
IronPort-SDR: ykcVajqjDR1cIOTNBdCkXwxuLE7ert0MJJbalJwBs42jRXDz5482yc2MAir/bvxGtmYmvy9v89
 DKxBEMhaTOQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="164897159"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="164897159"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 01:16:17 -0700
IronPort-SDR: 8cUXmZv6R0zvcEQ/eScMiuPLcEjAonWV/JAYlU2E0pukGwO+lbP2JgpTWATm9+OU4CDYQWyx0M
 0RZREjXpsVRA==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="533868375"
Received: from mmoysa-mobl1.ger.corp.intel.com (HELO [10.252.55.201])
 ([10.252.55.201])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 01:16:16 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201021143948.2558154-1-maarten.lankhorst@linux.intel.com>
 <160329148583.24927.9148362733542956189@build.alporthouse.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <e2ff0d4d-1c5c-59d0-e114-3f46ec9fc2f1@linux.intel.com>
Date: Thu, 22 Oct 2020 10:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <160329148583.24927.9148362733542956189@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Do not share hwsp across contexts
 any more, v5.1
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

Op 21-10-2020 om 16:44 schreef Chris Wilson:
> Quoting Maarten Lankhorst (2020-10-21 15:39:48)
>> Instead of sharing pages with breadcrumbs, give each timeline a
>> single page. This allows unrelated timelines not to share locks
>> any more during command submission.
> This is designed to fail. No. The hwsp is observed externally with a
> lifetime outside of the local timeline's control.
> -Chris

Hey,

Thank you for looking at the patch. It seems you're worried about
lifetime issues. When the timeline is pinned, i915_active takes a
reference on the vma pin and timeline.

intel_timeline_read_hwsp() uses the existing i915_active trick to keep
the timeline alive, so this will stay working correctly as intended. :)

Can I add your reviewed-by for the patch when I submit it to the ml
again?

Cheers,
~Maarten

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
