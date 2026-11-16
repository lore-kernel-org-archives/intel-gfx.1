Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA17606A323
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QDWoLNsE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92F610EEE6;
	Mon, 16 Nov 2026 09:29:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87CA10EEDF
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794821346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
 b=QDWoLNsE8ap4ZLXBbau0GUxUJW9b60b1fmIYb/7g6oif6/ThxNn/ipHNwk3Y8bzQ7W71Lk
 +pjNZrmwtqXkXYACR4PxB3VyvwhA1YEc/Qkx3rPlfjerkN1r2WmO5JdJt0Y5VXr4MEbg/0
 nOsXdETvbReYj0ZqUQx4hjMccHOwZ68=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-TAaBJEO_O5yZr0b6G4UdKg-1; Mon, 16 Nov 2026 04:29:03 -0500
X-MC-Unique: TAaBJEO_O5yZr0b6G4UdKg-1
X-Mimecast-MFC-AGG-ID: TAaBJEO_O5yZr0b6G4UdKg_1794821342
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4ba078abd70so20644645e9.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 01:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794821342; x=1795426142;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
 b=An+tb148pMkqK89qrczI7nNKjRjjm32bMW9VvLwVMlqrx5ojd6+NBXT2thwArQOdQ2
 hV9rn91Z0DJH3OmtLCw5bjmkot+RWby2qOXjJoZpjjoIJcGHBKo2Ad+yxK9ENdCFu3Qj
 nyM17qjVLj0M4XQ4saAQh8ieRKs0RneJoM9FdIrbmGNgmGYV/k0uwUOb2Dk3E/OBfCA1
 XLWRAt07vpPQYj8YhfaMJVDBvgy+CQqpzbmW/w16ktDU1QD5jQbhd4G8R0aLP9/eqfZ8
 aM90w0WkyNRxuAknxmCI95wchkh4K2vgn7lCONyhHutGEZXM1fQUKwD6OJQVwbSRWb+z
 PzMg==
X-Forwarded-Encrypted: i=1;
 AL+hErH3vFFg2GR+CjMAxdxrZB7cyFpe+1F94oEGz5W0PSnvjSTo0rIY287l0M9EO7HwuYF38XxWQFqJEQk=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9xc9Keat4s4MxGIziuM/SDWEnlMw69DcHPsLQJlmIo34gj8QF5
 NEiaSrL3Qik44mD1iLqcsyBNQHGd3ElRudu0Z64CQZSIKWr5XKHLkeOVtH1wnUDNvQaImmZAQVm
 89e5lhRiZZUC4wiuUCia9gRvSWdkpR7YUzWB0T6dctBL9Qg0C2TjI2yURYd3mO9qKaChlEg==
X-Gm-Gg: AYBFou1rZEJ8AQ3Dr94YAa3bAv2UAmOvfJen1yV5utJhDAMj2g1QEL4mL4BLhPbEGFx
 rgX1au1F+31QblOPVaXThF6E/N+0DhJy+uo/UnoRAdid8w+1fM7EciUFLKyt3br9IRXBhXl+jBX
 ghoiElJFcxL9PuyL9DGitaFj5ZThyPtriktoWKq56CNHHcFwvci+QmukxmtJ94cY2XsJSQJmQJl
 LNHorEXRd9624Gz1HdhHoy3uur/OGu/xJYK1R90M4gG+LmqbDZ07FmHMcz45dcdOsMAjJcRBpWi
 sJjAOX/1SSaa2rzO8IBzaZZg19Xcgwm1e2BqxVIyQJ4aTrMlLxdJJ5tBQNTaCyiCf4qCng1+7dG
 0Hd7cD/Ngy6ZXcdoGQiVu5hwrR24rcvnSQ15WX3CY2kdhLQ6H9sH7ra2H+61AfBYgLs9YZ4dutB
 u4lhn6AbmZUCZlkKpowC47lVKojZS6872ed/Svuk8=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id
 5b1f17b1804b1-4bb60bd5507mr133776545e9.10.1794821341817; 
 Mon, 16 Nov 2026 01:29:01 -0800 (PST)
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id
 5b1f17b1804b1-4bb60bd5507mr133775995e9.10.1794821341249; 
 Mon, 16 Nov 2026 01:29:01 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb675200e4sm115370395e9.0.2026.11.16.01.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:29:00 -0800 (PST)
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
Subject: Re: [PATCH v11 11/12] drm/bridge: add PS8622 connector luminance
 support
In-Reply-To: <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:28:59 +0100
Message-ID: <xlv1ld6trup0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1OLJ3jkqj2m7huMvcUu25Gx9uOsltaxPHGusvYAwLkE_1794821342
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Expose PS8622 brightness through bridge luminance operations when
> DRM_LUMINANCE is enabled. Keep registering the backlight class device
> otherwise.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

