Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C721C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jul 2022 15:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977811B0BA;
	Wed,  6 Jul 2022 15:50:59 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14B11A77D;
 Wed,  6 Jul 2022 15:50:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q8so6525841ljj.10;
 Wed, 06 Jul 2022 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JgkqeHuQlPU+G29JKQRsbmRnJbat568cRtAATn92ZqY=;
 b=fZgTc4CAgyE6a4VI5ndorhKPrP6Sekc8YHh9UIQCEmjIhOinMU6FhgXBSYo1FvQSS4
 J19cQCfwOYARDouo7K5de/+AxcsBxhSbrMKtWBuU1ukSaSx6DEIX1lQzrFTbAOXIaiys
 RwPRjSQiwlYc9L3baAACVV/TRXHfZjz5+1UQdE8IADoT3oSANdcdr+MjhjcJL88873dD
 M7SEL0mgsaVBe42cKmRmwvtzePq/4fQJ6Os3Z89q5+Ri5tfArq5CrZ0crMptY6lYdQUf
 RWH03KxKdlv8AT3k6ZUO/bAUinQu62Z8BUDwL+uWtbEfgp22OSQElmghX/3zyBl5aeXq
 U+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JgkqeHuQlPU+G29JKQRsbmRnJbat568cRtAATn92ZqY=;
 b=Xn8UrvRg2RKlTuJ3K3Rty4AVuiBDVNrkoHh5AzLymfbw4hPAtl7WktVlPyq+jKEzB5
 rfohOcaWmbSXaGh6tgy5CkFKlE87AMqVg/uu8PViFK+JT1RqU38/OVZFU2hVhQSFDnhf
 BujI9QrpbfHEKvAasQfWURCsG9jRSnGGOoh5/zwg+teO6Yb59gyQ036kuyeYHtkLdE5m
 xiY8xOOniIJhj6wwd+tF7in6f0jAVurcC4NrbxGbfmQ1YT23o5k6Q/yCxLSd/wCUTyNz
 MgUgpmAuTXc+cHJFL5vzRBmqqzKHAtRs2xxzOBs6Oi9/h07QlthH8s002pMQ8kU3Wmo9
 JFMA==
X-Gm-Message-State: AJIora8ChNYUCsuYadPQBBk9NhVD0PlT0VsKtEVDlRK3PJz9CwP/+rwK
 b3cpHVs1+l4s5gst38DTy9Du98/91K9Zc9ioNeCF0yOGJfC09Q==
X-Google-Smtp-Source: AGRyM1vbmEO7vGKglAK52r04sF+ZhpkVc8sTOaEY177+lC5yYQIKDpAPOJICajk6l50Xlgz2sPCtp4O4htxojlmsu2w=
X-Received: by 2002:a2e:9297:0:b0:25b:10de:a17b with SMTP id
 d23-20020a2e9297000000b0025b10dea17bmr23702260ljh.71.1657122656654; Wed, 06
 Jul 2022 08:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220706154738.235204-1-matthew.auld@intel.com>
In-Reply-To: <20220706154738.235204-1-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 6 Jul 2022 16:50:28 +0100
Message-ID: <CAM0jSHOCeLoLAa=WAyiQuC3qH3FzdtjA18YBjaOz05D98qrfGw@mail.gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Grab the runtime pm in
 shrink_thp
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 16:48, Matthew Auld <matthew.auld@intel.com> wrote:
>
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> Since we are not holding a wakeref, shrinking a bound object is not
> guaranteed.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6370
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
