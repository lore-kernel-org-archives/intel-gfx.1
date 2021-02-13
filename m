Return-Path: <SRS0=GbfI=HP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5283C433DB
	for <intel-gfx@archiver.kernel.org>; Sat, 13 Feb 2021 11:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21AB164DA8
	for <intel-gfx@archiver.kernel.org>; Sat, 13 Feb 2021 11:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21AB164DA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986066E3F2;
	Sat, 13 Feb 2021 11:05:10 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C7D6E3F2
 for <intel-gfx@lists.freedesktop.org>; Sat, 13 Feb 2021 11:05:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23857882-1500050 for multiple; Sat, 13 Feb 2021 11:05:05 +0000
MIME-Version: 1.0
In-Reply-To: <20210213042756.953007-4-lucas.demarchi@intel.com>
References: <20210213042756.953007-1-lucas.demarchi@intel.com>
 <20210213042756.953007-4-lucas.demarchi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Date: Sat, 13 Feb 2021 11:05:04 +0000
Message-ID: <161321430431.4581.811329210493659200@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [CI 4/4] drm/i915: move intel_init_audio_hooks
 inside display
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

Quoting Lucas De Marchi (2021-02-13 04:27:56)
> intel_init_audio_hooks() sets up hooks in the display struct and only
> makes sense when we have display. Move it inside
> intel_init_display_hooks() so it isn't called when we don't have
> display.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

And patch 2 answered the question of what about intel_audio_init().

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
