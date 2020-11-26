Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF26C56201
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 01:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4D52075A
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 01:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B4D52075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ADF6E4B5;
	Thu, 26 Nov 2020 01:06:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA926E497;
 Thu, 26 Nov 2020 01:06:25 +0000 (UTC)
IronPort-SDR: tw43qdgqH/ShGcCYbzqvsilh3iwLbFKAzbBuFYylMmoOdhWCc2U1KWzYHGYgbwgltkbEhC0r6H
 KUQ1TJk9OvuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="151479173"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="151479173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 17:06:25 -0800
IronPort-SDR: upjRiQvjyGWcbv0FPf3kSHKWWQ2nGqbPDXAJkP8if910RrNLBDEFASqX39zSZ50u1Wfy4ZeH00
 XFz6c+jE9VBQ==
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="370963247"
Received: from anyachat-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.251.131.193])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 17:06:24 -0800
Date: Wed, 25 Nov 2020 17:06:23 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20201126010623.GA827684@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Intel-gfx] [PULL] drm-intel-fixes
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Please notice that commit eb0104ee498d ("drm/i915/gt: Track signaled breadcrumbs outside of the breadcrumb spinlock")
is just a dependency of commit 2e6ce8313a53 ("drm/i915/gt: Don't cancel the interrupt shadow too early").

Here goes drm-intel-fixes-2020-11-25:
- Fix Perf/OA workaround register corruption (Lionel)
- Correct a comment statement in GVT (Yan)
- Fix GT enable/disable iterrupts, including a race condition that prevented GPU to go idle (Chris)
- Free stale request on destroying the virtual engine (Chris)

Thanks,
Rodrigo.

The following changes since commit 418baf2c28f3473039f2f7377760bd8f6897ae18:

  Linux 5.10-rc5 (2020-11-22 15:36:08 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-11-25

for you to fetch changes up to 280ffdb6ddb5de85eddd476a3bcdc19c9a80f089:

  drm/i915/gt: Free stale request on destroying the virtual engine (2020-11-24 09:30:57 -0800)

----------------------------------------------------------------
- Fix Perf/OA workaround register corruption (Lionel)
- Correct a comment statement in GVT (Yan)
- Fix GT enable/disable iterrupts, including a race condition that prevented GPU to go idle (Chris)
- Free stale request on destroying the virtual engine (Chris)

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915/gt: Defer enabling the breadcrumb interrupt to after submission
      drm/i915/gt: Track signaled breadcrumbs outside of the breadcrumb spinlock
      drm/i915/gt: Don't cancel the interrupt shadow too early
      drm/i915/gt: Free stale request on destroying the virtual engine

Lionel Landwerlin (1):
      drm/i915/perf: workaround register corruption in OATAILPTR

Yan Zhao (1):
      drm/i915/gvt: correct a false comment of flag F_UNALIGN

 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c       | 143 ++++++++++++++--------
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c               |  60 +++++++--
 drivers/gpu/drm/i915/gvt/gvt.h                    |   2 +-
 drivers/gpu/drm/i915/i915_perf.c                  |   9 +-
 drivers/gpu/drm/i915/i915_reg.h                   |   2 +
 drivers/gpu/drm/i915/i915_request.h               |   6 +-
 7 files changed, 161 insertions(+), 63 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
