Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3B7C624D3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 13:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6A10F1E1;
	Wed,  2 Sep 2026 13:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R0smeIz6";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED3B10E474
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 06:52:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-495437bb891so4948665e9.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 01 Sep 2026 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788331946; x=1788936746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xn4PAkw0tahIVVTtwzVrKulou125O66ZpuD5FdtR8Zg=;
 b=R0smeIz6KqtMseP2T/k2FDr0pwg2x4pow9JK8FUQSQxvMjP0gnS1PpqXhOESX5k96G
 ympm7JsH3YpZjKRHd2JFG2WgcQF5/NGYO1v5FMA8eOonZOfACn1zTX6WFi4CVD0Bvovh
 n+DLUEZgndwsvuSEVtoZQGsklXE2bZRrVp2cSrc9UYFh49sn9lIaJSGuDWO+OkJ/oQ2A
 nVQUKpXmRdFlzJs7gk/OM/vX2qUMEJyzwcRnWEvuRDOv/oYOA4ylT3Scqvc5c1qpQSv3
 7rd6NsEu4jDUmqBLEse/ofXgTX7QSXq4rUjRPfxDTCl+puL/BrifcvEXde32jAyMf58k
 Wt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788331946; x=1788936746;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xn4PAkw0tahIVVTtwzVrKulou125O66ZpuD5FdtR8Zg=;
 b=sQIWL/CnuYfp73bTm80EcLCpfZ+1ADehFBw9usSx0cMSTkJClDzuE48p1nV3c2/Klf
 xS+dCU35B24ZAagyV4T+8iz30GJdyoxhEo79iUSVesPhC+ssx3FEnUC1XVuEvCnytQ6Y
 WmbUdjmaR7zRad8cjjlEwgsJlD/G9noAj6Ui4/gRRjcNQULPAN08V0+JrMraMIJNqxFw
 b4DobxcuZhbL2acxdhWO9LBCqCLdnLkwIqlDlas7pCzAGBwFOWDFGzlMZGxGl9AVcH2y
 iv0Gb7+EMbSiGHmQGl8CnZTHpH1x4ZHVz85sIxgRxTjUejf4WeyLTQAu+bIechYUgC19
 bPPg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrn29YSFF+wOLczuVmntTiE/hC0WmcUrMU/IJwDuIA9NxNWf/pqoFe08S/jKj5GwpBzY0xIiHwleJQ=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mDqJytJksvDqFtJg79kP1rM/D27yTZnBiZis+4LuuU/+BfFaQr
 R/2E4msU4lVBWBe/3OCELBgVZFHKHxGUVh/CeGqN5QsGSt9kU+KZqQtt
X-Gm-Gg: AR+sD11yxPQM4yb76LvXWCBrUe900ZwDj0lHFxJ9Ocmg1N9+qFqDOOY1JK51S84dHcV
 KM23Am+dJW+zcPgS9HHrdt/R65hXFbHX3sIMLZCvYqgL2KrJqGOLzLHxa/ZMYTDy61Q2dHPwhlj
 Sp01kH0tDeXdlcJztfoU+R9mFsFLenyfTcG6kl0F9b1hRqrB16ka1lve++9ZtWGfCU73vDXF2dU
 VPqZWA9aYzc0RvaXeYNscDSooDXcZNgQK7TQbAEOe5C26seGTvmNN+a7QuzDfp0a5JiBZreI+V8
 7rabTkE8UetRnQnZFDx1nAw1E/6vxuFqeERZqDoF596Zw3LaLm+7jXt8ov6x0dv4F/QL5mBxEVa
 lh0r51HcOdRTWtvdvdrtFnWRVEqYrP40c6u/zkJRtEFTNH/FEaKcxs/iRqyki3x+lgkbhBlj0Ep
 oq233odiy7TIHwnNrUx5w3iIZpOK4ijbsIJVpMB6qXj7FLqsgcLciUBUNFxFgPPtsDksWjxrCP1
 Q==
X-Received: by 2002:a05:600c:3f0b:b0:49c:ced9:ab7f with SMTP id
 5b1f17b1804b1-49ce7c316aemr13532185e9.8.1788331945999; 
 Tue, 01 Sep 2026 23:52:25 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10148sm123486195e9.5.2026.09.01.23.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:52:25 -0700 (PDT)
Message-ID: <3cd2c640-3ce8-4163-9f7b-3abba46ae072@gmail.com>
Date: Wed, 2 Sep 2026 09:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <apbbvQSfUbzYRFaw@sirena.org.uk>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <apbbvQSfUbzYRFaw@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Sep 2026 13:10:12 +0000
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



On 1.09.26 г. 17:05 ч., Mark Brown wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
>    408 |         ad->card = card;
>        |         ~~  ^
> 
> Caused by commit
> 
>     699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI codec)
> 
> I have used the tree from next-20260831 instead.

This seems to be due to an interaction between two patches:
1. 9af2c1d4f847 (ASoC: ti: omap-hdmi: remove unused *card) / 
875e906efdc4 (ASoC: ti: preparation for Card capsuling)
2. 699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI 
codec)

Both (1) patches are in the tree and remove the 'card' member from 
struct hdmi_audio_data, while (2) was already in transit. Patch (2) only 
reorders the existing ad->card = card assignment, so it still contains 
that reference:

+	ad->card = card;
+
+	snd_soc_card_set_drvdata(card, ad);
  	ret = devm_snd_soc_register_card(dev, card);
  	if (ret) {
  		dev_err(dev, "snd_soc_register_card failed (%d)\n", ret);
  		return ret;
  	}

-	ad->card = card;
-	snd_soc_card_set_drvdata(card, ad);
-
  	dev_set_drvdata(dev, ad);

