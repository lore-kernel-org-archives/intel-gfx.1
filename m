Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B6606A338
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVaGFt8l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989B810EB10;
	Thu,  5 Nov 2026 14:06:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D7510EE2E
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2026 06:05:05 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3b09cc7ed1aso150721a91.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 04 Nov 2026 22:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793858705; cv=none;
 d=google.com; s=arc-20260327;
 b=DS9ErrxzTcTlZJxiHPHCoLHzcDiWPBQdhFyY/83hkGkRtJsztrkNqVT9jusGtubPqv
 sd72qoHWJcWbzgrjP0fTaXcED4nyWV58GXUL7HcBJlf22aXtaVsfae+RYl7WzVw2q0Ak
 BwkQnT9GGwAVCZReQRIEAoSqnqzaUWszzZHgV5MFNcja8fBugj1nQlwj8T6sROmPvuZh
 zE1+EVO4kKSX3K4YZ4V3j0eEytswxyoRdEwYes1YOe9O+pZCpkzes40qBwpXdFO6SDIS
 ABrN+TiQdzQGU1BRelrRO2ADPFUYGJaxnMh5ibmtI3L22QtOyph247v4Lz+HgOMWg84U
 AWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6CvS81jcXvcMzjusuBb3temDMl3RUTwUEKg0ZWsbrIA=;
 fh=dqFre35g+8GVtRGtbSYLb1DaDk4wCwkshjCJ5gFOCrk=;
 b=BpzzeHcUu/Pb0Wd4Jl2SKnXbJfvMGRk4A7Fdwk7judL4FZXOySPpksehCqOwb/QV3F
 3v25OES6s5P0NjV+hkL5C4no22BkTHT7JxNv8jcBIME+RIJrTSz9o8QGJyM4GJeESsge
 mhy4MRxlIATdKMUMOJblrXcM/lt2feB/5OvCO5IVE6ZcUKHRRvv/4BMe5Yes7VNLxTiF
 m/xoPCh7h90wUUbYYJ2/maFGklCDmAaV6fHnGEUCzexc0rEVu/RkaC0KaGcYt2tz9Ux0
 1cHDGeBwPB9Gp1iRLnTGowPcSq/ga9hFAihtqriffRYK/eLQcJ5GAfmpK3TqiQc8kI1p
 5yQg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793858705; x=1794463505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6CvS81jcXvcMzjusuBb3temDMl3RUTwUEKg0ZWsbrIA=;
 b=aVaGFt8lGuTDc3ZKQMPDU1HIZlKpmvll980XiqHn3VKuTWg3LvlAT4QM6GzGilXJPE
 yCpZX/Frtfd04WFCpJIPyl8TFR309povbUXoWQYZEgYfpKAhKFFw+Xc2ZsesojuZnlIJ
 yw1cEfYdp/U891u60UuaCK6MFck7Ivzh+I0qojCS7ieWOotkB0UEJWUYQjlzuzwesTbg
 lu4kgwA1HdPFc+bcRfLOfdIKb6Hz4UnqJUtJ8oMqbeLmhURlOx6+koKVDHDfH7rWlzGr
 9MlOgr5wXutRhjX1xtCSudKFeLD2h7vbf+Ia8QWMDAYLiIBLW/wm3l3RU+I11qNRfaba
 3Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793858705; x=1794463505;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6CvS81jcXvcMzjusuBb3temDMl3RUTwUEKg0ZWsbrIA=;
 b=xc01L1ZUEsXrePROO/kR6fUVA8axFTVF6fl4AOyWNHJk2bJXzS405QJGNKFpoKTxgM
 DciSCbdaecCYIOjkZqgTRqf02cardcUi7XvT1AGMQhu1HWGLw0yOvIQWwWFN+hA5xYdu
 Wcd1NCfVk3w4Zrl0qQ0v3ywlkLWG3+SVauAyMI7wiGS9vTZEl5FcS0mJ1Dgtz216VXcU
 II++C3zO79+YrM2v/e6ut1UdnMvxnLE25KC4h/khcI0FGf1iQiQbcJfM75tlpBwRtTqg
 VYaE3tXxacLDayuYABFB8T01lWHiufYKlnKkJ9dr9joD00Yz7wgw8Ry3aH7JqRifa6Pk
 nN/w==
X-Gm-Message-State: APuU4Z/J91Oh27UgQ8JVN2fJEOT/QEm6T43SrSWBznib50V9t40Y9jU2
 GYitug0WawMl5OoDf9iHKP4MZOKtb/joWHs6hKK6TjSa1aYemrzyoaO+p7mjTEzJpiBqb/sGuWz
 rYGvRyXbDc4W3YGN+baBW8RfmD6qAtcY=
