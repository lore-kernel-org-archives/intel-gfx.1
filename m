Return-Path: <SRS0=TzMs=BR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A1CC433E0
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 09:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C61220748
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 09:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C61220748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966426E9AA;
	Fri,  7 Aug 2020 09:51:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDEA6E9AA
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2020 09:51:03 +0000 (UTC)
IronPort-SDR: Fpt3/IY5RYmHU0SC81lyoiIZ5Tz/mYyabZDVmwJ0wBjRdifyJ3aXdSp3LF4Vtv830VbgWONmYS
 oxrvXj107uXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="154172140"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="154172140"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 02:51:03 -0700
IronPort-SDR: Owq1oMatugPW7m32Pj/fN1NeM2vVrGGoWeSSrDYsFfEoIL0st3iQfNrqy9G+yp0ob1aH1owsUP
 3/V/mxsbuh4A==
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="437857289"
Received: from kmatyuch-mobl.ger.corp.intel.com (HELO [10.255.197.120])
 ([10.255.197.120])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 02:51:01 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200807083256.32761-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7c53f59c-928f-64a3-9011-cc0e69e46b11@linux.intel.com>
Date: Fri, 7 Aug 2020 10:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807083256.32761-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/gt: Remove defunct
 intel_virtual_engine_get_sibling()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 07/08/2020 09:32, Chris Wilson wrote:
> As the last user was eliminated in commit e21fecdcde40 ("drm/i915/gt:
> Distinguish the virtual breadcrumbs from the irq breadcrumbs"), we can
> remove the function. One less implementation detail creeping beyond its
> scope.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_lrc.c | 12 ------------
>   drivers/gpu/drm/i915/gt/intel_lrc.h |  4 ----
>   2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 417f6b0c6c61..0c632f15f677 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -5882,18 +5882,6 @@ int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
>   	return 0;
>   }
>   
> -struct intel_engine_cs *
> -intel_virtual_engine_get_sibling(struct intel_engine_cs *engine,
> -				 unsigned int sibling)
> -{
> -	struct virtual_engine *ve = to_virtual_engine(engine);
> -
> -	if (sibling >= ve->num_siblings)
> -		return NULL;
> -
> -	return ve->siblings[sibling];
> -}
> -
>   void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   				   struct drm_printer *m,
>   				   void (*show_request)(struct drm_printer *m,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
> index 91fd8e452d9b..c2d287f25497 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.h
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
> @@ -121,10 +121,6 @@ int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
>   				     const struct intel_engine_cs *master,
>   				     const struct intel_engine_cs *sibling);
>   
> -struct intel_engine_cs *
> -intel_virtual_engine_get_sibling(struct intel_engine_cs *engine,
> -				 unsigned int sibling);
> -
>   bool
>   intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
>   
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
