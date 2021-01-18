Return-Path: <SRS0=QT0F=GV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14DCC433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 09:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F4B22285
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 09:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F4B22285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AED6E098;
	Mon, 18 Jan 2021 09:07:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0B66E098
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Jan 2021 09:07:20 +0000 (UTC)
IronPort-SDR: GXbcJfN1b2fKgA7dnA31qbuY4bUuc7qO7VbeTLaF5mqWQJPu1RrgRUxkcFdmrLmmYMxpqjfpnt
 l4ZNV6VnIAeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="263583127"
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; d="scan'208";a="263583127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 01:07:11 -0800
IronPort-SDR: AeZzlUgy7TfKA59zi3oe8GOsbYN2Rjd1VKFV/et5ZRfvG4xF/4tTO0UhC2cXEmUsBDjjhE4H4z
 QmHnBMlnbDpQ==
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; d="scan'208";a="383500492"
Received: from moshear-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.186.10])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 01:07:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Matt Roper <matthew.d.roper@intel.com>, Mika
 Kuoppala <mika.kuoppala@linux.intel.com>, Imre Deak <imre.deak@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 18 Jan 2021 11:07:02 +0200
Message-ID: <87lfcqobpl.fsf@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] Fixes that failed to apply to v5.11-rc4
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


The following commits have been marked as Cc: stable or fixing something
in v5.11-rc4 or earlier, but failed to cherry-pick to
drm-intel-fixes. Please see if they are worth backporting, and please do
so if they are.

Conflicts:
dbe13ae1d6ab ("drm/i915/pmu: Don't grab wakeref when enabling events")
9bb36cf66091 ("drm/i915: Check for rq->hwsp validity after acquiring RCU lock")
5b4dc95cf7f5 ("drm/i915/gt: Prevent use of engine->wa_ctx after error")
6a3daee1b38e ("drm/i915/selftests: Fix some error codes")
67fba3f1c73b ("drm/i915/dp: Fix LTTPR vswing/pre-emp setting in non-transparent mode")

Fails to build:
3170a21f7059 ("drm/i915: Only enable DFP 4:4:4->4:2:0 conversion when outputting YCbCr 4:4:4")

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
