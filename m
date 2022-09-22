Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F13C6FA8B
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Sep 2022 08:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7099C10E22F;
	Thu, 22 Sep 2022 08:19:01 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E11710E22F
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Sep 2022 08:18:58 +0000 (UTC)
Received: from 91-155-255-44.elisa-laajakaista.fi ([91.155.255.44]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1obHQ8-003Vxs-5u;
 Thu, 22 Sep 2022 11:18:57 +0300
Message-ID: <9731fffc60162a34b7790bb08792fc55593e4ca2.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Thu, 22 Sep 2022 11:18:55 +0300
In-Reply-To: <20220916165206.1499-3-ville.syrjala@linux.intel.com>
References: <20220916165206.1499-1-ville.syrjala@linux.intel.com>
 <20220916165206.1499-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Mark FBC B gone if pipe B is
 gone
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

On Fri, 2022-09-16 at 19:52 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> If pipe B is fused off we also shouldn't have FBC B.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/intel_device_info.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i=
915/intel_device_info.c
> index 1434dc33cf49..fbefebc023f1 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -394,6 +394,7 @@ void intel_device_info_runtime_init(struct drm_i915_p=
rivate *dev_priv)
>  		if (dfsm & SKL_DFSM_PIPE_B_DISABLE) {
>  			runtime->pipe_mask &=3D ~BIT(PIPE_B);
>  			runtime->cpu_transcoder_mask &=3D ~BIT(TRANSCODER_B);
> +			runtime->fbc_mask &=3D ~BIT(INTEL_FBC_B);
>  		}
>  		if (dfsm & SKL_DFSM_PIPE_C_DISABLE) {
>  			runtime->pipe_mask &=3D ~BIT(PIPE_C);

I don't know (yet) what exactly this does, but it makes sense if you
think of consistency: we already do that for PIPE_A.

But what about PIPE_C and PIPE_D? Wouldn't it make sense to do the same
thing for them as well?

--
Cheers,
Luca.

