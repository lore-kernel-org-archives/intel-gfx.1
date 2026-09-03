Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A8C61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 15:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B71A10F688;
	Thu,  3 Sep 2026 15:10:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A835F10F691;
 Thu,  3 Sep 2026 15:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B0?=
 =?utf-8?q?1/11=5D_drm/i915=3A_fix_incorrect_RCU_teardown_order?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 03 Sep 2026 15:10:25 -0000
Message-ID: <178844822568.119026.9764295149545856053@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903134408.105317-1-christian.koenig@amd.com>
In-Reply-To: <20260903134408.105317-1-christian.koenig@amd.com>
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [01/11] drm/i915: fix incorrect RCU teardown order
URL   : https://patchwork.freedesktop.org/series/173314/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/173314/revisions/1/mbox/ not applied
Applying: drm/i915: fix incorrect RCU teardown order
Applying: dma-buf: Add reference counting to dma_resv v2
Applying: dma-buf/tests: Convert st-dma-resv tests to use dma_resv_alloc v2
Applying: drm/gem: Add helper for drm_gem_object resv assignment v2
error: sha1 information is lacking or useless (drivers/gpu/drm/drm_gem.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 drm/gem: Add helper for drm_gem_object resv assignment v2
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


