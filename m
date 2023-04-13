Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B06AC7618E
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Apr 2023 14:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB2110EE27;
	Fri, 21 Apr 2023 14:10:03 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572EA10EB5A;
 Thu, 13 Apr 2023 15:32:45 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54fbb713301so47149707b3.11; 
 Thu, 13 Apr 2023 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681399964; x=1683991964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4Nc75iyNukd0UR0rxIxhX/z29BaqR72KzPmAyeHJwIc=;
 b=JAHnYmaeyTzRiLuZOeQwhE+KlzFkog2WLQuO5+Xkls1cIPq0GtTSILEI+jyF9oM1Lp
 7nliktTEq54GI2VPALYRdUSraMquQlNFMdAo10UETOI+Tz1TPQy6EV3j6fHm0vYHezZB
 o5hmHMXOcLAAW74yS2QsvKxM3CSBad619AN+HW1nXsfgeDb9NLbg4X4hDL7VMKmmAVol
 285REognpebbHdRDxuM9at/5EbEQLUN+x0k5pWd3yDm7e7DutIMVTPbEmSEzpCoF0yRC
 ijz9NVP7AkftSMBuH9k9IKN/kg8xJV1VAd5DzjidgGCZi9rkXWOOAwe3ziCQwGLAR6kt
 cbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681399964; x=1683991964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Nc75iyNukd0UR0rxIxhX/z29BaqR72KzPmAyeHJwIc=;
 b=dCaqkTC3ulDw80bZYvuFey9m9WNzhy7MmbaOhYY13vENBAyQmwI3fY722SGyOGJ3bY
 GFJ43n3dN3TrNK1FKXlIPcP8qGtbhQOZiwRe+skdJrrAsWDtfncE19VPnTR0upeEb8qH
 Dd0oJ15Qd+3moKLyXLl/zeyUpZw4u0+RcyWfGjJIf2NZNXNtcJyDfZ6oMPzaqeUoJ7Ub
 RDDLX3PEfX3A/B1s4903Ksi79y4Bzjmfn6bImvXjglU9ZXfC80HXCuMImz3Sxj3X8dH5
 Bbv1WEDkaAF1LAIVbmYZnFZVTSM47D8MECnR0Mr5AjeCvjgbDZvVX8Xs/6qK6EZ7VE+b
 pkwg==
X-Gm-Message-State: AAQBX9dLxCIDB7xm/Rvr+pfmPnWXgQRyhfgh7FmlIJa28jUJ+rwOezh0
 IyHqXz88zkL0owTGovXrVAsRS/Qa3SIZolsVbw==
X-Google-Smtp-Source: AKy350aW7/Rt5uV9WGKym2asTJbmxp7nWKlm8h8QUtBJ9JRBKTw2Rz6Yer8O3p7N71ttmVpgZM2dMRD0CuuQdndOY0g=
X-Received: by 2002:a81:1b8e:0:b0:533:a15a:d33e with SMTP id
 b136-20020a811b8e000000b00533a15ad33emr5024977ywb.5.1681399964024; Thu, 13
 Apr 2023 08:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
 <87r0spcuvi.fsf@intel.com>
 <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
 <CALjTZvaf1cwcZc9O8g24SnZXsoQaWB97UVQW=g6M0coaudLr6w@mail.gmail.com>
 <2495408f-a644-4e56-aaca-e6915cbda179@paulmck-laptop>
In-Reply-To: <2495408f-a644-4e56-aaca-e6915cbda179@paulmck-laptop>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 13 Apr 2023 16:32:32 +0100
Message-ID: <CALjTZva=JHsckrBeHgJcd-_TDMgYgmZGcXavJ=GhPr7VQCOF5g@mail.gmail.com>
To: paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Apr 2023 14:09:19 +0000
Subject: Re: [Intel-gfx] [BUG?] INFO: rcu_sched detected expedited stalls on
 CPUs/tasks: { 0-.... } 3 jiffies s: 309 root: 0x1/.
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi, Paul,

On Thu, 13 Apr 2023 at 15:43, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> My guess would be that you have CONFIG_RCU_EXP_CPU_STALL_TIMEOUT set to
> some small non-zero number, for example, you might have set up a recent
> Android .config or some such.  The default of zero would give you about
> 21 seconds rather than the three jiffies that you are seeing.
>
> Could you please check your .config?

Well, this is embarrassing. I can't fathom why/how, but I had it set
to 20, on this machine. That is, 20 millisseconds. I guess its a
miracle I haven't seen *more* expedited RCU traces. Sorry for the
noise, everyone.

Kind regards,
Rui
