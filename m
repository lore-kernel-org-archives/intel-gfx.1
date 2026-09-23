Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306D9C982FA
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 11:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A756810EFE2;
	Wed, 23 Sep 2026 11:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nX1/DtsJ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C5810EFE2
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 11:28:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 33D7741072;
 Wed, 23 Sep 2026 11:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DC51F00898;
 Wed, 23 Sep 2026 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790162936;
 bh=8VlQIonqTtzxEPvNCdffmHMeIKXMqoI8HOdC143mMAk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nX1/DtsJ8P8XYO/srD2lZuPyBE2h7rBEZGfmE2/LBIyPA47OmjryGe6q+eBTRHa48
 iJS5TTVFp3zvLi9LRydXzuQFLIl9vywG+ToKo2fkUsLyqkzrj0uAXDoeawZcqixsbD
 VESQ4rO/wVAU3x3EshSlXcY/vMzziWqnftpTAnD/qOkbOgSc6FEC+XKB5+lumZJaYA
 Kq0YMi/MnTrGgJ5FONB+lNBozKm3iMG8LKnZ0KWgRdWTr75enjWaCwDm8UmlAwSZe0
 5vuC6eJUWRxmyCB9DzuiSFv2iYVHo9QfL+/tPJkbjqch3b/F0hTPfLI9NWiyK5D9mp
 iRcwOPu8cKbGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] drm/i915: Use sleeping selftests for igt_atomic
 on PREEMPT_RT
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260923111518.310430-14-dev@lankhorst.se>
References: <20260923111518.310430-8-dev@lankhorst.se>
 <20260923111518.310430-14-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 11:28:55 +0000
Message-Id: <20260923112855.F3DC51F00898@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/i915: dead data in igt_atomic_phases and truncated commit messa=
ge
--

commit 321dc694013c1b67cd828bf70f5c9cc0726f1768
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/i915: Use sleeping selftests for igt_atomic on PREEMPT_RT

This commit updates the i915 igt_atomic selftest to use sleeping test
phases on PREEMPT_RT builds. It adds PREEMPT_RT specific phases and
terminates the test array early.

>     All of the i915 code that used to run in BH's, IRQ's, etc is
>     converted to preemptible code when compiled with PREEMPT_RT,
>     so adding coverage for those situations would require

[Severity: Low]
This isn't a bug, but the commit message is visibly truncated mid-sentence
here.

> diff --git a/drivers/gpu/drm/i915/selftests/igt_atomic.c b/drivers/gpu/dr=
m/i915/selftests/igt_atomic.c
> index fb506b6990956..8ae39cf570b76 100644
> --- a/drivers/gpu/drm/i915/selftests/igt_atomic.c
> +++ b/drivers/gpu/drm/i915/selftests/igt_atomic.c
[ ... ]
>  const struct igt_atomic_section igt_atomic_phases[] =3D {
> +#if IS_ENABLED(CONFIG_PREEMPT_RT)
> +	{ "sleeping", __nop, __nop },
> +	{ },
> +#endif
>  	{ "preempt", __preempt_begin, __preempt_end },

[Severity: Low]
Does adding this early null sentinel abandon the remaining elements
("preempt", "softirq", "hardirq") in igt_atomic_phases as unreachable dead
data in the binary on PREEMPT_RT builds?

While this avoids unused function warnings for the callbacks, it leaves
unreachable data in the array. Could the remaining elements be explicitly
guarded with an #else instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923111518.3104=
30-8-dev@lankhorst.se?part=3D6
