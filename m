Return-Path: <SRS0=NnJ0=BU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B61BC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 20:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1A7206E9
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 20:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1A7206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C086E0F7;
	Mon, 10 Aug 2020 20:53:49 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DA66E0F7
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 20:53:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22089368-1500050 for multiple; Mon, 10 Aug 2020 21:53:44 +0100
MIME-Version: 1.0
In-Reply-To: <20200810180851.2746267-1-matthew.d.roper@intel.com>
References: <20200810180851.2746267-1-matthew.d.roper@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 10 Aug 2020 21:53:44 +0100
Message-ID: <159709282441.2955.11306667328253055885@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't try to check max stride for
 disabled/non-existent display
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

Quoting Matt Roper (2020-08-10 19:08:51)
> Userspace may still create GEM dumb buffers even on platforms with
> disabled or non-existent display.  When creating dumb buffers we try to
> check the max fb stride for the platform by looking at the first pipe on
> the platform.  We previously fixed a crash related to accessing the
> non-existent PIPE_A in commit 8ac495f624a4 ("drm/i915: Don't oops in
> dumb_create ioctl if we have no crtcs") but the crash is back as of
> commit eae3da27ba84 ("drm/i915: Get first crtc instead of PIPE_A crtc")
> because we now try to iterate over the [uninitialized] crtc list.

drm_mode_config_init() is still being called
i915_driver_probe
  -> i915_driver_modeset_probe_noirq
    -> intel_modeset_init_noirq
      -> intel_mode_config_init
        -> drm_mode_config_init
regardless of the status for HAS_DISPLAY or INTEL_DISPLAY_ENABLED. So
drm_crtc_index(0) should be returning NULL?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
