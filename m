Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7716C43458
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Jul 2026 00:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E8D10E18A;
	Mon, 13 Jul 2026 00:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="apJgbuyM";
	dkim-atps=neutral
Received: from mail-qv2-f1.google.com (mail-qv2-f1.google.com [74.125.230.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C9710E18A
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 00:37:00 +0000 (UTC)
Received: by mail-qv2-f1.google.com with SMTP id
 6a1803df08f44-8de1d032d56so12297616d6.0
 for <intel-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 17:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783903020; cv=none;
 d=google.com; s=arc-20260327;
 b=jkqEYRdVfRSe94M5udIkmnH3tFQN9j0a/XvCGhqw57LHcJdYLIiiGk3vYSLD8pkLUA
 ZxS9nEP3mlX/ZYHTNdo6Bqt0SgIKYYEZTlKllMDMv16STBL6oSCzl20mghtxhbnQzpM1
 fXcixdmar5jlbkVLZLk4aBiF87Hza81ZcydByqoJf7zdpMN5YrnTOpHAT5+2Im+zG4h4
 n+x2TXwqrlIH5OlLsIdC5pKKh5uiAduFS8gW424VlUtVuCUoilkArFNOWGZ56Qw13aP6
 mh8+kmeJl6BncG6/FaE7/jOiYG4PgTg4Z7WZqOgVMAdpvQZMLexm9Xejw5w+ldPNwTAX
 nniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=1wRnBorjkU9scxWPBrcgodrRv4fQarK3+pkhmgG2UtA=;
 fh=0mq9d1JUrcYsoTTkGHiTtQVhfUtVmM5T3dWmSoFUk5Y=;
 b=sYdP27EHU8MFDwaqM/xTeS2X3f7f+MAtkOd30he9pbeHA5YD92jhwfIY2Z9yqPrzbN
 ZvL40w+3raubeSy1wqciyWU0hVvi/PKMk+5bBgmiRwP3l0HGjL9VAuZBAdwVvRj2F/SB
 NioUbBXfRXjzUl8IT0Zcl+eFzJOQ2hDKRd0ZZKDw8fsjKycPqJsieYk8fmR92rFPQr9O
 n8KgqW3KaJFUnUozZ14AQb5lB+21m/CI4rhu0+pGPJTSPh1D76nhFIfQ3fL4yVHwcW5y
 u4NitMtSBAGgwIznuPlyZ+y1HhVChtgp5w5GpgTg9/86I5zcRRiiN+H2+Sl6HUWoZgA6
 TcrA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783903020; x=1784507820; darn=lists.freedesktop.org;
 h=content-type:to:subject:message-id:date:from:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=1wRnBorjkU9scxWPBrcgodrRv4fQarK3+pkhmgG2UtA=;
 b=apJgbuyMmLO9ZUl+kpKx0pGInjT3BB+fs92CIJWM6ngjTzfzStrYj6QkL10wfs7n4y
 Tv0bi5C1FIfOL5nlkbhyeHQ57jOMxyet+SG+WyryJ677a1KhCtPni/FSPkJcqnQb+mhI
 B3mTxWwOVheWLew21a4SDFsM0QQwmHKleiBq4/+Dw6f9alkmNsM0L3K2Do0RjcyfA3w/
 bnYhOeMIt6TWl3J25KgRyXglMAX2QaYAR2QBFowGi+eqFZmeHazTiD/Cxqt9b7q1HNgB
 WxUhYxDe13drFuI/9stv8M+PpLyDy9Jwpv+8jxyqe/lyBfQRnKvBsw2RKPrh9wL+ylXE
 ZbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783903020; x=1784507820;
 h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1wRnBorjkU9scxWPBrcgodrRv4fQarK3+pkhmgG2UtA=;
 b=iLO07h/CqjTdlNSnYJtH1uD4rmUGLDc81WaV+hoT2132pFZd4sas/iW6efditcGDl5
 kiInnEkwovfn2g/tzcDb9l8jhSS0zLMSRRVn/hqbqZVn+ZATaoOTn7jPvuACqGGU8RUP
 sSKc/C3Ta2cMmhhW54subBqdRrFzZPegpN+gmYxbMBTbzrVlThR/YbcKH0YMahJ9GO3q
 q2kf+9dUqR6asSDBMCosCXqJoDtfT9Jcv/3TpQd/GiZ9TLi4sFrbLQ6OCCvGXAO6ZXBP
 qocj/g157XW2tKzER5DvrNrTcxxcOCA73uwmQ5T0ynd53Ou9sS3QLeRw93yOsb4qwwYx
 sYGg==
X-Gm-Message-State: AOJu0YzBBKBXEnwFlMZzl+fKHpY+7o7qoxphermnxMz5SfzxuZAgv0Uv
 riFV2YDIL+sHBDEc3ZNjEga+Og6BrmHsKY8zbIa+FL94X7s1SLimkHSt7rDEhyusm97OIgQ9bzC
 ldpxLHso30J6rJfOYcDTzvOu7pC0H2T4fCsHoSY27cYA=
X-Gm-Gg: AfdE7cmtcyYQ2boqlnVkNUde7DkLUK2XSJogw5hGEGnZC8nIk4QtoCVsJRPPl2WjflE
 ts9ipSqFKtOblBJYkpqO49d8cCG/4D5n3uwOCey+a2EEsV9u84Ivi4sQc3EwLieBB7tRHaJQ17w
 MqB/EiVmUiEaTBIrEHG8BJuqgqrr3ZZColHC45bptyB43CF2PSNWfZnIMjYO4nTmYTeKPh/mHfN
 OjKhbAznM8PsdoJu0GNgFIpKhr2G/wC4JLeejjyPIX4k7B5bv9wIBiTiQswOJSgt5lBxWQ=
X-Received: by 2002:a05:6214:3004:b0:8e0:c7de:1a2e with SMTP id
 6a1803df08f44-903fae94526mr82179416d6.0.1783903019583; Sun, 12 Jul 2026
 17:36:59 -0700 (PDT)
MIME-Version: 1.0
From: Tadeus Prastowo <0x66726565@gmail.com>
Date: Mon, 13 Jul 2026 02:36:47 +0200
X-Gm-Features: AUfX_mz7WrGs9smKd28wbKXlTWuDKepDYwZaftCs8NQMDzNtwOdMiLNGrG5Sodk
Message-ID: <CAA1YtmtZu4xH0dFXUUp97Apz4wNAvtpY2=QfhKgpt1scMFpYqQ@mail.gmail.com>
Subject: Commit 99cfbed19d06 at Linux kernel breaks AOC monitor 24P2Q
To: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hi everyone,

I have an AOC monitor with the following details:
* Product No. 24P2Q.
* Model No. 24P2.
* Manufactured in March 2021.
* Native resolution is 1920x1080.
* Input connections: DP, DVI, HDMI, and VGA.
* Product website: https://www.aoc.com/uk/monitors/24p2q

The AOC monitor is connected to a custom PC with the following details:
* CPU: Intel(R) Celeron(R) N5100 @ 1.10GHz
(https://www.intel.com/content/www/us/en/products/sku/212329/intel-celeron-processor-n5100-4m-cache-up-to-2-80-ghz/specifications.html).
* Integrated Intel video card VID:PID is 8086:4e61 (JasperLake UHD graphics).
* The mainboard has two DP output ports.

The monitor and the custom PC are connected with a DP-to-DP cable.

The monitor has been working fine with Ubuntu 20.04 LTS in its native
resolution: 1920x1080@60.  The Ubuntu 20.04 has Linux kernel version
5.15.

But, the monitor no longer works in its native resolution after
upgrading to Ubuntu 24.04 LTS: the monitor screen remains black.  The
Ubuntu 24.04 has Linux kernel version 6.14.  The monitor can work when
the resolution is set to 1024x768@60 using xrandr, but that is not the
solution of this problem because I want the monitor to work at its
native resolution.

The problem remains when using the latest Ubuntu LTS (26.04), which
has Linux kernel version 7.0.

Different DP-to-DP cables have been tested with Ubuntu 24.04, but the
problem remains.  The monitor works with Ubuntu 24.04 when either a
DP-to-DVI or DP-to-HDMI or DP-to-VGA cable is used, but the monitor
cannot work with Ubuntu 24.04 when using a DP-to-DP cable, which
again, presents no problem whatsoever when using Ubuntu 20.04 with
kernel 5.15.

The monitor works with Ubuntu 24.04 using a DP-to-DP cable when
connected to a different PC that uses a different Intel processor and
a different integrated Intel video card.

In other words, the problem is specific to the custom PC described at
the beginning with a DP-to-DP connection to the AOC monitor.

I have bisected the Linux kernel and found out that the cause of the
problem is the following diff-hunk of commit 99cfbed19d06
(https://github.com/torvalds/linux/commit/99cfbed19d06#diff-eb927a6d3f0588695ab1a8f54a0c90a7a5feddcfa8379e49130b2594b819f686),
which is found between Linux kernel v6.4 and v6.5-rc1:

--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -699,7 +699,7 @@ intel_dp_prepare_link_train(struct intel_dp *intel_dp,
         drm_dp_dpcd_write(&intel_dp->aux, DP_LINK_RATE_SET,
                   &rate_select, 1);

-    link_config[0] = crtc_state->vrr.enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0;
+    link_config[0] = crtc_state->vrr.flipline ?
DP_MSA_TIMING_PAR_IGNORE_EN : 0;
     link_config[1] = intel_dp_is_uhbr(crtc_state) ?
         DP_SET_ANSI_128B132B : DP_SET_ANSI_8B10B;
     drm_dp_dpcd_write(&intel_dp->aux, DP_DOWNSPREAD_CTRL, link_config, 2);

After I rebuilt the Linux kernel at commit 99cfbed19d06 by either
reverting the hunk or rewriting the assignment statement to
"link_config[0] = 0", the AOC monitor works fine again with the custom
PC using a DP-to-DP cable and Ubuntu 24.04 with my custom kernel.

Since this problem persists even in the latest state of the Linux
kernel as of yesterday
(https://github.com/torvalds/linux/commit/44696aa3a489), my question
is then as follows:

Is the actual problem the i915 driver or the BIOS of the custom PC?
Note that I do not blame the firmware of the AOC monitor because the
AOC monitor works fine when connected through a DP-to-DP cable to a
Ubuntu 24.04 running on a different PC that has a different Intel
processor and a different model of the integrated Intel video card.

Thank you very much for any help.  If you need further
information/test, just let me know.

--
Best regards,
Tadeus Prastowo
