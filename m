Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF8606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2026 01:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkVsmv8H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2782C10EAD0;
	Tue, 17 Nov 2026 01:01:28 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312C10EAD5
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 01:01:22 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1b3a05f8b5bso5159075c88.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 17:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794877282; x=1795482082; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vzqoAyjUokJZqlOT6Q8pZfCZ/k/84aYSFWealQEk2eE=;
 b=CkVsmv8HYjh5Tu+080Xa7GoHFGFbQXpOXyN6ISgnMxmTm8QR2EzDyI7G2DpiffwhzM
 qODiW5rhgSDPbVsZK6FxnHx1x0ZQi0Ky6SgX2Hj9DSuVcAwWydFUNxutzNe11gWzL34l
 2W7/TPwF3TmMzpi4gdQOymSd/97Rf2xcRXgl2ps1iJ9j7qkDue4/nCLeSU+Pj56KdK6S
 Iop9yCbsEty+uwrKoyV6micRFzME/exOlSzaSYsrvF1IUmDSfoPwhjhGsv78PSdL60Qp
 0TcIScPEn1nx8xt/uoyfV0rw49TRUl/1E7GUCHIkLXAv+u9eqYZppVT37laiksZGCNfS
 NhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794877282; x=1795482082;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vzqoAyjUokJZqlOT6Q8pZfCZ/k/84aYSFWealQEk2eE=;
 b=RlZ90nzeo+/owsPxbZJamQuVQRHNm1pWwKz4zYfMvC/I3r3xouMctz6Y4HvgNaT2yJ
 ThqK9VpsDMjgmMFJ8MdW62Jnn7XvSCpuk3KCc+rxgWSTHAZ2GfEKSjz3DzINNB2vpjG1
 BQODLk/SHA9EpARBWhRBn+HNwTFwt3WjkqCayAhW3Zcnl7DZdHyj6fMWskTx5WgY3mhB
 4faS4ujMeCSNzDD5dhxyMo+tlDr75kJjKFNsGdzW15e7fasoZGhVQ2BMlB2DK6/kZ/uV
 +GMSC6YNofffe+IoTscRiliw1WIUUm7WM7eSDqURAfAlyKFF7q7p9lr071WdMyXwlgnq
 c4hg==
X-Forwarded-Encrypted: i=1;
 AL+hErFyGUo0TbUXzuR+3J4tyWKsrwF7OoEqd8Jy450/gKV9EvV9TQ+GegvUuhXefmS2gNljkINhi6wke10=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9qsVM2M5B6aVwV9FXzV9+Dys1PfA0yiXTV7PD6S3akLXDhkf13
 16n3OO4vLfkfRYL7bjZ91U3AKE/QqQQbjiitUqhj2Rq5SW0dtVsfUTEJ
X-Gm-Gg: AYBFou3b+Fh/WW3Yv0LeE0uFVI0WKOlfeleTm47pbD+/OT8lTm02WyH+mq/HiysOSwk
 PH1QwFpnPMrZgv/F+FXxOH4uC9/RFu+140uTfLASqORgd9u2grtdu7uXX3RuhWFCP0PuOvcSsSH
 Sj1MkpU4YXu8J5M5xcvlxaW9AOShgtPmuryQuDCiPwgJhfyvwBNQ28JFPNXwBVOi3G88qGyNYan
 iIz3soOEbgviMP03Ju8jhJfMlFYTeo/UitnnI4IlhWDEzq3axHNrZHyIj/DKluqWTAb9amhg+UA
 C7xATCJjRPVuJ1e2CJsX17PX+rFv0YSe0fZcMPplOMF/exxGNxTBp0I+acGMS16pUBsUwfZIEuK
 NJNebU8xrf5e2BOxCKiN9Op02z5DtTxBTNA4tdNLn+Nkoea1FYHaH7PAhF/lt+aV+Jx0sm9JpZb
 ak821cM3bAY7LR0Bt4cikumIkzTsudIskAEXjCoSZKbuAZBo54Sthw0U2vZBl6HUfubFNS3jZSn
 1q2sF6wpTZeamhDw2MlRRbryaltu4c1zPixEaJYtGdSnYmq/vRu70Mrk8qFFAEtcNPZXHgIDKDE
 qG5QNueGdeoTUDm0GBSg0H5d7eU98uryHs50W+ncqPQXrJEr3SGIy2ST
X-Received: by 2002:a05:7022:290:b0:1b3:a881:4d9f with SMTP id
 a92af1059eb24-1b5030ad209mr10751139c88.20.1794877281631; 
 Mon, 16 Nov 2026 17:01:21 -0800 (PST)
Received: from localhost ([2400:2650:24e0:bf00:cc77:213f:afc3:65e2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b50309b2b5sm30987948c88.1.2026.11.16.17.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 17:01:20 -0800 (PST)
Date: Tue, 17 Nov 2026 10:01:16 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Tuo Li <islituo@gmail.com>
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 ankit.k.nautiyal@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Fix NULL pointer dereference in slot switch
Message-ID: <avunXOrG8wfAI2cR@dell-wzy>
References: <20261112155822.1336713-1-islituo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112155822.1336713-1-islituo@gmail.com>
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 11:58:22PM +0800, Tuo Li wrote:
> The running slot is updated to the pending slot before updating the running
> context. However, the condition checks the old running context instead of
> the newly assigned running slot.
> 
> When no pending slot exists, running_slot becomes NULL. If the previous
> running_context is non-NULL, the code attempts to access
> running_slot->ctx[0], resulting in a NULL pointer dereference.
> 
> To fix this possible NULL pointer dereference, check running_slot instead
> to ensure that running_context is updated only when a valid slot is
> available.

Well, just AI generated static check but without any runtime analysis,
again...and can't even show kernel oops of this, as it simply can't happen..

> 
> Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/execlist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
> index 29147a9f162e..763c310f2aaf 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -73,7 +73,7 @@ static void switch_virtual_execlist_slot(struct intel_vgpu_execlist *execlist)
>  
>  	execlist->running_slot = execlist->pending_slot;
>  	execlist->pending_slot = NULL;
> -	execlist->running_context = execlist->running_context ?
> +	execlist->running_context = execlist->running_slot ?
>  		&execlist->running_slot->ctx[0] : NULL;
>

Current code calls this switch in case whenever running_slot is
available, so it won't have null ptr reference. But code looks a
little weird, as current code tried to assign running_context in other
place e.g when new request happened, or even it might seem to miss
when enter execlist idle state...but it is still valid in switch
call. So I think this is just harmless. If you'd like for further
cleanup, that needs testing result for sure.

Thanks.
