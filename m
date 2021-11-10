Return-Path: <SRS0=lJ7G=P5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530DFC433FE
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 13:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2148361055
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 13:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2148361055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A506E4F9;
	Wed, 10 Nov 2021 13:49:54 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A336E484;
 Wed, 10 Nov 2021 13:49:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219872669"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="219872669"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:49:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="492101967"
Received: from skofoed-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.254.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:49:48 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211109075957.GC27339@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
 <20211109075957.GC27339@lst.de>
To: Christoph Hellwig <hch@lst.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163655218578.6332.7934375733343731100@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 10 Nov 2021 15:49:45 +0200
Subject: Re: [Intel-gfx] refactor the i915 GVT support and move to the
 modern mdev API v2
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Christoph Hellwig (2021-11-09 09:59:57)
> On Thu, Nov 04, 2021 at 02:59:18PM +0200, Joonas Lahtinen wrote:
> > The minimal we should do is to eliminate the double underscore
> > prefixed functions. But I would prefer to have the symbol exports by
> > default so that we can enable the functionality just by loading the
> > module.
>=20
> I'm fine with exporting by default, but just loading won't really work
> even with that:
>=20
>  - there are a bunch of IS_ENABLED conditionals in the i915 (although
>    they look like minor optimizations to me).

I'd assume the golden state capture being the one with biggest impact.

>  - the enable_gvt needs to be set, although after this refactor this
>    option is completely pointless and should probably be enabled

Indeed. Hope is that modprobe/rmmod would be enough to enable/disable.
This should help any distros intending to enable the feature, too.

So mostly about making sure the IS_ENABLED portions in base i915
operation are not too invasive.

>  - the enable_guc option needs to be disable for gvt to work.

On the GVT supported platforms GuC is disabled by default, so it should
be fine. We can change the logic to opposite to disable the feature if
the enable_guc unsafe modparam is used.

Regards, Joonas
