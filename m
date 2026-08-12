Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CACC5AD5A
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 10:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14E310EEB8;
	Wed, 12 Aug 2026 10:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hd9Bwx/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC1A10EEB8
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786529093; x=1818065093;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=D2OzqFvOG1zJHL/ro5Npv0lr/uCTAMIBpUpnt0ww/Os=;
 b=Hd9Bwx/Eoy+qeNmRwEug6vuRjVRwjZ1KGJZRZXfJAOhExfgEp1XEiLEi
 ernGbv/NMSIgWz1APUg1FYbF3OxBgYu6Z0y9wsRQpb62LrxS4pyqQtxIx
 VsNgsjNWpFzy3wGnjZTKbSNVw2XCYCZlZQ3Bae3GyWueV+dTnAL2ER4KA
 RuRR9FAryikHiEJzWfQEmCSBNMikSqx54xdabBDkE5mTQL6ks1kyI1mqv
 r3UBIchPX8816moen3A1/4xO8pwFAf3AgLwcwp9MwkmZpgL04+FyNuyaA
 /LMv+sSR3kx/wVr1/nv+wxzev+LCAFV2Dqz+lskIHA7kYf/HQ5WJrlqYI g==;
X-CSE-ConnectionGUID: 50N5+XA8QIK+sYpAnsuvJg==
X-CSE-MsgGUID: HaFeZ0AcToa/5GqYMa6yrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86932219"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86932219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:04:45 -0700
X-CSE-ConnectionGUID: Ph/flG93S72a4EolwhY6rg==
X-CSE-MsgGUID: wMyw+fdHSe641vqGfloMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="293543877"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:04:45 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACa-pC0Up7xJ_UvDATbxS4WK7mYW_gM4WdSYA_OEkj8nLRO2SA@mail.gmail.com>
References: <CACa-pC0Up7xJ_UvDATbxS4WK7mYW_gM4WdSYA_OEkj8nLRO2SA@mail.gmail.com>
Subject: Re: Offering to take a TODO item in i915
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
To: Parth Kamani <parthvipulkamani@gmail.com>
Date: Wed, 12 Aug 2026 13:04:41 +0300
Message-ID: <178652908160.52635.398108754427457885@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Parth Kamani (2026-08-02 23:45:53)
> Hi Joonas,
>=20
> I was looking through drivers/gpu/drm/i915/TODO.txt and noticed that ther=
e are
> still a number of outstanding items. One that caught my attention was "for
> discrete memory manager, merge enough dg1 to be able to refactor it to ..=
.". I
> also saw items such as "Come up with a plan what to do with drm/scheduler=
 and
> how to get there" and "Roll out dma_fence critical section annotations", =
so it
> looks like there are several areas that still need work.
>=20
> From the TODO, some of these items appear more involved than others, so b=
efore
> I dive in I wanted to check with you. Is the discrete memory manager item=
 still
> something that would be appropriate to work on, or would you recommend a
> different task for someone making a first contribution to i915?

The TODO is very much outdated at this point.

Work to enable new platforms has moved to the drm/xe driver, I'm not
really sure I would recommend ramping up to i915 at this time unless
you would want to focus mostly on bug fixing.

> My preference is to keep patches small enough to review comfortably, run
> checkpatch --strict, test against current mainline, and submit them via g=
it
> send-email.
>=20
> I'm currently in my final year of B.Tech in Computer Engineering at K J S=
omaiya
> College of Engineering, Mumbai (graduating mid-2027), and I have a meanin=
gful
> amount of time to contribute before graduation. I'd much rather spend tha=
t time
> contributing to a live upstream codebase than working only on coursework.=
 If
> there's a better first task than the TODO item above, I'd really apprecia=
te
> your recommendation and would be happy to work on that instead.

I rather recommend going to the the GitLab and browsing for some issues,
trying to reproduce them, add better logs and look into fixing them if
you really want to start contributing specifically to i915 via bug
fixing.

It's better really to reach out directly to the mailing lists and
GitLab, directly messaging maintainers doesn't scale so well. That
applies both for drm/xe and drm/i915 contributions.

Regards, Joonas

>=20
> Thank you for your time, and I look forward to hearing from you.
>=20
> Best regards,
>=20
> Parth Kamani
> Final-year B.Tech Computer Engineering
> K J Somaiya College of Engineering, Mumbai
> Email: parthvipulkamani@gmail.com
> Phone: +91 9820081318
>
