Return-Path: <SRS0=cAZQ=JJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11407C43460
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 22:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C416C61246
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 22:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C416C61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688DF6E09A;
	Mon, 12 Apr 2021 22:43:38 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697526E09E
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Apr 2021 22:43:37 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Apr 2021 00:43:28 +0200
Message-Id: <20210412224330.515926-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/2] drm/i915: Fix for BSW and BXT vt-d.
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

There's a lockdep splat that currently prevents booting on CI, fix it.

Maarten Lankhorst (2):
  drm/i915: Remove asynchronous vma binding
  drm/i915: Use trylock in shrinker for ggtt on bsw vt-d and bxt.

 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c   |   3 -
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c         |   1 -
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c         |   1 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c         |  12 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c          |   5 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h          |   2 -
 drivers/gpu/drm/i915/i915_drv.h              |  11 +-
 drivers/gpu/drm/i915/i915_gem.c              |  21 ++-
 drivers/gpu/drm/i915/i915_vma.c              | 174 +++----------------
 drivers/gpu/drm/i915/i915_vma.h              |   5 +-
 drivers/gpu/drm/i915/i915_vma_types.h        |   3 -
 12 files changed, 61 insertions(+), 190 deletions(-)

-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
