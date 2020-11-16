Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7116C5519F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 10:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EA620781
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 10:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EA620781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E1A89CF4;
	Mon, 16 Nov 2020 10:55:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED0C89CF4
 for <Intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 10:55:02 +0000 (UTC)
IronPort-SDR: 3q1zcw1NgVTzBZMpjm2ozLTPMzznXo8bnYR5ewcpXFHzoXq8uAKsOYSbdmRWLXaTlh6olAf4DM
 kRsAxQj98Icg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="169945396"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="169945396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 02:55:02 -0800
IronPort-SDR: +ImzBHIRcb8BYL/bzRUqqYb+K2s7BSd+IrcZ7CVtyr4Nxte4DmhXOCOV3W39q1YFwylazpl+Br
 y275LxeKITIw==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="543559047"
Received: from joejam1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.3.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 02:55:00 -0800
MIME-Version: 1.0
In-Reply-To: <20201115210815.5272-20-sean.z.huang@intel.com>
References: <20201115210815.5272-1-sean.z.huang@intel.com>
 <20201115210815.5272-20-sean.z.huang@intel.com>
To: "Huang, Sean Z" <sean.z.huang@intel.com>, Intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160552409799.10586.75664961642876662@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 16 Nov 2020 12:54:58 +0200
Subject: Re: [Intel-gfx] [PATCH 20/27] drm/i915/pxp: Create the arbitrary
 session after boot
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

Quoting Huang, Sean Z (2020-11-15 23:08:08)
> Create the arbitrary session, with the fixed session id 0xf, after
> system boot, for the case that application allocates the protected
> buffer without establishing any protection session. Because the
> hardware requires at least one alive session for protected buffer
> creation.  This arbitrary session needs to be re-created after
> teardown or power event because hardware encryption key won't be
> valid after such cases.
> 
> Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>

<SNIP>

> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
> @@ -16,4 +16,10 @@ int pxp_tee_ioctl_io_message(struct drm_i915_private *i915,
>                              void __user *msg_out_user_ptr, u32 *msg_out_size_ptr,
>                              u32 msg_out_buf_size);
>  
> +int intel_pxp_tee_cmd_create_arb_session(struct drm_i915_private *i915);
> +
> +/* TEE command to create the arbitrary session */
> +#define PXP_TEE_ARB_CMD_BIN  {0x00040000, 0x0000001e, 0x00000000, 0x00000008, 0x00000002, 0x0000000f}
> +#define PXP_TEE_ARB_CMD_DW_LEN (6)

This is a BLOB so it doesn't belong to kernel source code. It could be
considered in linux-firmware. As it's only an init sequence I'm not sure
how that will be perceived.

Probably best to ask.

Regards, Joonas
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
