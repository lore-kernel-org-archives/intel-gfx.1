Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520D0CD98E2
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Jun 2026 10:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66A610EF1D;
	Wed, 17 Jun 2026 10:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lRKdZqEA";
	dkim-atps=neutral
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E318610E512
 for <intel-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 15:31:58 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7fb2444cbc2so1179547b3.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781537518; x=1782142318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKcucg5HwaEhqTY906NOw0hSNqAQiV7nPnjw1bHrvgk=;
 b=lRKdZqEAx5i7RF/AUS38zvWRE84o0U/2V/dW6/Ps1qRMP30VN14kAm8mCbe62CLBQF
 HC8GeQcAP3PFZ9zAGCJvm35tylZB3eI35atfxToWkUUU/76rKJHJY53nfEcOLSnslidw
 UrO9WMc2yZ23OyToTVs4sUYGSamN5izFQCissEoe7rEW0ubVUMhnPMYLGIx4MdyHX647
 QkFOyG9MwszDHIix/3t2m9o+54dmHpl+uPPybeKI6enpvMoBAbQZ7y16q4gKsixeiori
 4dOo36FLIOun0d5IlNiTkQWAKjc/QNnwELJXRu8HcAh7QMK6AEQSwKT2rsJYEWnho1Bt
 WbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781537518; x=1782142318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gKcucg5HwaEhqTY906NOw0hSNqAQiV7nPnjw1bHrvgk=;
 b=iqWgJLcLz9BMpV+f3Wf7xl+IGhYlgvi9BwiulMnLgL+LL2LNDcpdj020nLLV0KXClZ
 IPokN3W3orMEjgXqIh7yv3bTiQkIOGCdLMl1dP88yRRAf4DrDcan5La+uMjw3rmTBorj
 IFmzqxc3RgGKNGCtFbOOEKE8xfC2TX7FN98M+xIp4Q4bHSLpTLs7JW65ry6nh2cPlnpG
 Y19tvQHJFECv0Rg6ZOrC0yTU67TRxSN1XlzMaAOM6PYmBMXl/3vFBxFnA0QGHAEShuBN
 B7l5LoqocDP7Dl8bDIat6oYzCoL2os8clbooqW97ALtK070QjIJ6hrXF/mjkGefayqfM
 kgSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hVSlxFhJ18gw+a9PhmKpmPmEac63IBp+kjdySWC3Anhg4lxs2tZzPmcuCTxMVXMLsisSzlpB/2dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfQ3EHCpISdUob7lG5EQPoL3tjD7wYSUbxKnEzjfTJzZZ6NPiH
 69gchrApwBCACx3jeM9txNDEK3k/Kns0fqHnQ3RtrriJNVvAAwxXU2Dz
X-Gm-Gg: Acq92OFobVqGLVEJynJux6CiYZEywxtmJ8/WZrHyKC/+mEy5RG+PEA/2kDb1BrQQ41U
 DOsbnfvkzcze3h+yWNerBKMnS1cJ7ZhrUWSYaaduis0Si40eYL33/k//PejDJbftMAO41oNbk/q
 IeUQU6cu1JbNczIf8cxlaofaJyrgYgU3Ow2yn8XC6tDowb7hYSaMvIeTaXydvm2GwhPKuGHkNUF
 FkzUMbFLSf4uPZUU5T8o0PtUwLfWLM0l+an3BOxH2Kh9AwpnDsXF9DhD4sT3Iax6uLPPwRpL8of
 K3NVVCwSL4d33ZnOSsNEw+CvS7G+tB8KaCzcSZK25NBdD6zRmjYMAEc09JSglLIZGD+FSlG0waq
 0QOv9j2gwuwD4QRD1hAkSREQ71YZdfsx8zjm2qnF5+LdOfSgDGiSeD3f5jeHmyTn7RlYaB1S8sC
 o4fFCZtDOBDbYKCdGM/VhAZM1x3NWOi0JsUFn418XMNTuostFv3KHi07KZEGW5MwK5q/wthrtV6
 op+LiLinsp05ERdDVsxvSeBwN5v2NdeXWuk1f1lbxjfUdWMSCH63A5+HMgVigIcfhos7Ebykfub
 fQ==
X-Received: by 2002:a05:690c:18:b0:7f0:9099:daed with SMTP id
 00721157ae682-7f7b2eac7cdmr94041657b3.0.1781537517565; 
 Mon, 15 Jun 2026 08:31:57 -0700 (PDT)
Received: from debian-t14-gen1-fuhrysteve.fuhry.app
 (6.sub-75-230-138.myvzw.com. [75.230.138.6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f132185fsm1788916d6.2.2026.06.15.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 08:31:56 -0700 (PDT)
From: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: "Stephen J . Fuhry" <fuhrysteve@gmail.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [2/2] drm/i915/display: Refcount for fec enable/disable
Date: Mon, 15 Jun 2026 11:31:55 -0400
Message-ID: <20260615153155.10736-1-fuhrysteve@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612091807.2123172-3-arun.r.murthy@intel.com>
References: <20260612091807.2123172-1-arun.r.murthy@intel.com>
 <20260612091807.2123172-2-arun.r.murthy@intel.com>
 <20260612091807.2123172-3-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Jun 2026 10:06:45 +0000
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

Tested the full series (1/2 + 2/2) on top of linux-source-7.0
(7.0.10-1~bpo13+1, Debian trixie-backports) with a local adaptation
for the for_each_intel_crtc API difference between 7.0.x and drm-tip.

Test: cold replug of a ThinkPad USB-C Dock Gen2 driving two monitors
over DP-MST (10s unplugged), with USB_QUIRK_NO_LPM applied for
17ef:a391 and 17ef:a392.

Result: zero fec_enable fastset mismatches in dmesg (previously 40
hits in a ~3s window on unpatched drm-tip for the same replug) and no
i915/DRM events at all — displays recovered without a full modeset.

Tested-by: Stephen Fuhry <fuhrysteve@gmail.com>

