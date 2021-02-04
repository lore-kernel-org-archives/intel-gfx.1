Return-Path: <SRS0=PZs0=HH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6511FC433DB
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 13:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27F864F38
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 13:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27F864F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652336E2D5;
	Fri,  5 Feb 2021 13:08:03 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32D7897F5
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 13:36:50 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id df22so4164403edb.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 04 Feb 2021 05:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6Puo/qjllLNLmfWe2RSzvJwUnGg4WHNNM3A+8y14qB8=;
 b=RPOgyh434hRTrCjINTKhinEAjyO3Wxq5X2AemuTUgDGlQcavVKeEBbjYhMLaE8Tpam
 3/2+LpF1E42tlFgQxYGLN/YkQ1tX5qTpwjMp48wHWIsniDWW5xhRL3CLHLj7UKKm0FZi
 kddldMUiSHfRI9L97aB4uEU2jTl+K5+OEqHLQGTuQSZyS6TQhaHGJD5IVosXVI5GbaQh
 5TBEXLqwmA7e7aEGzbdPgWvgzgtV50L8WbEz3novIXXNUJA06sfWDhzYBJl2pdNwsqAE
 SR/oHDZMG0Wm+QnyVbgP35EG3kYWNCrFiYYv2qOw59s8duNjEKqSw6DHL1Nw8X5+Ztvh
 i61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6Puo/qjllLNLmfWe2RSzvJwUnGg4WHNNM3A+8y14qB8=;
 b=WsRp8PM9KojqO/yf71Q2fSZA1GAMWuEGcTpNRPHlckpmDpBDEfulu4+nmHA6AJ7v9x
 nB2HpEvOY9i8nxzzbONeAP5PhM6GBt8Np0rfqsy0b5OtIi5NGGDw6DmqBTtcO/jlSPEq
 hWTGqMdJJOMrtYjyaXXQGpjV6u89UnF2Xk6xtvLh7tjChi3783Yps8zzl08EVBTTnNuk
 cIT1OH0FtbElKG0gPtWGTIoqTOhcP+b+gXJDzJS6wK2Xzfe3/Vv3IGmNVpBHwngowvqu
 Y3sJKJkJ9Rvr3bi0g/aQ5l0xxZFUIpxjVa6sR9CbPyNq+p7YKczExozznPvmz4NguFum
 T9tQ==
X-Gm-Message-State: AOAM533tIIWb9NlET/M/E54tFK6ZfCwycPsAq7KtraVLNlRpJB6yXxUu
 ishZ6//IGyjf5CAfDl9Uz2ecRV6YtyKr5BqtcMW8HrAh
X-Google-Smtp-Source: ABdhPJzDmtTXxLRsTgFdw3P8pELxuMimfoGsm+Hh4g56YjgM6RNy+oqlNBoozPgGG3OGX9ef6V/FWXRdl/Nd6Stc/Yg=
X-Received: by 2002:aa7:d34e:: with SMTP id m14mr844525edr.38.1612445809271;
 Thu, 04 Feb 2021 05:36:49 -0800 (PST)
MIME-Version: 1.0
From: FIKRI ADLY AKBAR18 <fbae48630@gmail.com>
Date: Thu, 4 Feb 2021 20:36:35 +0700
Message-ID: <CAG5=aZ+Kp_xMgb8X39xuhnd=Z4ZWEvdfZLsofOAQo0adPwe=MQ@mail.gmail.com>
To: intel-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:08:02 +0000
Subject: Re: [Intel-gfx] [PATCH 32/56] drm/i915: Move scheduler queue
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
Content-Type: multipart/mixed; boundary="===============0832807168=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0832807168==
Content-Type: multipart/alternative; boundary="000000000000ae662f05ba82cb28"

--000000000000ae662f05ba82cb28
Content-Type: text/plain; charset="UTF-8"



--000000000000ae662f05ba82cb28
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000ae662f05ba82cb28--

--===============0832807168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0832807168==--
