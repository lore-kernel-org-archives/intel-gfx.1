Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9218C44502
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 12:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103F10EB7D;
	Wed,  1 Jul 2026 12:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pg6Uf/8z";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881DE10E032
 for <intel-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 06:17:10 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47488efcf30so60997f8f.3
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Jun 2026 23:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782713829; x=1783318629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gD8QxoDHBMynsX/nmz6FeNsnsEwmzfTNM7CnqhTDUtg=;
 b=Pg6Uf/8zAOysXf7zhpINXifyDVSEdfQLkzKTAbsDMJzrsZBOZSRsoYCEA7jrkp0K4M
 XjQ+kIlI6/I6Qc/lwZX8Qq7LRNi4ILjxy4i2526vHzrRh1SXuV6U+LOGeXIBfUljcfLB
 euoC5PyxK/Fu4suld3oTtdafLh8DcQVMLSTtZuIQwSRim5Y6KNpkARNeT3Tvhg+ytaVI
 IAtKjDgU59Fi4WnrUwOxQVd9hOUs65t9cc0asskD9tTEXlPckK6xRi9ezG6vCOnqlEGB
 JD9oPl89y6or5v1Mt7lzIvcQUO7yg16yr0YEkr1ilPY+mX3iMzBVmwP78kGhwde9EJFX
 5gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782713829; x=1783318629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gD8QxoDHBMynsX/nmz6FeNsnsEwmzfTNM7CnqhTDUtg=;
 b=denhlg2O+XZVOolKvRzsZXj+szBvSv9QMqwBf7XtHHwYOGDJQ3nkFVHiNLpi2MA0Xe
 NveWIWPCvpaPAqCq3QirQMzxgjpFTG8We8ebLMq7j8y9ys5bfk4PO97Iu3l5roTBjRh/
 12BLjTh2lwc3IvAca2bsXWQ9nDhN/kdssm92BhAjoF95M8noLA1uotkMaJci/L2tONR1
 zL+rSkT85/0g57gpqC4jNzYG194nKM6zapSapfCwLvW5rxKQZCXSJ4aOTlZRpjeJuTOW
 +Ub0J7wp49texVzPuvhIVNLnfiCStRqEq3Tp5hlbPh/KFIMH6jBGgLyEH+3KjWAYb0JJ
 2pkw==
X-Gm-Message-State: AOJu0YzsGlb3LtLdOeyF9A2kYXD+d44FCsJ6Twpwo01BsgPt2f+VCi+2
 z7N0mDwQ4d89/PXug5u5T6JfkzImEsfZxkH9az+AjANzxPZ1PNW4aDnA
X-Gm-Gg: AfdE7cklJo8MkhTvmz7jStG0T/KZ+dsbCihlWHUjpumFAPTcQLSlm0oQjL3kMvHtpET
 zyp5CX1OsCR7wizsfWx5FR6dWYSJ0yGfnGOTkMUySEZxdeFkO/VKMkUlB6i/oOfT8MF2pGaxVZ6
 +FquxndNmdfse90CvDEgEnmpevBHwmW6qBtzrQ2tCzMOVno17CcJ/dMPrhFo/2J8LqMfO78h3oN
 NsE9ir8jFbJ2def1g7X6ENR/eFWuN0nq+6iI3B2uWtLMykDd1vjaobG3oJCgIaV+S59AgkC6W0G
 zKGqTuKpwt6ss1Jpr6U2Z70/leTFFXylwIAhByIKPgk4EHLGrMwtaUR4dYOKYIyL0MURUWIhZ8x
 IA7WAzcRZfZNbVmxyikFGyZyFOnlubqBqaYCE9wJq6Ryi5GCSXS7dibsTMtZAVZesnGfAjENy0F
 Y8RmoQLs56SDz7DLzNC8SwYw0YZStInBN6yW16IueqiOsKwquiBgh1lTwWtEKSn9q7/g==
X-Received: by 2002:a05:600c:c047:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-4926fc95e86mr104276025e9.30.1782713828484; 
 Sun, 28 Jun 2026 23:17:08 -0700 (PDT)
Received: from JTOLLET-M-FKW7 (232.64.3.89.rev.sfr.net. [89.3.64.232])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f7670bsm281334725e9.0.2026.06.28.23.17.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 28 Jun 2026 23:17:06 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, arun.r.murthy@intel.com
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Mon, 29 Jun 2026 08:17:05 +0200
Message-ID: <20260629061705.55335-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:57:46 +0000
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

Hi Ankit,

I noticed commit b7d51d65e4f1 ("drm/i915/hdmi: Poll for 200 msec for
TMDS_Scrambler_Status") is in drm-intel-next since June 11.

Now that 7.2-rc1 is out and the patch does not seem to be in
for-linux-next/drm-next yet, could you let me know what the expected next
step is? Is there anything still needed from my side?

Thanks,
Jerome
