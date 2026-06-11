Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3926CD98CC
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Jun 2026 10:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3496E10EDEE;
	Thu, 11 Jun 2026 10:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fWqqg/qE";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B3610EDEC
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
 b=fWqqg/qEEOeBhLTiXQh5WxsmVoRKTGr1GVdI4gJB/RA9tyWt61Ta7r5+D5i885hdF+V7hr
 b/+HE/ZO+JeZQG2lviWKUE/MbIKl66dSoE1DSNNFfYGYdYwL5xSyeSzlkRfNcD7R6XQ/NB
 RjtD+vlnBM15QU09C0/DzgBpVCzYt54=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-M7UZDNHhP82bFtIiRrNjqg-1; Thu, 11 Jun 2026 06:10:35 -0400
X-MC-Unique: M7UZDNHhP82bFtIiRrNjqg-1
X-Mimecast-MFC-AGG-ID: M7UZDNHhP82bFtIiRrNjqg_1781172634
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490ae016853so14351505e9.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 03:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172634; x=1781777434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
 b=OW4oJM3H4NvYJWjnOQ3tzhGxBtR8gCC3giWH+TgoPxi11gpsMNq1CYaEhdwMyJ2Apb
 2vFMqVOcud6uUVF7zAZZ/HOr/QifvBu78C+P4pRWKXRHsgscT2fcaVJvIkQRn8L9odLj
 8BLzgVoCforjOLcDkdrNMF5Jd4WCTRaXiep1rk2dfKri6glVqY3W21BYI/SPeHXi9j+j
 lhJFG59Sq8ygA1GveWeZmEeQeQs8yjyRXf7ifGiSPwo1wrHOg7+MUOvdcysswpOMZFqJ
 P7Op23hthQ6zwB9d13Z33HrpqFYANDH22uKK5MdASpX9TCuE+K6VUxtR8vF/tp9kOksL
 majA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sZ0u1xXMPVWPoCxJeBQlaKmTyA2nKuqQLbh2wkIJ+Lo6tlBBpv1pEBZehaI2wvk22go72oHPGLqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIAbBZ89t8ndh2NLHKVri0y0ZrbvlZFsD5Zvzvav4ErvXMHvvC
 r56DCyyzLwInBqHWclChRK0bDd6Vy4BBd6d39z17CoIS8ppeOZkplu8LxUcD6gTxqwziEvN30AY
 mdCUB/UEPEYA6SyI6SfcaubbhgjaWft0ggHILZSuqBLIe5qDlnMXgv6ST+pAPGQ7MqVQgrQ==
X-Gm-Gg: Acq92OHKSbk/XnprKYpZVRDuvIzD24NYiv2K+WpDVE6gYCBoLam8xMm7YgWKnCiciLo
 43iLcpcL8CsEdtgaDhK9qr4UIwhuFSVpMzckuNzt0KDsl2zBufWCBtPUO9mGVV0jLxQOdQ2vDQY
 zhNRIBHbQ/oKhnhi/qivmeV85TlgnloQsem91kcA7WyKwHL61+YE8p6pgCGJ3RY8M8xShmajQyV
 eTtUyaVNPhf1LMm4YKOiKcIH73+/yzEFkF4RepgBfxsgJj1dPXYHSQ4NjYhMfcgCdhGV9B38V9K
 B2m0avoFq5KKneMMwNnrnrD0JRVlhY21+9lPpyZy03Ed+pq94jydFGK4TjM8BSWY+qrAPgZqgQc
 seoxfGa/QveXQ4rX28VPAQCENd7z3x/l1mPn69YUIs1UNWQD8LikX2+tZFv+llFsYdVYnwQ+Ou6
 vunYboVd+50DL9Eiw=
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id
 5b1f17b1804b1-490e55dc1damr31237435e9.7.1781172633820; 
 Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id
 5b1f17b1804b1-490e55dc1damr31236645e9.7.1781172633469; 
 Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e52ac9aasm38076025e9.4.2026.06.11.03.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:10:32 -0700 (PDT)
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
Subject: Re: [PATCH v5 01/15] drm/amd/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-2-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-2-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:10:31 +0200
Message-ID: <87y0gl5qw8.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JRbRWXzrRgeOYepfDB8TXsl2oyyQpB7XEsFEFO2e5Vg_1781172634
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

Hello Thomas,

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in DCN code and do a full update in DCN code if it has
> been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. This driver does
> not do that, but DRM's damage iterator will soon rely on the flag.
> Therefore supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

I don't think that a Fixes tag is correct here? Your patch series
is changing the 'struct drm_plane_state.ignore_damage_clips' and
the changes make sense, but definitely isn't a fix in my opinion.

Having said that, the change look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

