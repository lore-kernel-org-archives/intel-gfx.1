Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFD310D14B1
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC25010E715;
	Mon, 30 Mar 2026 12:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zu+vi89M";
	dkim-atps=neutral
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACAA10E9E7
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 15:20:09 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-66b18af8c88so104957a12.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1774538407; x=1775143207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5VwSVLrZu02gODrnOBU1zsYKEHs5QD8MREnECAvLw4=;
 b=Zu+vi89M47MDC8jnXkdQOj2YbFkUCY99g8KSe+NPFODOz3IeUNlxmSKY377zf7eljt
 3jNgZtxogvpFJNWuW+D58X0po7NnNcXfkRVHC9WRNy/VlMOPch8vZpQaJY5jHFYac2uB
 UuTfk6Av3elNARjTpYw1FswyXRBqY58TFgcMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774538407; x=1775143207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J5VwSVLrZu02gODrnOBU1zsYKEHs5QD8MREnECAvLw4=;
 b=oGvS+90ZK1C1sn2bfTWc7WVh9ZEbgC5imxFZHkJaBqW+g0pvvUv4NW9m8kqS8ioY9F
 WRdJd8iOP1IqkEoaQiFOJeDjBv0N6gDP46foBWHYHvFbI74yXR17Dhciqg2DBL/8cYDJ
 MKSK5FqEnb/PtcxgD+gAuSsrCVwR1+3Yh6EZpBXOnpMepTyiJ5xrgyeTenHQw0kKfq5k
 u0thdIcW5lkRUcFWB0CEiT/vL/FL3ZoKK6AFZ7+z8ZS+BNAXMjOuwsSw/L4jzciw6w0Z
 FCI1aiQHVMHVdP3+OH3zfD5UEkhZTwd701mGu7aUky9BcUo4sOf1bpLhrI1clLF3uQCT
 EMng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJFUVpOitrl3jLBjzhVbwsCPBWkCCJVXQliLpTb2lFTU38nwVyUF8pKJR6YD4N4Rpv2zaM+W9/AZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/Zkg6t5KSNFiBjviKgrUHkQedoU5gdRc1BlzP1yMQtS+A7Bqo
 pApZbIOaIcHwIkRkFxV154+ihA/p+wUwS5NkOEe4Nm7/NdTaVHpfjIHMBth5KKheKj25FqS5X2l
 r25COYCk=
X-Gm-Gg: ATEYQzxtw2GNMVwkBCCJMEPAYp7I/ji+eNrX6bjiQKXjrQmPAxe9UWe+fCnRXGn415O
 9PFataC1FtvdVaDOt8bsj2Lh44Qbnk/QJWuybJrstRNQ4JG7jz81huNqkrmC3RuQwaAmeswmodL
 CNmBW1CaGZUjfFXY0pLWCBoAX0Ccbl7wWu+M7YyVWSZmzeOnxJj3iOlfoeH0UovGUieUR/CW127
 Qm8ClCCUYZGNjWYAzjKyuYrACM7uZOP5zueBpZHvTyQO+DXibEM+5+NzEWujsdd+vY6r66Pad2R
 P6vwy4EKhe0biCYNBtaozFJCJNafPql4tDF+G8Wx6TqwzdNV0W5Gh5E2K/jubhl5Vt/0XH2eyTk
 eZTculPDYyn/QfW4KlifN83+0dNAJUqecV5kB+GnVTt/iakjctNPaOAm/jWcmFCvkgtXCZDwH3a
 giuUbNVBTWVC2+c2MAGu7d1a7k0hy/qafSwKdsI8H8s4SfsIteK42x3OXgY/4mU+BmyVtJGEs=
X-Received: by 2002:a05:6402:46c6:b0:668:599e:1035 with SMTP id
 4fb4d7f45d1cf-66a8261ddbdmr4971832a12.2.1774538407223; 
 Thu, 26 Mar 2026 08:20:07 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66ad6a4ec00sm1144093a12.23.2026.03.26.08.20.06
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 08:20:06 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-668d4751a3bso1559645a12.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 08:20:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXnF0br/WhYwqZsF/YxdXskpFBXedz012azaFUtq0rk5dyFDuBOmdTG/SI/uLhtvpNCDwJh5l8LF2c=@lists.freedesktop.org
X-Received: by 2002:a05:6402:46d1:b0:66a:199d:12a with SMTP id
 4fb4d7f45d1cf-66a826d6b44mr4587446a12.24.1774538406265; Thu, 26 Mar 2026
 08:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260324151741.29338-1-sosohero200@gmail.com>
 <acUnQkniqECI0QVY@intel.com>
In-Reply-To: <acUnQkniqECI0QVY@intel.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 26 Mar 2026 08:19:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg6JqsqxrdZi6ruuV0pf3PdYWo0tm_XBWe+r=NSnjvHRA@mail.gmail.com>
X-Gm-Features: AQROBzBqAMCueS_SeETvVBTTiKjI_km_I1doFSxMVYDSlm03kmy_SF7PQp61KJE
Message-ID: <CAHk-=wg6JqsqxrdZi6ruuV0pf3PdYWo0tm_XBWe+r=NSnjvHRA@mail.gmail.com>
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Yassine Mounir <sosohero200@gmail.com>, g@web.codeaurora.org,
 gregkh@linuxfoundation.org, 
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 30 Mar 2026 12:57:43 +0000
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

On Thu, 26 Mar 2026 at 05:32, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> Should we not do something like this?
>
> if (likely(vma && vma->vm =3D=3D vm))
>         vma =3D i915_vma_tryget(vma);
> + else
> +       vma =3D NULL;

That looks much better. Returning a vma that you looked up inside rcu
without gettin ga reference to it looks very wrong.

                  Linus
