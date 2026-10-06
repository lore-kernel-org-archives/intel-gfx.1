Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546ACCA5FFC
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2026 14:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3FF10F5F5;
	Wed,  7 Oct 2026 14:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H0sJ/KTU";
	dkim-atps=neutral
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579A410E3E9
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2026 22:14:21 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3a1981228f8so9249741fa.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 06 Oct 2026 15:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791324859; cv=none;
 d=google.com; s=arc-20260327;
 b=leykx97jVKorS715lJU6ITSeeF8eS610EH5OcOqEMaK/1kG4nEhisMzYohtJ9FJHJI
 lpaYdTw7y2ry0u6u1uZAF4wruLa3hwDSDtSnZZ1yVkNlRmM03/qGEJEeelJz0aR9svEe
 VmTI8XL4Kxd8KM3mkMrV2GyFaJQgbRa7UNBb8r/weODsvkIhE/xQ6TIfjXLdGMjtc2wc
 lE5YKQdGhLhDfVDJQOg/J+7T8rITMlkOk7ZnJIU4hBsxQLxETnuMEb2XGk4x5xCcJRW/
 5teDOQzCpPNe+CLMzOYTUU2gml5a6ag+IKjvwMNyup7Aa4iU7YJTvepgyrRVFT4L8BKN
 HsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
 fh=KIPc/yZkdw6Pp12kQ1QXMQxelEr/xSrlPjYo/1mAmd4=;
 b=F32jxKdAvMgrfMwooEavtqjNptkEvyESOH2C+f90oHPEI3wnb+02IY690N5bZTRtGH
 /li+QBijiV3roaHmwOGk0eVvT15AN/ErfyjjgJch4Zx50LoKgTqOncbZ1WngOIu0fOLR
 djqW5ppnAEO2T7I2BLVNglmEMYrmUYnpoIKn6cj+KZX/G6h3E7xQItCmHs3Hwnl8hvUt
 xJWMsVsovqJDRZjgprehjhWGQcNuM3X8VDcxcSVY9yN8d0+bCM7FCFUXG2kVF1Jyola7
 ieUbltAnmRRTnbg+fFFjZMhlEEMnu+ESlJBKi/BW20/z8SMn+4LTnSEGQMH01hJcZwOf
 95iQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791324859; x=1791929659; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
 b=H0sJ/KTUVwg/ILyiB3enmAoFbFguvrD+UYaZ4X+QOFULlPBT+Fk++TndkBb01RpzS+
 R2tCHpRZTIbKuy41uQhNzmoS/2A5Q4/MxLWVvkzxYFeKtzcOVfUApqF19YjSSXFUU2qE
 /gsZjmymUsOeGkfe1oKTFMBCxYpK+wKPt5cOo6fAD9bOPgH0iB592WCfW4q8SbnnZin6
 Qd17kQZplKSOp4BtAkRB1Gw2KmmnmxAoMf8h12Jpag0PmRnSlMsp5Icnk54WfZOmBUVm
 mEC9ye2Guy/7mxMb3qwNsWtME1227mxZvUoB7TX5EMF2arzgqHbXn8YwyGNH3ny8IDB8
 6tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791324859; x=1791929659;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
 b=qhHfy0ivkmTfwQTr4/DqfD2Ebm0qhlK4IAicpLTlG+rHl02swVnyL/BY2W2ul8iok+
 sOXDIzqu3iZF8gnftiSLSVm1sibXGYrcXivep1u7yfv5y9TPallq+cSpI2pGb7Jf+tS9
 8xEoio0key2zla7SBiSAZBwhwHl4X0mQgwZWXkqk0oF3BuHdh8+fm28PZy6t2J+NKCu3
 zf/HNmu6T4+cdnBmlGFJMnFrNEnTaLTXhbxKKaIo+CWbNLVCbiwIJLAXzG/ZcKosEL6I
 wkACTowkK2vU55tJWGER3oox48DK8xHJd36f9EFAEurqtLJOcj61ABYiqSkmtoLLyA7p
 eT0g==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4DKg3jIiuw37o0nvmRMMhw+CWWmfQFxonbkYggNgdQ9HqBiKp7EMcHKjGqbXFkodWHdXyz71Xyu0=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIsnQAGqoCEdQSaxk34ZxprlzdlahnGtJb75Rl90BBegucGTVlR
 sdQCuASg4hCfif5ZkmdQ7HFwssEllBTbmThzo7D1eydEEt7NkLxCTLHiBgFiHbHrNZofam66UEh
 R4RudTgoZulY7lHGadXuijKgXxRKIPnU=
X-Gm-Gg: AYBFou1YQWSfWKmrqYuKTwL4+PYnLBIEMBxu8vzRgp9gpFN4OP/kD838uQBEhfejP/n
 HRnHyWNbNp1cb1hRZDsF3+k4ZgjnZUG/AhVc3f1Joh/uc1/VRucRbGpIEr2ZqVKUMGMn9U/5tXx
 47pvA67x1LUpstljgWj6pVISZd0yGC6ofUIhxtQJzpK0VP7jvciTXiUPmQfgwEh3UcL3I5+dMuB
 tdBkbGaweJCPQse3heuvqDLdYSCrporH0lbQcQ+hwZrefBfiak0jYisg8Yxfav/ZJGaJGtEkEJQ
 aaxDMsRt9VRAgv1glE+dQEPYIYu0xe9/bgYyGM4nQB7+hyLxABDugQc=
X-Received: by 2002:a2e:be84:0:b0:3a9:7160:e83e with SMTP id
 38308e7fff4ca-3a9a2cc1e75mr696691fa.8.1791324858938; Tue, 06 Oct 2026
 15:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
 <5e03928e7817104f062e27f0b14d180549f209c2@intel.com>
In-Reply-To: <5e03928e7817104f062e27f0b14d180549f209c2@intel.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Tue, 6 Oct 2026 18:14:07 -0400
X-Gm-Features: AclHuK-H1P6XAfW5WOEyeLge3myteWvfLBr0lYFKR2exJpjCcMV3nLYXUK8SvaY
Message-ID: <CAGG=RgCoBZwks5CR9GK0+xk8kexj_wWZf23WwmSTLZBu1hW=eg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:06:25 +0000
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

Thank you for reviewing.

On Tue, 6 Oct 2026 at 03:41, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> IOW, you're not hitting the issue yourself? How did you find the issue?
> Did you use LLM to write the patch?

As part of security research, I am reviewing how virtualization code manages
the lifetime of resources it shares with guests and devices.

> Did you use LLM to write the patch?

While preparing this patch, I asked an AI assistant questions to confirm my
understanding of how the driver works. So technically yes, an LLM was used
in making this patch. I should have disclosed this in the submission; v2 will
carry it.
