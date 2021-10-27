Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16C6C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 09:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88AA60F21
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 09:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A88AA60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E26E879;
	Wed, 27 Oct 2021 09:54:14 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3BB6E879
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Oct 2021 09:54:13 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id bj31so1864403qkb.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Oct 2021 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mDx9orJTGGFf9xb3pL0fmxTR/7alUBsgYj7qdBiz24k=;
 b=X0m6D+bbsQSEK7bYd+HqSL7TAfZyJv1KvWSkKRreg2bq/prysRbCuBcrxlZX0aNp3i
 Qb3yIHpCWbPNKJxdeqWHj/ClI8G7MDiTZkFelyJ7qFOrnANk0HVAMod+eNhsjzU3nmJy
 1rpc+wcIx2Ipy7nqbq+Lk7dmZR1f3yZDt6WMggziVDTFgZEjfPzJC28rPq8OfAyXSw+C
 wfg/DGEbQ3lbdMEu3ZmJwKYUqNXew8/C742175ArohSLmR/RqXveyjgUJvlY+Jw+mpEY
 Vivib15kecJOwNg/ud54fX2ninsCMN6N3oUyNHU3JwXLkezGRQw3w/bgN2EYp0GtG3BV
 I3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mDx9orJTGGFf9xb3pL0fmxTR/7alUBsgYj7qdBiz24k=;
 b=1ybhY5HcULe90pwwthWuzZ3RNRqHHhfrhPupb9mbnM70P8WCJOEQMNMccieJ3CFIjc
 X8E2CuZDd1oZ2jQZtkmwclIUXkoA29rECIkoRnQzAkegZZm/w5JgaQFnf9rSygpMWcHG
 C0Uxij5aP+mr8rzhm1bg7oZqDI+u82kl6ZZVyXGaJLE2cXuwD1ybvgiApwIvs9aeiwoA
 8uuukTWSKF2ZIgM3R0w2n7Je4OH+iCByi5O7DrCYLT9Gyn2tkoba9NHo0o8LzeGvkbva
 4qSnwG9lNjK+ZUFcCP+EIHKqGZJ/MaeNXBCdw25x4BmM1CjKw8cW242IT/3OfFOUU0Qm
 /2kQ==
X-Gm-Message-State: AOAM532sQSKAURgbaLDIE4pu789OTUmArPabI6csJTLhZc5fg9Os2cNN
 2LEnL4+57jYf1fsSIarlMsWY3V9eGV95bQ6UO0IcswGXrW0=
X-Google-Smtp-Source: ABdhPJxPHZnInZdMNHT2OqW3nqOtNs78F7HbCTOli7/MMjW6gMsCopFAUuWJkH11kKERYYVhshhSvYGuPmCVkUOA7K4=
X-Received: by 2002:a37:a87:: with SMTP id 129mr23169999qkk.107.1635328452872; 
 Wed, 27 Oct 2021 02:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211027093255.66489-1-joonas.lahtinen@linux.intel.com>
In-Reply-To: <20211027093255.66489-1-joonas.lahtinen@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 27 Oct 2021 10:53:45 +0100
Message-ID: <CAM0jSHNCNwdaBzbZmeW8Ja=5FC8o-iXjziM0sJMzh6t7CkGXiQ@mail.gmail.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "Intel graphics driver community testing & development"
 <intel-gfx@lists.freedesktop.org>, 
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Matt Roper <matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Revert 'guc_id' from i915_request
 tracepoint
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

On Wed, 27 Oct 2021 at 10:33, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> Avoid adding backend specific data to the tracepoints outside of
> the LOW_LEVEL_TRACEPOINTS kernel config protection. These bits of
> information are bound to change depending on the selected submission
> method per platform and are not necessarily possible to maintain in
> the future.
>
> Fixes: dbf9da8d55ef ("drm/i915/guc: Add trace point for GuC submit")
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
