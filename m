Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C443CD8CA8
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Jun 2026 13:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ECA10EA3E;
	Fri, 12 Jun 2026 13:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PylB7DtN";
	dkim-atps=neutral
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1910EBE3
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 21:06:30 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-7ea16f090b4so91568557b3.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 14:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781125589; cv=none;
 d=google.com; s=arc-20240605;
 b=lm4ZBnwm44FH4ZaC6HIzJY5QxP9kxjggGC9mUpYr7Nx+QWqZ9bt0OHBubqJ72w1H5h
 mhJK+dAYAjup06+u22YN+KSN9/HB00kbWdn4A6Kuqlx6NbH0lNO2IS+Myi738LX+371P
 legkg6RHYY6YwLrxHQ8K30ZZMPkAPwqKx3lsHcM1HbTlCi17BVB4j/nMN9padQy/7xwN
 ryZTw6oZSMS2f81NeqC0IFabmxct0n55+JTffMaJfO0vvFqDf2qyB0E7I0V+beqZi0TM
 V+wHuXMkXTodmI89PbjW0KehpCWoiU1FlnGHA3NCfUIkiliIs161yAAJnumSbJA2u6kk
 N+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=96czj6yri6D29TEjjpnrX0Ms962E0G1MVyGNh2o55HQ=;
 fh=QWV8Ts5AmCzLN7gO2T3TMIpCbI5/IYtIvndeUmVrBKI=;
 b=CXddFZmxDKrYS4RDR7WOcJGaZ7yfms7Oq8Tdm1N6KYtiC8Qoxg3K7gODBGcLCEE1Pj
 gDDa4fR/GXZfyX4U+r78Kr4PAIka9UCn6wzlK4zhsCFPZYRiyikF75XZiYS0G+6iN7X7
 Nk1Bf61qazCONVh29mfJe19hGV6/4xz/C6NM7hsNz4pfvMxQV+G6L6KT47kK+RWRJOVv
 fuILabqXJnlBXtOoXow3iWkuaE3Rxd3+5kZi6EGlXgBTcan0L3vx/NOcvr5qD5bQpv4k
 L6bL93ygJML5sCwu7e8zfBOvV1syPSGGko3FO90wGJRv0fLwZsbGQyzIr0YnGHEmhnEh
 ZtAQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781125589; x=1781730389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96czj6yri6D29TEjjpnrX0Ms962E0G1MVyGNh2o55HQ=;
 b=PylB7DtNoywixLevyU+aSGna9WJ2oCJDGaHyYolg/J6MJMytnprlMfzb1wwiCB1C66
 XIlwZ1FxwaDdBGbctCetu1XPeMDXxM99T9Udm54LT+r6yUHxzruZMWnWRhfo5Yp3fLb3
 nhHGZwNEoZd6Xnk5dspYE8q3dDIrmVsVaKQALpgewvniLb3pf/xPMrNyjicNmVznd2sY
 UnUpKH9LgaSkY4zs09UP+LzZt67kABOQUC6WPr6yVuilnpcM+apSoZdhoBgpTGD454Gh
 TGg7U8Nd191I/Q8tn/cdT7BSrR1JU426EsZSS4/a0ycHlUYtw7ysZ0qbDWhP6xWkD27b
 pQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781125589; x=1781730389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=96czj6yri6D29TEjjpnrX0Ms962E0G1MVyGNh2o55HQ=;
 b=WNQvVbE2FtGmVzdg1g4QC2go15iM1Y0VQPShvLjcpCc3OkYa4gdxM41Y2VkhlkIGXZ
 B4CQ8Std8VtRPStcetXUP6Dt0Q8nZFUaiN1NgcSVKb0bL3dW9xE42lzi6Do/IBJoakIi
 hsvCbLsdSiXPQQo9VT9NKYCk+YERZib+LqYEE1tcWEpZ0QENiWYEIYJFq4oYuNwNUWBd
 YD27bv65L5fUgp5/UYgGXXRwSuyzxG2jKBI55qwvIBbj+Ka5fkeTNR/VJKUeoWgPn8Ob
 x9sh//qFo5z4pKlH5d3VG7avCET1FmLuO+Pn+Js1b97iMCazJewM4O8NSQHUGTSP1hKh
 hyNA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FfklMbsc+FjjgOBR9h/tu0j+tRVaVUGXQvS1qIek7nT7IDPPXriS3+zAFTXeJgd+KyyOSmTEebOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu9d7eNSA4OjscjqlvEOl3lW2y2HIUz1RmRfnbndAQaiCLNnd3
 +5SL/Belw+C5vBse32hTpWi4bFYYQqL1e8lw3QGXALpNO/IlQsTX2NYKldkmLNa9iiT7SOVmh44
 xaLDs1qtZG7ImBRMZrqk/ICF4pfjN8iQ=
