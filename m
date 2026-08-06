Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85022C5AC7C
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2026 14:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27D110F1FE;
	Thu,  6 Aug 2026 14:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+JdBQVu";
	dkim-atps=neutral
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBDA10EA23
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 Aug 2026 11:54:56 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8114a4542b2so30394507b3.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 06 Aug 2026 04:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786017295; cv=none;
 d=google.com; s=arc-20260327;
 b=aJ6jMQumBriKg370VFGHQaF7eg+6JZNNAg6yu1D1q5sOGLaxbKhVXmkAxYahK9hkVJ
 5QxPj7j4WGb4GHSUvpNzvTrXhDNOdPtU1kRB6I64bvML8tNY4b56Qz9SAdYYCc78XHOK
 ePPTbKuLrUc3wg1BN6PHqO8GrbEJHJEMkU3Ia+XAP+OpOzTQj/9IIXrv0Y9KaeHbaU9+
 3joUt2YNFZZQLephNjjTRUCCAS/FLObJqMfzmzBYWPiSs1XtN/F1casuWn38r5NZaeLm
 +dNiUwLe4FaYh5fQB3z4hFsTw0sOjuBt3K3D+/3pqfyGhgGNmqPi7ITuNTmvFmWbsbjb
 87/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
 fh=OWAw8onC+EhrRgylSl4+MWzE+Y4KXLmJdha07rEUP8U=;
 b=kPnbRkgNAuv/FhKdxPI1v0hzYXPRFPuzc2Gg08FHahabMR2IB08zBpstyFsFzQHCk/
 9XPFcWdPXLzAapIUelo8V/OySbV5xSC0F1jaNCZn1ei3hS7EPgVwVNddQc0KlAVAAyWm
 PG65Y0NWwlzvzla1B09wEGvHbEjgZu3TxagZPyII2IKTh3qx8PdXkMR8t4M9rMk0fKvP
 wHtC5L+10lPrkPIRy9MchD1ZJi0KBuuOba/RvPGle6aKSuVtT8D2/4lzpfjsLKZlJdAY
 0/Ym0sCRnhv+qApRZ0kRuCBErFPcteftyMDeN1J1vJ6Hobns3YzXi4q5nzYZPkG5k9fA
 5fiw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786017295; x=1786622095; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
 b=d+JdBQVu0JriM3Gt1e5b/jWVE0U1Tqnxpv23LCQYBCTBLCZphDJAIJG+yNqnRAERfN
 xqyZviFcmAoTMVy2kjCkMvPNHPmGXITx9P9frRzWYN58xFOm4mC1DbFfC/60lgPtiExQ
 hDcKoXdkDKFO36C2jbPqgJIvqu2OF09tjD1iOu3DMsnHHHxyH+hVMCBxhMZRn5qRts5O
 XTtkdvvviKSDuWYgWQs8jPMm8TeTgmJ4oYFG8F+azlexQribYHrFg3uI+GqovEnxVhuI
 d4j/0QPt/Z0GA6j30zFLzhPEltfiwp8IBsIDifZYnq3o9U4ZjbhfhQmGrmgpsRB2CYXT
 ZXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786017295; x=1786622095;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
 b=OgjU39Hky27il4wRtPHfoUFo9kdLl4SVq59D0vDnABAehPoVseti8YZVBsQnNUXKWL
 74pQXfnIJXx1LNOU5wjRCDaOvCD7ghgoYdBIicsWUifBQ1CMHFeoCUrYIuORqUGaVkW8
 VefjMYrvKD/XnvQ4GpUaescuU3Vm8vuLsPVOo213F7GnX+f3CRzcyT3teQ2r/CI2T2eT
 RV7TeyQzAV3QSBNypYQOlqsssy/7HnXHm5YOyXv1ZZvpp//Nk3tEafvyYOsBT3ayP0+d
 wT/L4iCNu7u9IBHV4WcMXpjTn6usSvHRnFX8tsdiVJ4EKGBxIhng4f1qq93QzFGu+np4
 wuiA==
X-Gm-Message-State: AOJu0YwC0RqcnRXhyY3WE7YBhuxV31RTWI+gHzkDmoHD3eg9k+MMk5Co
 5PjHyoVk0z+6DapTqsG6ZiXlSepkOZhC0tb5+3apKMG93REI2WVS/rz4nkqXHmL7K/kZ6jJ9H1d
 12C8NtWuR/eXlnVxMzBXSOAKSb4R2FsbGP6qnYHY=
X-Gm-Gg: AR+sD10Yum+hvJp8GKRsMfFAFiVRMOGqmQSmzujS02wSvZnOqmalku+mnMZ0Im4AnD3
 QwQsYPF6bNX69+KbWYqsg/NcStIv/xK69FiNKZsaLyKth1yGLKhQpImTrz90liPI7y9qW6lnoUk
 SxXUsUR3R7gqJPttOoKieUEIye6m5ol4PDpwK49Rqi3E5QCGwmbwJwLPPsGrmHrtlMpNeBTI5kQ
 AelhnTfx6zvmRqGSunwpGe4B4p5knO0mmrvTv5Gq//Uh4ksSo7WWh97eqmxNifEQ+Tp0kRRmeAS
 dA5r2psPXLuDRjETyCsv1z7/g5h84vGu5e97GQcutUKrMJhmMDDpMw9jB5HmvKKAonZCaYcKigM
 =
X-Received: by 2002:a05:690c:f14:b0:80f:9998:e614 with SMTP id
 00721157ae682-8202288040fmr80320427b3.28.1786017294938; Thu, 06 Aug 2026
 04:54:54 -0700 (PDT)
MIME-Version: 1.0
From: "nomorsukses@gmail.com" <nomorsukses@gmail.com>
Date: Thu, 6 Aug 2026 18:54:18 +0700
X-Gm-Features: AUfX_mx0icv07njgIQKLGWn9W8s0rNdLlrMaEnUq6i0pZcpohwAhqp1x9AT3OCc
Message-ID: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
Subject: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
To: regressions@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 06 Aug 2026 14:57:31 +0000
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
Reply-To: nomorsukses@gmail.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hello,

I would like to report a possible kernel regression affecting the
internal display brightness on my Dell Latitude 7390.

After upgrading from Linux kernel 6.14.x to Linux kernel 7.x, the
internal display becomes extremely dim immediately after boot.

Hardware:
Dell Latitude 7390
CPU: Intel Core i7-8650U
GPU: Intel UHD Graphics 620
Driver: i915

Working kernel:
6.14.0-29-generic

Problematic kernel:
7.x

The issue happens on Ubuntu 24.04.4 LTS and Linux Mint 22.2.

Booting back into kernel 6.14 restores normal brightness.

This appears to be a regression between kernel 6.14 and 7.x, possibly
related to Intel i915 backlight handling.

I can provide logs if needed.

Thank you.
