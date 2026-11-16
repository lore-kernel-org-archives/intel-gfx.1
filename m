Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4657606A31C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PBL997xy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F70510EDE8;
	Mon, 16 Nov 2026 09:39:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A51910EDDB
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794821950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
 b=PBL997xyALWdIUtLQySIsabVRkPZx4sYJBK+YA8ZClrQS63OO5cyWMtXELjyUH3WWLmyae
 ypFmygs2qJkDAWOWuX67xiIIvWRoiFLDcUvpv2LMWvrcaqc24ASGfeKadAGeHNZqHEjBZw
 aSv2M6djm0joeYt8cgDJlvJMw6fJfcQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-mTGamfhZMMqEg7vYXe5HNQ-1; Mon, 16 Nov 2026 04:39:07 -0500
X-MC-Unique: mTGamfhZMMqEg7vYXe5HNQ-1
X-Mimecast-MFC-AGG-ID: mTGamfhZMMqEg7vYXe5HNQ_1794821946
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-490d2ac331bso3058976f8f.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 01:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794821946; x=1795426746;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
 b=fFBvltVUJRxd3bSSpUIueXFEPuEmBWDAwp5Af0JATrdvv4WEca44VdcpnJWDmd8PSW
 6cDBAkV0Dn0DLLG2wNQ2PbTv8cNXyqDJO34CZAWJH535F6tO3cNDrpOvAAG09e+EcFgc
 MDc8/4ApYi1twxSY24kCneRhEnMSqPgUznMKjLFc2fBgJmCD9gLlgjy5uBIFaltoFKSU
 hX7EYHEB4Shz+GeK3i7LswQXKKbQjHwSbG8/pO4q8DsevceQFv31ddvrhlqAWquG2OSB
 VDqlpMwTfZh8IzfiiMBtaxRvaSvJcN2FAYhwO2VEaAqg5nGJ6/RLp3BrBK2yk0Z5y4ts
 lxWw==
X-Forwarded-Encrypted: i=1;
 AL+hErF9RQnhEsQ+UW9i5PvBok3D5XhSsR+hGEIEHkW41IF12r/Aevc3Nng4Mgo0jCOGpwYE6BLqsh5aIzE=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+ETwUHkB44DFgLPTnaGUSp606O6tQy+PMKoxFu/5Y7iV9dbakh
 KLtf3a+mofhAhrMBz3ojgWZbQSPYggaKYoSZhgZlSmL7A+qEXDKQveIjik5Rtd4Ui/EpYpDURTk
 MHvhRlld8GUMjaO4dBMQ/oJQOjWcJSDPjCKQU16JT8hyEZRKXgGLE/Q9aTMNTE4KT5QHBLQ==
X-Gm-Gg: AZFdTZfjQJ/tM+1f+KOARvUCWGlfXYRx78AkTJNvrr8Q5sfIoD5yk8N0E0GxLa0JJWg
 DxAwwe7soLH5/FbXSUEw3j6aciS8fVsbkXXlRSuYFau9TXZe4xWaD1TVAxx0+cfAif+MGAVqH0x
 2BBP3pEm+BTjaD2y+p00bjA0biPFp2Zw9OeGgpY597utNYnK4vZFTJCiYJBIh+6OdFzLa8JKV5O
 IxJbjWCqDTBYvHTbOBNYTsoiYiwZjAU8MVB2lZlGPpm3oeBxATVn8v/Z6vq3CJnKsp2eXma1Pdm
 BHRnVIR1fwzRwwdmNAiITwwYlSKzm9gTMPonptUPhzbe7lx9ix6HxQj+t9iNIKMn9qu7GVdva/K
 auWf0iac5NOE+PYsmU1RYAP2IRYr48tBlfgVlW8nENsBr4iiaJ5GA09T5F8/XoUnz90F0qrm8KG
 6sZ0fhaL9PqkFESWttZSClGveiLi6RsXhkuLbdMQ8=
X-Received: by 2002:a05:6000:25c1:b0:4a1:486b:4eb9 with SMTP id
 ffacd0b85a97d-4a1486b53eemr6359097f8f.40.1794821945574; 
 Mon, 16 Nov 2026 01:39:05 -0800 (PST)
X-Received: by 2002:a05:6000:25c1:b0:4a1:486b:4eb9 with SMTP id
 ffacd0b85a97d-4a1486b53eemr6359053f8f.40.1794821945065; 
 Mon, 16 Nov 2026 01:39:05 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7da37b19sm21564920f8f.5.2026.11.16.01.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:39:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v11 12/12] drm/solomon: add SSD130x connector luminance
 support
In-Reply-To: <20261103-superm1-backlight-property-v11-12-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-12-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:39:03 +0100
Message-ID: <xlv1ik1xru88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vLRFJriTJlBz4_F041pHzjnLNKKbGNbjkQ_6VtKqcK0_1794821946
X-Mimecast-Originator: redhat.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

Hello Mario,

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Expose SSD130x contrast through the connector LUMINANCE property when
> DRM_LUMINANCE is enabled. Program contrast directly and register the
> backlight class device only when DRM_LUMINANCE is disabled, so contrast
> has a single owner.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v11:
>  * Keep selecting BACKLIGHT_CLASS_DEVICE and drop the guards (Sashiko)
>  * Register the backlight device only without DRM_LUMINANCE (Sashiko)
>  * Initialise the controller with the committed luminance and don't
>    clobber the saved contrast on disable (Sashiko)
>  * Skip contrast writes while the controller is powered down (Sashiko)
>  * Unify contrast dispatch and backlight ops (Sashiko)
>  * Drop Reviewed-by due to the rework
> v10:
>  * Guard the backlight operations and registration with
>    BACKLIGHT_CLASS_DEVICE
>  * Fix Kconfig recursive issue
>  * Add the Reviewed-by tag
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 149 ++++++++++++++++++++++++--------------
>  drivers/gpu/drm/solomon/ssd130x.h |   2 +
>  2 files changed, 98 insertions(+), 53 deletions(-)

[...]

> +static void ssd130x_connector_set_luminance(const struct drm_connector_state *conn_state)
> +{
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(conn_state->connector->dev);
> +
> +	/*
> +	 * The encoder enable already initialized the controller with the
> +	 * committed luminance. Skip if it failed to power up the controller.
> +	 */
> +	if (!ssd130x->enabled || ssd130x->contrast == conn_state->luminance)
> +		return;
> +

Is not clear to me why you need this enabled field? I would prefer to not
keep that state if possible.

The changes look good to me though:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