X-Gm-Gg: Acq92OG2mpK2610R3cZIZ+Xb2RLsq9fvepVixgAtPjWD7cknISyzg+esqgun9Q9shr7
 +NiyAVKIOw02J5FbeoAZIcPJ/OqC6seFRthQuC+kmYmjHVFWJ6q9sSCxwwpLaBxhw9TKEFhkBNa
 PveBtRhR3NKeU2XKyu9GwC+ELlikfwQZdWTVc8NLjjPfessPsMjB0N9oeXKoec4yI1W2QU1GLO7
 9iAJs+CXrC2jgQpxAkhGmFYAtmusxn+GONekiCTRQ1ZUjwsa9W+ayYG9vTjxZmYNBpOZL2pK+o9
 K+yCyllYOB5aNcYZhKcFZgNKvQ==
X-Received: by 2002:a05:690c:45c5:b0:7e9:ab56:3c99 with SMTP id
 00721157ae682-7ed0adbb616mr276188567b3.6.1781125589039; Wed, 10 Jun 2026
 14:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260521133315.work.845-kees@kernel.org>
 <20260521133326.2465264-4-kees@kernel.org>
 <da358ae1-91b4-4a16-ac76-ffab99c230b9@suse.com>
In-Reply-To: <da358ae1-91b4-4a16-ac76-ffab99c230b9@suse.com>
From: jim.cromie@gmail.com
Date: Wed, 10 Jun 2026 15:06:02 -0600
X-Gm-Features: AVVi8CcLXClq9Fijm8VjZF47hQWmos5q_iXrehNZDw9kSOby-E_cMxEQI0SK-hU
Message-ID: <CAJfuBxwRuT1K=rjPX+sdNyYurEJ=OjqbJaSa_S6JnY6yzTwTvQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] treewide: Convert struct kernel_param_ops
 initializers to DEFINE_KERNEL_PARAM_OPS
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Corey Minyard <corey@minyard.net>, 
 Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bart Van Assche <bvanassche@acm.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Hannes Reinecke <hare@suse.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Jason Baron <jbaron@akamai.com>, Tiwei Bie <tiwei.btw@antgroup.com>, 
 Benjamin Berg <benjamin.berg@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 12 Jun 2026 13:06:10 +0000
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

On Mon, May 25, 2026 at 7:35=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 5/21/26 3:33 PM, Kees Cook wrote:
> > Using Coccinelle, rewrite every struct kernel_param_ops initializer tha=
t
> > sets .get into a DEFINE_KERNEL_PARAM_OPS-family macro invocation,
> > for example:
> >
> > @@
> > declarer name DEFINE_KERNEL_PARAM_OPS;
> > identifier OPS;
> > expression SET, GET;
> > @@
> > - const struct kernel_param_ops OPS =3D {
> > -       .set =3D SET,
> > -       .get =3D GET,
> > - };
> > + DEFINE_KERNEL_PARAM_OPS(OPS, SET, GET);
> >
> > Using the macro for initialization means future changes can manipulate
> > the struct layout and callback prototypes without having to change ever=
y
> > initializer.
>
> Nit: For consistency, I suggest also converting the few remaining
> kernel_param_ops instances that specify only .set and no .get, such as
> simdisk_param_ops_filename.
>
> --
> Thanks,
> Petr

for the dynamic-debug changes

Reviewed-by: Jim Cromie <jim.cromie@gmail.com>
