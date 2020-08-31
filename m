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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547C7C433E2
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2020 11:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5722098B
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2020 11:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2WuEbVx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5722098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BAE6E103;
	Mon, 31 Aug 2020 11:18:12 +0000 (UTC)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189976E0F4;
 Mon, 31 Aug 2020 11:18:11 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p9so2227375ejf.6;
 Mon, 31 Aug 2020 04:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2UbH7nyi0AzxoN4/HtEDtyeYbzdgvbboDc5iNNOozuA=;
 b=q2WuEbVxohARvB4Qoi9K1TlmUo3Tgr9p15PC50hyeczvRXO0i5nkPqtcDrhXfLq/hB
 GT/EhUKQXWE1iyuvndV1Cp0YwAETUznP2jnQHFDVLTQQcMknNVnQtYkTiRpaigMaBUH/
 rr9hfbpUgmW1xhaC1oP9L0Drb9fHj77gtwdL+zjK1uGxpplGsbqU4k+ykftDR97vYCoS
 YaSYswZO5dYYfBI7mcWglU/g6YWbRoO+OXdlBtb9e7F33dnqMG4QK1ZswNVT3FFVX/ZV
 C6J+P8WHY7YnaAc2d/JPES+3QSdz4yD28Eg1OyTzFAbZOux3v8ttPPBwDx+0UI1xoZ3p
 CNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2UbH7nyi0AzxoN4/HtEDtyeYbzdgvbboDc5iNNOozuA=;
 b=US2PXuIzFu/0IskIqFDqDJeNdpnxkzGzR9zNRbZezwJDEv0u5tnlWE+pI/S66hq9sy
 qswycGCp44VcS8NGybnlreaCLRRfWETtaR0op+CFWbxXdg4uzYKVNal+YiK/JdDo6Jn4
 HSkEYOeFaG2RFFwXWO1/0SPzhBXiDoM6JCfS1faPmUGtHILuRVdsNvUD2bArA7U0Pc+d
 SkS2LGO8lsHllP/d2yzZe0YetiFdeMw5Bcxz0l7CfU//7QC0kiuPfpDTGSblF1xrfMzE
 6UzwSzIe4IeLyUyNzVf3Jgwb1GhuFa9IWcz4glXLTYU0WWLeghuyCQ3BKUrjiE/rZq+7
 cyJw==
X-Gm-Message-State: AOAM531TvnlIxvw2/W8eDRrSubokXU6tKC0EFAZhooLTuQd0GOl0zaJC
 71Q1BIXIOpUKUtTqU9u2j1I=
X-Google-Smtp-Source: ABdhPJybJO3HGYkWU9kdY1Mxc+UjAiVH4EAhTo9VGUWfQXMQrFBgj/2Mff1SFpVi3mp1OVhiDj++cQ==
X-Received: by 2002:a17:906:7856:: with SMTP id
 p22mr643614ejm.262.1598872689810; 
 Mon, 31 Aug 2020 04:18:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id nh1sm3984880ejb.21.2020.08.31.04.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:18:08 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:18:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20200831111807.GL1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-14-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-14-hdegoede@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Subject: Re: [Intel-gfx] [PATCH v8 13/17] pwm: crc: Implement get_state()
 method
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
Content-Type: multipart/mixed; boundary="===============1035413256=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============1035413256==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Content-Disposition: inline


--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:49PM +0200, Hans de Goede wrote:
> Implement the pwm_ops.get_state() method to complete the support for the
> new atomic PWM API.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v6:
> - Rebase on 5.9-rc1
> - Use DIV_ROUND_UP_ULL because pwm_state.period and .duty_cycle are now u=
64
>=20
> Changes in v5:
> - Fix an indentation issue
>=20
> Changes in v4:
> - Use DIV_ROUND_UP when calculating the period and duty_cycle from the
>   controller's register values
>=20
> Changes in v3:
> - Add Andy's Reviewed-by tag
> - Remove extra whitespace to align some code after assignments (requested=
 by
>   Uwe Kleine-K=C3=B6nig)
> ---
>  drivers/pwm/pwm-crc.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M3G8ACgkQ3SOs138+
s6E/+BAAocda+M6anWstR2+VY/j/fIRJqp9Uutp3/NB5Evzr7HJoJNH5vvaX0CRu
XqzhdH7nr5WJwWuAXjWc9HLsWYOlVxD7cjQZp4mb/jDtO4p/JKjmY2x2lPoajMm7
CzjyPXwOg+WBW0xcaJmgfxJE8acB7wRWK9HeJ/yfUNiaya0/gR0iNcZfAfr+9SlZ
aXglvu1KK14kNRYZRgu+hZWooP1aPa330ldfzrh2nfV8lALUdpV0dbu4WhGrSudW
wevvN4Ss9tynApqlWTY0o8HikNnwttIbMGx7XZnkrOyTvFLrSuXHi1YHGMMUIycl
6rdsp0cdK9nrnxAFPZiYISgZAWEQPiDR//xTlSMCxbasYNAG+saK6EWM1chAW1vS
BLQPfD0aOxD9wngV8SV7AedZcUoRy224s5ko/NQWy/EYYgWg73ta24hNkX1GqUp/
2l66DbLyaFhGg3xTiUCk3E7yrFxbjgOrtpUhN6t9i6cPzDhJI8akbf2gS419EUjo
uKJvEUa4YJERUbWp2KQgoZnOyTFpv/7xIblyHsujcFJ/t7hxLLVV14yHs1iBu2k5
ZPmChGQaUO1eXAbCHThintTquvR+IvY+SeXceX1kCIe44JJYjm4nupX1gW33lLrl
nIQCrgA5W5YtASdRZIQ2hwCInbabfpv0TVSjdQKLvHasrC2MPqE=
=YZ0E
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--

--===============1035413256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1035413256==--
