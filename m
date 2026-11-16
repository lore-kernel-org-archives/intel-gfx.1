Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1891606A329
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EMITteBu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ABA10E3DB;
	Mon, 16 Nov 2026 09:16:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5CF10EE6C
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794820607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
 b=EMITteBu+Zq8r2lIitF9xBTTKbkSgXU4IffsBkd4BZFKpcgITbCd7jZEUSnebvtB2Q1W6d
 PH35SJqECAscrYKbWMwb5wWggcBbMPV98Z82Erc6SmcAfUQrQ+UmiqSowFcYnMHNmbUBtL
 /2QOZwEK8sHfcBqS3vJlpjRRNyFyp5s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-Hzwu9_aPNRm4OIgomC4pjw-1; Mon, 16 Nov 2026 04:16:42 -0500
X-MC-Unique: Hzwu9_aPNRm4OIgomC4pjw-1
X-Mimecast-MFC-AGG-ID: Hzwu9_aPNRm4OIgomC4pjw_1794820601
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48e0fc747a7so2015536f8f.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 01:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794820601; x=1795425401;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
 b=VyYOcezfaDYPImFAqs6GFFR2/NRlihQu6d00EH69G8nioknoqt+7Sg+MAmD9OipLn8
 vdIcspFN4wdppaHJdvAMCgiLEtk/u/NkMNz4NhkR/ZpHl653lf5rhBljEoJJ5UyNyS/x
 S/2GKQuEC3XiUydORcuEGtcoZ+Efiq1QHqrbwRg5EUev7D93LO4cKrZCpPYhgOecKbFB
 etUk/9UAZV5+t/694aq/oYW2Uu6P7E9OwsTG1UnGTIgRPmdngmkfPYOEYHOnibo25aad
 7YYm6mUSaOEt9G+eAvZPOeXlinTg514jSsViKKt/UpkwmqPekL2OAoQZJGBnojCBRhFU
 2Ziw==
X-Forwarded-Encrypted: i=1;
 AL+hErHKaaK8N/ZlDPuSV3o1rTzccyGTBZM3T4qsmYdEa5T32hQp33/i+jYWVyu7wh+CpKq5g9pGlSHNIiQ=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/NJMT4FM/BBhOLrQChmojgt+1TnqaQU94ow6V/nAP7A8f7ytXx
 wi8VoDmwHnrP4LOiISoL/TvqkkFGoSnfvwS+YBh4XZFXZLX0rBkD93CCcE+uJGbu3LwGxT2ukpq
 p3jeDp9pggsOOCi1kSWB0sc4ikM8we+rpZVX5mO9Q71fCKaNUyhr5qEcMKF1EKEfbYhCftg==
X-Gm-Gg: AZFdTZf6F685YaTBXD5xd9s5xths6de8CzE+esVjsMnRUvHLQT9CojCdeOLXjkzavve
 MZdnu0jM6f2vqRBZOr4XC32MulF+Q5yRreQ74wMiN0DC9ACik7TeOUIUpC9bghu/9wULZNnBKXH
 JnSG4kv8gPSfpNnaH2QXrb2hetj23i66Ijfa2thIIzxaaCy8K3mEK3M8G7RqIEIuBVR88nDF9D4
 1tqK42KNzydoJSr5Q6J/w4mwT3eeVn/1FwWKoFS6X+hiIsUkDMTY8VeVhpxmKoYy8QM9WO3f813
 i1WkR6CSC7czk+S5oO1coT7jvlSq8J5+wZte8GtSYNCV7fL47iHtbQN7DeFCRYwHd10C7wnWYeQ
 MTYjoo1lFJCP/j4c8EMbO6GnWClq8IiDXPYBK/fFbWwZ1k/Cglq5C+T7RuLChnTpDz/r9pSukuv
 j2vFQehNvTNh9GNVGaCUCuJ4OVf80s6Avv0Yb8iRk=
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id
 ffacd0b85a97d-49c6d453058mr20772416f8f.5.1794820600440; 
 Mon, 16 Nov 2026 01:16:40 -0800 (PST)
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id
 ffacd0b85a97d-49c6d453058mr20772359f8f.5.1794820599837; 
 Mon, 16 Nov 2026 01:16:39 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49dc430fa15sm14802191f8f.13.2026.11.16.01.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:16:39 -0800 (PST)
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
Subject: Re: [PATCH v11 06/12] drm/bridge: add connector luminance operations
In-Reply-To: <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:16:38 +0100
Message-ID: <xlv1tslhrv9l.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XIFJSa4qyAaXAy7cyn90EoXdVGjJxxTRlWJtd0leEMQ_1794820601
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

Hello Mario,

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Allow bridges that own brightness control to advertise a luminance
> operation and its supported relative range.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

I'm not a bridge expert but this make sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

