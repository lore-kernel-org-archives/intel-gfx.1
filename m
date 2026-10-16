Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3497CCF2E3
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 11:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5286610E9B8;
	Mon, 19 Oct 2026 11:41:46 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197A310E359
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 18:45:51 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5be3db57938so276503e87.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 11:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176349; cv=none;
 d=google.com; s=arc-20260327;
 b=fXF8hkksSXpANs3hxBBOF0O125sBpxkkCmCjnOlOA74BSELyn1Gi7M+b4MchxGoxoE
 KtNo7hDdcV+CanLoHbRgqI0mpb/Ctaubvpw0za7V0fsZEkKP5Bcn82bML2+GC9JkJurL
 8MIbq0g8CYbQHbicbcEgYkNDgAx6Lkcx2snFVojbLPTEBFllGUGC/k1a1XJtb7LAr9fI
 9O17OAtOfAAkOutzX2dYHIjqwp49uLvQoGlRNLxdHngNMCxpmKqNcmbkKXet0T4upzJo
 U8Q7KaXrxw4dxtACy6evEu9fkGtOoWam7yB541ufJt9SMTOy1OjkEemad98mcjA32fxZ
 Obig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=k5fWdKR4KH1xJNhfX2EOMzlFvYwX5hK5uF++6d/eYyg=;
 fh=x5ZFTcuAFVZ2Lf4aGqwb+H1gQXTPX2SP2t4u7xDhZUU=;
 b=qHi5E6I0Jklf5HJllTi+CqfrJQHHhH+ezCCtjgIkJ8y4s8Q1YnFWU/p1NXN5zsY0YT
 lmEkZW3H+iNrv8VQLMUVp3utRp9e1H1jPL0ki2KAKz3RI+xssqGhy9cc6GJ+8LeG4F5J
 H4Vt7hiqCK70Jd/KFr+ZcTNVsjNKs8ZjS6HXZzZTrGcXQdN3kIn6ok29Dk4DZNrA9DV+
 v19eVtkUcCYLDKPPVBYRjorJjYvYoGGBdQfZB6ze8MaLBeSdlc7DCAKx4/mwfNSV75R8
 +EPXHjEdYxs1Rm3XlW8OWWzRmbuJeQbzuOTAWhJMlQmogsVC5N1m/rUtCqR7j9ABlw8a
 pbFw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792176349; x=1792781149; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=k5fWdKR4KH1xJNhfX2EOMzlFvYwX5hK5uF++6d/eYyg=;
 b=Qdlg+0poJecree0ibpGXs05txzVcHbPQHLWd2jVoKqCthPZj63Aqu1vX1rRcxH3tjW
 S55ZEPUrc/LIzA4tk7vV/z6T0vI4bPXACsldigGM7yRush5lNUS+i6nfjZMC9k72G/AP
 qAncxIoMre8O/QArOK7AmQf8frEwhf+Ux/vBk/9mX3RCPdd53By/vbEQR8CwZb/IWVb6
 ju3gcCpXrOQqRvseKsEWYUyC8zpLgG5Ia+OiBgFAuVxndsF97FEZ8L5X9zGWvGZxH9L3
 gHVzgtdd17A5Y6Ck4xskK3tWS7MI8p/rr+An5JCVwc6plc/ZRcYpQg1Hk/mokABlKRaK
 gvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792176349; x=1792781149;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=k5fWdKR4KH1xJNhfX2EOMzlFvYwX5hK5uF++6d/eYyg=;
 b=DTgy01TykNPyO6uOaAjeDX5fe/dmr12T/EKrE9DOKB31EvaVPSq0tjkhVY8/VjgvMe
 AurV9S7r0O2YiVZ/Jj319q0Lp13sSqIWwxlU+UQXYR7mL47bfNHFBfQDtN9wQBXweCs5
 JzoS/TaGV3ujEoOHnVPxef/U3hsQKhEQr/1rZQlNpoKKfCxYWXQv+GtefEjz8/V3iXYJ
 Gmp1OsaxWp9dWxO6ZYGWfO5jh+ofsvJ5XAjKqa0ItEbgXTvaSRH79uCynXkMyjwF25Bv
 krI8TazVbx6OMYupvunforHkKQwCpQD9uHWcsknu0wTrAHvvTFgJdGMYrS5Zu017XoFJ
 BEFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNsLmKMg6Sr09WGTSe+QptC/foxuO+DVR6xFF8giP6EZSc58ocmoPaIxIILk1B+NOT8Rh/EH9GKDw=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIL+ibWgcEPsOXVArNxyZb+Jfb4U1bNqitgtH2y5Fj9Uf8tcPfS
 wT9mqhnhva1eutQiMP4veNN/RezTYNW/UiMLJIH9mvZYsRWOzOVX3gMHkYZsbblqaYRPbAt2kTR
 6TVbiClcBTVLwc52MQ96IA5gO+0PHNfk=
