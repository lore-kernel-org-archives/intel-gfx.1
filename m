Return-Path: <SRS0=pIl2=NV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F002C43214
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Aug 2021 13:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B00A60F3A
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Aug 2021 13:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B00A60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D1489CB5;
	Mon, 30 Aug 2021 13:49:23 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AF689CB5
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Aug 2021 13:49:22 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id n24so19905116ion.10
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Aug 2021 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hDLkNcl3kpNuKXzYl4GK/0vNmHcEDi/wO1WbFyuTnp4=;
 b=ABRzwlJRaHBViMvocIXvTc9GX0mM/8Blk9K8IkGyMSJ7wfHHuZcq0usKO7JFVnD5kI
 7KTHLhfvQjqfN/Sja0E2ffvrrEnGkN1y/I051XbZpKEuU0ADHGVFRfkALdZSHHF7xWhx
 HPsV0m5j7FIfkhfRiS0E0M8bksq5gvq0ZR56jcak0IYLXIMzYp/xawZs2/5EICmReVzK
 DkGwDytjOBrtBSqorTcwYhpMnfcJhOM1tzQHELYpprrfmszpjTrqp8p8pdKaCT1WRvSn
 ZTOqtUeDOeZgF1DaHN4EkUNbMBIyl8r7wyX+cKfGez6YiBQtsdXIdCxYbbycmYraQhLB
 lnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hDLkNcl3kpNuKXzYl4GK/0vNmHcEDi/wO1WbFyuTnp4=;
 b=LuBzcrvy/LMZGis9gaOiRCobQaj6m970XaiHvK1UC+/HF9u/u4XR//5ngds0NUrFGr
 SYSZYBBVaAkoNPf+fO2CPuf8p2Na42Q8J+5eh6VGyi3YL7M308jBSQiC6mkgwjmaEHuo
 nnjhi4V8UOSVKwhBcv4f4s9B8xbx6+Ica0hdIdpII9Ty+cpMm9B+wdPt3ljOzaIlCrYW
 dSXZzE2O6jseEE2BjsAwM/h0mRwHafSGTLQF0qfcERdrp3M1vsiZTnzKvp8xpX4TXexa
 bqDxY1xHT/y5dNtCUIDfs3ozmM82dvObp4oDiss7uLj7XOJDlQHp5oi+UHY9y7gaVs1e
 qRgw==
X-Gm-Message-State: AOAM533pziCX9Hqv/T/f/XMNGAz7c5gOTTAiWv1P/zMXfDCMrT3qKab2
 2L3VuKiG+I9/FnGpyCnp3OaICUz7iwcdqQ6P/YpzUFaHlec=
X-Google-Smtp-Source: ABdhPJyltWMMh9vlGuvi7AgbAmDyM9zljm0vPuHVCKduK0eHjx8KygFpP4UFC5f2vVaW2pXmcT+zySzcGXKg41WnbYM=
X-Received: by 2002:a5d:824e:: with SMTP id n14mr18223161ioo.134.1630331361799; 
 Mon, 30 Aug 2021 06:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210817204329.5457-1-anisse@astier.eu>
In-Reply-To: <20210817204329.5457-1-anisse@astier.eu>
From: Anisse Astier <anisse@astier.eu>
Date: Mon, 30 Aug 2021 15:49:10 +0200
Message-ID: <CALUN=qLzwmP1sz1wr=yrFHUGEHm=n+uEre_ApfP6MgtYCZbRWQ@mail.gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v3 0/2] GPD Win Max display fixes
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

Hi,

On Tue, Aug 17, 2021 at 10:43 PM Anisse Astier <anisse@astier.eu> wrote:
>
> This patch series is for making the GPD Win Max display usable with
> Linux.
>
> The GPD Win Max is a small laptop, and its eDP panel does not send an
> EDID over DPCD; the EDID is instead available in the intel opregion, in
> mailbox #5 [1]
>
> The first patch is based on Jani's patch series [2] adding support for
> the opregion, with changes. I've changed authorship, but I'd be glad to
> revert it
>
> The second patch is just to fix the orientation of the panel.
>
> Changes since v1:
>  - rebased on drm-tip
>  - squashed patch 1 & 2
>  - picked up Reviewed-by from Hans de Goede (thanks for the review)
>
> Changes since v2:
>  - rebased on drm-tip
>  - updated commit message
>
> When v2 was initially sent [3] Ville Syrj=C3=A4l=C3=A4 suggested that it =
might be
> a good idea to use the ACPI _DDC method instead to get the EDID, to
> cover a wider range of hardware. Unfortunately, it doesn't seem
> available on GPD Win Max, so I think this work should be done
> independently, and this patch series considered separately.
>
> [1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
> [2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.=
17051-1-jani.nikula@intel.com/
> [3]: https://patchwork.kernel.org/project/intel-gfx/patch/20210531204642.=
4907-2-anisse@astier.eu/
>
>
> Anisse Astier (2):
>   drm/i915/opregion: add support for mailbox #5 EDID
>   drm: Add orientation quirk for GPD Win Max
>
>  .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
>  drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
>  4 files changed, 85 insertions(+), 1 deletion(-)

Would it be possible to have this series reviewed ?

Kind regards,

Anisse
