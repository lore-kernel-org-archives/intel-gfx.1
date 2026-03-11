Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FEF1125839
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Mar 2026 14:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A005910E1F9;
	Wed, 11 Mar 2026 14:13:49 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3AD10E1F9
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 14:13:47 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-66174cf4549so2116575a12.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 07:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773238426; x=1773843226;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
 b=JOGvvxd1tLhmvzjjuXELpQQDRrw1/Gi32VlSMiz+RYRZqXVPqXh+PjP7dmpDxp6Bal
 dw4x5M9JViIuF+C6AsbLBl/Aa2ICOT+qs3iZYsnhWK/bN0JDMGy5jLHlj5MEmhyaU/rD
 vY3RRFV84dqnGQeczoR6PYs/nizF3zw6EE9T1jGbIthsm4gjRMVTv2jWgY9mXuNHLFJd
 xZp22CZ1lGL1jOsHtVCbOy/KKJVzHTgKXbmT+tn/imnpMiG7jAGCwLCs8QpdHWvP42E3
 fEPuluNmqbz181u3UW+hnIFYerXvnpAfpu3SRrBOQPLiEGJ4BnEmQbXOSx//zsJj+FGW
 BL3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrx+7RfkevVXBsGxxdnEvqxkjPUivsjAXu+Hii5BuCMZSrSkxOy12dpyWsLkW0debBhSnjwJHdK3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy8idmBHXi3Kekz6kZHShkeqE8KeBZnkGVYKVVsV0TzzAEX6xq
 i0DS4R6vsMloYzfLsHZ/YcjnvOL+05D42m0Ae0yXnDA1ov+Ls4+2w4cJGpTh8lxuSQGpQA==
X-Gm-Gg: ATEYQzwzCyTFV9Dyp30zlam+nVkMFJB7aB+lw1v6v2z9Zih6bGl01gbgjhQCaykUgJp
 lQ+0g2voY98cq5SJocuaoH/P0TJXDKmLYAV+FBWZ6gLHmEuOVc6ZnzPy/gtRyedqgELXyQC7p0s
 CKYLleMLDSAorXCPWLb3QTIk5f1V2esvvyfBk+R3UscvXoKFFxlqfqXC3kQ6/PYWRTkv3ILLv9P
 XKJHJHioB9PHVmHr72YvtKzcibndXILGSvFyTEKKaCXRHacbB9qIzFrAIz2xN6boRKEZjFrrdcb
 mxcvIh9vED8oJvVVT5uF8wUU95cEYVBYNQyd765mYBIoona7e+hbTFSmXqu9wIq/pJaaWh0ezGc
 AZPMZBpk3+zMt9mSNuEFhUERL31cLg6A0HOR0lxtwObLNWvCUT9No2lE452lN3akKhtVybEwa0t
 rlFqbxaKqpg7Y8rcYGPSG/kH/DKaJekJG8a/ob2h5M3G/l6IDhvFz+G6WKuZKW
X-Received: by 2002:a05:6402:34c2:b0:660:f351:758d with SMTP id
 4fb4d7f45d1cf-66317970de6mr1587816a12.7.1773238426180; 
 Wed, 11 Mar 2026 07:13:46 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6631419b21bsm639960a12.5.2026.03.11.07.13.44
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:13:45 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-660ea6ceb5aso1642005a12.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 07:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXH29LicyzoV0EMj4/fmQmagVS0sQMSLJl4h4NbBq5AUFxoKehcGx7tmWHogGMlijC6Suotb7TMAiA=@lists.freedesktop.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de>
 <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org>
 <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
 apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
 cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
 samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
 v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
