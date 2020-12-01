Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F63C64E7B
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 21:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDA72065C
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 21:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDA72065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7474D6E02B;
	Tue,  1 Dec 2020 21:11:00 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED8B6E02B
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 21:10:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23182158-1500050 for multiple; Tue, 01 Dec 2020 21:10:46 +0000
MIME-Version: 1.0
In-Reply-To: <20201201205021.GD2849269@ideak-desk.fi.intel.com>
References: <20201123182631.1740781-1-imre.deak@intel.com>
 <20201123182631.1740781-2-imre.deak@intel.com>
 <160682607520.4024.5213539229190522123@build.alporthouse.com>
 <20201201205021.GD2849269@ideak-desk.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Imre Deak <imre.deak@intel.com>
Date: Tue, 01 Dec 2020 21:10:46 +0000
Message-ID: <160685704629.19969.3005909283019006262@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/tgl: Add Clear Color support
 for TGL Render Decompression
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
Cc: Nanley G Chery <nanley.g.chery@intel.com>,
 Rafael Antognolli <rafael.antognolli@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Ville Syrjala <ville.syrjala@intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Imre Deak (2020-12-01 20:50:21)
> On Tue, Dec 01, 2020 at 12:34:35PM +0000, Chris Wilson wrote:
> > There's also the matter of coherency. Is the object coherent for reads
> > from the CPU? -- in most cases it will not be, but you should check
> > obj->cache_coherency to see if the read requires a preceding
> > cache_clflush_range() / drm_clflush_virt_range().
> 
> Ok, at this point for the TGL-only modifier, we could then just
> warn_on(!bo_cache_coherent_for_read) due to HAS_LLC.

Stupid question, is the same path required for dg1?

That makes everything more difficult as the struct pages are gone.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
