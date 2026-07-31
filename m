Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE9CC54F54
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2026 15:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C290610F2DA;
	Fri, 31 Jul 2026 15:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ECIyP3Wg";
	dkim-atps=neutral
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F7410F2DE
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2026 15:32:20 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-9083f928b60so6006496d6.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2026 08:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511939; cv=none;
 d=google.com; s=arc-20260327;
 b=s/uZh+LRiEiJ3FZbv75VThmMlHJsrAqOLyJy7yGzNJ2uUzI6ffsL4jmKBHsDXBuBDa
 jIct+9DZ2D1NBs6xL8WXRtX3j2WJyN8P+mDnszVZsq+6zPBvL7B/Ao8yIi5A1WqUCf/Q
 a/aD47jmU4g6D9YYcAVqm4lyqg2zzP25H+gDYDc9Dr8yg1K62+s83O6WefLjoBbmcIkQ
 JGcWFE+DonBkQzjc0NLiwwThC946LAT7IGgmCKc35JQnXxxVuqM9Gll+B2DjZedmrtH8
 Sil/bGN8vGfQzrCl0pg8r1hRNXheU5M5GB3R+Jb99tdn23NuxGxq9YIbX2lnXcMXWlF7
 g4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LaXKHBEWUqsx51ozSN4bDVQrb+Dc5m2QMMhc6D+dABo=;
 fh=qTJ4q8Wkcf7q7drN06b5lPGe1FZ4mOUSun5n7X6w/DM=;
 b=KhTcAjcwkSJrZiJ3fo6VdoDfGuH5n9/JHwWRi9cIdCOzxmWLrKoLHWO2P4+Bf2kl9/
 n3bLm7vx70MaBMhLRSJuUnZDW77n71/cp0ynYQFhqOYMzriSwx9brC2OiTY1UzW6qNbD
 1J0GvRqmLZ1o9wV0DyXjqCkSRGJIDkFsYb3ExSd98p7/xTZlPfMMDkIaFhcmrPUtRAOt
 gf9QrhD1PlXe8yqRqwqlze677T62N0Ipgn+PelBMNI+k6yumF3gCdX490UXDsx+NIIfg
 qgyls3yJU1TpIUctsrI1XqHhKxd5S6w3mVC4olA8kCfqSIezTkTtlVeO40FfLcb4URTT
 3mlQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785511939; x=1786116739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LaXKHBEWUqsx51ozSN4bDVQrb+Dc5m2QMMhc6D+dABo=;
 b=ECIyP3WgZtz+/Spnvwn/AZaLeNX3JAvp+CZA467QeiZRxyHPnsBx/sAbnLN4APY6KG
 IgdT1yyXtEzK/z9DpCyWF6j+7sm9+uoug/BmXcQXfuuh0fVdKsk6Vvqqk3XVWmJQn/Fk
 zolLLHllAMu7JxJXMxoFD8d8jOfXmWCH5Y66JrHgugRTjVagTK4Md+0i7bvdwpsnzPxY
 uXZQwaV6HbJUmX7D56TKD7DgOi+ysRxpI/gJNsw7ykiahVICy9GsJiNmewKiQvyKdzCA
 Qod+2lZKO88r67LnRv2BM5uC3LCFGuIttzFKMVpnbAR0aB0GZmtfs19iyjGOJEyPu2bI
 5wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785511939; x=1786116739;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LaXKHBEWUqsx51ozSN4bDVQrb+Dc5m2QMMhc6D+dABo=;
 b=DwubEXgZl5q3R6txImj+JSap/iTxbyjUjAtMyMNVMhFV9L3mEpSXy4ODBIGH6bM7Sq
 pHTgJZsDecJsSffqTqlJpJJdmPG3hiuPqSwgUQqVEvB+r7lzFHf3V1jG992XvsBP83/Q
 Pqc6bnuu0Stc5JZEgEWfRZOhnliBMSYqK3H68IzsrMN4JSvP6o2OG8ecUbD55By48Lbi
 dnmLdYg3QpDgJiSEMd0ob/50rVYjgVEdtOv1veVrOJMq6OQjX+hMXnwGWeyGfsywXLnk
 pgynrdT9IJw97blFUWnMn/3q/jxozupy5ZpCCJZDfk3VCx8YoRdvVLI4K+2V8uWHnwye
 b+xw==
X-Gm-Message-State: AOJu0YwJRX7EG+B35hZg5fwKtVaDJnVscJysXDkCcOUkR0ovyAckA5cp
 1vE5swA0RSaZjnh1nYl3QdGRS0+eNT5Sdslqms68v4uJGEb16R1wxkft3ko/pErQp2cmKmdZVMk
 PvhEztu49bTM8wIk8XEVKlR+3DoE3Xw==
X-Gm-Gg: AR+sD11JzfWDgWwOr7tGA+QlXD//oOmnk7xBITgfCh4aSoW9vMn/oT4mkVANJKjBZXC
 Sy7VAfoJDhQJ1K/l61F6aK60dPzwTzPqyWXTHtaMyzhe8YgxGe2NUBF7Xk6tr8jdHpC+xFAJaB6
 h/8aXrwTDohrkG0vX9uhhEVe8iEClJZ3PzWcw5GHY2jHx7LyzAmczdZkUIsHCH3/Hl6yhJgOJHR
 hMOul0mZF78saa3nSDb5/LuAhMrshoJpawusHEa9Dpqg9prLZ9LT3Ovnv4T796nziWDRdI5OLHt
 k6gK2Umuo4yPRFqk5+HHrkjAyi6byobatGoUcnQbO8GXkZdE/jbrd1Q=
X-Received: by 2002:a05:6214:449c:b0:8f0:47b2:5734 with SMTP id
 6a1803df08f44-9084959c965mr7638366d6.7.1785511939059; Fri, 31 Jul 2026
 08:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAA1YtmtZu4xH0dFXUUp97Apz4wNAvtpY2=QfhKgpt1scMFpYqQ@mail.gmail.com>
 <CAA1YtmsiNJH2NyO3EFnLW6bfDs79xMHj5vRX6keXBd-5LemCxw@mail.gmail.com>
 <578a5bc236dd8af73693db217797623ce77aa868@intel.com>
In-Reply-To: <578a5bc236dd8af73693db217797623ce77aa868@intel.com>
From: Tadeus Prastowo <0x66726565@gmail.com>
Date: Fri, 31 Jul 2026 17:32:07 +0200
X-Gm-Features: AUfX_mzVqxtEWTzkWgqKrzIDznBimnMf10JqBSh3zD3VVWmmrySgBwBVuqHU9zk
Message-ID: <CAA1YtmuV3BwLyr-RZzpUADoJjpe9EER9i4s2M0DHPJpok2zh3A@mail.gmail.com>
Subject: Re: Commit 99cfbed19d06 at Linux kernel breaks AOC monitor 24P2Q
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 27, 2026 at 12:09=E2=80=AFPM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Mon, 13 Jul 2026, Tadeus Prastowo <0x66726565@gmail.com> wrote:
> > Sorry that I forgot to CC the maintainers in the initial e-mail I sent
> > yesterday, which can be found at the end of this e-mail.
>
> Please file bugs as described at [1].

Okay, I have added additional information on
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16735.

> Thanks,
> Jani.
>
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.ht=
ml
>
>
> --
> Jani Nikula, Intel

Thank you.

--=20
Best regards,
Tadeus
