Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D18C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 11:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 764DE61058
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 11:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 764DE61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802916E563;
	Wed, 18 Aug 2021 11:55:40 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676986E563;
 Wed, 18 Aug 2021 11:55:37 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id q6so1478916qvs.12;
 Wed, 18 Aug 2021 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pybp1h57rSgejjB5qeOIxXCpxMSfcbtU4L01XqE4NBQ=;
 b=SZTW27Mn8ya2gYpBZAYbIhyFF51oIaaZgzm5qElOoukcZPB6CVx/CNCyFM6DsXavUI
 UH+pmeMmWML8vV5BFO+Hl3iG2EBcb2J/MbzRaPdzf8Dhd0vDyhmac763XmpOcovpfj7r
 VmTFrrhWtR1s+Zw58FI1Ui5BfFJ/ZiF2yQC6My0JxCcclZD9oR4El7e4XDcNbeHc3YTw
 i7WaVAyL4hAUi1yHgck51jBxMPz3iBEv3sYGUpWRAFnbySf3rn98t317njNmApWkj4dM
 wxf7gaLXT5b3RHN4D7qHZmLyv3Z/CI8C1l8vaGKSX2082Z7acKybtBApH4iGgKHcwb63
 qjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pybp1h57rSgejjB5qeOIxXCpxMSfcbtU4L01XqE4NBQ=;
 b=lMZFMn4ojTfrMhsN0lnoAzMdapaIlYXcU0yk4O6VsUgG5LBzrrzkbn2z+2nIHYKMlK
 kJc5GB94/mlD8/zm5Fv635GUmCoRoWPjQZaBwG+YMe1RZNln/KKA3kdc57WO04bULPHP
 GrgLSSGdkbtLMvWhEBrY379tqhG/mrRiLTjmiIljx5hqK5z1PjqCHef+jMq1JEJZomu8
 GB8ZzEBUVq5wj5I3yxKuBYdd9teaywasPLt1NvVb2pFgHftSfz+77FZjNCoMqDbptuv/
 9b5xCQogDn+14sR+o5egejatxla37u3JbjCwv+dh98uSAYeVQYXHlwBb8r/OAVCI0aPp
 CsFw==
X-Gm-Message-State: AOAM530TmIJ3xWSRPwVpq5lQQAFDuo2nVWM/lGoK5peEU0/DYNCrlzWS
 0MRuaNfNdJfVf4+8yhcNqRamP4taZvFj+SjDXUbywJ+DizE=
X-Google-Smtp-Source: ABdhPJwdq2qrgN2f/CrK5JV/wojv8FLXFt/apl6fl93D1kv23W7OWSDtGRTg8RsDNVmf6eRQv4p70M9n9uuJnJB20ZY=
X-Received: by 2002:a0c:ffae:: with SMTP id d14mr8526854qvv.41.1629287736471; 
 Wed, 18 Aug 2021 04:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210816171444.105469-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210816171444.105469-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 18 Aug 2021 12:55:09 +0100
Message-ID: <CAM0jSHPzZ532ey6ZxbBaxDYbm6agDtMu7HFSSrSwaWmYKjfu8g@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Ditch the i915_gem_ww_ctx loop
 member
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

On Mon, 16 Aug 2021 at 18:14, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> It's only used by the for_i915_gem_ww() macro and we can use
> the (typically) on-stack _err variable in its place.
>
> v2:
> - Don't clear the _err variable when entering the loop
>   (Matthew Auld, Maarten Lankhorst).
> - Use parentheses around the _err macro argument.
> - Fix up comment.
>
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
