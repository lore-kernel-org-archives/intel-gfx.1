Return-Path: <SRS0=Slz9=JT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9322FC433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Apr 2021 15:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F864613D1
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Apr 2021 15:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F864613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2E16E34B;
	Thu, 22 Apr 2021 15:44:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011686E2E6;
 Thu, 22 Apr 2021 15:44:36 +0000 (UTC)
IronPort-SDR: a1bOUOuSoBqc0rwjlrZBXBATpMKzWTOG/RDyHDOawDjnqAZhi9JfYLmsobbQh3K6K2lXnlh2aB
 nipu/QroE56A==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="196022933"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="196022933"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 08:44:36 -0700
IronPort-SDR: c6HMcF5/QOhWOR+a5+Dihne+F0G5frAedepbyVUZ4zVcz2BGMNio+g/k4Z5wwoc0z12oWzqOS4
 srffrOKEqLLA==
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="603258702"
Received: from gcbowen-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.213.182.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 08:44:33 -0700
Date: Thu, 22 Apr 2021 11:44:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YIGZ3pQPgPQtZtyI@intel.com>
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

One GVT fix and one display link training fix targeting stable 5.11.

Here goes drm-intel-fixes-2021-04-22:
- GVT's BDW regression fix for cmd parser (Zhenyu)
- Fix modesetting in case of unexpected AUX timeouts (Imre)

Thanks,
Rodrigo.

The following changes since commit bf05bf16c76bb44ab5156223e1e58e26dfe30a88:

  Linux 5.12-rc8 (2021-04-18 14:45:32 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-04-22

for you to fetch changes up to 2d292995bb8f49a2596bef522679c1e1454f3230:

  Merge tag 'gvt-fixes-2021-04-20' of https://github.com/intel/gvt-linux into drm-intel-fixes (2021-04-20 09:41:32 -0400)

----------------------------------------------------------------
- GVT's BDW regression fix for cmd parser (Zhenyu)
- Fix modesetting in case of unexpected AUX timeouts (Imre)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915: Fix modesetting in case of unexpected AUX timeouts

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2021-04-20' of https://github.com/intel/gvt-linux into drm-intel-fixes

Zhenyu Wang (1):
      drm/i915/gvt: Fix BDW command parser regression

 drivers/gpu/drm/i915/display/intel_dp_link_training.c |  3 ++-
 drivers/gpu/drm/i915/gvt/cmd_parser.c                 | 19 +++++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
