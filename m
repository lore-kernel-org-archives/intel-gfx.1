Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F3ED73E83
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jan 2026 20:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FD910E8C7;
	Thu, 29 Jan 2026 20:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/bzLYNk";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C632310E73C
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 17:13:08 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-29f102b013fso28205ad.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769620388; x=1770225188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v536dPL3xbsn4C25/q600c85aXwSnqGccGF9Ndz/vck=;
 b=W/bzLYNkZaGXe2fQOalrGHWUZ5pXMK3sQUHLvNWiRTKmP0E7dJAPhyfZHLsJ+2mujJ
 oJYoDp8a610x5ZVT8u+0FCLhrL2gikFeQ9Dn1M2kDx539nCpijstJWgRLNKd/fV8MAX3
 vRxkjACd+V35Al3xOQCcwwgQJZot/IfWSdUUpqqJFAIK7F7SxuxHWWTn0+xIWp0KBE0a
 JyY+CKXCnAezAu218Z1JQEVu7RssjDEvBgRBS7mjdhbkiZgCcRCld/Zhrp+MrlJt1eGA
 hCECrGxL4D59P7kZsSkkYQT/QMJD/U3tgnvlpLuEdMQ24pWO83caJGIsIuMB66UTuPuM
 LpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769620388; x=1770225188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v536dPL3xbsn4C25/q600c85aXwSnqGccGF9Ndz/vck=;
 b=hhfIUZzwpKW5pH11r5rm+kmvUiaQ3Ws1Z7tG2D8jf56Z2Y6h0KY/GtVkqh7s97f3ME
 rOuhQn25hRoi7304hGTAre7kkLEzJk0VVEww4bOFbdM0FtFQuUoSmPvqBcIGNCIuTxrI
 8q1veIKM2rqmNVmNb3qR7h3PWrvAHrv1IAdWOLpN9YWewQ9DJg9pgFkBamPWqxzjFQku
 iZUDG+Ki9+bMSV/zoHbZHMTZvjmJ0K5TT8903bjLMA+qtCAptfsURH8trGp31vU+UJZh
 gW8GOR50eqqsD6RC7gNOwOzFEw+n5WeQtyLPdnxr+uASONNllbAoC/WTzPocZA+6QMC6
 JGug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQuoBDsuKWVhzxxjlKCYu79lZqgdrvllyPAiO/wQE+kyrHqLDcuLjQTWYzL33QQM/TsQ3Rh+xQ+As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww0B0LjG0tXxcPtG+ZuBSctOMjZ/4R8BT2eKWLf+08r34bsbNs
 EzqrsE1Mj0mt4IUKBEoQUv9H9WFCIT2Hmh9/FUl5pvHnVLNupFYNYlU=
X-Gm-Gg: AZuq6aK9ZWNFzOue39fAT+1sw1YLfDO84U3XX3oIDudo4XfHF4QU3qXoqRLptxIzbZP
 UMWfUd59+/07RmpusbqGZKXkCHRdPeXwPKVY6MNrMyrvN7nykJ1A9wVZLY4Xq2WtYAi0DkLWUPW
 SJiavikZ2nGywUdOtIXpLpHer72Dj8jJmOSJ6+977NClJVjOYW/n6HNz9r1j0tPs4UFyc8lIMQQ
 JJM+3EC/nHHr5k67oh4SkYqB1o4VcxmdvaS+qcqe/XUomaFkVwDBbnpRLEPA+BuEGt5mSSahC58
 3bn5MplsBOAPWvlRsLI+N9cy5IZ+kSpz2uhuztXXLrBcBq5/eTFuNtFl9PJ4psnUGHEM+PX7plz
 vox/nKWnG/dmgbwuYFKhw2PUus48yGg11XTPDEjj4L3L0iXf3YatB7rCjRYMNo4COJXVnf/kKdJ
 g1kdzLczEpuJUU
X-Received: by 2002:a17:903:1a88:b0:2a7:afb2:ce1c with SMTP id
 d9443c01a7336-2a870e18dfdmr60392705ad.61.1769620388192; 
 Wed, 28 Jan 2026 09:13:08 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8bd74e9bbsm85105ad.95.2026.01.28.09.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 09:13:07 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, mingo@kernel.org,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v2 0/2] Add support for eGPUs on Apple Products
Date: Wed, 28 Jan 2026 17:12:58 +0000
Message-ID: <20260128171258.1081-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXoxpWFE0rByjS-y@wunner.de>
References: <aXoxpWFE0rByjS-y@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 20:47:43 +0000
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

> It's possible that the iMac has a multiplexer built-in which can
> switch between the iGPU and dGPU at runtime.  Please ensure that
> you have set CONFIG_APPLE_GMUX=y in your .config, the gmux driver
> should bind to the multiplexer if there is one.
> 
> If there is a multiplexer built-in, then disabling the iGPU is the
> wrong approach.

I was using apple-gmux even before this patch, and runtime GPU switching
does not work on either macOS or Linux.
On macOS, the iGPU does not even appear in System Information.
However, the iGPU is present in IORegistry, and Apple appears to use it
only for acceleration, not for display output. This can be seen from
the following IORegistry entry:

    | |   | +-o AppleIntelFramebufferController  <class AppleIntelFramebufferController, id 0x100000556, registered, matched, active, busy 0 (230 ms), retain 8>
    | |   | | |   "IOClass" = "AppleIntelFramebufferController"
    | |   | | |   "IOPersonalityPublisher" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "CFBundleIdentifierKernel" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "CFBundleIdentifier" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "IOMatchCategory" = "IOFramebuffer"
    | |   | | |   "NumFrameBuffer" = <00>

NumFrameBuffer=0 says that iGPU isint handling any dispaly atm.
