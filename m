Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA1DC6369E
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 00:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40648221F7
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 00:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40648221F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9476EA5D;
	Thu,  3 Dec 2020 00:36:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CFC6EA5D;
 Thu,  3 Dec 2020 00:36:25 +0000 (UTC)
IronPort-SDR: 7mIgqpepACoUzD9JwsiSWTrsgUEAUBr87PsIHQoajInooG41Npkwybsu+0tpSgpI+w+HpUZtsq
 HjLldsra4+sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="160167523"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="160167523"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 16:36:24 -0800
IronPort-SDR: MV6tZMddInp2em9Sb8Se7mfZO7yWaXBIm5njWpMTV/ETkkeguuSQdlZHR3oN0gCAZX6uS0Dx5d
 AHyuKsIhzapQ==
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="550273752"
Received: from jkbrown3-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.212.201.247])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 16:36:24 -0800
Date: Wed, 2 Dec 2020 16:36:24 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20201203003624.GA1517510@intel.com>
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

Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

The commit 6db58901c2aa ("drm/i915/display: return earlier from intel_modeset_init() without display") was not actually a crucial fix, but it allowed a clean pick of the use-after-free one.

Here goes drm-intel-fixes-2020-12-02:

Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

- Program mocs:63 for cache eviction on gen9 (Chris)
- Split the breadcrumb spinlock between global and contexts (Chris)
- Retain default context state across shrinking (Venkata)
- Limit frequency drop to RPe on parking (Chris)
- Return earlier from intel_modeset_init() without display (Jani)
- Defer initial modeset until after GGTT is initialized (Chris).

Thanks,
Rodrigo.

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-12-02

for you to fetch changes up to f2f2b21feadcb1eb08687a8b20dcf6442d22be18:

  drm/i915/display: Defer initial modeset until after GGTT is initialised (2020-12-01 08:36:37 -0800)

----------------------------------------------------------------
Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

- Program mocs:63 for cache eviction on gen9 (Chris)
- Split the breadcrumb spinlock between global and contexts (Chris)
- Retain default context state across shrinking (Venkata)
- Limit frequency drop to RPe on parking (Chris)
- Return earlier from intel_modeset_init() without display (Jani)
- Defer initial modeset until after GGTT is initialized (Chris).

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915/gt: Program mocs:63 for cache eviction on gen9
      drm/i915/gt: Split the breadcrumb spinlock between global and contexts
      drm/i915/gt: Limit frequency drop to RPe on parking
      drm/i915/display: Defer initial modeset until after GGTT is initialised

Jani Nikula (1):
      drm/i915/display: return earlier from intel_modeset_init() without display

Venkata Ramana Nayana (1):
      drm/i915/gt: Retain default context state across shrinking

 drivers/gpu/drm/i915/display/intel_display.c      |  24 ++--
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c       | 168 ++++++++++------------
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h |   6 +-
 drivers/gpu/drm/i915/gt/intel_context.c           |   3 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h     |  12 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c              |  14 +-
 drivers/gpu/drm/i915/gt/intel_rps.c               |   4 +
 drivers/gpu/drm/i915/gt/shmem_utils.c             |   7 +-
 drivers/gpu/drm/i915/i915_request.h               |   6 +-
 9 files changed, 124 insertions(+), 120 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
