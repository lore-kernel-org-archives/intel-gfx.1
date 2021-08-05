Return-Path: <SRS0=p3Ij=M4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7BFC432BE
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Aug 2021 22:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CADE610CD
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Aug 2021 22:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CADE610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04306E09F;
	Thu,  5 Aug 2021 22:58:44 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1496E09F;
 Thu,  5 Aug 2021 22:58:42 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m12so8564548wru.12;
 Thu, 05 Aug 2021 15:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q6beibzNrILHq2SGf9/COm2CxcmfWx9qSxPEsXfxPtw=;
 b=uNPbQwXzK6ouX5+p8QgoDFyf/NIPsbdwWueKLuI4V9JnYMwxCFtlxOAatI83UljIzU
 2EqTDXeUqwJHIWDUgztaATkmLbK5KEMY3vA/RR9DF3nyQmpfL6mYYw9raKkpiX910SGY
 +bzOlnew+FAC5v4QGPN8V4suXFMEv2wja3fav3Vr6NaFnDdi2wRQsnTxvZpAbb8XHhJb
 v27feG5SYEZc2xwnJAq/BCKKW5DG0YUn/fhyTg75Gdj9K79SHoSmGg9NSY1QArSnhep+
 P1ikQyb0GNisUnnUCAWuYxLTFGDkQdyDSyS5v9k/bxh9W/AN5iBS8LXQY1CY5J5gFwI8
 a8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q6beibzNrILHq2SGf9/COm2CxcmfWx9qSxPEsXfxPtw=;
 b=bZglLSJezrxcU5J59rOnzH9K6Tuvk7YWKIwy5+PVgz3dHynGty10DM4+f6Z4BmBUXi
 /t4OhlZsDxDjnH2UTi5YsEtNmraiuUyJ94fC6+dyHNtWV4s8jcBLvYZGS75SFe8rkWyG
 szwBjJzwWQlh4X1U1PLtOCSPeAmCjGcgBXU4nrZRbeW7pfqxHCA3/mwYYs4De7ITIIlN
 6uB6xNLTsuHP5grgQriUi/boa1s7ePbQsE8GenwEYCsqzojkm+r9ZbXl/x3iyuQvnumM
 7sW8U1R8putm69m6N/LmEWSEEjdan1Byk7LZ3UjWXACX4KXD55pMdakEWPWZyqtCi7R0
 x2jA==
X-Gm-Message-State: AOAM531bicvdJIj45P8L/EtQ7ATv02ibAkSdjPtdvGgYTRelfz3erXWC
 sbuntPiCJk989odt6wh7zrL/h1WaaxAfWXlFlNM=
X-Google-Smtp-Source: ABdhPJwkqoi7Te+8IVA6FyKKRv4mbRhIKOatAn/IO6gqCZx4Kj1mou4VEJhavjSimHsrRoYATzTuNhXPQ7l4hmxuN5E=
X-Received: by 2002:a05:6000:1ce:: with SMTP id
 t14mr7751825wrx.83.1628204321241; 
 Thu, 05 Aug 2021 15:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210805104705.862416-3-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Aug 2021 16:02:56 -0700
Message-ID: <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v5 02/20] drm/msm: Fix drm/sched point of no
 return rules
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

On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
>
> Originally drm_sched_job_init was the point of no return, after which
> drivers must submit a job. I've split that up, which allows us to fix
> this issue pretty easily.
>
> Only thing we have to take care of is to not skip to error paths after
> that. Other drivers do this the same for out-fence and similar things.
>
> Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 6d6c44f0e1f3..d0ed4ddc509e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       /* FIXME: this is way too early */
> -       drm_sched_job_arm(&job->base);
> -
>         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
>
>         kref_init(&submit->ref);
> @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>
>         submit->user_fence =3D dma_fence_get(&submit->base.s_fence->finis=
hed);
>
> +       /* point of no return, we _have_ to submit no matter what */
> +       drm_sched_job_arm(&submit->base);
> +
>         /*
>          * Allocate an id which can be used by WAIT_FENCE ioctl to map ba=
ck
>          * to the underlying fence.
> @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
>         if (submit->fence_id < 0) {
>                 ret =3D submit->fence_id =3D 0;
>                 submit->fence_id =3D 0;
> -               goto out;
>         }
>
> -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>                 struct sync_file *sync_file =3D sync_file_create(submit->=
user_fence);
>                 if (!sync_file) {
>                         ret =3D -ENOMEM;
> -                       goto out;
> +               } else {
> +                       fd_install(out_fence_fd, sync_file->file);
> +                       args->fence_fd =3D out_fence_fd;
>                 }
> -               fd_install(out_fence_fd, sync_file->file);
> -               args->fence_fd =3D out_fence_fd;

I wonder if instead we should (approximately) undo "drm/msm/submit:
Simplify out-fence-fd handling" so that the point that it could fail
is moved up ahead of the drm_sched_job_arm()?

Also, does the dma_fence_get() work before drm_sched_job_arm()?  From
a quick look, it looks like it won't, but I'm still playing catchup
and haven't had a chance to look at your entire series.  If it doesn't
work before drm_sched_job_arm(), then there is really no way to
prevent a error path between the fence-init and job-submit.

But, prior to your series, wouldn't a failure after
drm_sched_job_init() but before the job is submitted just burn a
fence-id, and otherwise carry on it's merry way?

BR,
-R

>         }
>
>         submit_attach_object_fences(submit);
> --
> 2.32.0
>