X-Gm-Gg: AYBFou1oSrKSl2QYh6iHUEe1dknH63+uYamMjSnC58Y2EiIYn2S2JXobcUTRi4d7rPt
 DhRnhcQJtXMCCI6Ja4KhvSnEF7JIUSlrcSDAm2VcrP0bw7us6vcFxvZsdklZ+mSvkoppNZ8bDo7
 KkYJicI99eEhzZKUxkMxtCsvUByJ7h7DQdFpOFDQIPquzYG8Xs81jOxILg7NvlOjgAT1UO8L+sX
 W2/uTiVwhDljfU9IW28/ivePK/WdQ0vqjy+u9Af0Bq9GRU3UWKxtC+hrCixvjtundLfFVcgGPLr
 IqwKvvX2pDoJMJXcLRkfdqYdTI6894+S6ThJELs+rwxQNgfQv7TY1dLvjpuCF2c9Gw==
X-Received: by 2002:a05:6512:3186:b0:5ba:3c60:b875 with SMTP id
 2adb3069b0e04-5be50a6a815mr115374e87.43.1792176348595; Fri, 16 Oct 2026
 11:45:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 14:45:47 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 14:45:47 -0400
MIME-Version: 1.0
In-Reply-To: <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
 <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
From: Jame Jao <jaojame6@gmail.com>
Date: Fri, 16 Oct 2026 14:45:47 -0400
X-Gm-Features: AclHuK-OtA8zd8ZD6yhVY0T3x9G8mkTyhTueDHPQ63C0vT3FG7zdrTKBiWs99JE
Message-ID: <CAN52AYsR-SbHWKjnMP-ssTR6UfGHxqtP620MSH=SSw_=SWYW6w@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026
To: jani.nikula@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:41:45 +0000
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

Hi Jani,

The VBT is attached, as you asked. I have not been able to file the bug
yet: gitlab.freedesktop.org needs an account that is manually approved and
I do not have one at the moment, so I cannot open the issue. As soon as the
account is usable I will file it against drm/xe with the attachments and
post the link in this thread.

What the attached dump is:

  Source      /sys/kernel/debug/dri/0/i915_vbt (raw dump, read today)
  Size        7680 bytes
  First bytes "$VBT PANTHERLAKE"
  sha256      1a0a08b81c48977efbf3f4ea0cc547d6bdf44569f95d88662c5593f24a5e2e4d

Status of the report itself, so the issue can be assessed:

  - The warning is present in the boot journal collected today:

      xe 0000:00:02.0: [drm] Port A asks to use VBT vswing/preemph tables
      WARNING: drivers/gpu/drm/i915/display/intel_bios.c:2813 at
      intel_bios_init+0x17fd/0x1f60 [xe]

  - Machine: XIAOMI REDMI Book Pro 14 2026, board TM2426, BIOS
    RMAPT4B0P0909 (2026-05-21), Panther Lake / Arc B370,
    PCI 8086:b081 rev 04.

  - Kernel: 7.2.9-zen1-1.1-zen, Arch linux-zen package. It carries one
    local downstream change that touches only bitland-mifs-wmi
    suspend/resume error handling; graphics and input code are unmodified.
    Please treat it as a downstream kernel. I have not reproduced on
    mainline or drm-tip yet.

  - Boot options in use: xe.enable_psr=0 xe.enable_panel_replay=0
    i8042.dumbkbd=1.

  - I have not collected the DRM debug journal (drm.debug=0xe
    log_buf_len=4M ignore_loglevel) yet. I will collect it together with
    the mainline test and add both to the issue.

Thanks,
Eason


On Wed, 07 Oct 2026 15:19:13 +0300, Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Wed, 07 Oct 2026, Jame Jao <jaojame6@gmail.com> wrote:
> > I would like to report a WARNING that appears on every boot on a Panther
> > Lake laptop, and that is also visible on screen (before the desktop comes
> > up) when resuming from hibernation.
>
> Please file a bug as described at [1]. Please include the VBT.
>
> Thanks,
> Jani.
>
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>
> --
> Jani Nikula, Intel
