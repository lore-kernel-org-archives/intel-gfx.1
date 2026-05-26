Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B854FCD5BCF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 May 2026 06:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB17810E4D5;
	Tue, 26 May 2026 06:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Z3K5vl6q";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC4F10E4A7
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 May 2026 06:53:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso5943364f8f.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 May 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1779778389; x=1780383189; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXWASYjT/jE4WzpKhE8nVhHkzGwmPlTITkkcMF0D8BI=;
 b=Z3K5vl6q6p5EbeZinZFefQTbXguFU0mPuP+SYkHCWUdSq27x9/NzMUy/+8R7Ov7gDW
 /uuiZe9A0RkbA/wcxzhXDBMGrI1+u3tXqvqOsQznEPre/4x+DnN3MGn85drfPZjSD2zD
 Aem+G0czoOj16TW62YQ2YSFt6eRJP7jIYCbUg+55ZuK0MHNzgN3pFPvWJ4cIb92UlLX7
 G7DfLbzBKXfBIxq9rldtRmCgC22LGSh3J/cPSCOZZGFf5tQKHVJhzrjJCL++mWcAwhBr
 PIF+5emLmoevoaVmVTZ/WeKQoTFFRCKWQwLiQxTQmG+//r/91KEXuryXBU3MUOdQ7Efj
 z2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779778389; x=1780383189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yXWASYjT/jE4WzpKhE8nVhHkzGwmPlTITkkcMF0D8BI=;
 b=cQvEhe/AOSCqwt6L5dqMqXvCPPjsFN5x06KG2/P9M7iSjJHslT2sGdv5U50sBrowiy
 cXVlwsLlfj2szjmDFfusOQ2QM+DWQkqYfKBcnpyNIUEq7Zm2YIv1wduu02+bMUYRbtNN
 rDOAkMBWuj3P/1sBy1/n1xd4vLNw2nIDDS6oifGJ7qAXcJwv/5vL/D9C68wLoUIXVUv/
 /DR0jArbIvPBEFyopVxHssShDUvGWY6XZp6asjz998vB8UGx4cz5+FqV5Q9ESdT22+bz
 f6r0kcOJYN/21Z2EoGyTALjFYXy8m7JygBLg5h+ZIbzls3teIEFXXrSfKcTJdV3IisZ+
 69rg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ysZUVYbLlAjdcBKIUbSwrteRdKm4yeqLLz6vpXoQ4LG99NuWOl33lpVOIyip4/FpVORyptxC725E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyTSnmu4Mm1jAvmWrPKtekw0YY+AKrgOU5fXF+m9GpcO3IwNy/
 ODNcOLtNExqK3BN1LfkQ4ThQfJD+jF+42tZ+CDeTAGMm52DH0emj0hbvJe/gogvuS0Y=
X-Gm-Gg: Acq92OGuB7S+urjw3B+Ad4thzYXBGnoO/ziPDRveAdwWkfI/CbiWDiCXHmxNajP64g5
 RCv8UjCffRHs1unRLhbs2zK1FGDfmng3LiM7xct+D2BVbpOp0OuMnBPvRKa+EvIXfFvHBi/n+rZ
 pW2Wyzm3QpZNZP9cW7+fmXhOElmWtkDtNjB06gMr42GE4nSSgUi6b2CVuD0EZH+YQPpt3+PBxYx
 HCetHu7ifBzEYLhp+LH/WFOeBY5Rcj+OjnZQos971UmqulnLUfLGSs6GPslNrR3bgNX7aFmjNtR
 snfF8/svZyeYTk2pPzr81UvZEj8+IAgz8n03GHBos8o24ADESPbq8EOjlNYtHY1+cOKjZ6fAcCO
 Ad8rZbHlxYV5dsLMv6At9rUs+odIYrY876wx6nJeSJvLBplju//9Pyb6jfRz+UYBC9S+jxCt4Ed
 +hnSopJfR62Fz63rFbM6rKBJzJvi+cnuYRA3t/zKBBZEqB31IDhx3AFBkEMtaDZAnoSa+6K+OdC
 QWMNEHY/1dOX/T2YrLn/6FwHJFyTltYVfEqrqCXTbt6YOxicg6/ljT53+0eflEMH5xc9iLudYn+
 +fCE
X-Received: by 2002:a05:6000:2003:b0:43b:4136:1e6f with SMTP id
 ffacd0b85a97d-45eb38e4b46mr29516257f8f.38.1779778389230; 
 Mon, 25 May 2026 23:53:09 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100?
 (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz.
 [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9ba2esm33848641f8f.8.2026.05.25.23.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 23:53:08 -0700 (PDT)
Message-ID: <88c5ca1d-eeda-4023-bc7a-397b92780db9@suse.com>
Date: Tue, 26 May 2026 08:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Convert moduleparams to seq_buf
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
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260521133315.work.845-kees@kernel.org>
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
> Hi,
> 
> I tried to trim the CC list here, but it's still pretty huge...
> 
> We've had a long-standing issue with "write to a string pointer" callbacks
> that don't bounds check the destination (and for which the bounds is
> also not part of the callback prototype, even if it is "known" to be
> PAGE_SIZE, which sysfs_emit() depends on). Both moduleparams and sysfs
> use this pattern. As a first step, and to test the migration method,
> migrate moduleparams first.
> 
> There are 2 "mechanical" treewide patches that are handled by Coccinelle:
> - treewide: Convert struct kernel_param_ops initializers to DEFINE_KERNEL_PARAM_OPS
> - treewide: Convert custom kernel_param_ops .get callbacks to seq_buf via cocci
> 
> The last treewide patch is manual, and may need to be broken up into
> per-subsystem patches, though I'd prefer to avoid this, as it would
> extend the migration from 1 relase to at least 2 releases. (1 to
> release the migration infrastructure, then 1 release to collect all the
> subsystem changes, and possibly 1 more release to remove the migration
> infrastructure.)
> 
> Thoughts, questions?

This looks reasonable to me. I added a few minor comments on the patches
but they already look solid.

-- 
Thanks,
Petr
