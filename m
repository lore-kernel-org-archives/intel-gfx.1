Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A327B606A33A
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Pq8+Vuzk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98A112824;
	Fri, 30 Oct 2026 13:46:18 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29156112824
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2026 13:46:12 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-8451a619da7so526871a34.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ieee.org; s=google; t=1793367971; x=1793972771; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
 b=Pq8+VuzkL0ngvNVFy4TeQnUrAbJIuova2axhhfcb98FHFcG5mtivIAHn/VVklVs3Sz
 GLQpJor6tC80AyNRVpTXwohGz77XWbu8YsoKBuzCQoxrW/2u0BwYsaeF5XcXB56cYIf6
 v/Uax5Ou4au83KofCOmtd4AvxK5cEy+h8KfXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793367971; x=1793972771;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
 b=1oOxyc3+fGH5moNHFPo7dyMXnNj0/5WMwTSGK96lGwEQbQhVnaopHZEjLU3FX/M2/s
 DUL7cvrnRSOZjTj4DJMaE1yu5z3N446ZDW0vspEeL1DHKtKS8rf5NA0Br1N3KBheNkPQ
 BNX0JOUJyFq7mNBV+2oSBqdEVxgOOtaWQHoku5LnAdL0j6egAWJfxKouz/YF6SXVZTGX
 sXFpLaexZ3T1lYxFhosVf5uOUX22AuXwvA5gQVL+efFe15BOoCOPxhzdIqpnRZG+IysT
 E5Ul8y1UT9IFVIEv/FbPZPBcCvGq4oT1SsuSWUP7BqaTkg5G3MypA6IyGIv0hCVwGFR/
 iqpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzKtaddY/n0vs/wJy6Gk4CMjkPZ2eWmLSd7pT2c3UYh1Y5qDFzDC7ZOkJDOnQk+wLBnZcTMjpwW6M8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJs9YOBnL86JVlh+3lcctYeRFvKiHHAASdZzKI7vI15nYNpTIoD
 iSQNj2DdCQjPHYGG9hfGMhfpcKVYaFsJ+5XM5nhguRxZtw461/DJkbDZPEVF9vK5Eg==
X-Gm-Gg: AYBFou06cF9MLVFrxqR3LbBS63DyP+bo/ASGF35Z93ZPy0sqq4B0VvxnP6F/9OLeM7H
 M713tea37XJR3W+lDDAKx+5JEVxjcWhHrmcovlsNcadSRvEW6pq7BeD5NN5smXzUNs261w9dmmw
 hVgvwokK1vtHCWzyJatF3VbGmw6sYmnUnsSbSriQQ6IhAqKvVA4bxo3YYwvS69lVZScSiKJTZTO
 eRiOrFi6gQEEt/INCcgR7EgF0QlUV8eeXSHswCrcwYF8yEJs9xUHUQ5ZUzqEDk4TFb1Z+5lLMOC
 xKPJl4c9tlvy2V9xUk69r1GhRzFhsr/dYvkhAM9Utqv7Yvxap8xrawwNCQlkPNuzEhYto+pjzjZ
 33CnT2mx9NPq+elpuMks1fOw3w9+nvUxmwPkTaJpNXrsnZ2HESe+wdSw8yElxoMC6GtqUhenVjV
 z2GUh+nyNvZwdASm7oxuR0cMwmDW04IMNEpb9C0yZ/xSV9ycVlKYp0IQsvqKgTbB21lAaNctifp
 s/h+vY73oDjzHl+lZ/q9g4mNL+mvFsAQ7MRYzXVypbfVEJssBqeQdQ5g6xLWhlborrb7j9JzbGw
 q9r2Yv++FRHEMhqRx6+wpURu
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id
 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178; 
 Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex
