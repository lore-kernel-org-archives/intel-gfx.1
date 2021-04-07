Return-Path: <SRS0=LPwG=JE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3277C433ED
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Apr 2021 17:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A9F361132
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Apr 2021 17:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A9F361132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC7988C11;
	Wed,  7 Apr 2021 17:13:27 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBD388C11
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Apr 2021 17:13:25 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id k25so19497701oic.4
 for <intel-gfx@lists.freedesktop.org>; Wed, 07 Apr 2021 10:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhogcI3e2a0s0TpHg1uoICzncg9zexl4RCRVjjXhp/0=;
 b=swbyilnrGF+lj+iQMWgQiu/5omif2ireuUq8EY7D8MltebJ2NbURGTjIT9gYs4R8k3
 Up9CAXbXqBeFDH9NnS0LHmQGVvzajMxDF7io6aARTwAoLegeeQzNLZJzW9A4AB61nZVM
 mvaxvjghTAnTe1EzB3IQacRKVDhb1Hw5ehsPWFhi5dvxvgGl0HrOruk7z24m+smoodan
 ZqJTBLNjbuovqezd/bqP6rbugteKspxImbMFclGEOiasFkld2lgJ6vOp/GCzJeuQWZB/
 8knyV2ZsCE5UeU6pGhAy8Tq+iNWgQox0Z7qtXkRB0FqK5hq1QCl2hGdO2qljl4LASWAM
 XhjA==
X-Gm-Message-State: AOAM530tE7vFcGOFRGDW8Dwqe2PJ6sAJOjg9DwpiwNuvCuJQHGCe6Rqm
 8hioJvwPSIgBxPIYw6qeGLdgs9/HNkWN1FvgUKk=
X-Google-Smtp-Source: ABdhPJxBuwo60giwH76t01hOXqtUegHgOCZkDLEtaF+sKOJ4fN31d81+tgJ6rzVXSJ6QGjfrE3V8WJwy8GssTYjLi3s=
X-Received: by 2002:a05:6808:24b:: with SMTP id
 m11mr3003358oie.157.1617815604553; 
 Wed, 07 Apr 2021 10:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210406211653.182338-1-hdegoede@redhat.com>
In-Reply-To: <20210406211653.182338-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 7 Apr 2021 19:13:13 +0200
Message-ID: <CAJZ5v0h6=_U+_=G8YL5rA701pTLGfyg4PmBudc3tFRKG=Wxh4A@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] ACPI: utils: Add
 acpi_reduced_hardware() helper
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
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Apr 6, 2021 at 11:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add a getter for the acpi_gbl_reduced_hardware variable so that modules
> can check if they are running on an ACPI reduced-hw platform or not.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/utils.c    | 11 +++++++++++
>  include/acpi/acpi_bus.h |  1 +
>  include/linux/acpi.h    |  5 +++++
>  3 files changed, 17 insertions(+)
>
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 682edd913b3b..4cb061d3169a 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -872,6 +872,17 @@ acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
>  }
>  EXPORT_SYMBOL(acpi_dev_get_first_match_dev);
>
> +/**
> + * acpi_reduced_hardware - Return if this is an ACPI-reduced-hw machine
> + *
> + * Return true when running on an ACPI-reduced-hw machine, false otherwise.
> + */
> +bool acpi_reduced_hardware(void)
> +{
> +       return acpi_gbl_reduced_hardware;
> +}
> +EXPORT_SYMBOL(acpi_reduced_hardware);

EXPORT_SYMBOL_GPL()?

> +
>  /*
>   * acpi_backlight= handling, this is done here rather then in video_detect.c
>   * because __setup cannot be used in modules.
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index f28b097c658f..d631cb52283e 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -78,6 +78,7 @@ acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 rev,
>
>  bool acpi_dev_found(const char *hid);
>  bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
> +bool acpi_reduced_hardware(void);
>
>  #ifdef CONFIG_ACPI
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 3bdcfc4401b7..e2e6db8313c8 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -748,6 +748,11 @@ acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
>         return NULL;
>  }
>
> +static inline bool acpi_reduced_hardware(void)
> +{
> +       return false;
> +}
> +
>  static inline void acpi_dev_put(struct acpi_device *adev) {}
>
>  static inline bool is_acpi_node(const struct fwnode_handle *fwnode)
> --
> 2.30.2
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
