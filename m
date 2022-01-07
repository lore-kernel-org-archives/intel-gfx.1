Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE00AC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Jan 2022 17:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236F10EB9F;
	Fri,  7 Jan 2022 17:29:34 +0000 (UTC)
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1037D10EBC6
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Jan 2022 17:29:33 +0000 (UTC)
Date: Fri, 07 Jan 2022 17:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1641576570;
 bh=UiTlyBo9UuvfhzocANog0JAKgTNkVZpUBxSayY9p2tE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=GAauKnGMTyEXiFfCB/6NXgNZXkVYvCukP7KR+50OnPx0xmNzSXyo70fbab5XGx6ZX
 gxwDRNAQZl9tweSDOfxQYGN6bI04/u4vrJnFk82UsvYYqXRO/k8m/iDjdGLdg7NZik
 TIJIbiDbKhZNgLv+B9Q+TLr3wEhHERsQfW3M3o7MGD4PV+yxYYcFeVLObLQDXSwLUD
 Hi9TLYSZHMPMDEsiaQaJvLvn9TghvS2bW6mGvCT3eO8lYzkZm/0C9iCCZlG/V1TpXL
 kIRWEKbpaC/u4T1xHlFwYdVi2WAZ7xmbKAT2NXUCwZTVeHnr6vqpD4XPBwKrDrMQRW
 /rdLFvZ8Hiz2w==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <zTX9uSmiLpHhH2VG6QBEkyfzqLTLylulwnf54f-fsx7Qp-ePGWW9gJJm-whTbo35o0TKd_hzV_f5Ir977j0A_sMeXCXZ8nofLNV6Q9Rzwwc=@emersion.fr>
In-Reply-To: <20220107172601.GA122757@elementary>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
 <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
 <20220107172601.GA122757@elementary>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v3 2/6] drm/plane: Fix typo in
 format_mod_supported documentation
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com, stefan@agner.ch,
 benjamin.gaignard@linaro.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marex@denx.de, linux-imx@nxp.com,
 intel-gfx@lists.freedesktop.org, s.hauer@pengutronix.de, mripard@kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Friday, January 7th, 2022 at 18:26, Jos=C3=A9 Exp=C3=B3sito <jose.exposi=
to89@gmail.com> wrote:

> Is there something that needs to improve in the other 4 patches?
> Or just waiting on maintainers input?

Yeah, these patches look good to me. Feel free to add my R-b.

Maintainers for these drivers still need to review/ack/apply them.
