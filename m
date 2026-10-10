Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08E6CA9EC5
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2026 14:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA9A10E5F0;
	Mon, 12 Oct 2026 14:37:51 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A1610E9D1
 for <intel-gfx@lists.freedesktop.org>; Sat, 10 Oct 2026 05:18:47 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-533797e72e8so2011581cf.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 09 Oct 2026 22:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791609526;
 x=1792214326; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O16bXHFucTMEeNKlXKDYTMjJw1owaYurkTBLl5Gsiz8=;
 b=HTyFnXXhuwU/Ny8a9iH+Ss58aTjKAaaodRZCHquY/P2Hs/tXWvLQfP/ha81VT5zyYi
 XsQ9QW1iDu7oVcM89vZHqV2mP6+v4A7oPKsWf3tFggqmxUnLILrss2bMKqQ801nWhoJA
 BblMfM/5HsmkymDz0ZwqDIoilpUk0mAJsKSUoKgOoFfeOtS/NIHh2Meqa3HVx12m9WGG
 owll0T4rRjuTP0LOJsYBcw7SDnqoiXlA9Q6dN0A1i62Fa/FWJA4mV5o9ob3fQ/zbqPEF
 /D3FaQq9qLqDCfiM6vnaFgyTezRlmmE5RgNBwLYwUlS1v8WkdKDjaQCHClhHQ3coxodz
 IRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791609526; x=1792214326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O16bXHFucTMEeNKlXKDYTMjJw1owaYurkTBLl5Gsiz8=;
 b=GqrDOUG2GrNkNrURy0AcobTuPtvpvYd+ljjy3XGG0ElYH0+VQKSg00196K2FZJIt3i
 PfEaiQsfssxvsaa/PE6LI4nSBo/aBvX140ST2rK5bvZxc3IhNw+WCBs0xhMVPbZGr92I
 gz+HuB+ECZwZxxAu/XZg7RshRIkW6pNUrB2ssRG3wapl3Di7QYf43ktT5Qu1ceIKMBUe
 wmawct9r6CI6HaEZrSrCRjIl0l0mxkhx89OsPUg5uwtgtLYOIini78cmpKuYQwp7e4FN
 Qm2mlzusJ/ueYPwfg+WcevdqDFxP8ROC2FKyT8frUA9vhrUPCCAhr4alFFgm9YL4t5gO
 mAdg==
X-Gm-Message-State: AFq9FYLC4q0OIN3wywOYPMiCDerJ5kZAFfPNvwl1J869cHBdEWBC+o8b
 9UIP3zO4364MmolLVK87X53ykR2H/HBnvwD7YF7zCw12JJZqi4DhGtfNn/RLJ6HsWjo=
X-Gm-Gg: AYBFou0m+Spy7Ja6hbnZsy2ubXHXnmmuCCutzev1MAywXvXj/OfeCdFVpl/HWBl4TJt
 nMEDb4D7+HLyrEqy7kC1YDILO2lvAToPPPQ80qLZO9qdUzhuoSPQv+zXvXLykgY+qx8TC1ZKHeG
 RoZ9ZtuxQYnCWXKMUYaLdgbXA8ZtHw+qB6q52VR0O7gDP1rs5omvwR49HcdX7j3qrhIp0czG6x4
 sQK0H+peIUP1qc4n7p8/BMAQKg5BVSP5dsi4ZcDYeyZnvkbw6R4aIp/Fr9mby3+fad4A4zNdQf4
 by4F9ApvFoaws6T9XHXka+/AefhPNHa2cS2b+H+W016aWr2eiXoa4YjK/c/UlONtr2wQgwOenaV
 aTSN0WGAwtuwP6oUSb5J7kNu4cwxvyLitcyOgebvByBOYjZ6tokMuwCx+LEDVY4WSpVmnGIteI7
 Cd/yj+YMgrDZk2nBOpbPnp+ZELE05aXeyONvK4u61zbweIKPZ+thAOQWsesIx9wghT1V8EeptRr
 ZS53Yj9gsIxR358X7PKF8eJUA/5cJmaLFyOmYATqWcxHBcI6UANKs544TXr+uXEQvEB0DohGHeO
 EM6AuYLVEX21kwrb87ZPkXNaD1gfpzcEieJssGKJEif72mP+vFlGeHZLpNiaUf7U+ClP
X-Received: by 2002:a05:622a:1f91:b0:532:d202:328e with SMTP id
 d75a77b69052e-5359fb85a92mr68279931cf.55.1791609526381; 
 Fri, 09 Oct 2026 22:18:46 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b5501859fsm36031116d6.16.2026.10.09.22.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 22:18:45 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Sat, 10 Oct 2026 01:18:44 -0400
Message-ID: <20261010051844.11094-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009175251.2097777-1-j@metarealtyinc.ca>
References: <20261009175251.2097777-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:37:50 +0000
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

Hi Jouni,

Retested with 0x107 bit 6 set (my 0x107 patch dropped, 0x107 reads
0xc0), 7.3-rc5, XPS 16 DA16260:

- With the RFC (AS SDP on in PR Active while vblank is enabled):
  smooth, including after screen off/on.

- Same build with the RFC behaviour switched off at runtime, so the
  AS SDP stays off for all of PR Active (PR_ALPM_CTL 0x11): judder
  immediately after one lid close/open, and it does not recover.
  Switching the AS SDP back on clears it at once.

So bit 6 set is fine here, but this panel still needs the AS SDP
while frames are updating.

The judder after panel power-on that I reported earlier came from my
0x107 patch. With bit 6 set and the RFC, five screen off/on cycles in
a row were clean from the first frame, with no hold of PR after
power-on.

That leaves the RFC as the only change this panel needs, and it keeps
DC5/DC6 on a static screen. Unless you have a better signal than
vblank, I would like to go with it. I can send it as a proper patch
on top of yours, or you can fold it into yours, whichever you prefer.

Happy Thanksgiving,
Jake
