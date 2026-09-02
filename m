Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A586C61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4610F6A6;
	Thu,  3 Sep 2026 16:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="uJnleAQV";
	dkim-atps=neutral
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEC810F327
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 19:25:35 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-9377f717879so102687585a.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 02 Sep 2026 12:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788377135;
 x=1788981935; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eOSZwZkh58hDRqe67j4/nlf7KiAfIEb1LAB7CKHGbec=;
 b=uJnleAQVe/UrDJHsTqrjn7vqPmPW7lJj9vYAIqrDF1NyJRalVF9pQ3drTPJJ2Lq57g
 GCX1i2djy/Pnui3XccZ7TUbadBho8rQpZaHgwMHuOPSLX8ltB3iBEGEI3/+FqHEcUkZU
 kqJpmaImdZQIanLGO0m66wfHHg6O5rnSJTIAoiXy75Q/JUw262ZdJtFK1wVIFHds1s+Z
 /Okp6bd+qOi1Ey3eYn1dy0+fXWU958KquVQrG7hpTASCc/pV2XAPuofvsmkG2InrmmRW
 Ylj/D4oMmqS/swhXqOILeDKrICOX5EU3EkeU+wzS45HinR4ysToNy1NeqHlFPvyOgOiY
 3Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788377135; x=1788981935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eOSZwZkh58hDRqe67j4/nlf7KiAfIEb1LAB7CKHGbec=;
 b=dlfwudnc2HXVjrVXqbF2G47wGA/O8dbFs9TTRr04+xlGVtXiWmL8AtZH9rf6jFjzoh
 0Amt5BjE8JVEFxSDGIn6mWGOfFmDValr2Am4zfq4iqHygCAZJItiqx6rjWsrmAbPksbZ
 umu9is3wgbUFQoL6CTbEE929IbcoRC5XoJo6WZCoPO/VMpj8Bpz3utn2r44I7hexq5Nd
 aGuZrqXhkgBSOBltI46nDRg8Gw8P20NLqPRf1F+FYAyaQqaDWA03YfY9zprUvM8j8vkw
 jFRhM2KWnG1qvznEZmkkLsIdA634oGQ2jXEO96SIjW5oUo9K0W4vj9H1l8GKKoJKOfSE
 TpVA==
X-Gm-Message-State: AFuF++k4+A2oD4D7lXRvaKDGL7P9H/6ELG47T5OzS2vWZeNaAwR6cVu5
 uKzBrEuf7E8D7VAI67irFGhfUgBZ66mXU2GPr7Xxqnizdjh41jzVWLGWFuavu+BEhJ/HKrSTMJS
 vZ52/EvA8oCqeiKYeXCfjWsQRSwWLhHlyw4OgQF6+B/RO6i1mD6ttzTlCmAIdAHKAp1jljGl4aI
 nst6qco4PCBPoFC6TJj4TooAEgqsR06iS0ltokDEIacclFRMjO23ZNFyI=
X-Gm-Gg: AYBFou1cz7Q4trJo5c/jHEUP9q6qFDm49wUyw5tNhMRCifc3SVeXtkIg6R+IBSk7tIO
 oWrl2GyUKzBJZmS0cNJFSlrrTuNdORYac8QET8lSTDVNPzFG6DzblWResLwSYWRrS/sdxz9Ugjs
 qrKr7eBbjEbzPYE9fq9V+3PKT2sPx52ffGieiNL0jiH7XDzPFT8lOtTorpwyEItdnfGGufIugbb
 zeoQW1uCvCT+pEuDjLluukz7XYndEYKcKRaGJLKXdbKwtZq2v2rhTwk0BDEV7E+l+HeK5MNUfMf
 4FaLBUh/VVU8DbfGmirm21NDzJoDM+fGEAJytJu3nytFPGKrG0sczL1PkrGWDCmjTL75VXS5Qfz
 BvdFKZyoBgjir3nkQQEigLYS8XB4EUwg+6uc1Hmxsk6kcwBTO60Rm3QR7cFKGvp0yHPVW1aiaWm
 gVep3TEVhjkBe4cSuYUKNgAJg8jS8wgD28JZetWotWtGDZea/USH52Eq9ltq/ecTMMkF3Q97gVz
 scYN//YklcMXWcvauKB2V2+KsmbnlUL0hF3EF748Dwje27WRHIdYlcrhazL2nbVvQ+VUar2P2+v
 Dynmy+KHvXHfSs+EvR7Xb2rY7mg/3JkikXlwLiBbmbQs/hQS11pxG519b+mRvVO0sPTy9w==
X-Received: by 2002:a05:620a:a716:b0:939:3cb9:553d with SMTP id
 af79cd13be357-93960fdf834mr775651485a.38.1788377134732; 
 Wed, 02 Sep 2026 12:25:34 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9396b7ae401sm102436985a.20.2026.09.02.12.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 12:25:34 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Wed,  2 Sep 2026 15:25:31 -0400
Message-ID: <20260902192531.44003-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902162150.58778-1-j@metarealtyinc.ca>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:11 +0000
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

Follow-up after a day of A/B runs, all negative, each verified in the registers
before the run:

- TRANS_VBLANK.VBLANK_START programmed with the real vblank start instead of 0
- guardband forced to the full vblank (127 lines)
- PSR2_MAN_TRK_CTL in the pre-ADL-P layout (4-line units)
- ALPM_CTL with ALPM enable / keep FEC / AUX wake sleep hold set for PSR2
- IO buffer wake at the 5-line minimum
- PSR_DEBUG masking MEMUP only
- no PIPE_SRCSZ_ERLY_TPT / DSC SU parameter writes
- frames-before-SU 2, idle frames 6
- SW VSC DIP disabled with VSC_SELECT = 3
- sink: CRC verification bit set, MSA timing ignore cleared

Individually and all together: two captures after enable, then SU_STANDBY at
every frame change, sink 0x200a never reports SU_VALID. Manual TRANS_PUSH
SEND, CURSURFLIVE and LNL_SFF_CTL writes with the desktop idle are ignored as
well, and PSR2_SU_STATUS stays at the block counts of the two entry captures.

I have exhausted what can be derived from the driver source. What would settle
this is a register dump from a Panther Lake machine where PSR2 SU or Panel
Replay works, taken while it is active: 0x60000-0x610ff, 0x70000-0x707ff,
0x420c0-0x420cf and 0x16fa00-0x16fa7f, plus DPCD 0x2008/0x200a. If anyone at
Intel with a PTL eDP system (Windows or Linux) can share such a dump, or point
at the Bspec condition the PSR2 engine needs to leave SU_STANDBY on Xe3 LPD
with two VDSC streams, I will do the rest.

Instrumented kernel, scripts and all run logs are available on request.
