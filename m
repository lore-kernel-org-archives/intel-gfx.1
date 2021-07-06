Return-Path: <SRS0=a3P7=L6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49104C07E96
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 20:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E136261C94
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 20:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E136261C94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9420C6E06E;
	Tue,  6 Jul 2021 20:58:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151A06E06E;
 Tue,  6 Jul 2021 20:57:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196360477"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="196360477"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 13:57:55 -0700
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="491467826"
Received: from pbarbago-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.131.218])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 13:57:53 -0700
Date: Tue, 6 Jul 2021 13:57:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20210706205752.k2lm266zu6kdyqrz@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-2-matthew.d.roper@intel.com>
 <e15c0271-8663-6122-f7af-80c642fd2a4f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e15c0271-8663-6122-f7af-80c642fd2a4f@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/53] drm/i915: Add "release id" version
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

On Fri, Jul 02, 2021 at 01:33:50PM +0100, Tvrtko Ursulin wrote:
>
>On 01/07/2021 21:23, Matt Roper wrote:
>>From: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Besides the arch version returned by GRAPHICS_VER(), new platforms
>>contain a "release id" to make clear the difference from one platform to
>>another. Although for the first ones we may use them as if they were a
>
>What does "first ones" refer to here?

XeHP-SDV and DG2. The additional register that commit
01eb15c9165e ("drm/i915: Add DISPLAY_VER() and related macros")
talks about is not available for these platforms. Here we hardcode them
in software to something that makes sense and it allows the driver to
be properly prepared for future platforms.

>
>>major/minor version, that is not true for all platforms: we may have a
>>`release_id == n` that is closer to `n - 2` than to `n - 1`.
>
>Hm this is a bit confusing. Is the sentence simply trying to say that, 
>as the release id number is growing, hw capabilities are not simply 
>accumulating but can be removed as well? Otherwise I am not sure how 
>the user of these macros is supposed to act on this sentence.

this is explaining why those numbers can't be interpreted as
major/minor and hence why here it's called "release" rather than
"minor".

Your interpretation is correct, except that a feature not being there
doesn't necessarily mean it got removed at some point. I might just had
never been in that particular release: i.e. GRAPHICS_VER_FULL() == 14.5
doesn't necessarily mean it comes after 14.3, with additional
features/fixes.

Lucas De Marchi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
