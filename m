Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D338DC433DB
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 07:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DFA23120
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 07:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96DFA23120
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9046E3F9;
	Thu,  7 Jan 2021 07:50:38 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9E06E3F9;
 Thu,  7 Jan 2021 07:50:36 +0000 (UTC)
IronPort-SDR: 11Xnq13BnXETSpPJtVoaBzwkvnhC0Bb35gbqJpii253EMnq18vDWQHOk9FEml5lTzAtu/Pjg8C
 46j407G7m/zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="156577808"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="156577808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 23:50:36 -0800
IronPort-SDR: 8c5cw/Si9ja+O1mGgH9NQtF2R0dm+4EdlewNmIEyDPM5Br+xOJ6aoU9Ten0Kz7p/jHou+3Fpok
 1yMlrORLrTLQ==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="379622302"
Received: from muhymini-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.207.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 23:50:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 07 Jan 2021 09:50:28 +0200
Message-ID: <877dop18zf.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Pretty quiet still, but here's some cc: stable fixes.

(Well, one doesn't have the explicit stable tag, but the Fixes tag
points at a commit in v3.9...)

drm-intel-fixes-2021-01-07:
drm/i915 fixes for v5.11-rc3:
- Use per-connector PM QoS tracking for DP aux communication
- GuC firmware fix for older Cometlakes
- Clear the gpu reloc and shadow batches

BR,
Jani.

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-01-07

for you to fetch changes up to 9397d66212cdf7a21c66523f1583e5d63a609e84:

  drm/i915/dp: Track pm_qos per connector (2021-01-05 10:25:03 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.11-rc3:
- Use per-connector PM QoS tracking for DP aux communication
- GuC firmware fix for older Cometlakes
- Clear the gpu reloc and shadow batches

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gt: Define guc firmware blob for older Cometlakes
      drm/i915/dp: Track pm_qos per connector

Matthew Auld (2):
      drm/i915: clear the shadow batch
      drm/i915: clear the gpu reloc batch

 drivers/gpu/drm/i915/display/intel_display_types.h |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c            |  8 +++++--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  1 +
 drivers/gpu/drm/i915/i915_cmd_parser.c             | 27 ++++++++--------------
 drivers/gpu/drm/i915/i915_drv.c                    |  5 ----
 drivers/gpu/drm/i915/i915_drv.h                    |  3 ---
 7 files changed, 22 insertions(+), 29 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
