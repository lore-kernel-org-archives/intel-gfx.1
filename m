Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BDCC5DF7E
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2026 12:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A106D10EB00;
	Tue, 18 Aug 2026 12:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="no/oROwZ";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F102C10EB00
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2026 12:28:46 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-8486672f03cso4539813b3a.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2026 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787056126; x=1787660926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ALr+Mpu4v+ZXHfpojxbf7r83vEpMpww1PUS2n+qAu2M=;
 b=no/oROwZAgXUN1F4xRbbmM4/fLgjTivVrxA6V1YrG1BnghySwUv30AAlq0eluExg9c
 Ff13Ya7z3ksylI/uTl4TfLAeL3EeIovdqCdYDK4gN7Ptfd/WtLQc7Hz92hQp6DgC815j
 xz2On0BfEdMN1I/BvsAcJui/snOy9qdkAJ0Dnog77DAJ3TglEwHK29R7f6ZzQE0VEDGa
 E0kpcHdGvylzGHamR25GpfHykU4L5LwFR4D5bYIDPrygsL7YmpEOerYY6dBkBPpKwp+u
 pWQSuH5YQ+4ZgY2e+TClV3HiA4B/OB5RkAiPJfLv/K7bOegF8xABYABTqdkNAoPF/WaZ
 P/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787056126; x=1787660926;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ALr+Mpu4v+ZXHfpojxbf7r83vEpMpww1PUS2n+qAu2M=;
 b=Qf/nHHtBxXZA+2cWq459Ow6QpMWsCFlHAa2Au4PoV687Ovh7pH4GL72QgvXygqC6co
 Cy3I0q7fTRFL5mi9ejDscxYLo97o69tMlivyplm1io3asmsQK3EuRR4PePSRyqzxni5D
 Yk1SOejj8/5Lhsh/JhuDbSOgYZOKWnIiQ8q+cAyjSgeZtcovv1k9P/vMG5ife1SaSFFa
 RF8kcc2QjuubrPdfW6V0jV7F8u3XGzivrS+ESbV8NdVHx7iY10gg+A5SLdNw4cwmCtCR
 vgpd/YNZGaIOmumo2vR4tpLnb0QedyTKUSAWcsx6L4StVUUsw7a+Nnmk8fyUYqwdNM9j
 djrQ==
X-Gm-Message-State: AOJu0YzyEHoEzbGSIdTAJUsvNY71AaJUTy2QPJWFQ/igMRqh+TEn/azq
 PUbv2yqZbe7s7zFj52p2ycg2f48dhesk8MRDqLJKPfVAwmfaCsuYZMRuRmCNSY1x4/2CXpAP
X-Gm-Gg: AR+sD12sn5x6RywHhXn+rnqHShwJI1+VQmm0XOC+ANY7lEkr0xtuqWZpFmtmxOFESeM
 QxYGMzQyKwd7Z6kdwTbjOGtdvUR1pAJi1kugnmWDy0bWIvVnVovkGEOBQ9u8zqzM4B0IsVu4bz9
 4Uojr1MGAiBKA/eCBT4LOJnsHGFRAJOplGlQqLQIuKRCJCFFmg2LoZL75ofY/HgRRfgLN2xd6W0
 drLY+CVworJWV9B61+pOgdeFbHZnIrRjvaL6xHAw4/Kv8I9wGH7+t+6k3292I4VLMlk7RJvhqYG
 czKFDsdJJ58jqMp66CKr6+dLm713vkGXV9jbA3+sykVQBHFW1WPVAfQZVLnc+0DNXw9RDAf+FkX
 VbH37Hd3m5MbHYxTGyzDbN4eNTOijegPAwCk0sms+Zj8vfNdP6hQhR4U66T0Z5t+CNEz+K1zHg3
 rPvlxY9yq9kOiHjpXaeglYa5vIMXpt2eAoyIcs56PflxzTZs5Ev9VGntjy1kb/lM28heSimJdVF
 vevFQXBQgL7DY/SWnWcFNU=
X-Received: by 2002:a05:6a00:4f91:b0:84f:37c1:f887 with SMTP id
 d2e1a72fcca58-84fddfdf5b0mr32924597b3a.12.1787056126348; 
 Tue, 18 Aug 2026 05:28:46 -0700 (PDT)
Received: from allen-xiaomibookpro14.lan ([2600:1900:4030:ad65:0:1::])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851b401ec8dsm1730869b3a.1.2026.08.18.05.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 05:28:45 -0700 (PDT)
From: =?UTF-8?q?Chang=20Jiong=28=E5=B8=B8=E7=82=AF=29?= <xspeed1989@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Chang Jiong <xspeed1989@gmail.com>
Subject: Re: [PATCH v2] drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in
 bxt_sanitize_cdclk()
Date: Tue, 18 Aug 2026 20:27:16 +0800
Message-ID: <20260818122719.2374637-1-xspeed1989@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816062344.796615-1-xspeed1989@gmail.com>
References: <tencent_6CC00E822A788776C8F6E2D6B24C5FE4A909@qq.com>
 <20260816062344.796615-1-xspeed1989@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Withdrawing this patch: it is functionally identical to Ville Syrjälä's
series 170652 ("drm/i915/cdclk: Avoid spurious cdclk sanitization on
PTL+" / "drm/i915/cdclk: Introduce has_cd2x_pipe_select()"), which is
already in drm-tip. Sorry for the noise.

For the record, I validated the equivalent fix on a Panther Lake laptop
(Arc B390, 8086:b080, eDP 3120x2080@120): it resolves the boot-time
"CPU pipe A FIFO underrun" and the scanout corruption on the first KMS
client. Happy to test Ville's series on the same hardware if useful.
