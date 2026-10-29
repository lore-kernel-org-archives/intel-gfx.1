Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E762760A2622
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0KnBisL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6BE10EDB7;
	Mon,  2 Nov 2026 12:42:54 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0A610E1B5
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 21:32:00 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-97ca72f2cd9so25084241.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793309519; x=1793914319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2fppUUj5HcejdeVjTMNfb4aywjhpz3Hjgzr44FiZzlE=;
 b=D0KnBisLfcEPF+TtxIwpvMMBj7Pr0Ju9stVwSkE6D+K+vMn8B6Ezt9XHOZ4+qK4S3C
 4ogp9j4oqUyPEops1aTtqGOG0CrDXLg39TK5TGwgbXZLsWLrhXAEyejJff4WNNirHQ0V
 LJ+IQDoCzH5Y72lMlA6vZMK4ixETGFwGRazS/owWytQa93qZnCfdv6zGJfsaAC/mde2b
 fd/Jd98aYirVX3v9i5oPxGPOtEwz1VJrH5ZrlTGPmpZuk7O6Sp+ZrmPXZR6b0olE6Ags
 /dWaRqe+ywmug/sZncZ3EUJMcg2p+9vYy7muFgm5m9NNlGBLHDy/i4jNHWc9I4Lmhlk/
 kNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793309519; x=1793914319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2fppUUj5HcejdeVjTMNfb4aywjhpz3Hjgzr44FiZzlE=;
 b=Fryd0vZLqA+Bnh8o6CftwSfBjNJgUaDg+Oh6055oJ+pnZBe99tBIpMCAgJqDroVQaq
 SvU/qFyQqC/H01GCWxpxhxSGKOGnC1pHcHDRyIZzW4e+96qH7fnMCmLYZpWqtK91A33a
 bHbjKo1+9eci/0oPGQjI546JAq++3e4C70DpVVAZ7yiNjhxt2znRNLhxpZdQdHYAHzqA
 uLmq8aFT9XOtUIEVFmRrbbye9uuLr2a20lcypXHIxN4WPl7XqThv4FML50KpGnpF+Tno
 kBKt/7GuuWXS/FTYTiHLScqU16pzlvcS2uGa02/g+AXFyVwC23wx+xNLWxbc+YVsn0+x
 C5NQ==
X-Gm-Message-State: AFq9FYItKpe5KV8WfIw+blOyBRIn6Q4p9dCUTSRy0khxTlk2tGpZeuAA
 k24yxO83WusXlXhe7o8sKQSSfCbXX7YuiQz2roaeyFMcAKJ3tkushK/vVxuG3fC1
X-Gm-Gg: AYBFou0ybQz7xL2J8/DrQexn2W2gOgSOgTH2znSpAJYUHZbRGE7aJLr9+yn0xGQ+FQ4
 GLoZt9bxUvssGWDRFfvtosAqKYFYAw0a+Ohv4FoKCpA4F4SSC53N4Dws+rhoenKAR3MAZIDWPoF
 yvjJJNErdLvfwkR7FDIP2y4yaRlZEKU6reKY6tQKmSEVLiJH1ePFyCbNFb89FGF+W69KogFf/y8
 GGjmDZZqcgbleKreR4ybVcrOJ+toX+8ihSbl5EPAdRgzsTXSCRYB8pfvjfsE9HycpDA5mE+6gDN
 KqDo3NvQTpP0VO2tqb/fu0W/YACvpYYGIOIat9JtZeNb1Ec9b1OY9AD6NPvJiFFsNcdOFSjlj4N
 PTvsyG3TGvEqxjvlfLTH+KWotsmUtiO/gyTeov7nnB+QoMjI2JJieHqZtdFj9T9inoi176TuoY/
 ApYCyriAdYJlI2LdhPmnZRSOyUOHpN1rGs3h4x6b9a+wNoXUBBETcAyu4zKeGOviq/Szi0rLz8u
 C7T4YlJNcWBQDh1bsh3NVaRspnwGrPLK2uGj4kfTSgF5idgv1x60v0eSHqDGlmr7ZZoSR0mQfXV
 O3xWJzSg4dOnx2nnTEhVVSXb+10RjXT1Rfze+pB9g6pQ0ULoecvGZwxYQiuc5SbNACJdpwhKd9d
 Wxw==
X-Received: by 2002:a05:6102:f0b:b0:7d0:5688:f4fd with SMTP id
 ada2fe7eead31-7d0726c0897mr316589137.17.1793309518687; 
 Thu, 29 Oct 2026 14:31:58 -0700 (PDT)
Received: from localhost.localdomain ([190.13.90.101])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5ec69caeccdsm239589e0c.16.2026.10.29.14.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:31:58 -0700 (PDT)
From: Lucas Moreno <lucasgabmoreno@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, i915-ci-infra@lists.freedesktop.org,
 jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/bios: Fix reset sequence order on GLK VBTs with
 DEASSERT_RESET in INIT_OTP
Date: Thu, 29 Oct 2026 18:30:41 -0300
Message-ID: <20261029213041.6220-1-lucasgabmoreno@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
References: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:42:45 +0000
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
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A gentle ping on this one. CI has not run on the series because my
address is not on the allowlist (I also mailed i915-ci-infra about it
on Oct 26). Could someone with access to Patchwork please click
"retest" on series 176138, or let me know who I should ask?

I'm also happy to rework the patch, for example to limit it with a DMI
quirk for the D330 instead of applying it to all GLK, if that is the
preferred way. The issue it closes is
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13225

Thanks,
Lucas
