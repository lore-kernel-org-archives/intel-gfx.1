Return-Path: <SRS0=/3Pa=EQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF232C388F7
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 07:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F83E2067D
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F83E2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B75C89856;
	Tue, 10 Nov 2020 07:02:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416AC89856
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 07:02:14 +0000 (UTC)
IronPort-SDR: dr9p9+0yqJzEwHAkr0ay39bWILD/cO9EcnhmS4vdoa1lf6wHzl6ccEWCzcjKLneCFeWVegVy5g
 OJBVOeBaJSIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="167345244"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; d="scan'208";a="167345244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 23:02:13 -0800
IronPort-SDR: Muoj77b6XunCiwjfvT5EgkLIAUiFkJ3mRQN0P4wPLb54CEkSgOj+R6FA0ukL4WpmDCAbr9yx5e
 +FYLiNzaGC+Q==
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; d="scan'208";a="356011364"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 23:02:13 -0800
Date: Tue, 10 Nov 2020 02:03:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20201110070330.GA1096798@intel.com>
References: <20201105154934.16022-1-chris@chris-wilson.co.uk>
 <20201105154934.16022-2-chris@chris-wilson.co.uk>
 <160460168592.18394.4434466144151994039@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160460168592.18394.4434466144151994039@build.alporthouse.com>
Subject: Re: [Intel-gfx] [CI 2/2] drm/i915/gem: Pull phys pread/pwrite
 implementations to the backend
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 06:41:25PM +0000, Chris Wilson wrote:
> Quoting Chris Wilson (2020-11-05 15:49:34)
> > Move the specialised interactions with the physical GEM object from the
> > pread/pwrite ioctl handler into the phys backend.

which depends on the backend...

> > 
> 
> Fixes: c6790dc22312 ("drm/i915: Wean off drm_pci_alloc/drm_pci_free")

which was a fixes to 4.5 stable, but I could only find it into 5.4+
so...

> Testcase: igt/gem_pwrite/exhaustion
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org

When cherry-picking to drm-intel-fixes, should I add

Cc: stable@vger.kernel.org # 5.4.y: c6790dc22312: drm/i915: Wean off drm_pci_alloc/drm_pci_free
Cc: stable@vger.kernel.org # 5.4.y

> -Chris
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
