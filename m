Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69C9CA600B
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2026 12:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576A610E7EE;
	Thu,  8 Oct 2026 12:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="cEAp7Jdy";
	dkim-atps=neutral
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
 (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B0210E7EE
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Oct 2026 12:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791461610; bh=aP0RUeB78axPNP6NJ4DjQ8DF9qaKUJU6zYwfnJiRnDA=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=cEAp7JdykNDVJr+rpbVWKPAKISk4hjv29mxKH7LOqrUY6ywZceO6UUWAIRgZjjtvCjzl/jerWdZezMHZMLI+OmrQDRQyOxKjG+KfAqJ7XmGUAoQzJh3MUjcXDofzKYKYcHwBKfg2rEMuTWY1btfuj5ssSK6ND3JrC2z1XPirUwwv5fwPHEaReUDZ8MY2YoRBt50waSDMnsLVgKtV7s6mgQglxx7rblst+LT20tivF2nijiaS5zdsIkyhNbNYvYPsC1OwyiSy6RSANk8cK9GjWlsAfv7pFjjx3a4Z55u3lh2fXnYEdl0+atGNfGQ2WRjInn7VlwKKGDM6c3oToTdxWw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791461610; bh=ieyeUxPr3/PE749Hk1EhzF6GCfF3od47SqwBl3bXMN3=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=pzTjVoRacK73nV/b+9VyBd0ATAh2NEriofM3knWHkj6Lh3E44tkLWYcF7CKKmqGve/4JvIjawMRrL2Uyj7WB4Tbev37vCMOVSDtkmg4Ouxj3D/rV1l7mxX0ct4LmZdCXWKVEqhOf6K8+2etKN0UUkp/67jLRqqwfkNQX5A0cbiZ9ymN8mV59AJZn0sHf6dX02LCaiQS0KnYU9S1cjAOyIXqA9kogFAC9CyzGloNGaYd0brM/LAaqmo2LL0XRABoPRBq2Xl51/DEHl5q6xJMpDtU9YTHfviwm/ND1X7oVe/ybTkKazxHXFfi9rGvwFamTn/HZEGBHbr+bHOkp5XHZuQ==
X-YMail-OSG: 9dPHFyMVM1kPZ0SlJDe28rHfcGeV0b3qPqNalUqeErPpAhLaqe2OxofJuaLKf8u
 DE1blou7bMkX8IzpeaKgnrlujjRAbcM1Og9n4KNVDwW_DDLdMofubL50AESyqwZ0_ueQXT6Y936o
 62m7tw.bfVCTgQofZ0mjyvu5eS_Glo4HlzS19VdwNz_DbNRLfVs07F6qyqK1_LPd7oxRbCBa0jJO
 jcr1HNkfxLaKWZGRbv2MuJoPa8UiJL3BjL3p1dlylDiSCeIeJ6E4aBLXXjx0teNQG3RcIttFNmAg
 aUTIg775WoHaEmDs8a4SN0wigrxgQtl_JO.gDxsUT0i9V5Cf4wHt9LpnH9lbm_N7d3IF6Og85.9e
 LSio9XTNlk47ukZM5xcwGedjOzmy8IGJYdJOAzybCscKNf98AwCP9khlTtoPteKWFjjChUq9mqvS
 LlLV14KojXh0hBd8amzjYk.GzaJ.VCbaNRUwj4neA2WR_1vsfiCbaKXBmTv60WrPLmmbRjiDP590
 WCNWjR5g1vB9Fo_WNWsdomEgpjgiIX8WSqO89sXGXj89iytG5dDU8FBsHE4m70kcBximZnQzC6Sr
 gQeVVDeqqJfiN.ZHVNjumw27TEIe.AbNa27CwGDEXDTFM7A.07dmnNbn7qBHEmPBw_H1oF0UV4kt
 ky8RfFoZfPBvUF6eBF2BZryXVPqZOhZ_EDj6f3qBK5EHq7L.uQgilLlzrbFbd3zcQD67l8rZ0ID.
 s7Nyb6Z72OrLLy8CuWb5Xj7Gw9AlTS2qYtGHFKA_tieAyddRDc_Cy3D1jUCjGLzYNkdRTd7_y.tF
 BPWWkvmSqLPrv.dLFE7LRDyyx664XBmubVRIYpov6RIXIJfgBVDUBWfrNLKplieRfxS27y4GsoOZ
 eVyDIfi6Lkr7dGTzv7c4pu3BTuo2ME57ISKAxC5lZ4Ib0FN4t3JBqDQnbDTia0_Ewa.A1b2rUY3U
 4kHA9MKvXAUyhmm6h2Jq0u7lhzRwMmRW6loZJu7B0FcC17y8gNwJ.080Fs6QZuMOyn0qB5yOg.2V
 Hz4Gb080T5wGAiJuXbZYJgZZvs_HaAH4zZXkMxCjYSVsAkYmzh0mhoIxx.g1nVLt134Eqt5fPYQy
 sUWEO9uMuMU9ujJTcJBXGplYo3QGpCU8f4gCcZEowKEIArXo_yI7xVyrjRlNc.zCRicvhje3Ww4I
 1_YfKyhdvm0JyI3pV0AzhE8iq2l_7SAkB9yQs8yevcvdXr1iAkdc8LOxbEnfojtfeMVhWpoAtOZ5
 cJePasUU2oxlNgS54gbB3HnVFhsjRTfBiDUF9ukF9gQQTQx2GRij1ZLcbbHqNsMF3iej0i5lqNru
 cnAGpVGD2QRFVEeqS1L1U9qCxR7hhDjIbVMGlkJ7Y5FHCGtHdspzPEwfTj3GaIPlkBZdmOfa58ka
 dIgQ70XMwwRx1FiZPn7bfzDyzpBmiNwlYF.zIRrZagm8zfTpre3xhUgmmsuDpSYjrNGHmsz7d7SG
 TLbB8QxU.Z8M3twpQFFPHNGjBgEdhZiDYHjZ3A2i.QAZooD.0NaYNFc4eGIamxkTEvBV7HqfrZqs
 TwJQLSV0TmOi3Q88KjeT2VaaOwqlxEDT3c4U8edzV7K4OlixOqpc8EDnXwIQaV6AjF8nyLtL6XjC
 zBJrNn62.HOPnKQC7SKzMCP7zuXaVIzL6O38Ors.ugdZAXHNIYHtl73RJUbt7CraHmsGjUn.0M_f
 GhPT9XuMHzwVA7ZIYcOhc8HnXkoc8HIGXunygfpT0Silg7w9Apub9enI48jCo6xlmD4wqmBt_eof
 y4r.C8BnOq3.Td0puiNvfQ1Dc4bqhi7tB8Z3Wig7CvrSwy9mnpP.QNqJiMdD..YAsDvhjW7pkIb.
 io56DYjAM30UI_pPVG2Z9XtRyYtOtzYOexUHaIRjuMNuLyjpg0PTxSNinAQLhvUKmUaSGPzUrPcs
 wbTjUkjLu3zg55hbzeCH0co7ARrfdoUZ..ybeZLTwNdsaC3mve3v83d37I5Yd8VQlhnJG8QpqeNi
 jgDJEIhDkZB.Ym6O76pZUrG0KxtZm3GVXEDT86T26HfxZ7T8jJG3LKWEVMyeYEMpus10O3oTl00F
 tF6SrZhCHCfunx7UpfMGj.uVGbVRu5dgPQcaAZMo.gJ6O_ItTzYZ2D4B27yMXtzJJmITye5I7uu8
 .3zhbqSmFUSxFUK3d701qGBr5QuA7Nlw4nR3sZhpaqHujNvFEq1uaw6DBjapd_4BVjPt5fnwhErw
 ALVo4iBtUW3coc224No1V3dLtcrE3Onhwo5X.PWVHfEqPxCJpTFN2TOvS7I7jWFOKbKBtBNoYlAJ
 qFA0auDPkGbJZRSZ12fLFJaGzJI9hgfT6g1fisHjZmJA-
X-Sonic-MF: <jp_2422-git@yahoo.com>
X-Sonic-ID: 4d334cbc-5cff-4da5-9422-5d7e9631966c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Thu, 8 Oct 2026 12:13:30 +0000
Date: Thu, 8 Oct 2026 12:13:26 +0000 (UTC)
From: "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <2058729485.143579.1791461606363@mail.yahoo.com>
In-Reply-To: <fd77de823c5d30b4587676a7a71962f517979616@intel.com>
References: <348041964.128703.1791459745347.ref@mail.yahoo.com>
 <348041964.128703.1791459745347@mail.yahoo.com>
 <fd77de823c5d30b4587676a7a71962f517979616@intel.com>
Subject: Re: adlp_tc_phy_connect [i915] floods logs with
 drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 YMailNovation
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

Ok, thanks. I 'll keep it just as a private fix in the absence a suitable bios update.


On Thursday, 8 October 2026 at 12:49:19 BST, Jani Nikula <jani.nikula@linux.intel.com> wrote: 





On Thu, 08 Oct 2026, "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com> wrote:
> The issue discussed at https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12246 affects a number of laptops and Bios combinations, and appears to be the result of buggy Bios'es where the Intel VBT table is listing non-existent Display Ports on Alder Lake laptops.
>
> The following patch skips the creation of the non-existent port early
> on in intel_ddi_init(), so preventing the logs from being flooded with
> the warnings. It uses a new i915 display parameter to allow the user
> to select the type c port to skip with a boot option, and fixes the
> problem. Please can you advise whether you would accept this patch.

Thanks for the patch, but sorry, module parameters aren't the solution
to work around issues.

BR,
Jani.

>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a46ab5d3d..5b9ebdecd 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -50,6 +50,7 @@
> #include "intel_ddi_buf_trans.h"
> #include "intel_de.h"
> #include "intel_dip.h"
> +#include "intel_display_params.h"
> #include "intel_display_power.h"
> #include "intel_display_regs.h"
> #include "intel_display_types.h"
> @@ -5239,6 +5240,24 @@ static const char *intel_ddi_encoder_name(struct intel_display *display,
> return seq_buf_str(s);
> }
>
> +static enum port get_skip_tc_port_param(struct intel_display *display)
> +{
> + const char *param;
> + enum port port;
> +
> + param=display->params.skip_tc_port;
> +
> + if(param==NULL)
> + return PORT_NONE;
> +
> + for_each_port(port) {
> + if (port_name(port)==*param)
> + return port;
> + }
> +
> + return PORT_NONE;
> +}
> +
> void intel_ddi_init(struct intel_display *display,
> const struct intel_bios_encoder_data *devdata)
> {
> @@ -5249,11 +5268,20 @@ void intel_ddi_init(struct intel_display *display,
> enum port port;
> enum phy phy;
> u32 ddi_buf_ctl;
> + enum port skip_tc_port_param;
>
> port = intel_bios_encoder_port(devdata);
> if (port == PORT_NONE)
> return;
>
> + skip_tc_port_param=get_skip_tc_port_param(display);
> +
> + if(port == skip_tc_port_param) {
> + drm_dbg_kms(display->drm,
> + "Skipping creation of Port %c due to the skip_tc_port parameter\n", port_name(port));
> + return;
> + }
> +
> if (!port_strap_detected(display, port)) {
> drm_dbg_kms(display->drm,
> "Port %c strap not detected\n", port_name(port));
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index ca0ef466b..2f516ca4e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -143,6 +143,10 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
> "(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
> "Default: -1");
>
> +intel_display_param_named_unsafe(skip_tc_port, charp, 0400,
> + "Skip the use of the specified Type-C port "
> + " (single letter in the range [A - I])");
> +
> __maybe_unused
> static void _param_print_bool(struct drm_printer *p, const char *driver_name,
> const char *name, bool val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index 5c5a1a135..6356438f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -51,6 +51,7 @@ struct drm_printer;
> param(bool, psr_safest_params, false, 0400) \
> param(bool, enable_psr2_sel_fetch, true, 0400) \
> param(int, enable_dmc_wl, -1, 0400) \
> + param(char *, skip_tc_port, NULL, 0400) \
> /*
> * Debugfs-only knob (per-device): no matching module_param is registered
> * in intel_display_params.c on purpose. Runtime-toggle via debugfs.
>
>
>
>
>
>
>
>
>
>

-- 
Jani Nikula, Intel
