Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E499CC79F9F
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D2D10F4C3;
	Thu, 10 Sep 2026 14:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dCXIkp2X";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287EE10F1E9
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 16:38:09 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b93204449so2985105e9.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 09 Sep 2026 09:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788971887; x=1789576687; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MeVq8rDairowljrEmGCrzLch2/pf7DNyzkC5aOrOsz0=;
 b=dCXIkp2Xr1fW8i+Be2esNqF5/97E4uvYTpCbH38So16Fi2Rn2R/uljAB4MsqvLNYGg
 Dfmlw9/01jtktJl91dip5O8/TXnGzhCAmBnNjqM15ar5MHxV9cFQq2MvItFgobo4l/0X
 ldj9FMikS5xdwrTJY9aMAxJ7XIVAFflSgTmU4+ZAHwhONczpVYe6+V7X8Z+23SZLMNME
 T6zuPl/5ABw0V6AF5r5R1h4r/caN9Rnyim2FPzMIOvMLV8SIO0GHaRy13Ssfki37uVOQ
 0Obh/wmkwIi1SzHgVBVhJYfwR42aNiXc7bn6AUhVVay+sCqH2vEyz8d3bY1FQWld1DkW
 5zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788971887; x=1789576687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MeVq8rDairowljrEmGCrzLch2/pf7DNyzkC5aOrOsz0=;
 b=XPOAG38Fr2aOLhRZcG02p4c9/FjhAQOUkZMQToFrVIYrs1Wy9/xOIqz1zrgd2aVjuC
 gXJ+4QE4o0gL00GIuhj3UjFUJksl5KxujQQjt1os6C8j4D2Qo6mFXH6rXWy28rAaYmI+
 RuHOQdNftFOrtvhjoJlA3EZFHVA0QVMRRMRzk2izpn/7Vox2StGtkUQ68xGJ0X8s8Nko
 a9yfdA768Z9modPcJXm/SZqXoYmCgXNiKMNwpXmhw7su14MyUz0s9mR13QhLKVRP7N/t
 7NaBwYfYlB6WhruUB54L0J35ZxmDVqr/OYP+T6VIv4RllJeQOekyXrhrjC7Gxjkl4pjn
 jj2w==
X-Forwarded-Encrypted: i=1;
 AKwUvByCRYiNkCvsEMdUg0sARJ++PyDkKU/ztgSCout0werlyFiZ6qdC7w22ql1v2J63wGrWpvGyTW1xnkM=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nlLeUCGARf6e3zZ42iJHUxGe9teVORb5QgkDXNgaxuqciB5cVA
 wdhrfkjGoKmrE5fLlIDWKYwAFBq9xixfxx5bbNPW54VNSu2fj2CECuPP
X-Gm-Gg: AYBFou3kmJaKNf82rFEevILPAIcdNu79CaxjIEA2/q57dm1FsFweuBnzAaYv0YzWYGK
 4e2Yf2jmp75RruQbdS8vUxzmb7t5LRvGlynoSIdOHXLWTN2535SaRj8g451HOcxXEarCh6fNrka
 MelvPMN/X4YWEEvuHdOm62FASNp3NAdY/QhZeHQbJJ3wy9YUYU+Zb9AL2H5428iTwwSQBWALVw7
 ZRFRhYCEhA4KPR9G0KxA0ij68qs4cK16aLL0BLVnm21jBI7tnLuLeKBkKZX2rhr95V8EDaIe79C
 YQWC2NdVB6wBQRFXDmfaFSvwISNIuRVaMx6Vi+hMOtQltfO16H7U8sk4UagVqH95b9gS7XvHgX1
 HP7KZwHgQI06+UIWmNsjiOTtLXOrT/z+yL98nRdTd9n8Ow+o3nAJmXT34MNNSnBzZXSYTu2cxE1
 E2Pmw671AzvciLvpQdsAph5j01ky+ldw3YJZ1hXhk70unuA/PHxRZqSlj4Vo4EZnnnwZPXtzddF
 brGSlNCuifyR8FdGET2jjTYHrnynI3VLFBJIUd8/U/KGNuuHfSnpA3cM5z9dlsf/YWjYMKfSoz7
 nkwT
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id
 5b1f17b1804b1-49d01dce86fmr262368785e9.1.1788971887351; 
 Wed, 09 Sep 2026 09:38:07 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B836900E58FC5516AABB3E4.dsl.pool.telekom.hu.
 [2001:4c4e:1b83:6900:e58f:c551:6aab:b3e4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fb40e1sm66537515e9.2.2026.09.09.09.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 09:38:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 0/3] drm/dp: shared HDR metadata SDP helper,
 and max bpc for dw-dp
Date: Wed,  9 Sep 2026 18:37:40 +0200
Message-ID: <20260909163742.37003-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Sep 2026 14:24:20 +0000
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

Following up on my own cover letter, where I said the series had not
been built.

It has now. On top of drm-misc-next bf63a72ea005, x86_64 allmodconfig,
building the five objects the series touches with W=1:

  drivers/gpu/drm/display/drm_dp_helper.o
  drivers/gpu/drm/display/drm_bridge_connector.o
  drivers/gpu/drm/drm_connector.o
  drivers/gpu/drm/i915/display/intel_dp.o
  drivers/gpu/drm/rockchip/dw_dp-rockchip.o

All five build with no errors and no new warnings. intel_dp.o is the one
I most wanted to see, since 1/3 moves code out of it.

To be exact about what this is and is not: it is a compile test only. I
have still not booted this exact series, for the reason given in the
cover - the runtime testing behind v1 was done on a rockchip-devel
kernel carrying the v9 generation of the dw-dp series, and mainline's
dw_dp-rockchip.c is not the file that was exercised. If you want a boot
test on the Orange Pi 5 Plus before taking this, say so and I will do it.

Igor
