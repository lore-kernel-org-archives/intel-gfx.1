Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC59C982DA
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 12:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F92510E0E2;
	Fri, 18 Sep 2026 12:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="d4Qik8Go";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X4xqnbFk";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142D10F276
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 12:36:38 +0000 (UTC)
Date: Fri, 18 Sep 2026 14:36:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1789734997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBjwMFuKbvsgU7YbbbeVY24UWFLer0wqy6y+8C56WXc=;
 b=d4Qik8GoBw4s6gL1f823HsFZHjZctxud0phWiR2gzzYrK8x/jfIEqED60aHDTQRLyPKzwN
 vZbrTjD87sUpeJ56N1BKt9e1qpdeODdOCNrrdJOC8WttSEBwgyQJefWh0Yn6fqmHqAPN8F
 DFZcBVNgEapetmiJxqM0THI928xj8jxZkcRc4wZcPakAxyzjlIvn6t9NHOjbxbj/JrCK+u
 XGPI5LuP3R3O19ohJMnzW/VS6Ln9DVjm71vzGLxnuk5UYJnn/FA1pF8kXm8sMXb6gqV7dT
 HpGcEJ34BqB8lH3gCLg7dWFwiJNa/pjy0bxGzZGWL7RKWVxN6gGx66FBSsHvRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1789734997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBjwMFuKbvsgU7YbbbeVY24UWFLer0wqy6y+8C56WXc=;
 b=X4xqnbFk1dnt7rZu+ywK0gyoy0g8p0UME+EydAkCmQrlDretA0L9eg6h8g53NyPXOFthdh
 q3MSgUgb7wlNBbAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915: Use %p for pointer formatting
Message-ID: <20260918123635.aEFLyRcK@linutronix.de>
References: <20260918103725.cfYzL1Wt@linutronix.de>
 <DLIFC0Y2I5M0.2322C84W8AYDB@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DLIFC0Y2I5M0.2322C84W8AYDB@intel.com>
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

On 2026-09-18 14:00:15 [+0200], Sebastian Brzezinka wrote:
> Hi Sebastian,

Sebastian :)

> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -179,7 +179,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struc=
t drm_i915_gem_object *obj)
> >  	struct i915_vma *vma;
> >  	int pin_count =3D 0;
> > =20
> > -	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
> > +	seq_printf(m, "%p: %c%c%c %8zdKiB %02x %02x %s%s%s",
> Please, correct me if I'm wrong, but i915_debugfs_describe_obj()=C2=A0
> prints into a debugfs file read by userspace exactly the case where
> Documentation/core-api/printk-formats.rst=C2=A0recommends %pK=C2=A0over %=
p.

I should probably get rid of this, too.
So we do have %p and %pK by now and both return hashed pointer unless
overridden. K can have a security policy which can only work in a user
context. There is a different override switch which does not make things
easier. The vast majority of users are gone.

> >If (and only if) you are printing addresses as a content of a virtual fi=
le in
> >e.g. procfs or sysfs (using e.g. seq_printf(), not printk()) read by a
> >userspace process, use the %pK modifier described below instead of %p or=
 %px.
>=20
> And it was addedby 2563a4524feb, which explicitly wants to
> guard it with kptr_restrict(i mean that it's intentionally stronger).

Please look at the timeline:
pre v3.9-rc4, %p prints the bare pointer
v3.9-rc4  2563a4524febe ("drm/i915: restrict kernel address leak in debugfs=
")

(%p -> %pK the leak in i915/debugfs is closed, %p still prints the bare
pointer).

v4.15-rc2 ad67b74d2469d ("printk: hash addresses printed with %p")

now %p does not leak the pointer, too.=20

Sebastian
