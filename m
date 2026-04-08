Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EEE1073C98
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Apr 2026 11:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BF989ABE;
	Wed,  8 Apr 2026 11:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVkOQ6y5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EF689ABE
 for <intel-gfx@lists.freedesktop.org>; Wed,  8 Apr 2026 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775646934; x=1807182934;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=0LvS7Gz72RsVAzAnNLjH8DaHOXkdV5aeEXOQnrm2RSE=;
 b=bVkOQ6y5Bh5fWjeB9rBIVKlq5ROgRkq/p/JXP7gzq5XWrbZpc/ujrsYg
 S/olE9/8BFwqPcDeDWD4FbIMH0J2fIXWcADifIgqEq9uq3NrqQPR5Y4dl
 9gZSx5A16K0HGdPpu8HRo1rmdq4z5umfEigYDsPz+iBHpT47Q6cVrNTqK
 Fh/Fw4wawwG2Szl4NYI+O6TiG3VEKIvyRz+rS7/teS3KG03CGEpl8NE3C
 /DBxa/mNL3VB7xxO9Wipkp5Qx5wqHVpmwP7f+HcRHoqINaXGydIe9TqjD
 0xqprdW3cuq7utzup0Hdh3AlKY/jXt0q44mAlsa4w6ufe1FCiYeYyYsqL g==;
X-CSE-ConnectionGUID: hWs5wZhQRXikL1UV7TWLhA==
X-CSE-MsgGUID: R8MXuf6/RZWEaDlJQMOCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76697007"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76697007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:15:34 -0700
X-CSE-ConnectionGUID: G+iJUAr6TTCSKfLGi06WJg==
X-CSE-MsgGUID: eLlVkwxEREeeb0zShVdG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233317400"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.1])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:15:31 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHk-=wjcSt1gGnQZoyNvodky_6WEDxC=1+gQHywiOvOjw1+GUA@mail.gmail.com>
References: <20260324151741.29338-1-sosohero200@gmail.com>
 <acUnQkniqECI0QVY@intel.com>
 <CAHk-=wj=h9z-Qp+xm1oSURRGHO3wexzG7MyLqU8gSQbastwgdw@mail.gmail.com>
 <177557988645.129480.6094289548721099346@jlahtine-mobl>
 <CAHk-=wjcSt1gGnQZoyNvodky_6WEDxC=1+gQHywiOvOjw1+GUA@mail.gmail.com>
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Ville =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Yassine Mounir <sosohero200@gmail.com>, g@web.codeaurora.org,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, security@kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 08 Apr 2026 14:15:28 +0300
Message-ID: <177564692857.84154.3119637094332266143@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Linus Torvalds (2026-04-07 19:46:42)
> So I'd suggest just fixing the bugs that are noticed, and giving
> credit appropriate to how good the report was.

I've sent out v3 of the patch[1]. I think it should be fine for you to
simply drop or revert the version you included in -rc7.

As per Sima's analysis attached to the patch, the race for wrong VM
has not been possible to hit since 2021. And the refcount error
potentially leading to UAF accordingly is only relevant for drm-tip
codebase between 2020 and 2021.

So instead of being included in -fixes reverting your version and
allowing the v3 patch to get merged through normal means to v7.1 would
be better in case there happens to be some regression. It can then be
backported to the old kernels accordingly.

Regards, Joonas

[1] https://lore.kernel.org/intel-gfx/20260408110551.84120-1-joonas.lahtine=
n@linux.intel.com/

>=20
>            Linus
