Return-Path: <SRS0=k2AZ=C6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27000C4363C
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2020 18:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3B5207BC
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2020 18:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3B5207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBF06E520;
	Mon, 21 Sep 2020 18:37:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4D26E51B;
 Mon, 21 Sep 2020 18:36:58 +0000 (UTC)
IronPort-SDR: bP5QqbiV9m+rMyjaiB0op6xK1CQ22kOB0fChymd2Vp2I9B5MoX/N0i5bODgPOlxTEwNPC1SOxi
 HMPBfCaDBsPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="178517692"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="178517692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:36:57 -0700
IronPort-SDR: PZPhsDQwnvhVcFDhIj6wilJWtSKNVSKzzNYy8jsIkjvgIcO5hk0n55ikIai0tXzfEvxA5KYsmx
 rIBHyWF7FmJA==
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="485606928"
Received: from pamcglyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.84.51])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:36:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <3df7f6ec13348537bec5e0736563616e9ed05c28.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200901123226.4177-1-jani.nikula@intel.com>
 <c4b9aa428ccfa90cb29845f622eba8923eeb2e38.camel@redhat.com>
 <87d0354bqi.fsf@intel.com>
 <3df7f6ec13348537bec5e0736563616e9ed05c28.camel@redhat.com>
Date: Mon, 21 Sep 2020 21:37:06 +0300
Message-ID: <87v9g7q8ml.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/dp: start using more of the extended
 receiver caps
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

On Mon, 21 Sep 2020, Lyude Paul <lyude@redhat.com> wrote:
> On Tue, 2020-09-01 at 21:01 +0300, Jani Nikula wrote:
>> I guess we can try without the change, and fix later if we hit issues.
>
> I'm fine with the change if it doesn't break things btw - just as long as
> we're making sure that we don't zero things out by accident

My conclusion was to go without, it's a trivial change to add
afterwards as needed.

BR,
Jani.




-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
