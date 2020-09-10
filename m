Return-Path: <SRS0=K74T=CT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8E9C43461
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 11:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4602078B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 11:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4602078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DCE6E909;
	Thu, 10 Sep 2020 11:28:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0CF6E90D
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2020 11:28:02 +0000 (UTC)
IronPort-SDR: 49w0KORUjbVjtt3x2rsjt5nJSGqvlH8mEEZOIeojuAErbPk+J/6uge4Z5nZZ9FYtFoVRTIf01d
 ZE4Nc2p1AuKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="138545269"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="138545269"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 04:28:01 -0700
IronPort-SDR: mNSxvJwREeSHXFoDWCH/3S0eBseJXLo9GOIcUti9VtkEDyd5LS60gNEE5KmSnv9V8zj6+WJuhM
 4suqZ1XqRDFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="304851462"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 10 Sep 2020 04:27:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Sep 2020 14:27:58 +0300
Date: Thu, 10 Sep 2020 14:27:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20200910112758.GW6112@intel.com>
References: <20200910111225.2184193-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910111225.2184193-1-maarten.lankhorst@linux.intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix slightly botched merge in
 __reloc_entry_gpu
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 01:12:25PM +0200, Maarten Lankhorst wrote:
> This function should be an int, not a bool.
> =

> Presumably because we had the same 2 reverts in a slightly different
> way, git got confused.
> =

> Thanks to Dan for reporting. :)
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 804339255df1..5509946f1a1d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1437,7 +1437,7 @@ static unsigned long vma_phys_addr(struct i915_vma =
*vma, u32 offset)
>  	return addr + offset_in_page(offset);
>  }
>  =

> -static bool __reloc_entry_gpu(struct i915_execbuffer *eb,
> +static int __reloc_entry_gpu(struct i915_execbuffer *eb,
>  			      struct i915_vma *vma,
>  			      u64 offset,
>  			      u64 target_addr)
> @@ -1456,7 +1456,7 @@ static bool __reloc_entry_gpu(struct i915_execbuffe=
r *eb,
>  =

>  	batch =3D reloc_gpu(eb, vma, len);
>  	if (batch =3D=3D ERR_PTR(-EDEADLK))
> -		return (s64)-EDEADLK;
> +		return -EDEADLK;
>  	else if (IS_ERR(batch))
>  		return false;

If it's an int now why is there a 'false' still here?

>  =

> =

> base-commit: 877d8c074302c20ac0759d1a4f689c14aada420d
> -- =

> 2.28.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
