Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473EECD5BC9
	for <intel-gfx@archiver.kernel.org>; Mon, 25 May 2026 13:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1610E2DE;
	Mon, 25 May 2026 13:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="b5nIHG9y";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D3010E33E
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 May 2026 13:27:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso121366025e9.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 May 2026 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1779715637; x=1780320437; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ij+l12dR+ISDUAaA9eJOw0SDQ47xwS4UQDqlRXMB76c=;
 b=b5nIHG9yjNkEfCJpeLt1NAj+IjC/IC+He26bxfg4Eacg4Z0Zg7fE8F87TnKGBhwf7W
 ZpGI0rOnG02XvZ5QloPczWU48Z8Ebgr4LUhSCNc3mQ6LfnsusJ4tVVKiTEhsHwK1EmJM
 E5H10Tpm10LdaxWuPHvh6f0XDyvz9YRvx6P735XK2hRQ4Sb13nPgodFZCq0LIfHumecR
 JTj37iJDPiQf34ZK06U3atgrjjXSQgxNZ4fs0oWbOxz5zkxd88SswYXt/i1TqNfPp7cL
 UBTVLASQ6LbsSS3sjeauZPafEzeOEKGuxlqLvlptRLvg/eqdGbfoDIXudz6XPca3ITLY
 mj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779715637; x=1780320437;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ij+l12dR+ISDUAaA9eJOw0SDQ47xwS4UQDqlRXMB76c=;
 b=OiQIcYjMlY8QSL3PN/1dndaBPao+jID14MfBMCYXCIfG7n4S1oFadhF6I+EvoXI10D
 abaOshFVDVmQ502CbjEhz8zrwYUsjH7OI+HCeWYHfmgW8zSzuznVNEEpeaJMBknGfsTj
 MPl1LbFeCfuxToCVakOKBZS01XL0fIsELpHMQ5VdMlu5QGbc50cEJRs9mtssH0t3HJVL
 9gWM1zaKCC0pkzGGQKzEONvphoebss1sz9Ce7zfhW4YfjomHTumOXz+d/EgbNPD3hXHC
 xy36au9EDey4REGy84eq1g6sPq7igOcZX0fKtriDF8T5B/YcxV/9Zi0VVH7VNcxJSGT/
 ftRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kRL3CU5o/l4gmGlt8eg8f/Qr7JYEp/Z09QjHECS+SJ4AScTB3++zxxgo8s+xO3q3XBtQ5RiLVlpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTwZoyc4r4d/WcwuU++Dc54CJKcXo3U3tvn1V8IPF4IN8uFlKW
 o7tsmzhrGoC/5D7WhKLwEGKeO1zmWXYBwactNKWCLyoZQ58p285XOLg0GELZdIbiF6I=
X-Gm-Gg: Acq92OHcfGk6cJ5nbjla0eLPGKQnUd4UuutvtZtTd5WGKoeoMwJ2KgI+laizku2g/8x
 BtDjI6ePp3z7bLSDzx1+iJcWcV3/zXzrofhMzcyNoozeXfpAm/bx0Ua/oNv7ayNanV/x4I8djFK
 h3tkqByarYh2WBFSTZG7CITo7agr4ywOT2fe8Fo/BAxcolE6mPIdXPdw83JGqxD/q4OlXTZTHQH
 e+l64HWDhcjI+445mY3SXz5gdGbudu6IfPx4SIVJVmXxXTReDMxsPfpNqiASlcXb6RGCMw9biLZ
 cuSc1WIq0IoGexp/xF/zC2rgrUj5+g84CCEj+YAET9eHdvq2451VT1i4BQSnYecobIN7zWKR2If
 C1tM4bEbVORnGLRTs6DDnnL0lCIlmDd1ld5OPoqHEDAOHx5A6LQcpi0AFysm4SyyYFHvAjs7uu3
 D/TMXO9O2LL6WRtu92lmwyZ/8ufBVQVOmm1RPLUwEbNCIcaqkyr7V6SyWCVtvF8ZZQTRUVfXQx/
 U5hFBx7a4TPe6AYwN73/PAZ6pvOr4msYyt7Phqahtg7020UQNwk+E/EDchTV4DZuNEijtg1WUXi
 76Vf
