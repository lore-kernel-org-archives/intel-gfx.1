Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE8AC5519F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 11:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4153A20789
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 11:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4153A20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D0289DFA;
	Mon, 16 Nov 2020 11:01:12 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBB589DFA
 for <Intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 11:01:11 +0000 (UTC)
IronPort-SDR: o+qrsMQhEyrWnEFZCs2Zo6fhymrFlFvH3HL0Oj/NU0K71x1mVIw/d9S3h/2GvXDv4gKM9vVVaE
 DG5p0+tNTzdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="188772796"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="188772796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 03:01:11 -0800
IronPort-SDR: KOus0GVJ5AaHPE18gQSp3HLgjb10CBq+2QO7bJRdJYSO1xeQbJCZJbnpef9lGQwOlFypP69qYQ
 6idUXt7fmS1A==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="309838855"
Received: from joejam1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.3.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 03:01:09 -0800
MIME-Version: 1.0
In-Reply-To: <20201115210815.5272-10-sean.z.huang@intel.com>
References: <20201115210815.5272-1-sean.z.huang@intel.com>
 <20201115210815.5272-10-sean.z.huang@intel.com>
To: "Huang, Sean Z" <sean.z.huang@intel.com>, Intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160552446714.10586.4206532920335090879@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 16 Nov 2020 13:01:07 +0200
Subject: Re: [Intel-gfx] [PATCH 10/27] drm/i915/pxp: Enable ioctl action to
 reserve session slot
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

Quoting Huang, Sean Z (2020-11-15 23:07:58)
> With this ioctl action, ring3 driver can reserve a specific
> session slot/id assigned by ring0 PXP, as the first step of PXP
> session establishment flow. Ring3 PXP stores the session info in
> the session list structure.

The whole suggested userspace<->kernel API surface should be strictly
moved into i915_drm.h to make review easier. Now it's hard to tell
apart the suggested uAPI from the implementation.

Once the separation is in place, I'll be able to provide more review
comments on the rest of the patches.

Regards, Joonas
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
