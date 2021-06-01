Return-Path: <SRS0=8ese=K3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213A5C47080
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 16:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7586610A8
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7586610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5429E6EABA;
	Tue,  1 Jun 2021 16:50:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B326EABA
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Jun 2021 16:50:38 +0000 (UTC)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <marco.trevisan@canonical.com>) id 1lo7bA-0003TO-0u
 for intel-gfx@lists.freedesktop.org; Tue, 01 Jun 2021 16:50:36 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 128-20020a1c04860000b0290196f3c0a927so1290880wme.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 01 Jun 2021 09:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=iTrKi3oqRMBuOtiLPrLLphRsYza82qg3+M0S5I+h4is=;
 b=Uc0FHp+cyzyDLjyMzElQw6G2EUbv17sV7ViWh/6J2LlNeIOfqRvpXqft6o8SfZzB6/
 FdqJgGZ4zTZKK3TvfV2IVMJZV5spE9yuecOnIf2FaRpBNPzPaON2g+G3ro26bEyfrwFz
 zx5QocrUdPBHnNLm7m8lT4Q0Yr9Smp6pCND7VMp3KGC9G9oa/31u+YA7Il4m/OXrKpEE
 kyqsArrJA1nBop/xNS7Y/zAROAvLeQLWjy8vBsITPb5KHv+H4dSpe+PR/T3sodisFW8c
 SoXyyCgRlv7c7RSlQKKTMyZhYHUWzwHaQQCHkWCCyK8CreUCDlgARLArL2KQOr3paEcC
 anXg==
X-Gm-Message-State: AOAM530wTLfwSbenM8JR0bs7P/luKiYhr+hAaVpBK4eC2Jo7wMyz8EmW
 s8Dk+kcZdl0+xh9ErW+HhOsWgmb3nmXD5lZaPGFGO9LawWx/RpolJRJFF7FA/+hf8izsks07Rud
 O95XyqbE3pZHHCLC4co82ms/MUXdv1E57WBH6Rq2jSGyYow==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr871797wmg.36.1622566235789; 
 Tue, 01 Jun 2021 09:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygCvzkOOEdkehhNOGbTNUEUrWeb4BZSr7fwfbIpmPYmZOqAJBI2SD1NKf+9uEpdefvnRVcQA==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr871784wmg.36.1622566235628; 
 Tue, 01 Jun 2021 09:50:35 -0700 (PDT)
Received: from tricky (84.127.144.65.dyn.user.ono.com. [84.127.144.65])
 by smtp.gmail.com with ESMTPSA id t4sm2270986wru.53.2021.06.01.09.50.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Jun 2021 09:50:35 -0700 (PDT)
Date: Tue, 1 Jun 2021 18:50:33 +0200
From: Marco Trevisan <marco.trevisan@canonical.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Message-ID: <ADF0C848-D7E9-4AC8-AFFD-0A717418B011@getmailspring.com>
In-Reply-To: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
References: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Subject: Re: [Intel-gfx] [PATCH v2 2/9] drm: Add privacy-screen class (v2)
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Mark Gross <mgross@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 "=?utf-8?Q?platform-driver-x86=40vger.kernel.org?="
 <platform-driver-x86@vger.kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mark Pearson <markpearson@lenovo.com>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Emil,

On giu 1 2021, at 5:31 pm, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> Hi Hans,
> 
> What happened with this series, did it fall through the cracks?

It's mostly waiting me to finish to propose the changes to GNOME,
unfortunately I've been busy in the past weeks with downstream work, so
I couldn't finish it, but I hope I can be back at it soon.

Cheers

> 
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> 
>> +#include "drm_internal.h"
> 
> I think we don't need this include, do we?
> 
> 
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_consumer.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto
> 
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_driver.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto
> 
> I like how you avoided leaking any DRM details within the new code,
> modulo the includes above. With above tweaks, the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> Theoretically one could also remove the `depends on DRM` from patch
> 8/9 but I'm not sure how much that saves us.
> 
> HTH
> -Emil
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
