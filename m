Return-Path: <SRS0=x7Pm=FN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94DCC433FE
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 23:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDD123B77
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 23:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDD123B77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF016E2EF;
	Wed,  9 Dec 2020 23:50:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321106E2D5;
 Wed,  9 Dec 2020 23:50:12 +0000 (UTC)
IronPort-SDR: 5TGmVq/FoBYiZKF4w0/yNX9SnhB3yhdrKm6D0/34omwMj1KkBwaXIG4EdC8esODj+x5uwts9mU
 Ij8LSoljU3Lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="258884914"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="258884914"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 15:50:11 -0800
IronPort-SDR: Emk3oZMBurRUZFqJd1zPE8jcLyLQdGHioOXEjM+7IAPjlJM3vNahPdy8p+GKa6/YIvSG273isi
 yJwmyjl7gnVw==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="371140734"
Received: from dannie-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.50.82])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 15:50:11 -0800
Date: Wed, 9 Dec 2020 15:50:10 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20201209235010.GA10554@intel.com>
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

The commit 7c5c15dffe1e ("drm/i915/gt: Declare gen9 has 64 mocs entries!")
should actually be sent last week along with the commit
777a7717d60c ("drm/i915/gt: Program mocs:63 for cache eviction on gen9"),
but I had missed that and dim didn't cope with fixes for fixes.

Here goes drm-intel-fixes-2020-12-09:

Fixes for VDSC/DP, selftests, shmem_utils, preemption, submission, and gt reset:

- Check the correct variable in selftest (Dan)
- Propagate error from canceled submit due to context closure (Chris)
- Ignore repeated attempts to suspend request flow across reset (Chris)
- Cancel the preemption timeout on responding to it (Chris)
- Fix unsigned compared against 0 (Colin)
- Compute the correct slice count for VDSC on DP (Manasi)
- Declar gen9 has 64 mocs entries (Chris)

Thanks,
Rodrigo.

The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-12-09

for you to fetch changes up to 7c5c15dffe1e3c42f44735ce9552afb7207f1584:

  drm/i915/gt: Declare gen9 has 64 mocs entries! (2020-12-08 07:09:58 -0800)

----------------------------------------------------------------
Fixes for VDSC/DP, selftests, shmem_utils, preemption, submission, and gt reset:

- Check the correct variable in selftest (Dan)
- Propagate error from canceled submit due to context closure (Chris)
- Ignore repeated attempts to suspend request flow across reset (Chris)
- Cancel the preemption timeout on responding to it (Chris)
- Fix unsigned compared against 0 (Colin)
- Compute the correct slice count for VDSC on DP (Manasi)
- Declar gen9 has 64 mocs entries (Chris)

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915/gem: Propagate error from cancelled submit due to context closure
      drm/i915/gt: Ignore repeated attempts to suspend request flow across reset
      drm/i915/gt: Cancel the preemption timeout on responding to it
      drm/i915/gt: Declare gen9 has 64 mocs entries!

Colin Ian King (1):
      drm/i915: fix size_t greater or equal to zero comparison

Dan Carpenter (1):
      drm/i915/gem: Check the correct variable in selftest

Manasi Navare (1):
      drm/i915/display/dp: Compute the correct slice count for VDSC on DP

 drivers/gpu/drm/i915/display/intel_dp.c        | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 7 +++++--
 drivers/gpu/drm/i915/gt/intel_lrc.c            | 7 ++++++-
 drivers/gpu/drm/i915/gt/intel_mocs.c           | 7 +++----
 drivers/gpu/drm/i915/gt/shmem_utils.c          | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c      | 4 ++--
 6 files changed, 18 insertions(+), 11 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
