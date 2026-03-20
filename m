Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADB4F483E0
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B110E57D;
	Mon, 23 Mar 2026 16:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kvXX5vrc";
	dkim-atps=neutral
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFA310E0F8
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 22:38:50 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-64e9f9226a7so2101939d50.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 15:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774046329; cv=none;
 d=google.com; s=arc-20240605;
 b=aQhpiKaw4v8iSvRiPaSocLXyT36o4e+nBnr/7eAe8bSyvav+sEerv5Kd6o2FwhqBJN
 9/j/s6IW5xaxLZoBE7AWCA7afKEBRsNJkeDdqnhYhg524dNMKdm+YSBqxC1Y1fdOyeVE
 xzdZy3/PlgGllysrnlekOKqOOUZ/PtyOaIAkVsiKyrTcg+6w4cfnt1YA9zrw/uNpVTNl
 S5toWT9JmvpJlB1ukPrixfmHQEpxJvZNsrXzmTEJMRWIVIbhe6UmSjP3yX6+SynTTosx
 sgIaw+80KvL6qOF2pl6jU1jI3b5uscNNi5gYor6e84D3FYW65oB7reRXQ4kv8lG5H2pi
 /GNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1QP6vLGAno7k+sNss+wwfyElHbIT2Fj2kzdCjibqhnU=;
 fh=CY2SibA2a0VBVyC3/VT9kXcc0KHo7YWeQsHHbeQyj0g=;
 b=WaqqvF7SFXAhAf0yiZ7eYsDlBGHktKKz8zy7D0Ru5XmuI9WVDmh4YmBCO08O8gdsA/
 yXnZHOoop7Jixur3CKETOT2B2VUymgLo8zGvCLI/wNDbhDVJX004KYA6kNPlHzon8Dvb
 AtDZU5dCcJGYtYl72k1E2nhgROlawmipcZWQ0l7L9p8aiBCGIlcF6jBn44guxrFWVdM2
 8wT5XsEvw+nz0NvzWQlphwdc3NvZdVQGOiDiAXQxgZzn1IICDpXWINuzX2UZYFxPyNJv
 a4Lo4faB5R0MluLRC034MewDlEXfRPOPJw3B71fdvxoMhzthxLuKR6AYBzchzXnru8Pr
 iEow==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774046329; x=1774651129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QP6vLGAno7k+sNss+wwfyElHbIT2Fj2kzdCjibqhnU=;
 b=kvXX5vrczBwzeLzetQEk30KLX2hI8wZSCEZPkz20BHdO3OAlPJiiyRZYMBjwTkqK6G
 lA5a2Vymp8+CNUMPqbfeM4+pqnADDrPl5sa+jaMfitV0HrH1BZYm1SDX4gPbT4ep3nZV
 vqu1n16wt+dXoujFWL+/sK8qDWM3+xx7HV8swGmXa3oAvgTqtPCi6hyUxlZKQD0wldj4
 Iqw2vxzzYJOJahzsWAEo0XxnEE5AUh92KtkTU+eIvYoAsYYZbwPvlzKBXd13jPw/5Fi8
 bHuYLT2x00OCwkNMEM7eeGTr+r4Z4WC45fTvR/llh3PsxA5cVoVGzDH2RV+5im+1NitV
 1ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774046329; x=1774651129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1QP6vLGAno7k+sNss+wwfyElHbIT2Fj2kzdCjibqhnU=;
 b=M7FhwGAytayyT/pfpOYt4RWkof94RFXOHk8WZ3i6XYRqh7AUXG1QEOLrW23oXZbDHY
 O5eWTGfQX/pCQEMZq6sdeKKNXTo6btgtV5Occ2p/8b7FxKGqXWX2InsJIhZAFIZcpoDi
 wCNiyYLMLrwH2PAA+dV/x0KmoOUo17MXvDngYjkViKWpiM++y4inVNLK2cKj8dnuOfYN
 tC9s2TyOwjwBrTXWZEKHhb1zgXt4RFlRy3P8v6xpU/ft5L7bjMKb5eb/svqNppVEKuMf
 waldgNlVFBvgHB+1TaWRwEbkiMUs8O1kWdY1flfSkUog7QaRjTrJLOSMyM9pdy7YMhxJ
 zlQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI7pCoXmTi3lhf7gtxgjK/9BPGsKaImsmkPkWn1/7s41+BJ2CDN8eVZN9QFwofy1KiO66aila6W8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxur1M+prs+weae7+dzr0ZMCLV4s0YZ3ksi/Yjo4IcWtHJqBlEt
 xdRfdWSw42aFLM7WPeSKyVnSKVVxF5UJL8hLEQsq+gebDx5k/9vmLcLGD5fY2XDb1jcHn1gDEX3
 yi1tGuhkAnTDKsNG5DfoaEEqpEWz4S+s=
