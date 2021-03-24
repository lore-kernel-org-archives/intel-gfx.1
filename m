Return-Path: <SRS0=sv0W=IW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1474BC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 13:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA6F60C3D
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 13:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA6F60C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032FF6E9FD;
	Wed, 24 Mar 2021 13:16:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E2F26E9D6;
 Wed, 24 Mar 2021 13:16:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8763AA9932;
 Wed, 24 Mar 2021 13:16:48 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Wed, 24 Mar 2021 13:16:48 -0000
Message-ID: <161659180852.19036.1948952778297658102@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Default_request/fence_expiry_+_watchdog_=28rev5=29?=
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

Series: Default request/fence expiry + watchdog (rev5)
URL   : https://patchwork.freedesktop.org/series/87930/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
8fc435bf4d9f drm/i915: Extract active lookup engine to a helper
-:114: CHECK:LINE_SPACING: Please don't use multiple blank lines
#114: FILE: drivers/gpu/drm/i915/i915_request.c:290:
+
+

total: 0 errors, 0 warnings, 1 checks, 104 lines checked
eee19b9617fc drm/i915: Individual request cancellation
263ce11450a2 drm/i915: Restrict sentinel requests further
9d6ef50b29a0 drm/i915: Handle async cancellation in sentinel assert
d0d85357b1fb drm/i915: Request watchdog infrastructure
22d460cbf87f drm/i915: Fail too long user submissions by default
d81b27e279a2 drm/i915: Allow configuring default request expiry via modparam


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
