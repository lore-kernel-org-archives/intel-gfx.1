Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BB2EDF151
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Feb 2026 10:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18010E7C3;
	Fri, 13 Feb 2026 10:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jUwcf7tS";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A5B10E7F6
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Feb 2026 10:42:21 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2aad1bb5058so8244995ad.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Feb 2026 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770979341; x=1771584141; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZCDEGFPKnYN/t5YXsreAVJgxq9c7fMOSfUR4vNh6TY=;
 b=jUwcf7tS56hJTpkQ7VYpOBlxhkw7sH0927XvU+YzDM1dUT0Fh7R5vCRTD94nlL3i7n
 4QjAGKZzgGIrZyErliJ3Jb91j9+3T9gTX9f6HxRBG9HmAIwAxCOB6YdqGndkN7iZ6oRk
 Pt6eIrc7muox46Amwb61g4id5fQSfsXxuVRe7mX2U8cYRsCCqjV0mut4wWLYmGN/YDvE
 5IawFqhv2Fq96+PFuphhmQVF9lHxdLjYAiENPUnz587vcbcIsACGVlWHumATKBkx9mH8
 KJ/hEtxhYootpdKOpVptwe47UXHd3u2t3RRkqJX6em93hq0sSQBKFmFZtkVE87zIRIQC
 Qawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770979341; x=1771584141;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZCDEGFPKnYN/t5YXsreAVJgxq9c7fMOSfUR4vNh6TY=;
 b=TG92NXbVOuOTgn6DOxJurb7b27HMh5JzjhbQWSofycYuijRxwjvxXb9Sosh5ZrCWbt
 05ttpFTLh2shDHIMEzjFHu7FD3sOLcA/OLbtDPnx2OgB+ZdJ+wR55TySesCZiFnL719M
 YGT2gUcFDYdtQgihQWvI+swBVXSNivC8b2U9zJZpRI0/7fep9LQpuPiGgdTspK0F/t8H
 FHHqpWZJ/2cIWXE3aQAAShYgTMGiRSWRsfQvcS8dvAixC05tl1l6DS2BUT2FTpCsZKTQ
 fb8T9WRkVMQkoOAwTwPlzVZdShJF6FxNXREcY+EcXI2emDzwR9OYf8xgeQpR2HfPWfr2
 pDKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDSJ3c11ZySpL2lQX3ffclkXzhJbzeV8NZBo8c4vcA9ZC/F2WLhaEc34aBKvWQopHRmit1TXKG6Wo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqRYSBsT/ajXDJNpyTOjsBDpALdBkP0cJUia1w9toZf+QJyGNN
 8DFOblJzCazlGE0kfFeIHg+vQI/B8C87JQG7rSwnbRiuekAnbWCiac8O
X-Gm-Gg: AZuq6aKUUlZiKS7eUSLgggaVLOVwnl27unq36YuJwT6m26FNgWg/8bwJWuLWJVZXQDe
 fBfSurwKFMUwwpSJlMf9RBMi5a/fK2+QLQYNnVyWGhjkkKnh81xahgomTBrPoNx2wISs7jtu5AK
 2HCsEIVnnsvq8VuA8rT7aM1pmekbQ7dMkX7Q6lUv8ZBmPbcggX7eAtCI39grnZsfUIb0rdrIdSn
 UkgKXSlE3gAZQC4GboLkbijOTuvduoPJtti4RmuMTx2zEdC9iGYfEJQ1fzQcBZu+HGsU72Iwjeu
 K/swg9sv1I7tNUn6jInpRzPYgW0O2HVysCOXyIZx8KfUPLpArJMsOG48eqTFXQZdU9LylRUma23
 liGRcwcMuYgAkTg+oqtOn4hMkCpiTkHD2wLSoVhydBkW8Fy8zBByldtMOymt13vj9S0dio3/DYi
 6gCAsb73P7fDXf5ca+RdZ5Wx72P4Nu1FIcS9MUs+Sm
X-Received: by 2002:a17:903:1a24:b0:2aa:3b3:d633 with SMTP id
 d9443c01a7336-2ab5060e0b8mr14590705ad.61.1770979340891; 
 Fri, 13 Feb 2026 02:42:20 -0800 (PST)
Received: from localhost ([158.101.143.16]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2997a4b4sm78271645ad.65.2026.02.13.02.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 02:42:20 -0800 (PST)
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com
Subject: Re: [PATCH] drm/i915/gvt: Cast u64 array to u32 array
In-Reply-To: <20260212194131.64708-2-jonathan.cavitt@intel.com>
References: <20260212194131.64708-2-jonathan.cavitt@intel.com>
Date: Fri, 13 Feb 2026 18:42:14 +0800
Message-ID: <87o6lsylfd.fsf@dell-wzy>
MIME-Version: 1.0
Content-Type: text/plain
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

Jonathan Cavitt <jonathan.cavitt@intel.com> writes:

> Static analysis issue:
>
> The u64 array workload->shadow_mm->ppgtt_mm.shadow_pdps is cast to a
> void pointer and passed as a u32 array to set_context_pdp_root_pointer
> as a part of update_shadow_pdps.  This isn't wrong, per se, but we
> should properly cast it to an appropriately-sized u32 array before
> submission.
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
> index 15fdd514ca83..1a95c9f76faa 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -72,6 +72,7 @@ static void update_shadow_pdps(struct intel_vgpu_workload *workload)
>  {
>  	struct execlist_ring_context *shadow_ring_context;
>  	struct intel_context *ctx = workload->req->context;
> +	u32 pdp[8];
>  
>  	if (WARN_ON(!workload->shadow_mm))
>  		return;
> @@ -79,9 +80,10 @@ static void update_shadow_pdps(struct intel_vgpu_workload *workload)
>  	if (WARN_ON(!atomic_read(&workload->shadow_mm->pincount)))
>  		return;
>  
> +	memcpy(pdp, workload->shadow_mm->ppgtt_mm.shadow_pdps,
> +	       sizeof(u64) * ARRAY_SIZE(workload->shadow_mm->ppgtt_mm.shadow_pdps));
>  	shadow_ring_context = (struct execlist_ring_context *)ctx->lrc_reg_state;
> -	set_context_pdp_root_pointer(shadow_ring_context,
> -			(void *)workload->shadow_mm->ppgtt_mm.shadow_pdps);
> +	set_context_pdp_root_pointer(shadow_ring_context, pdp);
>  }
>  

I think we'd better just cast the type instead of extra copy.
