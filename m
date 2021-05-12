Return-Path: <SRS0=b0kO=KH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B2CC433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 12 May 2021 12:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F95861154
	for <intel-gfx@archiver.kernel.org>; Wed, 12 May 2021 12:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F95861154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17856EB89;
	Wed, 12 May 2021 12:18:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6485A6EB89
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 May 2021 12:18:18 +0000 (UTC)
IronPort-SDR: /nmE1/9HgysmwHpB3ACfWfLBtpE46JXvOFU53mevJc6/EeWMJefXNZvl21F6RcuvB3BtXt4Jgu
 rMxK0iy2bHIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="187116129"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="187116129"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 05:18:14 -0700
IronPort-SDR: ERsisYeTtsIkfzvvQfRXR08t/wqigIAPSEltq/bQrjKEYep93+btDMz9tF8TGLWBrgtCbb041Z
 muzvBFPnt8Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="430719163"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 12 May 2021 05:18:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 May 2021 15:18:09 +0300
Date: Wed, 12 May 2021 15:18:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <YJvHgdYh7R/tKEtG@intel.com>
References: <3e2e12f6-a5bd-858f-7454-fce19f70cf30@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e2e12f6-a5bd-858f-7454-fce19f70cf30@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] i915 clear-residuals BYT + IVB rendering issue +
 possible fix
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 12:06:23PM +0200, Hans de Goede wrote:
> Hi All,
> =

> We (Fedora) received a bug-report about rendering issues
> on BYT and IVB caused by the i915 clear-residuals work
> which landed in 5.10.y :
> =

> The Fedora bug:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1959581
> =

> Points to these i915 bugs:
> https://gitlab.freedesktop.org/drm/intel/-/issues/3071
> https://gitlab.freedesktop.org/drm/intel/-/issues/3081#note_890606
> =

> With the second link containing a possible fix which looks promising
> if someone can take a look at this, then that would be great:
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm=
/i915/gt/gen7_renderclear.c
> index de575fdb0..054a0f5b8 100644
> --- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
> +++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
> @@ -397,7 +397,7 @@ static void emit_batch(struct i915_vma * const vma,
>         gen7_emit_pipeline_invalidate(&cmds);
>         batch_add(&cmds, MI_LOAD_REGISTER_IMM(2));
>         batch_add(&cmds, i915_mmio_reg_offset(CACHE_MODE_0_GEN7));
> -       batch_add(&cmds, 0xffff0000);
> +       batch_add(&cmds, 0xfffb0000);
>         batch_add(&cmds, i915_mmio_reg_offset(CACHE_MODE_1));
>         batch_add(&cmds, 0xffff0000 | PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
>         gen7_emit_pipeline_invalidate(&cmds);
> =

> Note the:
> https://gitlab.freedesktop.org/drm/intel/-/issues/3081#note_890606
> =

> Link contains details about the what and why of this change.

There's a patch on the list already
https://patchwork.freedesktop.org/patch/431109/?series=3D89502&rev=3D1

I suppose it needs a s/IVB_GT1/IVB/ to be consistent with the current
w/a setup. Other than that it seems correct.

But I still don't understand how it fixes rendering corruption.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
