Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD450E7315D
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Feb 2026 12:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4336110E4DB;
	Mon,  2 Feb 2026 12:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qhb1TKEy";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512BB10E262
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Feb 2026 08:01:17 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c61343f82d7so1634983a12.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 02 Feb 2026 00:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770019277; x=1770624077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gpa7TO42qLDaaK7rvjxkwHnmN2Z6us+3ErmDg7wFIC0=;
 b=Qhb1TKEyd0C9yjBTj1EEYKYh3xRTSx6YeQJYBX0l2LJkXOIh+iUOo8cwzIi/qCbR18
 k1HgFP8odZzyYCR80T6oNNT2+9GuKdJP2Qm8hF+tWKWCzWcw3jkpmw/Tdy1hVR2QLe2L
 wm12/Sjr4Xwn+6Ox/iDDMu98dqRndwaIR2d+kVjAPU5uDh4SpR8mxm3Arfjg8FwMB13+
 qRsa3AySl7yMah6mLz0wTuwtWeOxRJPFCHM5gSYGY92MXTwJN8ELIKEvkfLnSy5V0r9d
 ZMSaMgrQexhU3rhD2nuOqzhFpyWbcoCLsUcsv4V+j5Ln0HUMAXIIRw3hiUTGLE5SapLH
 AzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770019277; x=1770624077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gpa7TO42qLDaaK7rvjxkwHnmN2Z6us+3ErmDg7wFIC0=;
 b=LR34Bq5rwrMd1m99BUVraAUnnxEN3epO8eUWmA/0ly6uR3jI1zZH9GJTkJJcyOcUSM
 fFvFkMsYINAFRFhBvHj7y4jC2nuzFveVZYceD4GDYcaoNXmbrK5DHpvuhyU6ywu9BWV/
 oN3FQHqhsXt7SrYRPS6o+F8gCJLse2FWXo6jiMptS67JgzoMICpK8xlqjWKbj9Qtyrs7
 09Et58VzzLwEBmv2NC+VfBwLH9ZBneBEv9xhLzd9rMYx7RfJqKbcDMkgHb9GsPrjtmnk
 mJsHD9bThIrOD5hfVHPCUcmuuLH0G6PZ/Sn57OIXhERv60Polo0FBk+GxM/tkplbmCM7
 P0rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlyY3KjByG1WdonHwm02xChqNX3v0CCWZVxQpedbAdSNnoDkFgiYbB4DlfhSlxffCPlDmn/S7iPKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL3yJjo5pPrQ/Sy6RyvLKpsFfuv88jN4gMtsP8H+rq4/bdzW7E
 w83vU0Iw1nu/QXYlaHN6svXDjQHvLvlJy41ZgUL/J1ytarS4Q4YI4Fo=
X-Gm-Gg: AZuq6aL8M6e+Po3U0Au/Ob4uOaMk7Uq1Ov28I8ZswdfcXNZF3DZr1O5qBfAvL2FBUQ4
 ULLvvvlhzoSeq0gX8y96HwmUXeTVw36ufQ6j/7k5TyZto++COh8y5BQoCh4oY31/48f1ttWU0wL
 c3BpiRYrfHSivzqul3nriFcddIdse5OPRtTa4CqcYylDMQFbKfKpcEK2zVqgqjnji5Wsr38LJ8c
 BuLuLF9uclMZ82hhm3C+Q9YI11l4N9696WVxJ/oep+ys7q64Fgpp8UeR37bnuVz/UGt9ExKXAJt
 QqCjeVtgotSODIt4dNVlnp0EiY8UQ37xbXV+rEItE09hYls72MaxZCqWWETdO3xvdkUXPbyLGF6
 pLYgVqurVvYY7ebCawvIW9NAzr+oYrz0sA/X91VWN3W1QzQBsFEAqxjlDZOjCzhL+TSB44jrP67
 ZEFepZsCXRmN3aXzI=
X-Received: by 2002:a17:90b:3dcb:b0:340:b912:536 with SMTP id
 98e67ed59e1d1-3543b3ad361mr9815251a91.31.1770019275904; 
 Mon, 02 Feb 2026 00:01:15 -0800 (PST)
Received: from at.. ([171.61.160.203]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f2f02aasm14655168a91.7.2026.02.02.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 00:01:15 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Mon,  2 Feb 2026 08:01:06 +0000
Message-ID: <20260202080106.1093-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXovFQsk-w90wZi1@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Feb 2026 12:56:09 +0000
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

> Maybe you could give it a spin and verify if it fixes the issue for you?

I tested it, and only tested to see if it booted.
now again i tested, and it seems my iGPU and eGPU wasnt detected?
and after futher debuging i found that setup_efi_pci only detected
dGPU, so using update_nr_gpus was useless.

and about the macbookair situation, i say we just exclude macbook from
enabling apple-set-os via a smbios quirk.
