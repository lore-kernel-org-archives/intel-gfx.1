Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D99F54AC5
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Mar 2026 14:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844510E181;
	Tue, 24 Mar 2026 14:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BnFSBiYh";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE16C10E6F0
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Mar 2026 14:27:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3FBBF433F9;
 Tue, 24 Mar 2026 14:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E8EC19424;
 Tue, 24 Mar 2026 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1774362430;
 bh=YntyrAEvKhruUfdcbERV1IHtWYJ3Xd1vlHV8OzTeqh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BnFSBiYhpOGEZqQkmPGAlGeUAUYIXevDepVPzm7DjFO9gDMlCEcV/8Pm5uH7Jtjx5
 5EAVRU4HA58eiWJChDvvHrs1VY/pVr7GNfnSv4A3ZLJ30nq6u8lrFsEALK4Me6EJdb
 z23Wl3Vsn193p4g7gjt3wONb3R+yWJ+hu7QbzBo4=
Date: Tue, 24 Mar 2026 15:26:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yassine Mounir <sosohero200@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 security@kernel.org, rodrigo.vivi@intel.com
Subject: Re: [PATCH] drm/i915: Fix UAF race between relocation and GEM_CLOSE
Message-ID: <2026032453-depletion-various-b39f@gregkh>
References: <20260324134718.27331-1-sosohero200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324134718.27331-1-sosohero200@gmail.com>
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

On Tue, Mar 24, 2026 at 09:47:18AM -0400, Yassine Mounir wrote:
> A use-after-free (UAF) vulnerability was identified in the i915 driver 
> within eb_relocate_vma. The issue arises from a race condition where 
> a concurrent DRM_IOCTL_GEM_CLOSE can drop the GEM object's reference 
> count to zero while the relocation thread is still processing entries.
> 
> This results in the kernel attempting to access freed memory in 
> eb_relocate_entry, leading to a display pipeline hang and potential 
> system instability.
> 
> Fix:
> Wrap the relocation phase with i915_gem_object_get() and 
> i915_gem_object_put() to ensure the object remains valid throughout 
> the operation, even if user-space requests to close the handle.
> 
> Reported-by: Yassine Mounir (Toji1) <sosohero200@gmail.com>
> Signed-off-by: Yassine Mounir <sosohero200@gmail.com>

No need for a reported-by when you create and sign off on a change.

> ---
>  drivers/gpu/drm/i915/i915_gem_execbuffer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c

There is no such file name in the current kernel tree, what version did
you make this against?


> @@ -1542,7 +1542,11 @@ eb_relocate_vma(struct i915_execbuffer *eb, struct i915_vma *vma)
>  		if (ret)
>  			return ret;
>  
> +		/* Hold a reference to prevent UAF during concurrent GEM_CLOSE */
> +		i915_gem_object_get(vma->obj);
>  		ret = eb_relocate_entry(eb, vma, rel);
> +		i915_gem_object_put(vma->obj);
> +

What prevents the object from going away right after the put call here?

thanks,

greg k-h
