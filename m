Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63753C982D7
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 09:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F98D10E886;
	Fri, 18 Sep 2026 09:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="yEFx2K15";
	dkim-atps=neutral
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A375D10E85F
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 09:44:47 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso4220795e9.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1789724686; x=1790329486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NxqRIww7NIrKqp1UJVN5rENFvuSLlnJdUVreugmbr8A=;
 b=yEFx2K1552O1Nmm5NAoGWShNLF3VLKtMj9a8QN5z/3cQVgJ4pjXLaKyRWQX7CUXbJ4
 Ao0BYWh7q1vGJJJIzVdwPFhMyWCoRdb5DJbo8bF15hjKaHBfSF2UqBT1HtOwTe7LR+DW
 l5QogV8ccOfTsgKAQ9Ujlqe6WnsRUle7+5sulnQ3lsFLz7lyONU9XND65eGuXlOPVO2b
 GVJD5xJzGcb/u4bidwPDClQz5TYfYYPf7C9KneQLaFlqk7+Nn9BHnLnwIMwOFAvenDt5
 YCVL3tCUabtAr7t7KDUNHeY7/1pFN+2+FDgtaYSfKui+opXxv8+yBnCuWGl8f4rtuN2h
 vqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789724686; x=1790329486;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NxqRIww7NIrKqp1UJVN5rENFvuSLlnJdUVreugmbr8A=;
 b=CtvMb2qOoYll45Yw5HQQkqaBirTc2D0qrw9G08e4ne1Rk4ovK18+HRqMvgCkYo9dYp
 O0AdpfK586x50DaZCakteKL2PbAndbYG+cePLMyxPwF29X6PUyHQ6Yub41sSBaI29prh
 u7r+3UbWjdhV/+xzWTwGHHgIwz/4vQiiSPbyNKEoFStG9l/vaXLosXp259AaDdYAihf5
 L7dV/6KIgThbAqjopMQYsAFa97EcPyn7rA2yp165MmcPrHpiirAlBrDgc+D0ioZbcJzr
 I6/6U6dloeAHTF5dwZQMiCreMfQXNS0GkM24fnoNvjGqN8L3wJVG3S2VSNZeznFBv7If
 DOYQ==
X-Gm-Message-State: AFuF++kh5KckfrHAKC5+DG/MU+NUI1zP5cpPMheF4getM3W+rQHPJr3o
 1DFlkLjGR4r8AxtGMPo+fB6zpgBdRzsDfL8kkD67Ho66K4gjxZdwWb+U9Ws/CPtTJcY=
X-Gm-Gg: AYBFou2QVb92XCWt1wXQOUxUba13lmZQttsSFAEsnHtyk7xT1P8cX30L2dhgO0vUEEH
 tR2uCPdFfp+bB1OQT2CMmwUrWzTP0YqV4tIgfPYGNCfvINrdqJNzE8O3vAcyLBcemtfsPglZuZF
 zbQAfwgAf3sLe4PjpzGUKcNkhVydjnlQHOxfx5F2W2PkVvmLhcL/ewcquNBo8S/BVeQLJxKTWm/
 Ek7ZUrASMWhXzRYdvf/V1TKC0xa8JNaL6239ClaFHN/TsTnfSONR3pea3eQIRPNrBVUpX06bXvV
 QEGxhQDLwWxb8Rw2IgElxYVaNpwrCfKfF7pzI4e2tBV0Jw/djlxmyqA5zGbhPAljY+Si/XOpFI/
 zf3Fwa0LHkua7Rq1XpzWxm0c2gWtymqQQSSWu4yY9bRoLsjWlbbcGA9ik0wY4sSId8fYV+M+TC7
 qAjaFucAI45beZUQq6lJqczMc/Gth5k6rMsWrGiUwRmzFY1S1aqLohIeoP+DhW57/CIJN4DQUMu
 1LC90MFuqPHKPWIeuH/VwPsHQ==
X-Received: by 2002:a05:600c:4ed4:b0:49c:cee2:a508 with SMTP id
 5b1f17b1804b1-49fc5728f9amr20810345e9.16.1789724685392; 
 Fri, 18 Sep 2026 02:44:45 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc53b1b78sm31441865e9.3.2026.09.18.02.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 02:44:44 -0700 (PDT)
Message-ID: <4c94abcc-2f0f-4454-999f-38640972dfe2@ursulin.net>
Date: Fri, 18 Sep 2026 10:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] drm/i915: All fixes to make i915 work well with
 PREEMPT_RT.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260706114823.752313-1-dev@lankhorst.se>
 <20260706122026.IJAiyhhw@linutronix.de>
 <c4222f81-72b2-4eea-a900-da327f0df928@lankhorst.se>
 <20260709110200.2_5Eg8xF@linutronix.de>
 <a6c056ba-0847-4d2c-a7bd-39ac27eb15d5@lankhorst.se>
 <20260918083118.POmXtJuv@linutronix.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260918083118.POmXtJuv@linutronix.de>
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


On 18/09/2026 09:31, Sebastian Andrzej Siewior wrote:
> On 2026-07-09 13:36:57 [+0200], Maarten Lankhorst wrote:
>> Hey,
> Hi Maarten,
> 
>> Yeah the problem was similar, I believe neither check should exist,
>> instead the caller should give this information like the comment mentions.
> 
> Any update here? Maybe I have been left out on reposts. Any chance this
> gets in before the LTS of this year gets out?

Side question, there was a bunch of sashiko issues against v4 - have 
those been addressed?

As today it is the first time I see patch 7/7 which is a bit of a scary 
one. I have to ask how much does Intel commit to fixing out any 
potential breakage given the status of i915?

+ other maintainers FYI

Regards,

Tvrtko

