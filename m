Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EB7C636D7
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Feb 2023 17:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F2B10E0BC;
	Tue, 21 Feb 2023 17:31:27 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C06E10E0BC;
 Tue, 21 Feb 2023 17:31:25 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n2so3438983lfb.12;
 Tue, 21 Feb 2023 09:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHPxPc7af3xcCKmcn4S6pyNi701Yy7IJSjSQhJUHjQU=;
 b=CadMKNfJK8JGU8E4Bpy0eGdSZZB1DhwZ1tF+xJ4Q2iuWgWcjbbXP1v0d6ISqAXJshK
 Wgw02BB3vKc0qVusbDQgIPU2OloYeTLjCuG9ifer2856pYlwLQMPNrDCT8M62uw8aUPt
 6m/RC8UyYAEszFZo3KS0gX0qBBhNH5ZA5p45m4ku8x229OFTVHoTjMEZWL07oYUy2hUt
 d65CSPmvse1wDdrCjwYCvgQ7nU4xfgCZ+7NXFAiovu9Gm9aTLL8MVp6feCgYpgjYqAbH
 hzz55iy1aLfbwndNj7vOjz7Yvv6gCzsnP5LQoJx8VGK1dckCr4QmbgWcRwnhgRbeB6B0
 GHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHPxPc7af3xcCKmcn4S6pyNi701Yy7IJSjSQhJUHjQU=;
 b=YIPpZvpbjReIgfhB5emOL7xaCkMJ1BTE0m8MDSyvDirBioiAcrzE4oMlWn2SOH/DHQ
 O1f1Tzb27CX0GVvvjXk4j1PjgiEpGn5sq44sAqlKDQHcma3XZtDY/LWP2O9Ua9iMEJHz
 GQ4nXbwA9qzUHnRYIN32RvCLnPDpFZyuangd3O8Sgymc44uFz3+2aiNUqQULPDKMSBvD
 LY2wJl31qhc+mB3oS+X//wtpAObsTG6/Aq5bTpnI7Qtfok0L4a5Ex/ndCcV+XdDdDDro
 pz3rhGbi+iqmKLY5iL6+T46mYyiWrcM/rhPYRQXVufIQIjrrTuOOIy4Ln1QM2xPEUsOU
 61KA==
X-Gm-Message-State: AO0yUKWBNK2OyQBHiGk3lInxAazUjQy/i7+XQgBPfAG2jpuO7VzZFKoz
 ElItxgf+Q30/Tt8jyuLFe3fMahmOhWiM2fV9Gsg=
X-Google-Smtp-Source: AK7set+SUltPHmbuPTc97m8BtyGr6buZ+3NrYgWLEJV8XWv04KS2WDaVDWzkgLvtrvQdIuJUxaBdT7FHd3V91FzYN34=
X-Received: by 2002:ac2:560e:0:b0:4db:1999:67a4 with SMTP id
 v14-20020ac2560e000000b004db199967a4mr1879135lfd.5.1677000683844; Tue, 21 Feb
 2023 09:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20230217122224.29243-1-christian.koenig@amd.com>
 <20230217122224.29243-7-christian.koenig@amd.com>
In-Reply-To: <20230217122224.29243-7-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 21 Feb 2023 17:30:56 +0000
Message-ID: <CAM0jSHO7miHcqreGLA1NUTatW+vRF7m2s+NO9HeXXQqwQYRHGQ@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/ttm: cleanup ttm_range_mgr_node
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023 at 12:23, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> We don't need multiple drm_mm nodes any more. Clean that up and remove
> the extra complexity.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
