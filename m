Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA769C5DF8C
	for <intel-gfx@archiver.kernel.org>; Sat, 22 Aug 2026 13:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F5D10E3FD;
	Sat, 22 Aug 2026 13:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMYYaEoc";
	dkim-atps=neutral
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1420895EE
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 14:07:43 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-51c1372f84dso6320581cf.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787321263; x=1787926063; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QHJgjLvgHDbYJ/uRAJqtcFTfRjwoYjG5WYJnARLGN6I=;
 b=FMYYaEocRAgq0aHEtb0xJ1BtA4WL9iU3S93r37oQq6Ampqv+bVTZHHJoe4XfCtzwQJ
 onWsDnP75JFehE9LKp7JFzG0gi0S/b3PNvsK7Be5JP/uVJSVfregVhhgvEmTEWCwFlGI
 qkeG4jhEpRHgQkYGlGAUtteipaRE7yPxqJvn/ddxyncmtXcTM3CiE8oermXG63c27Vg4
 /P9IMgZRmaJEHGhg4kAtvGHg9SBX/MoGgerAL6PmD+ikxCI63xgEFEdXxSVUH8r9kheQ
 rFDFFGrVFopHemRXI1PwWhnigmRJVIaIe8fb/NwYn5f46sWqEwYFX9oK1BhbGtNx0tQg
 vzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787321263; x=1787926063;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QHJgjLvgHDbYJ/uRAJqtcFTfRjwoYjG5WYJnARLGN6I=;
 b=Aasx2sX/1GC0Wcu+2dD461C8p5bt/MNeewM2D2Khqsw3eVL6VjU3PbSWx/++rV7LAQ
 yIt/BqUDtT9kPcsBxecF02KbbOGez54qrLrwZlIjPt7sDoXhfYUEfSFpwd7wjE5SXAgT
 eMs0YFCBm9U8A+DZYbDe78L+zQYbnmPKHi4Pax5zYrR2IhKuruq/nzLSTraQHabwaccL
 yXV1lmkHFy1Qcw7JIoYhmyC/E8P4m65j7FnY9Gvn9Dgt/kzCjfpNsbYPwvfNoYma4XP/
 0qeggKYI6ryOoEUhfzkDdsNqb7mojKfjdZYz5g5hG+YEaJSXlS7yI7hTTXURfHTWWCSK
 WEgA==
X-Gm-Message-State: AOJu0Yx0x7YhT2gCNcT+6w8a1vIP/PHDbazplLJU1mF8j9TUCdwjLuKG
 MsvynHm2zx0EHG8m5TCVPOJ2LUoOCj8SphIK2Qo8rrcFM10eQ/ySYDk/
X-Gm-Gg: AR+sD11DCtq76kcmjDCmxsKajaRztkkF85mu7RB88OiQAz3qAt5ByU9hPTUsn+KO/Wk
 FsFdDNPciX/5VcXTnTsu8Hd9STbsf9cbf80lDgAk727lGFpRtu9BDR3lvouukdXzCDEDtStgond
 Y/TCjCGmKtfJ11fx7bKF2tcfVZ0VKSpcJe4ZfPBhBxklb+kAs4m2jTkj7PM7ZgqokfTuppqlFtl
 HRLD8JBf/9rsZJhLtKehpWgurwHE6DZDl9DG5vNCrHnVxFiBCcORe++WDJBwRv+cuCC2FlbrhUZ
 AFFA/UfNMwkr7g4ROSc3q/93QY/9QZKmIYJcFSehajGfx0qwt2VJnFJ++sxG7JE7Hjn6H7uKS43
 g63IrkjqiFAH5bLbakMEXSS2oN/npQax3b5BgBrIAere34GKH7BOYK5bl/z9GmAuU4SDF5IIVSW
 U/ncnOYWyM4WiI93/iDomrU3p8q7lzmF8lw23z3QOik3HHCNae3do+dgM8em/jeiwV0mLgsBorw
 D8gDe5Shb/bghtXDeqn
X-Received: by 2002:a05:622a:5c14:b0:52d:3ccc:968b with SMTP id
 d75a77b69052e-52df56e4b5dmr59495521cf.9.1787321262531; 
 Fri, 21 Aug 2026 07:07:42 -0700 (PDT)
Received: from smtpclient.apple ([165.85.199.100])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f2a2d62sm62929666d6.38.2026.08.21.07.07.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Aug 2026 07:07:42 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v4 7/7] drm/i915/gt: Use signalers_lock to prevent
 starvation of irq_work.
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <5c4b9949-506b-4a01-b390-a83ec5d63fd5@lankhorst.se>
Date: Fri, 21 Aug 2026 10:07:09 -0400
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bigeasy@linutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <ECED6685-78D9-4B31-BEF3-5ECEA21EA492@gmail.com>
References: <20260706114823.752313-1-dev@lankhorst.se>
 <20260706114823.752313-8-dev@lankhorst.se>
 <20260821022530.2503120-1-shuangpeng.kernel@gmail.com>
 <5c4b9949-506b-4a01-b390-a83ec5d63fd5@lankhorst.se>
To: Maarten Lankhorst <dev@lankhorst.se>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Mailman-Approved-At: Sat, 22 Aug 2026 13:06:52 +0000
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



> On Aug 21, 2026, at 07:45, Maarten Lankhorst <dev@lankhorst.se> wrote:
>=20
> Hello,
>=20
> On 8/21/26 04:25, Shuangpeng Bai wrote:
>> Hi Maarten,
>>=20
>> While reviewing this series, I noticed an additional request lifetime
>> issue in signal_irq_work().
>>=20
>> The existing RCU loop removes rq from ce->signals and may then call
>> i915_request_put(rq). If that is the final reference, the request can =
be
>> released and its SLAB_TYPESAFE_BY_RCU slot reused before
>> list_for_each_entry_rcu() advances and reads rq->signal_link.next. =
The
>> RCU read-side critical section does not provide a stable reference to =
the
>> same request object in this cache.
>>=20
>> The v4 conversion to signalers_lock/ce->signal_lock and the
>> list_first_entry_or_null() loop removes this post-put dereference, so =
it
>> also covers this UAF path.
>>=20
>> This is independent of the PREEMPT_RT irq_work starvation trigger. I =
can
>> reach the sequence in a diagnostic run, although KASAN does not =
reliably
>> report it because i915_request uses a SLAB_TYPESAFE_BY_RCU cache.
>>=20
>> Since this also removes a request lifetime UAF from the common =
signaling
>> path, it may be worth considering the relevant fix for stable kernels =
once
>> the series is accepted.
>=20
> The original patch for the conversion actually had this bug. There =
were some
> failures reported by CI, pointing to a use-after-free after the =
changes.
>=20
> Originally I thought it was due to the conversion itself, that the =
lifetime
> was previously sufficiently by RCU. It makes sense that RCU itself =
couldn't
> properly protect that, and that relying on it was a bug to begin with.
>=20
> Thanks, I'll send this patch again separately and attach a stable tag!
> Since you reported the issue, would you want to put your reviewed by
> on the patch as well?

Thanks for checking this. Yes, please add my Reviewed-by tag:

Reviewed-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

Kind regards,
Shuangpeng

>=20
> Kind regards,
> ~Maarten Lankhorst


