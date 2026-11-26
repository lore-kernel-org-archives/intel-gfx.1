Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82976606A31E
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LYPnFhKI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E408112559;
	Thu, 26 Nov 2026 15:46:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3051F112562
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795707994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQvLC0FxHg/bSpHW9/gmIY66IIHqqdWcBSBJ2Hl0tm0=;
 b=LYPnFhKIghZvF9aLdBFKdhcXZ17yVFo+FvDyX9Gqk2i95v05yQuJPKP8ka2NUie18YXu7P
 CYFxBjx3Yc1zwYFbm36OV5dHUEPoHNP3TX6mHjAphvdyssgRFmzoJTqpHAWhoqSPuKZrSI
 7egEtSkHEtA4Wjg/osTIFrVGzo6eWv0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-8YTQQtkGPg-LNYG15Jh2Iw-1; Thu, 26 Nov 2026 15:46:32 +0000
X-MC-Unique: 8YTQQtkGPg-LNYG15Jh2Iw-1
X-Mimecast-MFC-AGG-ID: 8YTQQtkGPg-LNYG15Jh2Iw_1795707992
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-8b4d1e90b9eso56808167b3.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 07:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795707992; x=1796312792;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hQvLC0FxHg/bSpHW9/gmIY66IIHqqdWcBSBJ2Hl0tm0=;
 b=AC3rjjc0fMYSAFriv+tUX1I0ecwVtWkJZxef7f0Aacpr/34B6Sk8HWUMSS/PMRZKV7
 MZK4AfFE+MWFX3Nm6tQI5SotGW+JlkFDx6S8+xH6FVniCDGTTwhq5B64jsFu44TmPgwQ
 Uazx2T+5HWJvk2tmrQfx89ixU7LNA6CblBjFSq8GrB3ZvXL0WyU/HTKhB7LbK2CufOd6
 GqGCD71JHIZfTlQiXgkxAvHCLxlJEd4IudleQlkHXv3AJmQDNCpdgqfAGwNItpyUL7h9
 hc24OSZNraWvgepHQ0Hwf/PoD1ZtciUCVLjML4zIchFwff1pTLVXrTQ5chAL2or7PGfo
 67YA==
X-Forwarded-Encrypted: i=1;
 AL+hErGdeE8O1f0rq3YqwMB7/GLYQ5CEDBf70/pnzsm5ueCSTwndZBv4y3XBjX2EtHTJxcuWV28YLZmY8S4=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/qy01Pw4eMTJtpMqTWIC8bSkrISp5Cr0EcRIUcfbVzbLImaVuK
 89ehzbcDHCoBSvpGHCUf6Z1fc3g/Kx7yDUGJfpcAWFwfPDMnGart6CMk5LC+NiG3mRMGIAU2A38
 YDg+moaEDkeqf/KNLmz9vCISAZw9xM0NAH98kPYEHXAwCv961uJMupUACJCYeD809KMdmVvpytm
 fQV8SYQvpB72OZ+eOp4x+XlYOjsRJzpP6jooQc7IxPApq0
X-Gm-Gg: AZFdTZfPnc1CY9fYhY1SiPXOm32xoT2gBOpQDNimxMNe76oGBAjh7tf3EwMZDsv2x20
 SC8WFmcIdgotiHGbvlTMLAzai+Nm66traPctK9W1vz70LD/zq2MbuutwEN5vO+C7Xfn2O5Y09dv
 rHij8Oks++L10ad6J2ePdujlQJeD3S3XGF2W9JtLPeqpmfV+eJioiqEEvB
X-Received: by 2002:a05:690c:e654:b0:8b5:6ff3:3413 with SMTP id
 00721157ae682-8b56ff334a0mr14813317b3.48.1795707991740; 
 Thu, 26 Nov 2026 07:46:31 -0800 (PST)
X-Received: by 2002:a05:690c:e654:b0:8b5:6ff3:3413 with SMTP id
 00721157ae682-8b56ff334a0mr14813147b3.48.1795707991136; Thu, 26 Nov 2026
 07:46:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126081602.2901498-1-a.kazinsky@ideco.ru>
 <20261126081602.2901498-4-a.kazinsky@ideco.ru>
In-Reply-To: <20261126081602.2901498-4-a.kazinsky@ideco.ru>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 26 Nov 2026 16:46:18 +0100
X-Gm-Features: Aa3M54oYW2ihtUaCzbXcSxw8ImEG7WlDwS6-9lOSsQrY2Wmb71vfmuxMtd2PWFI
Message-ID: <CADSE00JCThOvzzKK0htFOpoK5ObCYq0EDaVTCR+wNrBvPnNeKQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/connector: Propagate content type property
 creation errors
