Return-Path: <SRS0=TObv=K6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815CDC4743C
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Jun 2021 18:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349F6613FA
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Jun 2021 18:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 349F6613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9CA6F8A1;
	Fri,  4 Jun 2021 18:48:50 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755466F8A3
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Jun 2021 18:48:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id o8so12872370ljp.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Jun 2021 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=psSmk0BzjlqtGu46X2F1KUx2Y4cHBhast9CZ7Rf61SE=;
 b=OrEoW7z5gB8gLvNO4liPws6SteXGWAo4I4AD/q6Lnj8gSnhuXDE/ofO1qTu6zkrLN+
 9METgNVgIEMjWhuTJWOOJSDZaNNFcd8ZZv7FDs3oji26Xqy/0yQvjLbDNH/LT9kXl1p0
 6qwBDFUCa4tCwTdxmEe+heWTCA88pOx1+5V3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psSmk0BzjlqtGu46X2F1KUx2Y4cHBhast9CZ7Rf61SE=;
 b=eLaDGBrNT5oNigORQmkQc/Mv1eKU6jP7XcYLedG3K5ZF4q+elFjVHuW0tp8Uu5/ZGm
 A6mV0iQngipTzknOvbBBRSM4U2b8H/QgY2Q3jZRrF0vnozn0wuRm6OUVt8rkSMDbsiaA
 VfWyKJSBaa7cIDKUOYTECPqR7ic3vbxEoX2UX+uscpc3ZKsQTk93OZTkxsVS1IBllmaW
 IZFbjQIlRUyTBHpqmTSwtNkiqgmO/3lLXwKSncjRAGTXvRVkr7x2T0wL+oBZycIWWUsQ
 RCzAdrYM4Boas1oW26vk7xpLIbomAyBj9E8voY8+kZ3+iTwrk+zLraOgIoXUWYScWPio
 v2zw==
X-Gm-Message-State: AOAM531/qPjbGXRTxiu0NsO1Z3AQTEz4Lj2JZVH52mbhrcVB6Ddj1TbK
 ebpcJJVeVYD9ejXrgtHpAA7N7ohx5c1ZHRLKudskXw==
X-Google-Smtp-Source: ABdhPJysm5xFkcIMW13SQPY+BlUF575dm2S569XIdTDsZ3x28jksUFYebjBnGbLr8BUeEFh+0rnbm5gH3hxmMWmdOro=
X-Received: by 2002:a2e:8108:: with SMTP id d8mr4400846ljg.239.1622832528938; 
 Fri, 04 Jun 2021 11:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210531153922.4683-1-shawn.c.lee@intel.com>
In-Reply-To: <20210531153922.4683-1-shawn.c.lee@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 4 Jun 2021 14:48:38 -0400
Message-ID: <CAJUqKUo+ZK_rVCxHfuGD+xQN6DbJUz-qM4n6jD5co0WuFk1Nhg@mail.gmail.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] tests/kms_dp_dsc: Avoid SIGSEGV when
 release DRM connector.
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 charlton.lin@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 31, 2021 at 11:34 AM Lee Shawn C <shawn.c.lee@intel.com> wrote:
>
> Got SIGSEGV fault while running kms_dp_dsc test but did not
> connect DP DSC capable monitor on eDP/DP port. This test daemon
> should "SKIP" test without any problem. We found kms_dp_dsc
> can't get proper drmModeConnector and caused this SIGSEGV fault
> when release it. Make sure drmModeConnector is available before
> free it can avoid this issue.
>
Tested on ChromeOS on TGL (Delbin) and JSL (Drawlat).
Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  tests/kms_dp_dsc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
> index 2446fd82bba3..ea7c9f4f72ce 100644
> --- a/tests/kms_dp_dsc.c
> +++ b/tests/kms_dp_dsc.c
> @@ -262,7 +262,7 @@ igt_main
>         data_t data = {};
>         igt_output_t *output;
>         drmModeRes *res;
> -       drmModeConnector *connector;
> +       drmModeConnector *connector = NULL;
>         int i, test_conn_cnt, test_cnt;
>         int tests[] = {DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DisplayPort};
>
> @@ -311,7 +311,8 @@ igt_main
>         }
>
>         igt_fixture {
> -               drmModeFreeConnector(connector);
> +               if (connector)
> +                       drmModeFreeConnector(connector);
>                 drmModeFreeResources(res);
>                 close(data.debugfs_fd);
>                 close(data.drm_fd);
> --
> 2.17.1
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
