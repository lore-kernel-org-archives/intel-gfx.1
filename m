Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC810606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfPMuJY+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825F510FBC8;
	Wed, 18 Nov 2026 12:44:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC3E10FBC8
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795005890; x=1826541890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j/mkAOxZhngnYReNQGu1/FJ0IFKN+MiHjoYf4rkE85I=;
 b=kfPMuJY+V5MT5QnhcZ6xT3nTGiGPHizFY687QlVUPT7R9IsVqu6ttlaI
 RKtzza20dMZtCiWPbzLyfd92UhZc6GU3cLPlFOph2nzv8YiXivImjxw6C
 BuQsDc2/TlVa7fv5/5+OG9E8jHW5FXlPfThyNrDhFlvvzS1H7nKz9ND6o
 Qj6A3AgKU9L7j5xhsn4KjTN23VE/Xez1UhGj/XTHKwNWBtjj4tPZeII6m
 rPsOHtITbV/u4jfDRP5vnNKfCU+bxjqm3ZdmKIffT/J+4lr8/D1cZHVvO
 s/i4o0v90NAsqUZJd9llNb2iD9hUw6FpaXiLX89armgx0QAD3qpNU/8Y0 w==;
X-CSE-ConnectionGUID: M+d/awlJTPSzbiN9tNmkoQ==
X-CSE-MsgGUID: gezH64WMSKmWmMzL5ipsrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3803781"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3803781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:44:49 -0800
X-CSE-ConnectionGUID: FTwQz4CPRX+Wqzw3y/rUqA==
X-CSE-MsgGUID: 4XJJwNIJRGekjzNxKC68Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10016508"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:44:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Noah Weinberger <NoahWeinberger2003@proton.me>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/bios: validate VBT vswing/preemphasis override
 table
In-Reply-To: <40IXMMqFQJJm26J3saK7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw3CmV_78Kc_H14=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <40IXMMqFQJJm26J3saK7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw3CmV_78Kc_H14=@proton.me>
Date: Wed, 18 Nov 2026 14:44:45 +0200
Message-ID: <332a02491f1f60617411757a2c9abedc4b637141@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 08 Nov 2026, Noah Weinberger <NoahWeinberger2003@proton.me> wrote:
> Hello,
>
> Proposed-fix limitation: the patch below does not validate the full
> VBT table extent against the section size. The malformed/short-table
> out-of-bounds case described below remains unresolved by these
> existence and minimum-count checks. This is an incomplete proposal for
> maintainer review; a complete fix still needs section-extent bounds
> validation.
>
> parse_vswing_preemph_override() stores the raw pointer and count fields
> from VBT block 57 without validating that the block actually contains
> the announced table, and allocate_vswing_preemph_override() allocates
> the consumer structures whenever a child device sets use_vbt_vswing -
> even when the block is absent entirely. validate_vspeo() only checks
> that devdata->vspeo is non-NULL and that the port has DP.
>
> Two failure modes follow at DDI buffer-translation time:
>  - block absent: tables == NULL, num_columns == 0, so the consumer
>    dereferences tables[0] (NULL).
>  - block short or malformed: the table walk reads up to
>    (5+1)*num_rows*num_columns u32s from a block whose enforced minimum
>    size is 2 bytes - with num_columns = 255 that is ~98 KB past a small
>    heap allocation, and the values are programmed into PHY registers.
>
> The patch gates the consumer on the table existing with sane counts.
> A complete fix should also validate the table extent against the
> section size, which is not currently plumbed through; happy to rework
> if there is a preferred way to carry the section size.
>
> Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07), drivers/gpu/drm/i915/display/intel_bios.c:2216-2234 (parse), 2654-2676 (allocate), 3874-3923 (validate/consume).
> Introduced in the v7.4 merge window.
>
> This was found during an assisted (AI-supported) static source review of
> mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); every code path cited below was re-verified by the
> reporter against that tree. The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.
>
> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>

Please see [1] on how to report i915 issues.

BR,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

> ---
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 7b6a6f8..d99a675 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -2657,7 +2657,8 @@ static void allocate_vswing_preemph_override(struct intel_bios_encoder_data *dev
>  	union intel_ddi_buf_trans_entry *entries;
>  	struct intel_ddi_buf_trans *vspeo;
>  
> -	if (!intel_bios_encoder_requests_vspeo(devdata))
> +	if (!intel_bios_encoder_requests_vspeo(devdata) ||
> +	    !devdata->display->vbt.vspeo.tables)
>  		return;
>  
>  	vspeo = kzalloc_obj(*vspeo);
> @@ -3876,6 +3877,8 @@ validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_dp)
>  {
>  	struct intel_ddi_buf_trans *vspeo;
>  
> +	struct intel_display *display = devdata->display;
> +
>  	vspeo = devdata->vspeo;
>  	if (!vspeo)
>  		return false;
> @@ -3883,5 +3886,10 @@ validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_dp)
>  	if (!has_dp)
>  		return false;
>  
> +	if (!display->vbt.vspeo.tables ||
> +	    display->vbt.vspeo.num_columns < 3 ||
> +	    display->vbt.vspeo.num_tables < 6)
> +		return false;
> +
>  	return true;
>  }
>

-- 
Jani Nikula, Intel
