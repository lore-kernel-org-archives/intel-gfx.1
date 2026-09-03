Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2367C624A4
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1053710F6AC;
	Thu,  3 Sep 2026 16:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="YfpRaaIZ";
	dkim-atps=neutral
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97010F5FE
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 13:52:31 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-90cc107c451so15344226d6.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Sep 2026 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788443550;
 x=1789048350; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hUjAEmmSy6PFRBv/7ZCD6slvlXW7y/fGRjA/z0SrhjQ=;
 b=YfpRaaIZbbHSG40zJlc9R71ZgqdfwdC2fwn13qo7xPS9DVtf5PNFu9jOiqtaClgFMx
 gyPnhombgl2DMHW8i3CMMP00yA8eTft1wPIEbr5A5iP6X2LRYgNp5UIKj+JzPqfuyfC0
 vECiQ1eQa+55M8ubif9aXUfv3wukdZYojoWOgQ7Q03bi6FXg2y0FWAtXVvYxKJhethbS
 VHJKkMcHBuEdEQay8WFXMKNfF7yUHlAa+06tcEpe49LcMnLkurbXU+ER0eOMruF6pslK
 ZM+ac9LW3RPsRM1GZ9rd0VhfQjr8wGHAAQRSRZL0UCTFlDjW9HQmZRiHsXkA4w78J3N8
 EFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788443550; x=1789048350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hUjAEmmSy6PFRBv/7ZCD6slvlXW7y/fGRjA/z0SrhjQ=;
 b=bzPjrbo+fPT4sVfFwBTCNArWxUw52xsIjbpVhNBMI2nDf88KnrGDB1jhsbDoWiqpQN
 jXSoMvIfGdtdegXh7mlwJA37ovIp4qIJ/9dwLelPJKXfrEPbBRh9hB1lsJqJRXkOPFok
 JDjsEuvTR7+ELQwH8Y0F+wbUIQuhlSSGxqKtl9scs58KRAcSRQvto1iFn7+Cf0l+/0ib
 STpTvORPhESrJ6ZNQLCu9SnmBRa/Iq7tHrqw7y/q8wHwLOdZ/TICgEae2fFy9E51unJH
 HRu5E9eQbJbVlmLtFTBS/NiQMRj/GR1sVILbW70ZXPZM0Gf9GzzRPef4QY7ywH0NI7mc
 ZYig==
X-Gm-Message-State: AFuF++k98mSwIO2jaEZm5ErBPLHzsUCGZCmGmKYEFFRv2MPSD4RpzGFk
 RRvsIRrxSuL07KDuGZDdxibnMJh6CZflNhFavZAODZhNm7x4XRq54e9PCCvtYEoKUyKgZxCUzM6
 uu312Qm5bZoKo/aJhRrIPgSV4u3c+3J61ErPjrWd5KYjIcbW9cNBTM+5SYOKjZHbUyyd6tKkPe2
 YDGhxIgXMnVNEMmybRiD7JlX5tK8Bbc9zzj3hX9xo1+qUnUx207w3Fo5A=
X-Gm-Gg: AYBFou2kTnWM4lXw/D0OmGEYqGpEUdizmGYcV5630p9uFMoLDd4Ym/BrVT40/fQHRuU
 g1k3mJ1JNz0jeQ7g21H8FYvlP5nSW6EAsjO6hVBc+oX5YJzZvsQhnW7LKIWfXbAV3RvNpoTDSZ/
 YOnEIUrYTBCJN1ZdXHKrgpmB1xqtKQuDh1HFJlQn6Z33q3pgCjDHwQ6K5def/g8rLXqpn4aWOZp
 EgY4nANzs6cri9dE9kW7e0a6p/8v6eKfTVxDmZosoL5KuRTBc10o5XifPeTur9R+AuXfGmw6Of0
 A5G+F095P328j8GTo6Iu7Pu7Az+Aflm0nMqecuATum2xdgA7hAb+h3Us4IRnNZjajZGBb+FLWfF
 EOF+bkH7SUeKlCCFcwx87I67mW1wnDI6GROOrrd+iYLwPz1rAkpGpmlzfbhHsGpYzjgAyTa1bHI
 Y3RcBVPSpcT/5ttolB1DjYL74kF/DnWiC616YrbtRb1PkP+VAp0pHH7VYh3Q+d24EAE86U85YCR
 HIUhndAsnnlhlMKtVZI6O7+DqkcaLDJh6SYc8IzkzAtb21obmnbX/CbLJpGWapEx0hNTIvxF4vy
 HcCzf9HvTmmL8aq1tEJKlVXP+/p+MnBGUbjbJIU55q/vHQDIDSPREBludGA=
X-Received: by 2002:a05:6214:4346:b0:910:3455:53bd with SMTP id
 6a1803df08f44-9103ddf1bd5mr6386546d6.35.1788443549957; 
 Thu, 03 Sep 2026 06:52:29 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9eef4f2fsm42933836d6.40.2026.09.03.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:52:29 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Thu,  3 Sep 2026 09:52:27 -0400
Message-ID: <20260903135227.105232-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903131432.44250-1-j@metarealtyinc.ca>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
 <20260902192531.44003-1-j@metarealtyinc.ca>
 <20260903131432.44250-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:12 +0000
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

Filed: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119

dmesg from boot to the reproduction (drm.debug=0xe), VBT, EDID, debugfs
state and the run logs are attached there.

Jake
