Return-Path: <SRS0=04ZO=CM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FAFC433E9
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2020 14:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF03206EB
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2020 14:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFwclfIZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF03206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6376E02F;
	Thu,  3 Sep 2020 14:23:49 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2621E6E4CA
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2020 16:39:27 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id g13so6456176ioo.9
 for <intel-gfx@lists.freedesktop.org>; Wed, 02 Sep 2020 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bw76E/b3G6TO00iQTq0aa2fkxlofOPTqXo+FteOiyvg=;
 b=jFwclfIZNnYo+Se4tYekj49yAjjB1IFeoV9aFOOKdYEjsg2V/9r2u2un3Xpwf99Sbe
 B6SfcVNxBIs8zNRORiT1axYIuNa9wuqMQijD5GMgaYefYgELlq6rwleCjRrvHCrti+15
 O/UcYSrUL2QLaIneyqiwXDwTr1XkQV53B7BKYQlNUIqdt4po1Jg551vVyvwam+NFEd3d
 hsP43eUJTpzaj5cL8yCUl7S33UV0M1wQUYj5hLoP9E109MBicShVSIfibrB41WIsdWBA
 khnmMe+YiY0RcIKrXR6Iei98aVXWZzo7sr9z16ufwmdTkQe8iJ+ejbAM75qu5x2cVE4u
 5Ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bw76E/b3G6TO00iQTq0aa2fkxlofOPTqXo+FteOiyvg=;
 b=jytMEK/ENHegAY3fGxYOw66pt5Jw9oy47cun/X6Fqs6YKMWnp4qhm/xARgFE7OQF6v
 AeBoDjfAJ+lIvPtUUr6pU2Wsui9ql3pHt8QHbgmHZq4pOhg8rnrVwG/xiSKqJsQnRl44
 mUumyxJXuvAlxriBRbCNR9WD5XptV4dg0f/E+RLu3waUMOHZi7zZfHKFYXlYBf3OYBWJ
 QcgCkOPrrYe64VR6cgQ4GXpp9Za4gjUJPRmGVPiu3wRVTcYh7NWzBAeVywfzDi8sFfhZ
 3fH5aGBMruAJhngTX7WRblX5cFFZxlWlXVm9HAxeRYfVsCgAskqLs4bAPXOEKTnMiLya
 33vg==
X-Gm-Message-State: AOAM531E0R/KEC+pWku7xomuLl/kagc4mIIAdBlqx6/rSN/YtXxTMG7L
 P5Fz23wBhVWoFXkR4nkW7E8jagKOC1rcs7ugjaqsgEwLLRamRQ==
X-Google-Smtp-Source: ABdhPJzYhasNYViPGlbruk+WcqvxyUNwVQiVTdLwlZmf0UX+MIKST1MCHOsjZ7amHMvXoXpZkCPJ0hK4Cnb27j2Fxyk=
X-Received: by 2002:a5e:c309:: with SMTP id a9mr4228146iok.105.1599064766149; 
 Wed, 02 Sep 2020 09:39:26 -0700 (PDT)
MIME-Version: 1.0
From: Peter Vollmer <vollmerpeter@gmail.com>
Date: Wed, 2 Sep 2020 18:39:15 +0200
Message-ID: <CALdu-zH+yh2X7OSVQ7aTW2Dj=rEMD2MRYighJ-YGdEp9W4AXYA@mail.gmail.com>
To: intel-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 03 Sep 2020 14:23:48 +0000
Subject: [Intel-gfx] i915: boot/load regression since Linux v5.7-rc1 on Iris
 Pro (Crystal Well)
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
Cc: Niklas Schnelle <niklas.schnelle@gmail.com>, peter.ganzhorn@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

since kernel v5.7-rc1 my graphical output hangs on boot or if the i915
module is blacklisted on modprobe.
I've already found and extended a bugzilla
https://bugzilla.kernel.org/show_bug.cgi?id=208737

But sadly there has been little reaction so I would appreciate any
help in further debugging or better yet resolving this issue.

Thanks in advance

Peter Vollmer
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
