Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC9DD73E89
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jan 2026 20:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA45F10E8CB;
	Thu, 29 Jan 2026 20:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="USNDVzpi";
	dkim-atps=neutral
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2805710E7C5
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jan 2026 04:38:09 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c0c24d0f4ceso195968a12.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 20:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769661488; x=1770266288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtQGOuC29uzt/6xaJHUti83+eOwCdLjkcvzsqNsGu6w=;
 b=USNDVzpi/NMuc4WTVKvX34yX6KxaKMPv456dt/vyTHVVT6nxo2XrrHGxCWLNjxAbRi
 lYqExVzkvjtk74tLsUMlF8c7Mi1vpuMHsTQ9I08zXjvkLol+2bLL0fUtbEVPNqTvXadF
 Hg2Hw8suq+WKq9UtgbJi1O1YYXR2iayZ6xxrQ5SeFso7bsoOcJ3b1o/j3Xj8iXDBj+mB
 uUXX0FK1vC8WAT3xtorZoJ9skrv66i4Fua0AiWZQFYxLC7gCNLTeDQjp2UKnN2HEo47v
 U3maa+ySJV5yNzK93F4pDjilJi2csYHEFBlKWzyXP/TD90nDyQdF7Mn+3L0/MtAJANfu
 fJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769661488; x=1770266288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NtQGOuC29uzt/6xaJHUti83+eOwCdLjkcvzsqNsGu6w=;
 b=KjbCkIjAI4rO7WOnebYGBqj6Sf8VDWtqnAPBrN498KaXuSuTYftleZVNti24V+n/D+
 GPuHe4MIuPYOGCmJaViBj2J7+rVitzPb/1BTCdbNQ8H4JtkskD10BiW9ZRu+sMx3mU/x
 EHSbglxvYwvbxU+tmgsWr7dmFzEICXiDNZ49Uju1kHpHr0kpO0Cj0CBYkzKEw0hxYCS5
 hoJ9zM3EkzcI+RfNxYOBEyUliZ49N4XBFKUfvV1SseF3j+EouIqWgr1RyCAQ2xmqE7fV
 lizZEWCXxwoIJI26ENZQLc+GktqsZU7ykMxleRLSzMMCfrD4G62zuFQ6XJE22Tq61Wa5
 caVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGzoRjPZDdhXep7lwV+tZHaZdpW5sK+yT9LIcTANiRhFRTO/bYa95Isw8PhFeT1ZrB9b3B+ADaElQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5Scz9WlVzQbmFEnEWsMIPdZIHZNmArk/zGa8U49PO4D4MRY71
 UqQvgQ8L/NHVQeoYW3BsjqZ+qAxSrLd1vbDh/WwSWIbJpBT7MVmO66Q=
X-Gm-Gg: AZuq6aKcGk5KBncQeKO8agPVp2z7kzd6nmHmdLDCaURYdbE1ciGRx0ukicw4DCK7JdQ
 jMmdVp0hnHRS4X9cT6+2epFKwq5Tn6bvEDV3+nRckemTPzsFb882tDBNaD8R20UwegQ8up0OB0V
 GUUL8oN4aPbY6zcbFnQ+v1IhFPUr88+eiN62DVEsJTJyCkjcAogU+Ud94VIerSPEklAGW/QoK6u
 6NhkR3T9MYilkKNzUNvzj4cAvD7V0EIIGHDVgfapxHAJ51mPX5XTX13CIPG0myhmpDL1eY+DOB9
 R8DLPAUFx0gTca6rKBTRuesCQridOIdet+0PGWntY+GKXxNclG2Y328RZOmC3rmHgQzj9Na+14U
 cpeeTCpOtcnoWSPIKXT8e1YyAimaHxrmdvqKUrTtni5k5sOpKYp5oMbe1XkIS/cgRnh58rAQKBx
 cw+fb0CWVGascR
X-Received: by 2002:a05:6a20:2d26:b0:38b:e430:156f with SMTP id
 adf61e73a8af0-38ec62c6411mr6930473637.20.1769661488418; 
 Wed, 28 Jan 2026 20:38:08 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6427e9ce21sm3595710a12.10.2026.01.28.20.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:38:08 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Thu, 29 Jan 2026 04:37:59 +0000
Message-ID: <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXovFQsk-w90wZi1@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 20:47:43 +0000
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

> As discussed previously, your patch will regress older MacBook Airs
> which use SPI to access keyboard + trackpad if the set_os protocol
> is invoked:
> 
> https://lore.kernel.org/all/ZoJPgSlZJ3ZlU2zL@wunner.de/
> 
> The last time this topic came up, I suggested counting the number of
> GPUs instead of using the DMI quirk.  I even provided a patch but
> nobody with an eGPU bothered to test it, so the thread fizzled out:
> 
> https://lore.kernel.org/all/Z6paeFrjdv7L3mtv@wunner.de/
> 
> Maybe you could give it a spin and verify if it fixes the issue for you?

I tested your patch, and well it works (you still need the 2nd patch to 
avoid a blank screen), but i can see how this will fail
like for example, with the iMacPro (only has dGPU) you would need 2 eGPUs
to turn on apple-set-os.

My opinion is, we disable apple-set-os using a dmi check on the 2013/2014
MacbookAir models.