X-Gm-Gg: AYBFou1H/FqOSjN8jVdfmuJIMWt+pdvqVaxfC2wDv5PcvnjuRnX/pevCAZFosZ4SCk3
 j8Z9CCJLzm7PndlZ96HOXYiL3psjp5wfxh3BWISfA9sj+o6KiLVwBGMvucskY2UTWB/a3qJ18+O
 yXkt0/2yqJz99E+aBzRJ+ay+TQ7UZQJ3a44Yz9iDR4+9AxtHAJ6vtvhgndkRKtAg+iT8htfNQkU
 XDXB4tlLZg4mWcOc368bIRrYYS/Lb3PxQ3CYj0awk7TxgAn6DLWgVgyuEiQPs7yfA7+IYzgRpDy
 dTkQMBzLZCICad46DlE+BnwsHxXARLzCqgM1xu/e4ie+3ReO3jva/OZdVjBVTz9W1X+9oY3rnKu
 ag6ltRUSlv/jxq3HDin13EAofugVgxrJPDzCM8Q==
X-Received: by 2002:a17:90b:1dc9:b0:3ac:9e76:aa96 with SMTP id
 98e67ed59e1d1-3ae897c3585mr26038759a91.3.1793858704906; Wed, 04 Nov 2026
 22:05:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104073311.1617823-1-lui2012qwq@gmail.com>
 <20261104073311.1617823-2-lui2012qwq@gmail.com> <autMrRaeVWRtBlMP@intel.com>
In-Reply-To: <autMrRaeVWRtBlMP@intel.com>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Thu, 5 Nov 2026 14:04:49 +0800
X-Gm-Features: AclHuK8ozyuxeuE45nFShHA9M9CtlCzBTDmn85bOzlVMDFkVYC2_DYt8S7C3UEg
Message-ID: <CAE=Q7=542V6Sf06r_WvGb4Hw0VrPK0vV=yU1OmoW6yhSiD4jEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] i915/gt: tolerate ERR_PTR pd in gen6_ppgtt teardown
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 05 Nov 2026 14:06:18 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026, Ville Syrjala wrote:
> The correct fix would be to not assign the error pointer into
> ppgtt->base.pd in the first place. [...] one should always use a
> local variable first, and only assign the final pointer after having
> checked that the pointer is valid.

Agreed, that's cleaner.  v2 does exactly that: gen6_alloc_top_pd()'s
result goes into a local first and ppgtt->base.pd is only assigned
after validation, so the field can never hold an error pointer.  On
the failure path it stays NULL, and gen6_ppgtt_free_pd() now bails out
on a NULL pd (the cleanup path is reached with nothing assigned).

(gen6_alloc_top_pd() itself uses the assign-then-clear pattern for
ppgtt->vma you described; this patch doesn't touch that site.)

Chengyu

On Wed, Nov 4, 2026 at 11:18=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Nov 04, 2026 at 03:33:10PM +0800, Chengyu Liu wrote:
> > gen6_ppgtt_create() stores the result of gen6_alloc_top_pd() into
> > ppgtt->base.pd and, on failure, jumps to err_put with the ERR_PTR still
> > in the field.  i915_vm_put() runs vm->cleanup =3D gen6_ppgtt_cleanup(),
> > which calls gen6_ppgtt_free_pd(), where gen6_for_all_pdes() immediately
> > dereferences pd - with an ERR_PTR that is an invalid dereference and a
> > crash (in the async release worker).  The free_pd() right after is only
> > guarded against NULL, not ERR_PTR.
> >
> > Bail out of gen6_ppgtt_free_pd() for an invalid pd and skip free_pd()
> > likewise, so an allocation failure under memory pressure stays a plain
> > -ENOMEM instead of an oops.
>
> The correct fix would be to not assign the error pointer
> into ppgtt->base.pd in the first place.
>
> Looks like a somwhat common bad pattern in this code that
> received pointers are assigned directly into their final
> location, and if the pointer is an error then the pointer is
> cleared. IMO one should never do that because it's very easy
> to forget the clearing part. Instead one should always use
> local variable first, and only assign the final pointer after
> having checked that the pointer is valid.
>
> >
> > Found by static analysis.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i91=
5/gt/gen6_ppgtt.c
> > index 438cd4724a..72a9ad4642 100644
> > --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > @@ -259,6 +259,9 @@ static void gen6_ppgtt_free_pd(struct gen6_ppgtt *p=
pgtt)
> >       struct i915_page_table *pt;
> >       u32 pde;
> >
> > +     if (IS_ERR_OR_NULL(pd))
> > +             return;
> > +
> >       gen6_for_all_pdes(pt, pd, pde)
> >               if (pt)
> >                       free_pt(&ppgtt->base.vm, pt);
> > @@ -271,7 +274,7 @@ static void gen6_ppgtt_cleanup(struct i915_address_=
space *vm)
> >       gen6_ppgtt_free_pd(ppgtt);
> >       free_scratch(vm);
> >
> > -     if (ppgtt->base.pd)
> > +     if (!IS_ERR_OR_NULL(ppgtt->base.pd))
> >               free_pd(&ppgtt->base.vm, ppgtt->base.pd);
> >
> >       mutex_destroy(&ppgtt->flush);
> > --
> > 2.25.1
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
