Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD7606A32F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BwZcJYhj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D965310EE7B;
	Mon, 16 Nov 2026 09:28:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBCF10EE7B
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794821294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
 b=BwZcJYhjRymcmBgjCmkbZqbD3p/7Z5yUIbI7BWl3csiyfQr4n5j8UxnyHgnvYPgRmKRnVI
 8qhDedUnvU1+nud8PS3oufxHCj8E+8P8mdtSVHVs0BjFS5TtBpFXyjxiVJRjnXYD//WsVJ
 t3KBHJmGz0jx44PKQ0LKGNP8xprcRUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-7nQCDsr4O_ybtm7-aFTA9Q-1; Mon, 16 Nov 2026 04:28:11 -0500
X-MC-Unique: 7nQCDsr4O_ybtm7-aFTA9Q-1
X-Mimecast-MFC-AGG-ID: 7nQCDsr4O_ybtm7-aFTA9Q_1794821290
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4ad3d35e899so21062545e9.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 01:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794821290; x=1795426090;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
 b=j0emU+E+ndpMvDhoR8yP4KdN1qwX4wPckovyRZIUnOKVUbMobhQOv4Z8VHeIYBurHj
 x0deazW1V3Sm1LeYXfVWwP5esQaShR5GJbgdBCo0hw3uQMOpksiJ4xOw0f+UC8fAxGGS
 tbiBXgdx99ddFOAaFzy6x9ntXh4Gf6w5mTcg66CbnUaU8mNG8O1fbs9dH6y1JzsO9ACp
 gQWEIKEvgFUFgtrriwjxJ6k60CEmw68ytklDkPoyn+jXDk6rJX2duCbdJRU6Cv+cX5mv
 MC36+Gcl6mfqgaAlZIVhWD+e2xrgyn1/5fHdK40xlPKDAgZ2OBDTBwvi+/HV/KpXet1w
 +18w==
X-Forwarded-Encrypted: i=1;
 AL+hErFPQPkwGqFloWgxTjfcjqSxgxRqmokPjIzh/dQTrPSa+TQvhSQOUbmlGy4sBsdtuWHKOvTBzajLA9w=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/2ybgdlW85/PkOfWJJl0SRMue1xrDfRNVTBkShjYMvSGtGKiGp
 NLv3X9GU+ZoWFwIsZURoAKsExt4dfw1z4Z4JyGBeSSnNdnrow1qW5HnCiEvPC94a2RN57pFqK5r
 jt7DCDwfoGuJpa+wqYDjvwdnio9uwf50Vy2nqQc0yd9b6aVnWMigobCQ/5jG6v5Iqy1FLFA==
X-Gm-Gg: AYBFou2J0eamYkbijQIUa6sp0bqUqsTmhSfQMRwjMR0xkv+/46IXILkmlZd96h8X4Ax
 bLX63Xy7y2cqyv2E/kg3bT2FqRpgYIUYbBVnThnUrRVUceCsTQcSMUDxCQ02MiXyclO/9ITFbxm
 DL3iGdsbVt6PZAYJhBbL9zAMWvKSP/G+5UTBoO8MUhmbiTTVP6XdKnxjrRjUMHR/V2hx0qMS1Jz
 Mu3m3XukWO/Qb+2x9ohhnYvr0dYLK7t7/R0ILbxeVPg/nOcM6Mryly8r0iNMvNAwrp9EVO87Ifz
 2Jr752V/C9eBzevkGNqApDMfPgIw40AMgsURTwdBbw3XKqSSt7on4PDuJhup1GPoeKzGDcxsLFj
 htWQ7tBxzA76zWKIrh3l0N3cMdOyy7YsMoW/gCPsOPKuwMa9OHWyTEdCQEI92p0hYC6AwwPA4Ub
 47pit+K6izGdFUDcIOzLkFj+12haQ4x05xXm6IrOk=
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id
 5b1f17b1804b1-4bb659cb9e8mr125481985e9.12.1794821289828; 
 Mon, 16 Nov 2026 01:28:09 -0800 (PST)
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id
 5b1f17b1804b1-4bb659cb9e8mr125481505e9.12.1794821289312; 
 Mon, 16 Nov 2026 01:28:09 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5720f6basm139362015e9.4.2026.11.16.01.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:28:08 -0800 (PST)
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
Subject: Re: [PATCH v11 08/12] drm/bridge_connector: add luminance support
In-Reply-To: <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:28:07 +0100
Message-ID: <xlv1o6bpruqg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cnEmACiYCU70zeqv8dklj5DvzOJU1gN9kKqGol153i4_1794821290
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
> Discover the last bridge in a chain that owns brightness control, attach
> its relative luminance range to the connector, and forward atomic
> luminance updates to it.
>
> Do not infer panel luminance support from a terminal panel bridge. Panels
> still have direct consumers, so their connector integration must remain
> explicit.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

