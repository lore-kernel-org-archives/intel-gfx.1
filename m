Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29851C5DF66
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 13:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FAE10E40C;
	Mon, 17 Aug 2026 13:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eFP2nMPg";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA06F10E40C
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 13:16:28 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2cacf197759so47285145ad.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 06:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786972588; cv=none;
 d=google.com; s=arc-20260327;
 b=MDgLpnqjxqV7gIpdIHkSyeWopa0AYwfGKSvP3rSOs3QH2zL8JP60w/Xtl8fIkzjeTx
 WUaM3SNKxxiS0KWXvaRwiPHcmnLqsE3XOrtmhQklgIR6czrcrcXyOvNNUeQIJ2Ew+Y8r
 86CWzY7Aw2W2Eb2XvtERBo5rkAgQrI9iOEPAvpIAkc+xzicL61r/ZSjaKSe7DVG6pOcX
 tmmS0xWQ8Rj1h7Xm4onncXJ3YAvhPAnoY2UoQuWwni6n1ka44/FCq4hSmjs8YeWPZw9a
 WI8ogFBXU0UQv6ysG1/hAF6J1WbqzjF11yvQsTDDgOtDdQ9Koj/rIv2+VE28BrhwSIiR
 /NKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
 fh=0yDzyppRxqOQTIKpcroBDHclIeSMSuhMpX3gIwCfRK4=;
 b=C88HS4C6NqDUlI+1fCvqKovHX4WOdqORJxnsbVIOtnN27YeqixEP0kHB+OF2k3F1GK
 LBvPA3fiN5I/OK208eSKstVJiIiNH9v0P/rBPBnGWjd3mQ0Rp9T04d21DI9zGvNYTkHB
 k5prK0r9eNsP5vKzXMPezKjT23ceOOB/f+A1bg91jE4AzBqK3BnhV3yVEatSZJVjgmsx
 SYZVriqMKPXEDcyE/dC/W+VISQR2fPyC3+tmnALVzFsWXh8peUSixlZITMT4GvFZ8ytb
 lIqy9WLvc0pY/Sw1wnYRxERHIaGiQ/AMes2hHQW0r8DBG3pzx2d4XaEd+td9TeshU+49
 kbYg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786972588; x=1787577388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
 b=eFP2nMPgP+hzTL4gIEEnPcGyt7k+alEpKL/teo4ppY5miQWB36VI7Kb7ZFvPlr6v+G
 8KkXlDU9074nhW6zv4sPLMQY5gdAtjvcjiLg0El8gD/iZpfaTY6kZejt6phgjvmvEbpg
 Z5Wz8ebQNAegYXCFvi8KamxldxI2vY/pe84sU6zL8wMmWapHrXrXOzs1jGKYdSzaf9o/
 7Faah5+R9iUw5oENU/AFK7OUp2cxGcnZ4r8U47Yhul8e8GT5LyBYunwfhf9xZzgwf3xe
 pSoDP2bJlYtOMcq8ogVLKYemJqmm9pdHBZ346lY4yY727pNrJvZjk0q82egkQ0O2gCzs
 LHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786972588; x=1787577388;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
 b=V+bWhxk5+HcELe4B4HrbOTAX2gkJ/gdYbc01oMozhZOMrfmMHyd3iMwG5SiFo7s8rc
 dlToOSBFgV4VmTn31+z7h4JBXoVDKCeu6mrPLp6aW5yTQe7FYLJEXPcAzZ1CZqwyXtwF
 U1SnLsmOG9Vw66R5dMQFS0hi8t+E91UkjrlXiHKbw+asiDo4QvT9mJCmEPkBdQoRueg+
 8kZqY50T2TcV0UuJMpIA7TndxAQQOVTfrMABYKXtAUtPTjFaeYLx53RbH/h/Gza7Hluk
 2BQhZNWSQQW1zJsppRvzkqN6VPaTYerEvh54wNTqUjUwVrbQNFrC8YR+cU2Wo51bp3+l
 yMmA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoBUk3T8/zdXB2HhPMChoM3qV+wgvmx2xYTHaSrSvy62OHBPW8mmshuSpNbmWwTL9/901KTwQ2GWpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxmFKZOHkwZr8jqAgrcCugVdDsS1yjxWDFSbRukRbO+7sZ5pax
 8IZL9F/US7YlRjpkIADr2DTPr48rZzjYPJkV5EyYGxhdNsPurt8fCIAh/6PreDPEB/54QcjClYn
 knRQVVZtSwAGw7s7NJg7gPwexqv1rkNc=
X-Gm-Gg: AR+sD11teZvQh4TleEGA2kUKeINsWNOQxKmcfAN/kodpWPG0C+N8XSPfMQcjrraWiAB
 EVByWpK+Beyqty42tFM5lAuh+ErDv0mIBiPd+hxAuvq6G60WxBEM/otDv7SKxi0W5RFnzOKeCpm
 TfwwQd3q9DHnlnX5uexF+1U4sOJSbTotfazkgCtR0R7QgeNOGoM4eHFgxSDAIYsMlyVQifNnX9e
 Ss/tN21dlgAUTcif7tj5Uzdi7/rD/IbyLOLtQzDAl7LWOkFKOgQR+39yQhWtw0McKom4T7YWHbE
 EZxXnTb8TC/wbCTJLHRPG20xXtLmnWd1DiStFRz/nCQEc+t3Vxma6d+usaX466t8F8/rZm3gz2f
 9P7nAnIJgBjyXhi8HvVshlUE/7zPLwnTdghRviAXtVCwHHoeD8S+hXd8EhNKRQ+SaVLN/XnxGf2
 FMg8kkrxHkiFGCx4TosyC1qfVxq2XxhNeC+vXi0dA0vRqAjfWR8Ko=
X-Received: by 2002:a17:903:2303:b0:2cf:84bb:1ebc with SMTP id
 d9443c01a7336-2d3b0c5db18mr277141995ad.15.1786972588243; Mon, 17 Aug 2026
 06:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
 <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
 <61d9c006-aeca-47a6-8863-eed92f15ebea@leemhuis.info>
In-Reply-To: <61d9c006-aeca-47a6-8863-eed92f15ebea@leemhuis.info>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 17 Aug 2026 15:16:14 +0200
X-Gm-Features: AcwNN1UaQ-p5PZB9_ytyorEEY2UmlN496Ynqr2adHZEtLQdMz8eLOIpt9bmw4LM
Message-ID: <CADo9pHhnajqPJi+7o5MK=8_RXTrqUuGJ54cO1B14F-0m7FQ5WA@mail.gmail.com>
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: nomorsukses@gmail.com, regressions@lists.linux.dev, 
 Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 Suraj Kandpal <suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Not sure if this is the same bug that i found a couple of weeks ago in
April, if so it should be fixed with 7.1

Den m=C3=A5n 17 aug. 2026 kl 15:14 skrev Thorsten Leemhuis
<regressions@leemhuis.info>:
>
> On 8/17/26 14:55, Jani Nikula wrote:
> > On Thu, 06 Aug 2026, "nomorsukses@gmail.com" <nomorsukses@gmail.com> wr=
ote:
> >> I would like to report a possible kernel regression affecting the
> >> internal display brightness on my Dell Latitude 7390.
> >
> > Please file a bug as described at [1].
> >
> > [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.=
html
> Before doing so you might want to try 7.2 vanilla, as there was a
> backlight bug affecting that machine that was fixed long ago:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015
>
> Maybe Ubuntu just never picked up the fix. So if 7.2 works, you need to
> report it to them.
>
> Ciao, Thorsten
