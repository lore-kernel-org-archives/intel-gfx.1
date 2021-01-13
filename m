Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE4DC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 13:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C8523432
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 13:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43C8523432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3D46E9AE;
	Wed, 13 Jan 2021 13:18:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0D3D6E9AB;
 Wed, 13 Jan 2021 13:18:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BA17BA8835;
 Wed, 13 Jan 2021 13:18:31 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Wed, 13 Jan 2021 13:18:31 -0000
Message-ID: <161054391173.11120.4735428941227622631@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210113124600.656-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210113124600.656-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B01/10=5D_drm/i915=3A_Mark_up_protec?=
 =?utf-8?q?ted_uses_of_=27i915=5Frequest=5Fcompleted=27?=
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [01/10] drm/i915: Mark up protected uses of 'i915_request_completed'
URL   : https://patchwork.freedesktop.org/series/85803/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
f916fef99165 drm/i915: Mark up protected uses of 'i915_request_completed'
194b07e485e2 drm/i915: Drop i915_request.lock serialisation around await_start
6103c5f91828 drm/i915/gem: Reduce ctx->engine_mutex for reading the clone source
92211d1cb256 drm/i915/gem: Reduce ctx->engines_mutex for get_engines()
c9cdc86bd411 drm/i915: Reduce test_and_set_bit to set_bit in i915_request_submit()
7e2285388a39 drm/i915/gt: Drop atomic for engine->fw_active tracking
39586d91fdb9 drm/i915/gt: Extract busy-stats for ring-scheduler
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
ce188455388e drm/i915/gt: Convert stats.active to plain unsigned int
e36118043d45 drm/i915/gt: Reduce engine runtime stats from seqlock to a latch
d824af942340 drm/i915/gt: Reduce GT runtime stats from seqlock to a latch


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
