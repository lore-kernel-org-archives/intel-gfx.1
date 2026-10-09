Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CF9CA9ED1
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2026 14:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F9310F14F;
	Mon, 12 Oct 2026 14:37:53 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2210EAAC
 for <intel-gfx@lists.freedesktop.org>; Fri,  9 Oct 2026 17:52:55 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-917a707f37eso1171146d6.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 09 Oct 2026 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791568374;
 x=1792173174; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+4+0kNK2EftqWP44Afx2yrCAuhyfq98njB7n1Ib+EPk=;
 b=XnGexcee4CZqLETn9b5DMn6tbV09qm+SabySK8buJk9sMjAnwrTk25yIGsaagDQbcj
 J4Tg119s5SetrsbdY1ldQVeurGli3laQy3B+qjVE7aTw4SbfnNFU027M8aRAhZ0OVShB
 eswNe8zqRYxBBWOuAF4r6Qzafic+JMIkRiVgz97Jf+zN1OjfOcArDQra4L40Vlb4UsSQ
 U4YLXkGWQ1hxbR7SszLtUj9gp6FAoF4Z3MpFKh+8rwj0ks1htNeQoT8l7IsZ5R5P1eAz
 AO2riQOj6hCTNwqBEhPD8RKSUHYqcUWjy+FgoYzXckzy95JVzNiHNqwLIow92xCgiiAB
 E4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791568374; x=1792173174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+4+0kNK2EftqWP44Afx2yrCAuhyfq98njB7n1Ib+EPk=;
 b=Kxcd5exBt21iSaOW+tDgkzTdb/vVTgLbMVjtPfq0dfbE1ypZHrGF+IvlyLD1X0ic+k
 bZ8s3jvvxhVxJ6F5uhVgM0qCYltzWYdJdLK5cCs08b/LTYtxzLekJZvmufJofau/sMI2
 5OH/UZHNQboVHVlBuLhdMZavSqydb+1mkx+fnOdMw2ZSUQzy7n3Zkman5ot/hPE2CDIr
 hcOWnfvFy/E9doYhZuAWb5gFBjMKJDDi+N3ZcvggKfGEMge93RFtoONOgs89za57QSX5
 rCSQfP8NLzttHpuyqM9ZxO923laT0kpOujXc+xAbFGrgXHt9dRQVkcsMJlphR36fyNdc
 5/IA==
X-Gm-Message-State: AFuF++kCwIuOITeODQbusmtpIaU9Mq74scG61Nh7VnsgJpHJsS5hAvIn
 XnN8v1EllvYcAEbNzC6Lw8T2qeG49tltcZW+5Tz35Eek1XKMTsuNKIWQZgz7SEiHuCw=
X-Gm-Gg: AYBFou0F1q949HctknKsOnUA0VJ8XrCiczs3JT+wo7oz+lM43dR4mYDsWKzVKo/DaaN
 XmRgHgCN64PWMS3X5VaxktQ0N39zMeXii8PQgbPaIRrFb5Qwu2QO1kpufJPCQtLgulOI43HncOy
 djNHMeAEFt0lvynCTZazjPEfKixkCbuRQKpQAQKMnbDD6FpBWrBXatAAcF9UI2dV61HFBFqHm3g
 JZve7m3XW0ray1QUx34aXoTaYiUcbjvi6uG3kYfKoKKU2byd7t2H91RqXuVSHdfXEuj8ecfbgg+
 Wsa4BCwpyFVA3bx/F36Tsox4ev7QaEQU2l8mfYBncC4qE+zI/MhPakX1pX68zGgv2KS86W12ul8
 yjpWIFFMDfdWDgOE2L+QSaVq9E0ybXjuPrQtOhK/4fqxWMgoO2J+Y3Na3kZHIXlBV2WWmBwgyKO
 sDsTnQIB5gocrlr8F+IM2rStF0zV0JefJAuWQ9jp29Lu8U9pTpQ6m/3G20boGSEh0m0bq8gFJU/
 i1Ohlze/DJz8RuN/OxYPeZytzWZZUkillEhNDosCJp+PocBmfeecajSIfynuay44PDzMQYrKsDV
 CI8de3fcuMB6ypIjxphfBfS4T+Y4LVssrGZvElEjQvpVF0Fz4dxyWcaxIPBiW5dt89e2
X-Received: by 2002:a05:620a:44d0:b0:939:f978:c1aa with SMTP id
 af79cd13be357-93ebd0d1425mr411442085a.11.1791568373705; 
 Fri, 09 Oct 2026 10:52:53 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb9846a5fsm241008085a.15.2026.10.09.10.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 10:52:53 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Fri,  9 Oct 2026 13:52:51 -0400
Message-ID: <20261009175251.2097777-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <d592bde4b15a1c283f04e9412f46069f8a4926d5.camel@intel.com>
References: <d592bde4b15a1c283f04e9412f46069f8a4926d5.camel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:37:50 +0000
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

Hi Jouni,

> I wasn't sure if this patch is closing any gitlab ticket.

It is the stutter in
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119
but Panel Replay is still quirked off for the DA16260, so a Link: is
probably more accurate than Closes: until the quirk goes.

> I don't really see why we should bind it to vblank.

With the AS SDP off for all of PR Active this panel is fine for a few
minutes, then drifts and starts to judder. It also judders after the
screen has been off or the machine has slept. So it needs the AS SDP
back now and then to resync.

I see two ways to do that: resync on a timer (say once a minute), or
tie it to a signal the driver already has. A timer leaves the panel
out of sync until the next tick, which is most visible right after
wake. Keeping the AS SDP on while vblank is enabled avoids that, and
PR already holds DC_OFF there so it costs no DC5. If there is a
better signal for "resync now", I am happy to use that instead.

> DPCD 00107h[6] shall remain set

Thanks, that settles my 0x107 patch: please drop it. It also means my
testing of the RFC was with bit 6 clear. I will rerun it with bit 6
set and report.

Thanks,
Jake
