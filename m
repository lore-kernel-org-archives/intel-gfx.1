Return-Path: <SRS0=YxzO=MH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C89C1B08C
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Jul 2021 13:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 592CD61278
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Jul 2021 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 592CD61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD406E85A;
	Thu, 15 Jul 2021 13:49:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408526E856;
 Thu, 15 Jul 2021 13:49:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="197733026"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="197733026"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 06:49:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="505800052"
Received: from gzhao-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.69.157])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 06:49:00 -0700
Date: Thu, 15 Jul 2021 09:48:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YPA8y1DSCp2EbtpC@intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

I was unsure about the -EDEADLK one based on Daniel's
comment on dri-devel, but Ville's response and the patch
looks reasonable to me. Also they are in sync with the
test cases. So if anything needs to still change on that
area I believe it can be a follow-up work.

Here goes drm-intel-fixes-2021-07-15:

Two regression fixes targeting stable:
- Fix -EDEADLK handling regression (Ville)
- Drop the page table optimisation (Matt)

Thanks,
Rodrigo.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-07-=
15

for you to fetch changes up to 0abb33bfca0fb74df76aac03e90ce685016ef7be:

  drm/i915/gtt: drop the page table optimisation (2021-07-14 08:46:18 -0400)

----------------------------------------------------------------
Two regression fixes targeting stable:
- Fix -EDEADLK handling regression (Ville)
- Drop the page table optimisation (Matt)

----------------------------------------------------------------
Matthew Auld (1):
      drm/i915/gtt: drop the page table optimisation

Ville Syrj=E4l=E4 (1):
      drm/i915/gt: Fix -EDEADLK handling regression

 drivers/gpu/drm/i915/gt/gen8_ppgtt.c         | 5 +----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
