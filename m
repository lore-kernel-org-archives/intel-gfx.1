Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DD3C4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 09:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5917E2335A
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 09:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5917E2335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC036E0BC;
	Wed, 16 Dec 2020 09:32:09 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C936E0BC;
 Wed, 16 Dec 2020 09:32:08 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id c7so21929927qke.1;
 Wed, 16 Dec 2020 01:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AvPt2oqvU1gcr9EFp/msak7UuYXXyxluuDDZystz5G0=;
 b=k+Jx8VHY3+UV7E8cvrchLrJT7iyArC8FAfDKxBm0rK2qcL/veBDB6tV1pxOBqXs2Tb
 FVEHI+1Q7HZwH8yxa8ReYSUQop3G0IroNFePqK9kiSNWCgD+12X0VFpJjXOT8QyZUNiL
 kecA8ml2Yff81GD1wWhVHVe2Ch7yrWndXM467Rf6yyQKw0S2o22VoT7qXan4fSHU7qJ0
 RvTFSTy3fE/fPzW9+sgD7VMoF2HL/nqirg7lEDXRUPHu+kGHPB+39f8EEvG99l284ycs
 23YLkjAaOHkcgi3Pspn3woiRWhd1yTOv6NbYWXc+N8wJk3NSxoj4IUgsm6a57vexrkK1
 UZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AvPt2oqvU1gcr9EFp/msak7UuYXXyxluuDDZystz5G0=;
 b=OIqzOCjCgwSO2Ob2mhbRXsx8Sskcp0QTCTOs3KDjzfUBxB/pd0zpxgJDn0z57u6Kvx
 05rQr1EGzczBIPSrbRNGnSyzMxdroD6ET89t4T7ejhT//FwC9AsJ8JIWmONGRPZlYeVX
 9rQr0h8G2lT+zu2/UPm5cmAKIbB8UX+h6kJktIE5COts37OYNQHn+CXhXDoOaOtEC1cy
 +REunJbikLAzz2LalwdR/oXzvu9ivX+4pyobiVYNPGnJj5utBTG51p5CGHedGRxp+LKp
 MvxsiVAjje2SI44jZkZx8zcPVJHPN8jZxHfmy2FlHjhhqsetKXuAYbCzj7tDJdTPRUhz
 i/RA==
X-Gm-Message-State: AOAM533Jto2O16xaiGMGEQCdIHlyczcGTec7eyv2GiRABc+1TIsZsv0t
 z5C8AmIyDT7PMhBfp5nxvU8Gy+84XyNs6nFjLIE=
X-Google-Smtp-Source: ABdhPJyBojcM2XnZN1p6kHHybvg0skZ7lMtZtE8RJJv72t0U9+HK0gHPwhpYJW+yTRQHxfkRJET3ARapLfoR5XnQba4=
X-Received: by 2002:a37:6f04:: with SMTP id k4mr44639879qkc.426.1608111127442; 
 Wed, 16 Dec 2020 01:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
 <20201215210658.1188718-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201215210658.1188718-2-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Dec 2020 09:31:41 +0000
Message-ID: <CAM0jSHOhCKfoFNqZUnHqbsNC-hWXzKQjK8jzH4FB+B4hnSinHA@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/2] i915/gem_softpin: Check
 full placement control under full-ppgtt
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
Cc: igt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 15 Dec 2020 at 21:07, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> With full-ppgtt, userspacew has complete control over their GTT. Verify
> that we can place an object at the very beginning and the very end of
> our GTT.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_softpin.c | 45 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index fcaf8ef30..a530e89d3 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -97,6 +97,47 @@ static void test_invalid(int fd)
>         }
>  }
>
> +static uint32_t batch_create(int i915, uint64_t *sz)
> +{
> +       const uint32_t bbe = MI_BATCH_BUFFER_END;
> +       struct drm_i915_gem_create create = {
> +               .size = sizeof(bbe),
> +       };
> +
> +       if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE, &create)) {
> +               igt_assert_eq(errno, 0);
> +               return 0;
> +       }
> +
> +       gem_write(i915, create.handle, 0, &bbe, sizeof(bbe));
> +
> +       *sz = create.size;
> +       return create.handle;
> +}
> +
> +static void test_zero(int i915)
> +{
> +       uint64_t sz;
> +       struct drm_i915_gem_exec_object2 object = {
> +               .handle = batch_create(i915, &sz),
> +               .flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
> +       };
> +       struct drm_i915_gem_execbuffer2 execbuf = {
> +               .buffers_ptr = to_user_pointer(&object),
> +               .buffer_count = 1,
> +       };
> +
> +       /* Under full-ppgtt, we have complete control of the GTT */
> +
> +       object.offset = 0;
> +       gem_execbuf(i915, &execbuf);
> +
> +       object.offset = gem_aperture_size(i915) - sz;
> +       gem_close(i915, object.handle);
> +
> +       gem_close(i915, object.handle);
> +}
> +
>  static void test_softpin(int fd)
>  {
>         const uint32_t size = 1024 * 1024;
> @@ -559,6 +600,10 @@ igt_main
>
>         igt_subtest("invalid")
>                 test_invalid(fd);
> +       igt_subtest("zero") {
> +               igt_require(gem_uses_full_ppgtt(fd));
> +               test_zero(fd);
> +       }

Worth adding igt_subtest("full") somewhere, which tries to occupy the
entire 48b ppGTT? Maybe using pad_to_size?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>         igt_subtest("softpin")
>                 test_softpin(fd);
>         igt_subtest("overlap")
> --
> 2.29.2
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