X-Received: by 2002:a05:600c:3b02:b0:48f:e1ac:c94f with SMTP id
 5b1f17b1804b1-490424b3938mr247672645e9.10.1779715636631; 
 Mon, 25 May 2026 06:27:16 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100?
 (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz.
 [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454b1ab3sm284841905e9.14.2026.05.25.06.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 06:27:16 -0700 (PDT)
Message-ID: <1c21f66f-0d0f-4a8b-835b-23408242cff1@suse.com>
Date: Mon, 25 May 2026 15:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] moduleparam: Add DEFINE_KERNEL_PARAM_OPS macro
 family
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Pengpeng Hou
 <pengpeng@iscas.ac.cn>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Corey Minyard <corey@minyard.net>, Gabriel Somlo <somlo@cmu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bart Van Assche <bvanassche@acm.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
 Tiwei Bie <tiwei.btw@antgroup.com>, Benjamin Berg <benjamin.berg@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Georgia Garcia <georgia.garcia@canonical.com>, kvm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-modules@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-um@lists.infradead.org,
 linux-acpi@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 qemu-devel@nongnu.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260521133315.work.845-kees@kernel.org>
 <20260521133326.2465264-3-kees@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260521133326.2465264-3-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 5/21/26 3:33 PM, Kees Cook wrote:
> Add macros that define a struct kernel_param_ops initializer through a
> macro so the underlying field layout can evolve without touching every
> call site. Three variants cover the three cases:
> 
>  DEFINE_KERNEL_PARAM_OPS(name, set, get) // basic
>  DEFINE_KERNEL_PARAM_OPS_NOARG(name, set, get) // set KERNEL_PARAM_OPS_FL_NOARG
>  DEFINE_KERNEL_PARAM_OPS_FREE(name, set, get, free) // also set .free
> 
> Callers prefix their own visibility qualifiers, e.g.:
> 
>   static DEFINE_KERNEL_PARAM_OPS(my_ops, my_set, my_get);
> 
> Also update module_param_call() and STANDARD_PARAM_DEF() to use
> DEFINE_KERNEL_PARAM_OPS internally so the generated ops table will go
> through the same macro as everything else.
> 
> Subsequent commits convert all open-coded struct kernel_param_ops
> definitions to use these macros, in preparation for migrating to a
> seq_buf .get API.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  include/linux/moduleparam.h | 36 ++++++++++++++++++++++++++++++++++--
>  kernel/params.c             |  6 ++----
>  2 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index 075f28585074..26bf45b36d02 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -68,6 +68,39 @@ struct kernel_param_ops {
>  	void (*free)(void *arg);
>  };
>  
> +/*
> + * Define a const struct kernel_param_ops initializer. Callers prefix with
> + * any required visibility qualifiers (typically "static"):
> + *
> + *   static DEFINE_KERNEL_PARAM_OPS(my_ops, my_set, my_get);
> + *
> + * Routing the @_set and @_get function pointers through the macro
> + * (rather than naming the struct fields at every call site) lets the
> + * field layout change in one place when callbacks are migrated to a
> + * new signature.
> + */

Nit: The newly introduced DEFINE_KERNEL_PARAM_OPS*() macros remain in
place at the end of the series after the migration is complete and this
comment is removed in patch 7. It would be helpful to describe in the
commit message why these macros are generally preferable to defining
kernel_param_ops instances directly.

I assume the motivation is that the structure is simple enough and using
macros then makes defining kernel_param_ops instances a bit more
concise. A minor disadvantage is that some analysis tools, such as
ctags, may no longer see the generated definition, but that is also the
case for DEFINE_MUTEX() and other similar macros.

-- 
Thanks,
Petr
