Return-Path: <SRS0=TObv=K6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D158C4743C
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Jun 2021 18:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58ECD60E0B
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Jun 2021 18:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58ECD60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EC06F89B;
	Fri,  4 Jun 2021 18:41:49 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816216F89B
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Jun 2021 18:41:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c11so12792114ljd.6
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Jun 2021 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YtUbxDxxxmyZQZnzGTxlJJEn+QskyNTm6GKN+/aCaAw=;
 b=VzjePSnK0TH5SKFAm1m7Fn90xoT99EDHHcvH+uWXi1n9M+QFRZvgzhD9swBQsyS2jG
 LQPlPkL1+g9vxCAj3G3h4v/tMpJW2qyR4ys1TRqllp+YZWe39WGz3EdXyRpn4Om6L7qD
 W/ESrG5Bfp67oMEaDh9lPaqflECiLI2qZsss0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YtUbxDxxxmyZQZnzGTxlJJEn+QskyNTm6GKN+/aCaAw=;
 b=jg4SHy54sDEM4aDlh7QmU+tQWPZ6ADBpYXm4n71sDMuGDAv2hOLll4dI7duo62f2hS
 qZ8xCSRou0/59JIRt+Fo9tnDmmbxxRYetB6cDzwsiY+de8rSaanzdnP14yG0uhFdaJ4D
 iQ+SKzrao76CQbCFBcQu4l5hhZh81irezlWyAYRjGDdFOg69sZG4AE2XMwPmPJxjNDsc
 bGA9qvbrQCeuq9w8CdXjnv8FMIfa10dchuU+5RbLHy8XuYk746Wu7QgjIW0MybkHpYc/
 32XvS+l8DMp6t3gZPV0iwcijTv8V5naEtrg6uKDdEhoE9MI9xn6dlOK8pHeBMGJkRmFz
 vYUQ==
X-Gm-Message-State: AOAM531ze4pgggkFOoq9twAn32Sh4CRTostMNwGgYRknPmEHOiLsGV+0
 ub1YlRc+iydND/uOsL+8CLz6fpXca8bVZlXkcBdHAQ==
X-Google-Smtp-Source: ABdhPJxa5uwtKyGvBMSf/TrLfZFHU7sIrZ/PwEFvdSPJZhM2/XzNSQ14dqx16LBGm6v+iTbnFr4Pi2i6RnUGVQ+4OVw=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr4334095ljo.182.1622832107898; 
 Fri, 04 Jun 2021 11:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 4 Jun 2021 14:41:37 -0400
Message-ID: <CAJUqKUokxsKTRF0v4A-Oi5=n0wZJGQkLg94m0njESHQNcXcWew@mail.gmail.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] [RFC]
 tests/kms_plane_alpha_blend: Fix coverage-vs-premult-vs-constant tests
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 7:54 AM Vidya Srinivas <vidya.srinivas@intel.com> wrote:
>
> Few Gen11 systems show CRC mismatch. Make coverage-vs-premult-vs-constant
> code similar to constant_alpha_min or basic_alpha
>
Tested on ChromeOS on JSL (Drawlat)
Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index a37cb27c7d62..224d79bd1749 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -447,10 +447,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
>         igt_display_t *display = &data->display;
>         igt_crc_t ref_crc = {}, crc = {};
>
> -       /* Set a background color on the primary fb for testing */
> -       if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> -               igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
> -
>         igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
>         igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>         igt_display_commit2(display, COMMIT_ATOMIC);
> --
> 2.7.4
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
