Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EEB606A31B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBUHhcuQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB7410E5C2;
	Tue, 20 Oct 2026 12:53:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3710E8FA
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 14:14:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D145439D7
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 14:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5234A1F000C6
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792419263;
 bh=z/uufzOKyhdC0SjTvaevqnoNwnyGbdyLeYjrkpbtR/E=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc;
 b=lBUHhcuQ1STY21Ac1q2PUTzl/4AVgeJXFxkITlHi37DiWe+2JlOfLrEsENA9BRdni
 N7hB2BPfsAIjthXNjNAV4zEXD9FGYlMbjOM69FIxSjF1JBoqeV8oYXJe5MXXeuhgug
 4nLLfvUTB9OfoI1OWwrHYOmD1/vo9oXS5eeUurPFHDK/aYA59zPiMyjSZFl1ydE6WU
 pDw+WQs2itn4ovf02s6pLG5moZR2IcnD2vmj1Dv+p7O+Q/i9DF467GjIuE4kxhUyfz
 TZlTYpNro3cdc9rSm+fxwqtAQRX/zqU8HcWJi9n5ia8FZ0T47nyjIECcMgf9+IjKqb
 OsMVWocR7bY0Q==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3ab3dd9681fso8524501fa.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 07:14:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwcAsFVVqh0ICjFwg0OOol217e/rkYnR6Z/LDt0MR74yUleQ72TCRVft8J+fQnW+hEVMlrKBCsGg6Q=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJvxlYuKSdhSDGdyhF9XaOZkOYQkQB370B1Mg4VLarUb0K0wkjT
 qSrf00tFRgJEHE9gXB5i37EYQ41G3l5dsvFVdBvK3MuV2EL4V7w68FfBH8hoq5ngw05ZUjCC/HW
 r/9BwXSvPZX8C9/7mZWMlfcyQrbkvtDHA2SZiGyTS+A==
X-Received: by 2002:a2e:b8d5:0:b0:3ab:2d6a:1a1c with SMTP id
 38308e7fff4ca-3ab2d6a1c38mr16436591fa.12.1792419262054; Mon, 19 Oct 2026
 07:14:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 10:14:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 10:14:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atX8mpg19_WkIa27@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-vlv-dsi-owned-gpios-v1-1-3ca18bcda670@gmail.com>
 <atXp2NSPKZUPj8sq@ashevche-desk.local>
 <CAL-Wm=O-Gr3CuvCn8iSQceQMhu=LGFz0SPhmWeFL=RiVnoprdw@mail.gmail.com>
 <atX8mpg19_WkIa27@ashevche-desk.local>
Date: Mon, 19 Oct 2026 10:14:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcrt8JVEUKLw+k_Duidi2Yuf=j61ViidR=aiUnjE5TZUQ@mail.gmail.com>
X-Gm-Features: AclHuK8c9Lee5KOPnjoOwLwBKEDawbnB4l1kQfS7VfHTiarAnxS_Er4MQ7HyRIQ
Message-ID: <CAMRc=Mcrt8JVEUKLw+k_Duidi2Yuf=j61ViidR=aiUnjE5TZUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dsi: Use owned panel/backlight GPIOs in VLV MIPI
 sequences
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Michael Anderson <mwwa919@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:43 +0000
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 13:18:50 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> +Cc: Bart (as GPIOLIB maintainer and author of the reset-gpio rework).
>
> On Mon, Oct 19, 2026 at 07:03:57AM -0400, Michael Anderson wrote:
>> Thanks for looking at this. I'd like to make sure I understand before
>> doing a v2.
>>
>> Here both users of pin 10 are i915 itself: intel_dsi_vbt_gpio_init()
>> takes it as the "backlight" enable GPIO (soc_panel_gpio_table,
>> PPS_BLC_SOC), and the VBT MIPI sequences on this tablet then toggle the
>> same pin as the panel reset (low in ASSERT_RESET, high-low-high in
>> DEASSERT_RESET). Do you mean describing pin 10 with a software-node
>> "reset-gpios" reference and having both paths go through
>> reset_control_*(), or something else?
>>
>> One concern: the VBT drives explicit pulses on the pin, and shared reset
>> controls are refcounted, so a pulse from one path wouldn't reach the line
>> while the other holds it deasserted. Would an exclusive reset obtained
>> once by i915 and used by both paths work instead, or am I missing how
>> reset-gpio handles this?
>
> But then it sounds like the request-by-demand?
> Bart, any ideas how to address this case?
>

Yeah. If you need a more complex sequence than what refcounted reset-gpio or
gpio-shared-proxy can provide (for instance a timed pulse) then you probably
need to look at implementing a power sequencer using drivers/power/sequencing/.

Bart
