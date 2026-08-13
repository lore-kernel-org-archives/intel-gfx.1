Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613C9C5DF66
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2026 13:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C710F352;
	Thu, 13 Aug 2026 13:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CjXM58ID";
	dkim-atps=neutral
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6854D10E0E1
 for <intel-gfx@lists.freedesktop.org>; Thu, 13 Aug 2026 06:49:46 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-66b2c08803cso2025806d50.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 23:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786603785; cv=none;
 d=google.com; s=arc-20260327;
 b=Yf1gT8zVS3rPwgjegAihP+xmS5GrYxjPU09DyphGywYusBT4ezAaXQiEYwxbBY4kVC
 khxsUzvOOfbk7yasZZfZfGscx/pWlHgiFNhwFUmpXpENx/xA//H/Ng1246HckIolZHdO
 3bMyqAh7UFkoIvNhrLJHME2f5XlrVegqnQTSNlTKrFoQXpM3mzjeUbgvY0gqKdC8LqoP
 4F0Z9WD3dX4YxF86IxGJ8mvgt1VCGe+hrza28m4yd7suSGIzcIENdgMBBEz8eOjaH56X
 neYKDdhs49XQD555mw1OlKhyE6u4zGUgZAOZqqN1vxx8ndzltPFCD9FP8Mx2p5LcQsWb
 dh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ekGdW2eYO2lOIBBZgTx2MF8tFA1VXLBcZFAQ3KWc9e4=;
 fh=Skm2yGNYwsqkPcy55qCdMUf678IIlwW+8yeux8891Ds=;
 b=Nn7IgRh0fdeHrk7+hF56ttDV7L8Et974DsZIN1gyxOhXxy7GrLFQgu1m+TurREpDrm
 l/MVnFuRJ8yCjAqqkiKB/GTIGJAzMCsNdNQfZyVUuEguEZJ4bmbjG670dJpvJW1ES/Rs
 IQJXPqXwMuPZzDCYjyiOXn5h4Mo4eEy4d0b8PNxsmjgd1pL5/dVCY5CgoEzsJW4sLJpQ
 8faxRJPkqukGXhCf3KSrU3q5//o3ht7bdmOeYEmNHkxV2OlEOviSg8vcbOUaVtA+9ayc
 OK1gQgyFZNlUPyJZ3tTjI7hxCp5/m3eL4SxX3+bcus678b+Z1grGCT2SMRhmPSJdgHJW
 CC4A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786603785; x=1787208585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ekGdW2eYO2lOIBBZgTx2MF8tFA1VXLBcZFAQ3KWc9e4=;
 b=CjXM58ID4daF0rMFMS/eAGcPGfxEKzZi9uKWVw57UYwwNtJgJ0tAmPriTv2tSREo9l
 r7yE323JpCOo/o85liAm5WC91tlaHjGHJYmsYqy2Bthv459Y+2NgoZR3lMvae3T8csZR
 FWo0vrO+E0HI/4AzG1hdf2c0SJdxlrKiVg2T9L9ElrzXmUjNkHjZAfbv8gibB6dm15PK
 1Cw8Y2Ihonpyey+atfh95nCruedah3FRQI4/FZNlzZS6rbjBD/thlezrWzxgHJyEt3b7
 GSd4GILwut6XLb2/WIFexmH7SWeckIUKLBoo3ZfOtcRxDRyQt4uRtJmepIFvkDRfb+sf
 4wWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786603785; x=1787208585;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ekGdW2eYO2lOIBBZgTx2MF8tFA1VXLBcZFAQ3KWc9e4=;
 b=LnL1xf2dwjg4p3+8grpqxAL7iW3fQcpvj4ibvLqdnxuOBzow0L0Meb4/Yw4aFO98IQ
 PQjTa8jk5Anaee5110C6BZhb+JP3f85kfzDEoz/A+Bq5hzLcXad9zrcBOKN0lIC5TleM
 Pb1q1ouPbsQHXPRq1ERIRpsvjoX5nDmYyxQD+2a7sBZ7lRWkUoitOVwmXdySiHvOV14U
 dAg+NB0WlOOB3COhD91ubG1zWIS/KuT9mYxMDny7Bm7gjdsjMSEiO4xpFjh6/uziOBEA
 ubkHRDfguaDCZG9N4SYg7enUN+B7pSJ69tQnVsyrAoqkl1awt5TzepSLZFwYEGsGJqjm
 g3lg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqxeC8rOBhT6Dpc30J9+VRD1DvEP2idNsVZWQDJHKAvg8dam3AUoNBu/7K71kovSOPHhFE7CNP1zzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwONaJaHtHrWko4JRJm5TARyqzCly/9OsAK3H5J6cy0U4e7DwaU
 GoJSpY2EpTtvJoQWgWIYJuyE18czEBeCyCbEYFc5WLd/Qy5MEw04As7UKMvYReSfunETK3EhtxQ
 TtqJgGLI67tinUSr8UAMkmhNl3Z3Zg2g=
