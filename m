Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA78FEA82E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Mar 2026 08:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D92910E807;
	Wed, 25 Mar 2026 08:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCckqo+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ABD10E807
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Mar 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774425679; x=1805961679;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=9jBLsJVMImsx2ZBmZ2lTapXNz3uTIKjJTFNxKVZSjcU=;
 b=MCckqo+/Faceyryxqur+8XUZ9S1cS/l9JR/sNxB+YcCrnyqidlGA0M7k
 QFlfUnXAGP3nn3O1DjH/fYVBbMcR3lBoaUELbyaLOAl/zxFxcn77AebYb
 YPSh2i+cDOJm4jbtEs/EgX0vSMigJnBsg79uqme0z8GOtfwa716v2VTiH
 +1pH1Sb105rpi8bde9TwIWWqoXwlnG+GsFrfjab56PHn/azdna3wvT8A0
 FOUFSvbjRjKeD/6pqKor18P9jA0jPNu2IR5DK3l/FilcBIXAOuvDDu1QH
 ihs1awOb0R3OdJaeUGbz0rLTuLO3I4unoQYnbx2oT4plCztaXiZwKVYva Q==;
X-CSE-ConnectionGUID: 4MPaYdRZQn6MF/dw+1v7Eg==
X-CSE-MsgGUID: DfcFwmhoTlWdm9kMjm1pxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75345247"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75345247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 01:01:18 -0700
X-CSE-ConnectionGUID: 5SkHGIZsR+iG11Jk60P4eA==
X-CSE-MsgGUID: 5Za2rTMVSTWF3tOHbhol2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="218021155"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 01:01:16 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324151741.29338-1-sosohero200@gmail.com>
References: <20260324151741.29338-1-sosohero200@gmail.com>
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 security@kernel.org, Yassine Mounir <sosohero200@gmail.com>
To: Yassine Mounir <sosohero200@gmail.com>, gregkh@linuxfoundation.org
Date: Wed, 25 Mar 2026 10:01:13 +0200
Message-ID: <177442567303.11552.5320450093167124387@jlahtine-mobl>
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

You somehow included [PATCH v2] twice in the subject line and directly
sent it to Greg for some reason?

Please maybe use git format-patch and review the resulting files or
send-email with dry run option before sending.

Quoting Yassine Mounir (2026-03-24 17:17:41)
> Fix a race condition in Linux 7.0-rc2

I don't believe this is a good way of putting it, it makes it sound like
it got introduced in 7.0-rc2 and would be regression. Instead you could
use git blame to find the patch that introduced the buggy code and
supply a Fixes: tag.

As for the commit message can just say "Fix a race condition where GEM ..."

> where a GEM object could be freed
> during relocation if userspace closes the handle concurrently.

Maybe amend here that this only triggers on low-on-memory conditions.

> The fix involves pinning the object lifetime using i915_gem_object_get()
> before the relocation loop and releasing it via i915_gem_object_put()
> in the common exit path (out label), ensuring symmetry in both success
> and error paths.

This we can see from the code, no need to describe it here.

Please supply the UAF crash signature in some format as requested earlier.
If you won't be able to enable KASAN, please do try to use netlink or pstore
to capture the dmesg.

Regards, Joonas

> This v2 rebases the change to the new 'gem/' directory structure in
> the current mainline tree and addresses potential memory leaks in
> early error returns.
>=20
> Signed-off-by: Yassine Mounir <sosohero200@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index e7918f896..0468c0551 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1528,6 +1528,7 @@ static int eb_relocate_vma(struct i915_execbuffer *=
eb, struct eb_vma *ev)
>         if (unlikely(!access_ok(urelocs, remain * sizeof(*urelocs))))
>                 return -EFAULT;
> =20
> +       i915_gem_object_get(ev->vma->obj);
>         do {
>                 struct drm_i915_gem_relocation_entry *r =3D stack;
>                 unsigned int count =3D
> @@ -1588,6 +1589,7 @@ static int eb_relocate_vma(struct i915_execbuffer *=
eb, struct eb_vma *ev)
>                 urelocs +=3D ARRAY_SIZE(stack);
>         } while (remain);
>  out:
> +       i915_gem_object_put(ev->vma->obj);
>         reloc_cache_reset(&eb->reloc_cache, eb);
>         return remain;
>  }
> --=20
> 2.53.0
>
