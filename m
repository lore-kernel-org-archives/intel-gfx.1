Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2BCC4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 21:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9C560E76
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 21:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC9C560E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1D56E8C7;
	Wed, 18 Aug 2021 21:13:30 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AC06E8C7;
 Wed, 18 Aug 2021 21:13:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216426133"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="216426133"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 14:13:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="521235962"
Received: from ygagnonx-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.34.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 14:13:20 -0700
Date: Wed, 18 Aug 2021 17:13:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Message-ID: <YR137zkSAIbun1Ed@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2021-08-18:

- Expand a tweaked display workaround for all PCHs. (Anshuman)
- Fix eDP MSO pipe sanity checks for ADL-P. (Jani)
- Remove superfluous EXPORT_SYMBOL(). (Jani)

Thanks,
Rodrigo.

The following changes since commit 7c60610d476766e128cc4284bb6349732cbd6606:

  Linux 5.14-rc6 (2021-08-15 13:40:53 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-08-18

for you to fetch changes up to e3e86f41385b2b5d5f771de6009748b584334366:

  drm/i915/dp: remove superfluous EXPORT_SYMBOL() (2021-08-18 07:23:57 -0400)

----------------------------------------------------------------
- Expand a tweaked display workaround for all PCHs. (Anshuman)
- Fix eDP MSO pipe sanity checks for ADL-P. (Jani)
- Remove superfluous EXPORT_SYMBOL(). (Jani)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915: Tweaked Wa_14010685332 for all PCHs

Jani Nikula (2):
      drm/i915/edp: fix eDP MSO pipe sanity checks for ADL-P
      drm/i915/dp: remove superfluous EXPORT_SYMBOL()

 drivers/gpu/drm/i915/display/intel_ddi.c           | 24 +++++++++++-----------
 drivers/gpu/drm/i915/display/intel_display_power.c | 16 +++++++--------
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  1 -
 drivers/gpu/drm/i915/i915_irq.c                    | 21 -------------------
 4 files changed, 20 insertions(+), 42 deletions(-)