X-Gm-Gg: AR+sD10FtQSeS1MIBSWpFRrhpX1/VP0oASH5L7AkB00MzJIZ4IU1cRgUklsBDQ/sxf5
 qxbqY0zTWKfMc/4xaAfXfaX+O7OGCbkYs2eghikJEnkY92QLGlD0P1yt4fhPGjiVlepqGsc2OYG
 tKebQif66SUlM1wXt1HaxQm0wEuSqYPas4jLforE9bm3uM4j7dmxs/pvg3gLohc8BMcvHVBjw58
 E1Ky52My/1XsgaXNubFo5aTVUORnZVCwQ0o9S73R5kRO1Os/w9U7V3qTqHa5CTAeGI23wgSizY5
 pWzaTY6l5iOSHkBI5HtEaQebnivNGn1PHQrleBCDcfYeA1L/qKZBsLO9x3ykxRMLrbROu2exuFC
 ZTwoQtO8xIcGvFRfdt9OIS+FC+JXimfzG++igmm0MC24s
X-Received: by 2002:a05:690e:583:b0:669:9498:3018 with SMTP id
 956f58d0204a3-66c517922fcmr1279824d50.36.1786603784947; Wed, 12 Aug 2026
 23:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260809090430.20577-1-kartikey406@gmail.com>
 <w3p7i7btvl6b7o5puofyxcjm362ni3mtcfmog2plm6h5wxk3an@dflvwud5t6zf>
 <cf0f4111c04ec71ae979b71c95fa1158c5e68a8a@intel.com>
In-Reply-To: <cf0f4111c04ec71ae979b71c95fa1158c5e68a8a@intel.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Thu, 13 Aug 2026 12:19:32 +0530
X-Gm-Features: AUfX_mxP6t7tFSfCkk-uHSOc2JdwpZ9HW9cJpOkY0Z8jfMuurlxTQAVf2aDT8NI
Message-ID: <CADhLXY4wnwAi5mL71s5XSEoqdKF=vDOHmO0uL_=mhdS+Zk4uOA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Guard against NULL driver_data in
 i915_pci_probe()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>,
 joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 13 Aug 2026 13:37:25 +0000
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

On Tue, Aug 11, 2026 at 3:01=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 11 Aug 2026, Krzysztof Karas <krzysztof.karas@intel.com> wrote:
> > Hi Deepanshu,
> >
> > On 2026-08-09 at 14:34:30 +0530, Deepanshu Kartikey wrote:
> >> pci_match_device() can return the dummy pci_device_id_any entry
> >> when a device is force-bound via sysfs driver_override, in which
> >> case ->driver_data is unset (NULL). i915_pci_probe() casts it to
> >> struct intel_device_info * unconditionally and dereferences
> >> intel_info->require_force_probe, causing a NULL-ptr-deref.
> >>
> >> Reported-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> >> Closes: https://syzkaller.appspot.com/bug?extid=3Ddb96c5ff032f4292a8dc
> >> Tested-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> >> Fixes: 42f5551d2769 ("drm/i915: Split out the PCI driver interface to =
i915_pci.c")
> > This "Fixes" tag should point to the commit that breaks stuff,
>
> In general, agreed...
>
> > I believe, so what you are looking for is
> > 7ef5ef5cdead ("drm/i915: add force_probe module parameter to replace al=
pha_support")
> > since this patch introduced that unconditional dereference.
>
> ...but that didn't introduce the unconditional reference. I think it was
> always there. We've always expected .driver_data to point at whatever we
> have specified in MODULE_DEVICE_TABLE().
>
> I'd just slap a Cc: stable on it without Fixes.
>
>
> BR,
> Jani.
>
> >
> >> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> >> ---
> >>  drivers/gpu/drm/i915/i915_pci.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i9=
15_pci.c
> >> index 82415af47d54..2f03f95945f1 100644
> >> --- a/drivers/gpu/drm/i915/i915_pci.c
> >> +++ b/drivers/gpu/drm/i915/i915_pci.c
> >> @@ -958,6 +958,9 @@ static int i915_pci_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *ent)
> >>              (struct intel_device_info *) ent->driver_data;
> >>      int err;
> >>
> >> +    if (!intel_info)
> >> +            return -ENODEV;
> >> +
> >>      if (intel_info->require_force_probe && !id_forced(pdev->device)) =
{
> >>              dev_info(&pdev->dev,
> >>                       "Your graphics device %04x is not properly suppo=
rted by i915 in this\n"
> >> --
> >> 2.43.0
> >>
>
> --
> Jani Nikula, Intel

Thanks for the review. I have sent patch v2.

Deepanshu
