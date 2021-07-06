Return-Path: <SRS0=a3P7=L6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038BDC07E96
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 22:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B533861C91
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 22:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B533861C91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BAD6E4AA;
	Tue,  6 Jul 2021 22:48:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791B189F97;
 Tue,  6 Jul 2021 22:48:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="294849492"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="294849492"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 15:48:30 -0700
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="410627987"
Received: from pbarbago-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.131.218])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 15:48:29 -0700
Date: Tue, 6 Jul 2021 15:48:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20210706224827.lv6sjchfl735vzkf@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-4-matthew.d.roper@intel.com>
 <CAKMK7uH4+WgjJ12uYd+3Jb+0fcUtPDhy3R2HLsMQhYF1uHcMow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH4+WgjJ12uYd+3Jb+0fcUtPDhy3R2HLsMQhYF1uHcMow@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/53] drm/i915: Fork DG1 interrupt handler
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 11:21:10AM +0200, Daniel Vetter wrote:
>On Thu, Jul 1, 2021 at 10:26 PM Matt Roper <matthew.d.roper@intel.com> wrote:
>>
>> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>
>> The current interrupt handler is getting increasingly complicated and
>> Xe_HP changes will bring even more complexity.  Let's split off a new
>> interrupt handler starting with DG1 (i.e., when the master tile
>> interrupt register was added to the design) and use that as the basis
>> for the new Xe_HP changes.
>>
>> Now that we track the hardware IP's release number as well as the
>> version number, we can also properly define DG1 has version "12.10" and
>> replace the has_master_unit_irq feature flag with an IP version test.
>>
>> Bspec: 50875
>> Cc: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
>So I know DG1 upstream is decidedly non-smooth, but basic
>infrastructure we've had since forever ...
>
>Why was this prep work not upstreamed earlier with some benign commit
>message that doesn't mention DG2? There's zero DG2 stuff in here, this
>could have landed months/years ago even. Bringing this up since right
>this moment we have an internal chat about trees diverging a bit much.

history isn't linear and this commit, the way it is now, didn't exist 1
month ago, so your timescale is misleading. has_master_unit_irq was what
we thought we would need to share as much code as possible.

The biggest reason to fork the irq handler is actually not DG1 nor DG2,
but XEHPSDV and without those changes it would basically be a 95% copy
of the gen11 handler... for someone not looking to what is in the
pipeline, it can be a perfect argument to "consolidate these into a
single handler".

Lucas De Marchi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
