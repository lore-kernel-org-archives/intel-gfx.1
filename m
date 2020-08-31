Return-Path: <SRS0=MyGl=CJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B893C433E2
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2020 11:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C895208CA
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2020 11:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoYWDyuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C895208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D51B89FE6;
	Mon, 31 Aug 2020 11:01:41 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B5089F33;
 Mon, 31 Aug 2020 11:01:40 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d26so7932164ejr.1;
 Mon, 31 Aug 2020 04:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BXz+peZRoN53mZjBhUHyzGxKbpfakmCobW+ek8D36sw=;
 b=YoYWDyuKxFsbuhe47h0zGeZJWMYREllqdMwLGPMm9dSkbGYZSYz+QGr7iiu0Gs0gtE
 34zbX8YmP4JWa39VzjK4yz+B412STc6DJ4C1gRTh4rKl+tLpoYAirftsWUjG1lV849YF
 wU0kXK+Ppn9VHSPfmCMlRiQb2CzGp88t+YBcFQyMYjxhGIQt8dGcS1TRkf8us0fUSxJQ
 CsU6IHKIsQ985D+pmoOa75LC/PwtCmYgauzlKhPzOtTiZzEQIkQZzcT/qZ1Sx+iosQ1t
 f+BORbiM6ZLW6IpXNRBHR52XD7iLHIikUc5QtmchQIjiDmnDmr2J3mtvjqmwbdFhnXVh
 aLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BXz+peZRoN53mZjBhUHyzGxKbpfakmCobW+ek8D36sw=;
 b=KaN+CagYJuQ54L2aBf1hcQi2G9rfyHenm47go4L1+FK8kYowsrYGPSzey63A6YIHSj
 YJpyfxtykvg6mE3XtItdE42kDLOP9xY4wb2O1KG3Eqw/IarNbX1F7I/z4V6+r1aeZo11
 1oMLhpE2WeLz8OXv18qZEnxraRbA3hI3IG2sLkcTTfPnPujSDEQU8vLFdfazm9gU3K1g
 apP6gYAXQYni4c4LCo/pOjirxdyZi6goRwEuEyHd5+Wg+4ipfGWxxi4+6KkgtvYTWDTn
 qoH61kjVFo6OkRJviQyFimap3t8OnzzczfIlbNvFWL1l7gHOzfhwbV3cH7cYr8zfIy+j
 7nSw==
X-Gm-Message-State: AOAM5335ZndnInqWRvifz+2QbK3O++XHMjLvF+W1iKWjuyqWM2M0hEBE
 Ndwnd+OjPEnNFFiFMCLTtiE=
X-Google-Smtp-Source: ABdhPJwc2sXXD2orqxDFSsb4FyIsXdymVcdkXoweoClyH+lABOlQyLYIk29IWwL/SHhX0erhFgbgGA==
X-Received: by 2002:a17:906:2352:: with SMTP id
 m18mr617431eja.214.1598871698647; 
 Mon, 31 Aug 2020 04:01:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id w7sm7837549ejy.4.2020.08.31.04.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:01:37 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:01:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20200831110136.GA1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-4-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-4-hdegoede@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Subject: Re: [Intel-gfx] [PATCH v8 03/17] pwm: lpss: Fix off by one error in
 base_unit math in pwm_lpss_prepare()
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============0392926518=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0392926518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:39PM +0200, Hans de Goede wrote:
> According to the data-sheet the way the PWM controller works is that
> each input clock-cycle the base_unit gets added to a N bit counter and
> that counter overflowing determines the PWM output frequency.
>=20
> So assuming e.g. a 16 bit counter this means that if base_unit is set to =
1,
> after 65535 input clock-cycles the counter has been increased from 0 to
> 65535 and it will overflow on the next cycle, so it will overflow after
> every 65536 clock cycles and thus the calculations done in
> pwm_lpss_prepare() should use 65536 and not 65535.
>=20
> This commit fixes this. Note this also aligns the calculations in
> pwm_lpss_prepare() with those in pwm_lpss_get_state().
>=20
> Note this effectively reverts commit 684309e5043e ("pwm: lpss: Avoid
> potential overflow of base_unit"). The next patch in this series really
> fixes the potential overflow of the base_unit value.
>=20
> Fixes: 684309e5043e ("pwm: lpss: Avoid potential overflow of base_unit")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Add Fixes tag
> - Add Reviewed-by: Andy Shevchenko tag
> ---
>  drivers/pwm/pwm-lpss.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M2I0ACgkQ3SOs138+
s6Hw2hAAqAqAOI9uH2Oa1iIBiZ7kl7dMlH4o44762/BfghrA3zUGN6pkdU81XXek
OzXbmvNQRdJQ9lfcnF+gIchRwyvSALGkKtLrumEl/A20WsXW/2u4ACfHybEZoG2X
pqN3Hr4N0dheBVY9s5L41LJy+MMNrb5y0uKdAAfolLdCzOOVBBYwmpmspzyJ4PDp
LAD+UvHNEv/UIAecUGhK4NQKxvIXbuVWK86WbTox29HvCH5iSr2AEfj2sJBpPWeh
hv6h3615nmmLAATD9iFhVO5ek15uNyrZuCNMV0GLmjBZZS4p84DlqEaxIvZD1QCk
2jbpFS6P16v5VFnQD1l3GAe9gvIMK8iqqwKbn3DKZ/v72TBjpBv5HdEvxyT96npb
Po6oET7Wx8erAqh/T4KPiVzLMnsbFJHOZk2bW5G1C7cBopZGrmIean9d+BhGBldr
qt4r8CY6Mvnx8Vqru5087KrMGCmHlgsNspZ/p77Z2v6/kVcCOZCQVME+hpAkX98Y
1qZIX5VFhuYnFgcCuR1ZzOEV0avpKJUbqQD/bBnJmWmqA20y1Hb0BAHg7Ny3+mVZ
fkf4aMuj+iWzMxnmMqgij8+5OrF5NpcX8x9z4tWgYCmmVw8f/fuu4vfCxEJKcYE9
ohTC5zGrJ9E8jm0PknM4q+Ea7XEAKE5Oc+Ut6DOLoeArxPExaSM=
=DtUS
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============0392926518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0392926518==--
