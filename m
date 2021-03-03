Return-Path: <SRS0=1UtA=IB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F113C433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Mar 2021 22:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA9764E25
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Mar 2021 22:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA9764E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25E6E413;
	Wed,  3 Mar 2021 22:17:36 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042316E413
 for <intel-gfx@lists.freedesktop.org>; Wed,  3 Mar 2021 22:17:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 24003791-1500050 for multiple; Wed, 03 Mar 2021 22:17:30 +0000
MIME-Version: 1.0
In-Reply-To: <20210301193200.1369-5-daniele.ceraolospurio@intel.com>
References: <20210301193200.1369-1-daniele.ceraolospurio@intel.com>
 <20210301193200.1369-5-daniele.ceraolospurio@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 03 Mar 2021 22:17:30 +0000
Message-ID: <161480985070.25897.13606979102438965900@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2 04/16] drm/i915/pxp: allocate a vcs
 context for pxp usage
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

Quoting Daniele Ceraolo Spurio (2021-03-01 19:31:48)
> @@ -232,6 +235,13 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>  
>  u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>  
> +struct intel_context *
> +intel_engine_pinned_context_create(struct intel_engine_cs *engine,
> +                                  unsigned int hwsp,
> +                                  struct lock_class_key *key,
> +                                  const char *name);

intel_engine_create_pinned_context()

Other users would want to pass in vm and ring size (ring size may be
useful here as well for larger SESSION_TERMINATE_LEN())
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