To: Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Alex Hung <alex.hung@amd.com>, 
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 George Zhang <george.zhang@amd.com>,
 Adrian Betschart <adrian.betschart@cinemaone.ch>, 
 Alex Huang <Alex.Huang2@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 lvc-project@linuxtesting.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4cixy_KnXpXkPEtwTFHJEc2qX1jjGRaX5WjKo-dXSlM_1795707992
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Nov 26, 2026 at 9:33=E2=80=AFAM Alex Kazinsky <a.kazinsky@ideco.ru>=
 wrote:
>
> drm_connector_attach_content_type_property() returns success even when
> drm_mode_create_content_type_property() fails. The property is safely
> left unattached, but callers cannot detect the failure.
>
> Propagate the creation error and document the return value. Check the
> result in the Intel HDMI and DP/LSPCON paths and in AMDGPU, logging the
> failure while preserving initialization without the optional property.
>
> Fixes: 50525c332b55 ("drm: content-type property for HDMI connector")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>

Reviewed-by: Albert Esteve <aesteve@redhat.com>

Thanks!
Albert

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c  |  3 ++-
>  drivers/gpu/drm/drm_connector.c                  | 16 +++++++++++-----
>  drivers/gpu/drm/i915/display/intel_dp.c          |  3 ++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c        |  3 ++-
>  4 files changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> index 8a039ef6e4b7..3d163c2fc106 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> @@ -3325,7 +3325,8 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_=
display_manager *dm,
>
>         if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
>                 /* Content Type is currently only implemented for HDMI. *=
/
> -               drm_connector_attach_content_type_property(&aconnector->b=
ase);
> +               if (drm_connector_attach_content_type_property(&aconnecto=
r->base))
> +                       drm_err(adev_to_drm(adev), "Failed to attach cont=
ent type property\n");
>         }
>
>         if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 51e616f5aa5e..5ab121860050 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2253,14 +2253,20 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnecto=
r_property);
>   *
>   * Called by a driver the first time a HDMI connector is made.
>   *
> - * Returns: %0
> + * Returns:
> + * Zero on success, negative errno on failure.
>   */
>  int drm_connector_attach_content_type_property(struct drm_connector *con=
nector)
>  {
> -       if (!drm_mode_create_content_type_property(connector->dev))
> -               drm_object_attach_property(&connector->base,
> -                                          connector->dev->mode_config.co=
ntent_type_property,
> -                                          DRM_MODE_CONTENT_TYPE_NO_DATA)=
;
> +       int ret;
> +
> +       ret =3D drm_mode_create_content_type_property(connector->dev);
> +       if (ret)
> +               return ret;
> +
> +       drm_object_attach_property(&connector->base,
> +                                  connector->dev->mode_config.content_ty=
pe_property,
> +                                  DRM_MODE_CONTENT_TYPE_NO_DATA);
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_attach_content_type_property);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 47741957935a..768cb02f22fb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7012,7 +7012,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, =
struct drm_connector *_connec
>
>         /* Register HDMI colorspace for case of lspcon */
>         if (intel_bios_encoder_is_lspcon(dp_to_dig_port(intel_dp)->base.d=
evdata)) {
> -               drm_connector_attach_content_type_property(&connector->ba=
se);
> +               if (drm_connector_attach_content_type_property(&connector=
->base))
> +                       drm_err(connector->base.dev, "Failed to attach co=
ntent type property\n");
>                 intel_attach_hdmi_colorspace_property(&connector->base);
>         } else {
>                 intel_attach_dp_colorspace_property(&connector->base);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index b6fa1a1558b8..83daf6d1af4a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2719,7 +2719,8 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_=
hdmi, struct drm_connector *_
>         intel_attach_aspect_ratio_property(&connector->base);
>
>         intel_attach_hdmi_colorspace_property(&connector->base);
> -       drm_connector_attach_content_type_property(&connector->base);
> +       if (drm_connector_attach_content_type_property(&connector->base))
> +               drm_err(connector->base.dev, "Failed to attach content ty=
pe property\n");
>
>         if (DISPLAY_VER(display) >=3D 10)
>                 drm_connector_attach_hdr_output_metadata_property(&connec=
tor->base);
> --
> 2.56.0
>
>

