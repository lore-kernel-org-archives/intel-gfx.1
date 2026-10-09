Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3638CA601D
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Oct 2026 15:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644FA10E44E;
	Fri,  9 Oct 2026 15:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="pd2yIqvp";
	dkim-atps=neutral
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1610FE53
 for <intel-gfx@lists.freedesktop.org>; Fri,  9 Oct 2026 03:47:19 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-91957ec418cso46999206d6.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 08 Oct 2026 20:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791517638;
 x=1792122438; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w8+DFfkUUomz+a1TzB5f0ADCXUizRfgZPO9NzdXJlRI=;
 b=pd2yIqvprHVC3YRztd3UvuB8i/EUsLxUNpYYYFo6Zr5sljubPkO3Efxk2DHjkIKCOm
 rz4HcRyScxaMXMP7M5V0S23Wpz+uaDkdnTZFWVmTaYJLtntDgVpsmVHabWbpEOx0ZnRt
 V7yx/4p1IeO5oNJWZ4appxM+MOAcpl/QJqzxfoiDpm5JKyY7xayoM0otUW1Z0l3FcscP
 ZO+SHTocRlytYZR/w7vPQtLpFeKWOvHspD3FiPSnwD/EthMYlLbLVJYHt9/nShZib7LN
 7yd443GnFCNJaVruzTd2Ajr1G0AsZr4iq+iUvOILoO62B9ObklgkA0Htp/0xgVR9zsOm
 xMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791517638; x=1792122438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w8+DFfkUUomz+a1TzB5f0ADCXUizRfgZPO9NzdXJlRI=;
 b=nAvOxqYRCt/xmZh63TmyHKV88nH5AOka2bOYnACvy2RdmtsYbNjrlA3nzCbBHlBPMe
 ujXR15VqUvFpoAspOO1WTf/CG1iVv7hicR5Ohy23SLkQHYZLFxkJQ8sL9cVmABOH9Peo
 7lfrwMrmjHCFjwKr7r3uNJrGsWbBuG9zsrmFrhKSeLpEwNYgN8fXpYk38IWzeF70MBCI
 lyc22dx1HJ65VbXGYfKyne9GX5+xpOn7XofliOjd1SGfmaniLP7e0mxHk6Lwr/8qRmra
 tjbM3zewBfwrC+1mEAJUq+o74Hm7BdD1hrcTJE7V23RTNW9ejkMeuVCYN9WJ17S1resa
 Uy1g==
X-Gm-Message-State: AFq9FYI6eb6ECoxkdGiPKsyA1UMubZolNTEhkdRgRyv2QA98JOtH86se
 GsFWOy3JD0b9r8hwF+hmH0l4bOkYCOOXeyUHSPEwjK1QMdsJ0zAmM8LEDRht5Il9G+E=
X-Gm-Gg: AYBFou1bitQgjwoUFVc9jxNqa8Moi1vA7VHN16xlp2KOGaRVoi7m81zzwaLqXy6zfyZ
 +Wy0A99QOoyvV7YJRMe+l1LawDF3HqpDmV6CgxT16o3roCPdpc2hcK8M4muEPEjv2wP5rIBdDlf
 qXetAKvRaxmEFtneQ3q48J6M1XGt3sLhtWe1gEFYjln4TxVWjoKwBYNoyVyX7wu/1WO/Pj//8xk
 H9tCVfCGOwEaZgoqjYE1goaph460oZHonnSwmgrFUZjmX5fljoCLPJp62xJs3nK+IczjpKt4FfW
 7tQUsrbbC2LGPgrJS9OuK8dQX3vOdEl6aCUEefyrdf8UclewjNWpCyWRnShuvqUKCRDtgpA3aC3
 tZDe2SU+hVDDTogpICishfAYHUL0GqzBRDbfHTRmxlpxoUblLoleKmpIMQCkw5IIJ3nfLdbHBSX
 dXsqf2Zo9x0cwIr8UEL7F8CHzu6KxkaKTE5f6TvSOZWuBdu7BxKFXkOKZftbP7KuQtMZtWL00Nx
 FxkFS9zwDPCem1/dvwpB2i6/aD2dHVKVIGA392JDdTI5uHdRJluiF4y6Pny5nq5rJ/8GZeBBHJ1
 mGQwgEEhQ3Svsy+YjdCFR4Q/LCZiLDpHT7AR2XCXqrHvjcT2Y3tB872n0p/NDFb0/eTlCA==
X-Received: by 2002:ad4:5c69:0:b0:917:9905:cd03 with SMTP id
 6a1803df08f44-91b554f036fmr11991716d6.20.1791517638110; 
 Thu, 08 Oct 2026 20:47:18 -0700 (PDT)
Received: from jake-laptop ([74.244.125.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b54e80344sm7934976d6.7.2026.10.08.20.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 20:47:17 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Thu,  8 Oct 2026 23:47:15 -0400
Message-ID: <20261009034715.10894-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Oct 2026 15:32:11 +0000
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

Tested on the XPS 16 DA16260 (PTL, xe, 7.3-rc5, DA16260 PR quirk
removed, no other changes): Panel Replay SU is smooth with this patch.

Tested-by: Jake Steinman <j@metarealtyinc.ca>

Two things it leaves:

- The panel still judders for a few seconds after panel power-on
  (DPMS on). Holding PR inactive after power-on fixes that here; 8 s
  is clean, 3 s is not quite enough.

- No DC5 on a static screen while PR is active: 0 entries against 550
  on a static VT with the AS SDP suspended.

Since this panel needs a specific change for the first one anyway,
could the AS SDP also be suspended while vblank is disabled on panels
that handle it, as in the RFC? That keeps DC5/DC6 on a static screen.
https://lore.kernel.org/r/20261006220500.3417572-1-j@metarealtyinc.ca

If you respin, a Reported-by would be appreciated.

Thanks,
Jake