X-Gm-Gg: ATEYQzyt0lSRkUvzVJYHD7FB1anKkQllTV+qlZIcXDOL4wSl+i0JaBIR/Djt2fhn649
 qOzu2r4BNpsSdmzAUzcQlT4iHWOy9fA4bO3/n7JbCYabNcpddSRsuXjjRTGbOUrpA934QqASVSQ
 N3OjJfOxgOP44pX7wFHwkH3UWjShcg5Sx6cO6lo2gW3KEHgjDtwo5htXaCB9SplShmjtw+6KB+g
 sDrwkqa3rW5BvlPaT/jj6vHBIjoQ5MNEvXCect37rD7l1W7P6hW9MUBAVoFsuthos/YdKuN02pI
 FW0u
X-Received: by 2002:a53:b9d2:0:b0:64c:f2f5:8f5c with SMTP id
 956f58d0204a3-64eaa707e47mr3626057d50.30.1774046329351; Fri, 20 Mar 2026
 15:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
 <20260313132103.2529746-65-jim.cromie@gmail.com>
 <177402491485.6181.1878747749743687917.b4-review@b4>
In-Reply-To: <177402491485.6181.1878747749743687917.b4-review@b4>
From: jim.cromie@gmail.com
Date: Fri, 20 Mar 2026 16:38:23 -0600
X-Gm-Features: AaiRm532nEVSECCKtVZQBvh7bVjnXge5XC4gNh5bglnjYOP9OLegdkUxnYh0aWg
Message-ID: <CAJfuBxy7U4DtDHKrphky7mCHMxmC9ZvuE4cdH1qAzZ4PZGuz1A@mail.gmail.com>
Subject: Re: [PATCH v11 64/65] drm_print: fix drm_printer dynamic debug bypass
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, mripard@kernel.org, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, christian.koenig@amd.com, 
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com, 
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:03:24 +0000
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

On Fri, Mar 20, 2026 at 10:43=E2=80=AFAM Louis Chauvet
<louis.chauvet@bootlin.com> wrote:
>
> On Fri, 13 Mar 2026 07:20:29 -0600, Jim Cromie <jim.cromie@gmail.com> wro=
te:
> > [...]
> > mismatch in intel_pipe_config_compare(), the resulting UART storm
> > causes a hard timeout after 20 minutes (see below the snip).
> >
> > To fix this, change __drm_printfn_dbg() to use the explicit
> > drm_debug_enabled_instrumented() instead. This ensures the bit-test is
> > performed at runtime for this unguarded helper, stopping the UART storm=
.
>
> Why don't use use drm_debug_enabled directly? Does it make sense to call
> the _instrumented when [2] is not enabled?

my reason is so that we can turn on the pr-debug, and see how often
this happens.
If it happens a lot, we can look for ways to replace the bit-test with
a static-key guard.

That said, we could use drm_debug_enabled(), we'd lose the counting ability=
 when
DRM_USE_DYNAMIC_DEBUG=3Dn, but still have it for =3Dy.
So Im happy with either way.

>
> >
>
> --
> Louis Chauvet <louis.chauvet@bootlin.com>
