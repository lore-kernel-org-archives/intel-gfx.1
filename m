Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2280CD98D2
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Jun 2026 10:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F05710EE17;
	Thu, 11 Jun 2026 10:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W5P8aYKS";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DAC10EE17
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
 b=W5P8aYKSblK3mjJytCe0Ph6MGhk/zYy591McbqpHdtgc5kRUjVo6Uibuz314zqoR8ND4AG
 QZ1jdRPlTX1qhVOO9F9cdF8bZ5grbi+hAWRyio/5e2OaC1xV11HkTD+5kOQc+/i2izSCKz
 Lv5uu5PjTZJCM4Xe1rB06/6F5cvl1TA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-nCqMzBLaM5iUvFMR-GNeqA-1; Thu, 11 Jun 2026 06:12:56 -0400
X-MC-Unique: nCqMzBLaM5iUvFMR-GNeqA-1
X-Mimecast-MFC-AGG-ID: nCqMzBLaM5iUvFMR-GNeqA_1781172776
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490bfd70b0fso78222545e9.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 03:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172775; x=1781777575;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
 b=nUwrkKSiBpOHais2TOJTfDjAUUheYDn4bxgYyGrASkkDxLtm/pkpvdEtvc107JQpd2
 jJSdcDV5l+2ZGRT2JSN+e0qugMZ4HqFu+ywAyijcpDOAN0HXA350VA4l917aJ/YhvwCL
 qkhyDamTlYljnE0ck+sv+rNt+csLU9CW2D19sz6I5cd8z/1FDHlaBmuLHHzOsRL42/42
 78U+46/jM77RIR2xDAO8ahMdE4TsvVDa8SZ/iUoGOBdj1OeqES+mtBgNsZhufQzMoOaS
 V8kArqC3nhemtDzgUClz5kYCbbYzQPwz3AzrU+0EGKNgHxQA8t5diMJ+wWMORa+GHwzo
 0TwA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YPAf/cJLzuy0kUB9JVWXXTyBJteL8YlGNlntE/cHjnsYf9tNbmF2Kq91ogMDg7YHUDSCClpWxTVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLTLhfFVVpZz4nxcGf4uen9xkPxwxIQpm062uFH8vRdOIBJZmD
 OlFfMb+5kNFU1VYIw8LwA6mT5MHnbysZa4HLO+5mOuxjPNSp6cgu9/t4hS+WxWsClx/GHWGE5xD
 SfJqVAYRMW2pGxhmC2ZIIFu4YL8Pyul0vbkDLQpYwDqqIgIZo+o/csoUudydrjqXEIc3GQA==
X-Gm-Gg: Acq92OGjQR42LrkheqtK/6SPgTGIcrG9LNvZuw2mU6k2IjFuhvZaanxcWC7CS5y9Lim
 jzTxPH9cIsA3XuIPg+vueOSw+7XfPGLqFdDl3+TQMa0ArNgfHWgUYP7TJLlRzwP3FlSRFagxvOF
 wtr/6AELduToNjk1BPMcF8qA9eMzYtgE9gLOgfM681Qmhb2sFdnkxdKZmYeNuAvRtXbJ5vWsY6Q
 tcCyAVKtiBS2Oqwt3SnpEdtgtBXgsPII+mY/wvAPxd5q/45QckC7RMwAYwfUwsEiT1W/MgeMKNL
 59/jQuGmUqbVCJogevY43jf73PTT0SMWWqlOAuq7qgj+VWeN0Qisnn9j1NK48icDnOomF038sPZ
 vozhRuAIXSd7n8C8Rn3WUfo6dbQZt24S5Ke95u/Ze2vhpkGOgsUx3z/lBAefMIq9CFoKCARAwTW
 7Gqn2wldTxx3bUZQ0=
X-Received: by 2002:a05:600c:c493:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490e5639bf0mr26218515e9.24.1781172775393; 
 Thu, 11 Jun 2026 03:12:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490e5639bf0mr26217975e9.24.1781172775016; 
 Thu, 11 Jun 2026 03:12:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e532c778sm38051805e9.14.2026.06.11.03.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:12:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 04/15] drm/vmwgfx: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-5-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-5-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:12:53 +0200
Message-ID: <87pl1x5qsa.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7CdWmLVxy1Qny0gJfqFv70gBJ_lC71sYdnxkTo9DsKM_1781172776
X-Mimecast-Originator: redhat.com
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in the primary ldu plane's atomic_update and do a full
> update if it has been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. Vmwgfx does not
> do that, but DRM's damage iterator will soon rely on the flag. Therefore
> supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

