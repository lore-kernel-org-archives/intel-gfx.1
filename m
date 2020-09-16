Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFF5C433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 08:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4FA20872
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 08:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4FA20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A683B6E048;
	Wed, 16 Sep 2020 08:49:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EF56E048
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 08:49:46 +0000 (UTC)
IronPort-SDR: n3Ye2C3ZypyMhaVWHw/4t1lWSOnvRlPqV07dpy4RCKaaO0DXLxzOr//Cjp7ropxfB97hn4OJI3
 RGFRvAI1Vulg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="160357008"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="160357008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 01:49:45 -0700
IronPort-SDR: T3/6Ko3JC0OZiAVdxTjmgCY1BLbfe/HkoDD4xhj462yTRGVBzuDdVmCVuK/VzI0JHc/iszsu15
 aoj2aEnjBWGw==
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="483217383"
Received: from djgriffi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.8.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 01:49:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 16 Sep 2020 11:49:48 +0300
Message-ID: <87k0wuw1g3.fsf@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] Fixes that failed to apply to v5.9-rc5
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


Now that we have drm-intel-gt-next merged, we also get the gt fixes.

The following commits failed to cherry-pick:

56f581bad4bf ("drm/i915/gt: Only transfer the virtual context to the new engine if active")
b3786b29379c ("drm/i915/gt: Distinguish the virtual breadcrumbs from the irq breadcrumbs")
2e4c6c1a9db5 ("drm/i915: Remove i915_request.lock requirement for execution callbacks")

Please also check the ones that did cherry-pick fine; I've pushed them
out to drm-intel-fixes.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
