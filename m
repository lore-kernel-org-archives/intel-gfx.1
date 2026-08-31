Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD76BC624C6
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 11:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B5C10E7FC;
	Mon, 31 Aug 2026 11:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JKAZViYZ";
	dkim-atps=neutral
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E1410E22B
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 00:14:01 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-9390f8a1c9eso187636285a.3
 for <intel-gfx@lists.freedesktop.org>; Sun, 30 Aug 2026 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788135240; x=1788740040; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KeqftXhgmq02BoO6G1HLtpAULPLshwJFEBqpXSiTygQ=;
 b=JKAZViYZZaifGI5eCIW2MKjdKa46XyAJ4kNzEcjK8OSg1zhK3HjppakjwBmbSTtOgC
 jT6AyZ4eieHjIRXmEcX+SqnTAuusiChkM5g/J5HKo8lQczu2FeIlJEujJBzVlroT7XtQ
 QE4uBSC+JGq1g5R/MPqbJy/3s4eXNSF4U3OIAZ9/d1pvdLxC/t7oqL//gTYFybFjJkzq
 dEtTQZwM5RPEe/iy2LGt0gAU4ErXPEQZGrposrG/5mPNdh+KQ+kdpGstRd0EVHanFYEg
 9Asg4in3oklcrefMesGIXndGff2Rqw01nuJlOJqdfiWfbyhdEVHPw1rvXcGGZxFbPQ7S
 +g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788135240; x=1788740040;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KeqftXhgmq02BoO6G1HLtpAULPLshwJFEBqpXSiTygQ=;
 b=qkqEtv+t6J/Vz2XhIAHXLatKZvEwNN4Mi595/agTYV2GcOXTjFjfCdNiix1E57EXxl
 1LVe7rPfBkjX+Wb3Re/Fg1QvtODSgj4b5qw1llBE3KwB7KdqctSHgOZ5oIBlptv2NrU2
 PMRn6oYX4A/hP6OlrFkqetHH+/Aek5LfaJPmibhIaWj7tEczwawGVcnEjZh1jm45nOnG
 5imhXicupWZ9zZS66MNzaGLpeMhOExACtkIfwigGmyrfNV+RkhZs8pz5HJ2WAfQT1DHh
 vyZIFIuk1zIZR1RbXMnP54/Uvcj7FnYpOgU/OFG40+6vmH6C+kz2KVarjtgQAJc0cNqe
 uOjw==
X-Gm-Message-State: AFuF++k35tN/tmsuhDjVCJLQIb7OdLHQFcixdQwldkmLwVhpvZeazHhh
 GdLyZ/RVUavE7Q9zGGCBzjcu/5k5RqR+xTOjDbe+YAq53EhuBI0Pyhet
X-Gm-Gg: AR+sD11RVV32jqRQdK2i6z7yTLdYLLh2mA8lpHHUvy9gHhRVaf6YN1GUHP8I8ZoiteT
 kEYkbOkY3dQWKH3q8rITWi0e1FE1k2iKfBIuL1Tqr9B1JkfzSCW6Je8FaBf+EoKR9y2EnWIBgE2
 yUg+jb31wvkiGpCks8mflpm7Y192pBp/TYlDpnrMzE9HFNc9yZLleINfhhZqzkqz77Kodh1Zz5D
 bnAjV8Bzzfsol7FUyVBncF+k7ahOyZoyq5cETcpq/TsrCATKoy1VT/HUPCmoVxPi8UF9Cw+sw3u
 u9QxXx/wrO2esU5mUIJzx943RvKzYtNIBpJQsRMdadxZjfpL7b/TEw+WvF2adgveEgEN3vBgLRq
 Yi6UWrOjJnF118bFIQtT/z6n1VqCI/QxioVdwaPHda5/S9zn1nssr5O5qBClipqiFugsb8TWnK8
 w12m+JqlZzqpqFsO/4jsV0EfoQzbTjs2LdNN2Cf4SqEPDpBFdrnyWwMZh5/i8N/tTmKGr3YDTLu
 i6yokdOv8F+3YbE6VXFMom2KR0Pgg==
X-Received: by 2002:a05:620a:4556:b0:939:28ab:e90 with SMTP id
 af79cd13be357-93928ab142emr1090242685a.0.1788135240228; 
 Sun, 30 Aug 2026 17:14:00 -0700 (PDT)
Received: from smtpclient.apple ([199.30.143.73])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9391703a49asm665449285a.11.2026.08.30.17.13.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Aug 2026 17:13:59 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] drm/i915/gt: Fix request use-after-free in heartbeat()
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <apSwfmDiwsuyQT6I@zenone.zhora.eu>
Date: Sun, 30 Aug 2026 20:13:28 -0400
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA6527E9-BF25-4EAC-AD11-7B2F92A3A01F@gmail.com>
References: <20260808184302.1509585-1-shuangpeng.kernel@gmail.com>
 <apSwfmDiwsuyQT6I@zenone.zhora.eu>
To: Andi Shyti <andi.shyti@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Mailman-Approved-At: Mon, 31 Aug 2026 11:47:31 +0000
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

Hi Andi,


> On Aug 30, 2026, at 18:44, Andi Shyti <andi.shyti@kernel.org> wrote:
>=20
> Hi Shuangpeng,
>=20
> On Sat, Aug 08, 2026 at 02:43:02PM -0400, Shuangpeng Bai wrote:
>> heartbeat() detaches engine->heartbeat.systole with xchg() before
>> checking whether the request has completed. If the request is =
complete,
>> dropping the detached systole reference may free it. Concurrently,
>> idle_pulse() can observe the empty slot and publish a newer request.
>>=20
>> The worker then sees a non-NULL engine->heartbeat.systole, but =
continues
>> to dereference its stale local rq. The newer request can therefore =
make
>> the shared-slot check succeed after the old request has been freed,
>> causing use-after-free accesses to emitted_jiffies, submit, and =
sched.
>>=20
>> If the detached request is incomplete, heartbeat() can also overwrite =
a
>> newer request published by idle_pulse() when it unconditionally =
restores
>> the old pointer.
>>=20
>> Use cmpxchg() both when idle_pulse() publishes a request and when
>> heartbeat() restores the detached request. Drop the detached =
reference
>> when restoration loses the race, and reload rq from the shared slot
>> before dereferencing it.
>>=20
>> A KASAN-enabled i915 mock selftest reproduces the use-after-free =
before
>> this change and completes without a report after the fix.
>>=20
>> Fixes: bf9bd6a5128a ("drm/i915/gt: Track the most recent pulse for =
the heartbeat")
>> Cc: stable@vger.kernel.org # v5.11+
>=20
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>=20

> Your patch looks correct, although I don't think the Fixes tag
> is.  I believe the actual fix is:
>=20
> Fixes: 4c71fd099513 ("drm/i915/gt: fix refcount underflow in =
intel_engine_park_heartbeat")
> Cc: <stable@vger.kernel.org> # v7.0+
>=20
> That commit introduced the early xchg() which hides the old
> request from idle_pulse() and replaces it with a new one.
>=20

Thanks for the review and for correcting the Fixes tag.=20

> I'm going to resend the patch so that it can be picked up by our
> CI.
>=20

Thanks for resending it.

> Thanks,
> Andi


Best,
Shuangpeng=
