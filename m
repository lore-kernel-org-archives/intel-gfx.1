Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C31C982D7
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 10:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B045F10E514;
	Fri, 18 Sep 2026 10:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="mFkJfKuv";
	dkim-atps=neutral
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E996F10E514
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 10:00:12 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843f22dcb8so380330f8f.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1789725611; x=1790330411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pRqYG/Al7PnVmwpoxNcDNWD2piCTZsGxHrlmiBtExAI=;
 b=mFkJfKuv0zwx92PbsPbcrrUhmQovRzUaJXm71ApPw7kaQMcjax09ZZitKOaA+Cqws7
 w2ucRtGdi4WnBEjilxzu6WC4cNGsW5c0JlnxdN9eDwzw9WYEDjJyJcQ+FTh4DBlFJ1Qn
 v9pyBe3haWIEbJFXWbis0SjkmGwDcrpuCYTOZaDPeN777ss6ZKF8eiu0jY3xDpbTlubD
 b9tLAJYjlyr6fAUsSQyaPmMEWockV7Ghz12TmoVvESP9quH0B/iA5TcTwX2J7DnnR/jk
 mzx+P5A5ajgrn1yH12hAMmj3o00aEAxvA16mxKK8TBEA5UW/EDpDEcfSLu2C8TtTpiuI
 lAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789725611; x=1790330411;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pRqYG/Al7PnVmwpoxNcDNWD2piCTZsGxHrlmiBtExAI=;
 b=b/v3fwqnaWr1kFAH9pwTxWvgWUzoAvi0VmnuSUTeYm5EMsMzv2NGYk5e8GDzpuo8gC
 gCfnI1vMxXT0K5f5Kl0wH1zyGXiSIJdUPH6L2EX4V57C5VMNxzO+GqRlu7XYIGJ5rDkY
 QGvJURINJY01ttYUgc7fgHrG/w3y0eSk4WJqsDol66+x1CzgdhNr9Zxl7qmANeRa2hQX
 8NuSP3I0a2cluy4CadsJGnCpth2nz6JpIXYEFHAUIrZpgkm0zA4D6P1jRLxHcu2+fWT9
 1y8+AH8TBYhaE9OQdMxQAG3u6NnOnVOZei3YKL426pVonUg6UGYyrSkB8CFJFmBgtDGX
 nnRA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8MZZg/C4WBESpLGj8ZF0aplnpzKgWafmOXxbjTFxQzKi368rS3hQaaF51+/N+qVsEubXbIMeJY+4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lA5IboK98VG2CI0SnUQ2L+Dt0jk4xV4UVt44L0/tsg+65xDr9O
 BrQRFzLfpetQ3ctKK4bcD2NEa8dm+jp5l87BbxSu/yDhlmV5Hl0l65yw5Dk59CixjmXDF2Ovt2o
 YY+ChoHE=
X-Gm-Gg: AYBFou0Ouo8yJXz08G83Ua21ARbydYlJ7E5UJI3n1kX0OhwLQqtkd4vRZC6+/DABkc0
 5eNGIFL34p7RxzzArYB7VVwRbJp0Vk9A77iibC8qJoJPzMBcPrXIPDOkgqDA3NBxPq5ZCbZatmF
 cfokVyKlX13FjQSF/xqAvne08AHSXSOZEUHQPkVCjQNdOYGkLrZuz6lXq+p8nmwQmFxxKkMuVRF
 unWazvlXcejNFPtKkOVugB2ZB9a/TboDbtvg8XDlbGxfIldVAvNvrvm25EzGUCl/tMdM1c2eIdO
 yh16Du/WvG0zuFdCvFmptpY+aoOHGxJZZVxosHe56MzRmWU6Rptz/wKDgHaCB5EyRiSs+E3MSBW
 MH5Ns4qkSsRcHXkSDLPHp7oLBVmhmga17LQFm2pIZvSbG9qtwhl7Fi+L6Sc03jSVtOlB2LzS0yo
 BJtghTw/nd5J7LBrxdhXZ/SX+UoX6qAmoH0t/d3AajfBs/f7S66oQCVpJbPMWZRDa9dkon/NRRN
 U4iNwn68qaLdwM=
X-Received: by 2002:a05:6000:38a:b0:487:144:ee60 with SMTP id
 ffacd0b85a97d-4871e21fd4emr2172267f8f.19.1789725610656; 
 Fri, 18 Sep 2026 03:00:10 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487200829e1sm3145290f8f.34.2026.09.18.03.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 03:00:09 -0700 (PDT)
Message-ID: <a2f5019e-34bf-440f-aa42-facea35a2a41@ursulin.net>
Date: Fri, 18 Sep 2026 11:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/i915: Use sleeping selftests for igt_atomic on
 PREEMPT_RT
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20260706114823.752313-1-dev@lankhorst.se>
 <20260706114823.752313-7-dev@lankhorst.se>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260706114823.752313-7-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 06/07/2026 12:48, Maarten Lankhorst wrote:
> This makes the i915 selftests slightly happier, especially
> related to GPU reset.
> 
> I believe this may be a better approach than trying to convert
> uncore->lock to raw_spinlock

The commit message is a bit lacking because it is easy to make selftests 
happier if you remove most of the coverage. :(

Regards,

Tvrtko

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/i915/selftests/igt_atomic.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/igt_atomic.c b/drivers/gpu/drm/i915/selftests/igt_atomic.c
> index fb506b6990956..8ae39cf570b76 100644
> --- a/drivers/gpu/drm/i915/selftests/igt_atomic.c
> +++ b/drivers/gpu/drm/i915/selftests/igt_atomic.c
> @@ -39,7 +39,14 @@ static void __hardirq_end(void)
>   	local_irq_enable();
>   }
>   
> +static void __maybe_unused __nop(void)
> +{}
> +
>   const struct igt_atomic_section igt_atomic_phases[] = {
> +#if IS_ENABLED(CONFIG_PREEMPT_RT)
> +	{ "sleeping", __nop, __nop },
> +	{ },
> +#endif
>   	{ "preempt", __preempt_begin, __preempt_end },
>   	{ "softirq", __softirq_begin, __softirq_end },
>   	{ "hardirq", __hardirq_begin, __hardirq_end },

