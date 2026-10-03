Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8544CA5FE3
	for <intel-gfx@archiver.kernel.org>; Sat,  3 Oct 2026 11:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EF310E0AA;
	Sat,  3 Oct 2026 11:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RW75a+r/";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340BB10E0AA
 for <intel-gfx@lists.freedesktop.org>; Sat,  3 Oct 2026 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791027436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHJZUWTv7rBEBUCND4bSkxxGBQPHEUSgPjoiGT34ol8=;
 b=RW75a+r/ZFCVTheiqwyJ8oYgxLXL6KbvpsXZd9Cqkz8HHw4xye7D0j+PEwnIEkInieWfLt
 Amf40Bj38zqTqCVOH8V3LVdQuQZXmIFyn4JU1Laj7fGqn3Xn6sIBxWLu1L7lSnSKM4sn/H
 QlMj44cJNGbP/9EQmorHs9Nlr63hHqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-P2n7siTcOa2dzLTwaeegnw-1; Sat, 03 Oct 2026 07:37:14 -0400
X-MC-Unique: P2n7siTcOa2dzLTwaeegnw-1
X-Mimecast-MFC-AGG-ID: P2n7siTcOa2dzLTwaeegnw_1791027434
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48c50ed05abso12205f8f.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 03 Oct 2026 04:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791027434; x=1791632234;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lHJZUWTv7rBEBUCND4bSkxxGBQPHEUSgPjoiGT34ol8=;
 b=OpIU6OPBslUeaqLmQQNugOfBCMM4zWppC9XAs7WMlgbEx7qR8VNKr+nsjrFpc1OCdD
 2iXA8rqhL3T0IOUc4Jg95Dk9tHqAJb9oQM8nljIN29Wk6OcPwe3h4RAyzPX3EIDLiexD
 X6DJyTNL7EhS6fOnWo1DvcRiaYDFddFIgrUgqZhMSEpHUbjftMg8c5e/ZWv3YaAqnYWC
 aR49amWZSp7iCwHDAsxkCNgs8STqHAKQ1bBkTHc0b1dpP/8ZzLzsl9KqisUQtRtdLUB3
 ahuvTdslwXTbULBcIFZKe120sgsjiWXaT3D2tXES+IOluu21b2mHj7H234tTJrbpBEy0
 2dcg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxW1GTjWp00efZ6qIbZHcWyHH7YAEVzzGVD9mKDzVUAM8rjCTW16MZ4cAuLI8ootsoYJ15y/4TqxGU=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKNg6f6xdRd/sxXRSBRMnFozdGrQatrx0slOZh9zN+PykjHzGja
 nz8Gf6JnliHrTODKG3kWjb08EFntWdHbtRAB8n5ORtlbywa1wuP1v5XvIAluzayGKSTpqa0Q5he
 4yF0cel/eSJ4QOEQ6uVYGptxuIk7aMdjiLEcez7BxTQXxrFSo/BiBx+t468ZfDMWzzSYCuQ==
X-Gm-Gg: AYBFou0Bdv/DT7XA/H46mdb9xrvqjKS2+5FYL/+natueQNDaluV3rt9u5dVLqhJby0J
 xIF1+uYNvs2EMV7gii6W/8J3iE7PBCSz+AXHV4OKtaeOjhEQGLYbNz/uq/3C4aEANw7F22iND2v
 XlRoLHLl0Lc5LxBCKON7vSWt7oQdu3gsFDtWN6oDhMFw1Vmz04Iegl6VHnKrdUdx3XBjY4lxAJj
 SCqC0as2YJuV3IkRJcoQZ9HFoNWHDXwq03TMG94DYk3WvThqTc2hQuYnRfoREJtn1l6FzwGVUwq
 dxRc5q5ng8fHZDJUm56utSyMribLNu1k5/Dw4Ahw/Z/isieetb4udiaSR3Zbx2IHJrwjmTTn4sw
 AAixpajd14E2PNshHzVd8A1pmWLg2Calx+IQLImzMpoa8sxbT3IztAcjgI3h5ExDPxA==
X-Received: by 2002:a5d:5f09:0:b0:48a:f464:2cc5 with SMTP id
 ffacd0b85a97d-48c4800d152mr3245839f8f.37.1791027433657; 
 Sat, 03 Oct 2026 04:37:13 -0700 (PDT)
X-Received: by 2002:a5d:5f09:0:b0:48a:f464:2cc5 with SMTP id
 ffacd0b85a97d-48c4800d152mr3245816f8f.37.1791027433222; 
 Sat, 03 Oct 2026 04:37:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380fab11sm11943111f8f.16.2026.10.03.04.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 04:37:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 01/21] drm: add connector LUMINANCE property
In-Reply-To: <20261002190030.211356-2-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-2-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 13:37:11 +0200
Message-ID: <xlv1ece7ggm0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U2FXVz4_QK2iGfVRPve25OMlFZezxJe4Z81yH85It-U_1791027434
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

Mario Limonciello <mario.limonciello@amd.com> writes:

Hello Mario,

> Panel brightness is a property of a display, and thus of a DRM
> connector. Add an atomic per-connector LUMINANCE range property so
> compositors can manage relative panel luminance together with the rest
> of the display state.
>
> Keep the core backend-agnostic. Drivers create the property with their
> hardware range and implement connector helper callbacks to set luminance
> or disable panel emission. The atomic helpers sequence those callbacks
> around pipeline enable and disable, including luminance-only commits.
>
> The stored property value is independent of display power. A commit made
> while the connector is inactive is retained and applied on the next
> enable; disabling the pipeline does not overwrite it.
>
> LUMINANCE values are relative, driver-defined levels rather than
> absolute luminance in cd/m^2. The interface supports emissive panels as
> well as panels with a separate backlight.
>
> Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> drivers retain their legacy backlight class ABI unless the new interface
> is explicitly selected, allowing the DRM UAPI and legacy compatibility
> policy to remain separate.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Thanks a lot for the rework. I went through this patch and have no more
objections on the core bits.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

