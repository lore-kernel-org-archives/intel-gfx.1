Return-Path: <SRS0=mvB2=J6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16867C433ED
	for <intel-gfx@archiver.kernel.org>; Mon,  3 May 2021 17:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964E661132
	for <intel-gfx@archiver.kernel.org>; Mon,  3 May 2021 17:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964E661132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3C76E3F2;
	Mon,  3 May 2021 17:11:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDC76E3F2
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 May 2021 17:11:00 +0000 (UTC)
IronPort-SDR: UwDHvuwIsTBYShmGVMUwgG0dqTfwb+cQhdO+e/nU0i3SFIHH1rmWpeZyJO7cPWzkYW5BclpjEv
 x7LO6qrz36Hg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="218585285"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="218585285"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:10:44 -0700
IronPort-SDR: Y15+UH0xaptjRshlfWgFjPSrOaBx6o6rnFL0BOe6Rbkt92AMPEP5bZ1Mh49uGhfl6X7BRDg5Wb
 dno2OF5b+FTQ==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="468140585"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:10:42 -0700
Date: Mon, 3 May 2021 20:10:38 +0300
From: Imre Deak <imre.deak@intel.com>
To: Greg KH <greg@kroah.com>
Message-ID: <20210503171038.GF4190280@ideak-desk.fi.intel.com>
References: <20210503164001.GE4190280@ideak-desk.fi.intel.com>
 <YJAql6Vstj7wY5Wg@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJAql6Vstj7wY5Wg@kroah.com>
Subject: Re: [Intel-gfx] drm/i915: v5.11 stable backport request
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mario =?iso-8859-1?Q?H=FCttel?= <mario.huettel@gmx.net>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 06:53:43PM +0200, Greg KH wrote:
> On Mon, May 03, 2021 at 07:40:01PM +0300, Imre Deak wrote:
> > Stable team, please backport the upstream commits
> > =

> > 7962893ecb85 ("drm/i915: Disable runtime power management during shutdo=
wn")
> > =

> > to the v5.11 stable kernel, they fix a system shutdown failure.
> > =

> > References: https://lore.kernel.org/intel-gfx/042237f49ed1fd719126a3407=
d7c909e49addbea.camel@gmx.net
> > Reported-and-tested-by: Mario H=FCttel <mario.huettel@gmx.net>
> =

> You also need this in 5.12.y, right?

Yes missed that, thanks for catching it.

> thanks,
> =

> greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
