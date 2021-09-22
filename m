Return-Path: <SRS0=at8c=OM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7996C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 10:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED6461131
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 10:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ED6461131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC576EB66;
	Wed, 22 Sep 2021 10:10:34 +0000 (UTC)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD326EB63;
 Wed, 22 Sep 2021 10:10:32 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a10so7452163qka.12;
 Wed, 22 Sep 2021 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wXl9gzkSSmuuPthPSsd3Ds5MPLvBhyHRtWxvgLPUsNI=;
 b=UTItvOZfNQxFvLzzkPsucEnzCWw4L/tDl8N0S5K/EyuMfHE3Lz0AV8rk86Wb0jK1Fb
 8XSMN3AJzvrJZL/4Wy3tx1IiDZlXYujL1I5WILOirL89Mjjve5rf0o3lAXlwqmFICGr8
 DkOvNEvT19+XQ+TTLQhoB/rbHi7Z4L4RLjlf1T8ROl4iYuy+DCJH7T+65ewoQM08KmLw
 W++/e6kw62R5GpHFM0LAzu3njOImQ9QqyuXcEus1gZKhlcJHaAjuOhDrT/ktD047tPaT
 8YySVyOpwf3Gob0Mh21qNWJVBgCvm/hkX53zvG+NibXov1YM8lO1+eVdZV2OEMoKPnwF
 K2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wXl9gzkSSmuuPthPSsd3Ds5MPLvBhyHRtWxvgLPUsNI=;
 b=SV83eryLx3of+SpiunrecJgA+FCgx8jnCP5yOOP/F5u/2GYF5qqvBPNQN1TZwBtxYY
 SNlC3409jiyZx0w3z1JpZ0u7bL597HJwn7I48iDHyTPR7aDF7S/S93muSD9iLt32lQAz
 oIgpSHbVbN+xzivEonE6T7DvAzsZ6RDgHbDTAto/oc5R6p2xb5ext0qWoXid+FNQ9CMx
 Dvx2HnUYa7R02BmWE2j7LZW9Z1mkwPAWXIz26c+yX+cjUx4SWUei8ZOdHX7d8UlFyMBn
 AQGKzQWLhYaNh6CZloIJsDRbIibQuzCvA+XlVsF/4BeTBkSPQqN+RC+tr0rADMbpUYHs
 /RRg==
X-Gm-Message-State: AOAM530RAMiM3039QD/dgYYJFm4A5Zeb412Fm74AR6u/Eejr2WynAo5V
 IkDHjYFmaXZtWc+pqsA3q0WYwb7T5gXk/GhdI98=
X-Google-Smtp-Source: ABdhPJxxVbRSamfGyU41PrMoCpg8CQoqf4GTAHGTlnvkn3IrIiSblYi2JE0R0omoP5P/MuHaLa8OXyQtB+m4tcAip9c=
X-Received: by 2002:a05:620a:53b:: with SMTP id
 h27mr8327882qkh.11.1632305431249; 
 Wed, 22 Sep 2021 03:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210922083807.888206-1-thomas.hellstrom@linux.intel.com>
 <20210922083807.888206-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210922083807.888206-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Sep 2021 11:10:02 +0100
Message-ID: <CAM0jSHPj9u_kD41F5Yn0SdasT1n1dN0kkDOHTjBo9EFK1RMZ-A@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/gem: Fix a lockdep warning the
 __i915_gem_is_lmem() function
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

On Wed, 22 Sept 2021 at 09:38, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Somehow we managed to invert the test for i915_gem_object_evictable(),
> which causes a warning in DG1 BAT, igt@debugfs_test@read_all_entries.
>
> Fix the lock check to only warn if the object *is* indeed evictable and
> not protected from eviction by fences.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Fixes: 91160c839824 ("drm/i915: Take pinning into account in __i915_gem_o=
bject_is_lmem")
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
