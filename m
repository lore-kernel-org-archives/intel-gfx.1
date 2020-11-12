Return-Path: <SRS0=k0IE=ES=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2C4C5519F
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 19:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1D620759
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 19:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1D620759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5F89FDD;
	Thu, 12 Nov 2020 19:44:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B026189FDD
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2020 19:44:37 +0000 (UTC)
IronPort-SDR: I4oUGKW+1DN9GI/g/e7/3aNkyCz/hg5tB5xqrIi/l5TbIaZhtkMnuFRZmLXHyEa+PlnhhbVP7y
 D5ZCOWZ/W3jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="255079576"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="255079576"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 11:44:36 -0800
IronPort-SDR: cMHten9J9aFhFhNsn57I0VFEsf3GGPsEaIGmDqW5Kv23MtSxkZQ4rBuB29hJeApqExlyjx+W9z
 G7puD7aWKZxA==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="542377862"
Received: from cwilso3-mobl.fi.intel.com (HELO localhost) ([10.252.35.103])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 11:44:34 -0800
MIME-Version: 1.0
In-Reply-To: <20201010002105.45152-5-umesh.nerlige.ramappa@intel.com>
References: <20201010002105.45152-1-umesh.nerlige.ramappa@intel.com>
 <20201010002105.45152-5-umesh.nerlige.ramappa@intel.com>
From: Chris Wilson <chris.p.wilson@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 12 Nov 2020 19:44:32 +0000
Message-ID: <160521027215.25046.10810273417498100458@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/gt: Refactor _wa_add to reuse
 wa_index and wa_list_grow
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

Quoting Umesh Nerlige Ramappa (2020-10-10 01:21:03)
> Switch the search and grow code of the _wa_add to use _wa_index and
> _wa_list_grow.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 54 +++++++--------------
>  1 file changed, 17 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 801fcb60f46b..e49283bffa33 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -174,53 +174,33 @@ static void _wa_remove(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
>  
>  static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>  {
> -       unsigned int addr = i915_mmio_reg_offset(wa->reg);
> -       unsigned int start = 0, end = wal->count;
> +       int index;
>         const unsigned int grow = WA_LIST_CHUNK;
>         struct i915_wa *wa_;
>  
>         GEM_BUG_ON(!is_power_of_2(grow));
>  
> -       if (IS_ALIGNED(wal->count, grow)) { /* Either uninitialized or full. */
> -               struct i915_wa *list;
> -
> -               list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
> -                                    GFP_KERNEL);
> -               if (!list) {
> -                       DRM_ERROR("No space for workaround init!\n");
> +       if (IS_ALIGNED(wal->count, grow)) /* Either uninitialized or full. */
> +               if (_wa_list_grow(wal, wal->count) < 0)
>                         return;
> -               }
> -
> -               if (wal->list)
> -                       memcpy(list, wal->list, sizeof(*wa) * wal->count);
>  
> -               wal->list = list;

An inherited problem, but I'm a little unnerved by the apparent leak of
wa->list here.

Paging Tvrtko to see if he can remember if there's a hidden trick.
-Chris
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
