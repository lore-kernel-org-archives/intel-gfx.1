Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429F2C2D0A3
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 10:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C27F2224E
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 10:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C27F2224E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20016E06B;
	Wed,  4 Nov 2020 10:11:59 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69526E06B
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 10:11:57 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22889888-1500050 for multiple; Wed, 04 Nov 2020 10:11:56 +0000
MIME-Version: 1.0
In-Reply-To: <160448433228.9474.10886564107965448562@jlahtine-mobl.ger.corp.intel.com>
References: <20191222144046.1674865-1-chris@chris-wilson.co.uk>
 <20191222144046.1674865-3-chris@chris-wilson.co.uk>
 <160448433228.9474.10886564107965448562@jlahtine-mobl.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 04 Nov 2020 10:11:53 +0000
Message-ID: <160448471356.15691.11641803526516335867@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [CI 3/3] drm/i915/gt: Move pm debug files into a gt
 aware debugfs
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

Quoting Joonas Lahtinen (2020-11-04 10:05:32)
> Quoting Chris Wilson (2019-12-22 16:40:46)
> > From: Andi Shyti <andi.shyti@intel.com>
> > 
> > The GT system is becoming more and more a stand-alone system in
> > i915 and it's fair to assign it its own debugfs directory.
> > 
> > rc6, rps and llc debugfs files are gt related, move them into the
> > gt debugfs directory.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@intel.com>
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/Makefile             |   3 +
> >  drivers/gpu/drm/i915/gt/debugfs_engines.c |  36 ++
> >  drivers/gpu/drm/i915/gt/debugfs_engines.h |  15 +
> >  drivers/gpu/drm/i915/gt/debugfs_gt.c      |  42 ++
> >  drivers/gpu/drm/i915/gt/debugfs_gt.h      |  39 ++
> >  drivers/gpu/drm/i915/gt/debugfs_gt_pm.c   | 601 ++++++++++++++++++++++
> >  drivers/gpu/drm/i915/gt/debugfs_gt_pm.h   |  14 +
> >  drivers/gpu/drm/i915/gt/intel_gt.c        |   3 +
> >  8 files changed, 753 insertions(+)
> >  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.c
> >  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.h
> >  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt.c
> >  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt.h
> >  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
> >  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
> 
> This patch seems to actually copy the code, forgetting to remove the old
> code. Let's have a follow-up patch that eliminates the duplication.

We couldn't remove the old code without making changes to igt to work
out what the appropriate GT directory would be for the test. That is
still unknowable from userspace... So as a matter of convenience we kept
the old entry point so that we could dump everything under the device.

More work could be done to remove the duplication of debug code, but
equally we could use more specialised debug info for the igts.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
