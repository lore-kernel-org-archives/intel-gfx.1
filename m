Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B718DC61DC2
	for <intel-gfx@archiver.kernel.org>; Thu, 27 Aug 2026 12:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BCF10E3F5;
	Thu, 27 Aug 2026 12:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GrLNtAOe";
	dkim-atps=neutral
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D54310E381
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 Aug 2026 02:21:24 +0000 (UTC)
Received: by mail-pj2-f6.google.com with SMTP id
 98e67ed59e1d1-3964e7720afso976312a91.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787797284; x=1788402084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w5YaH8mokWPLQfhjUseDA3RHoFgBNedWh0XDxf4FNzc=;
 b=GrLNtAOeSBPz2p1srNvKuMXJQgMEM62iX/6uTKa4t+f02YbYFtBxGkU6vcav8232w6
 aI3Kt+l+EHFCV7j5/cD9NjtR+rfO9dCTsn+21dhIcyKcDCPq+CH53vahonXsQkeuoJqB
 u/8ue5kk63oaeAq5OBTbrIVvROmnIuM7GzSsfw56WEpLQ1dWqRf6oImk1rqzvHpvSX0e
 tiGTnGqjTaSle8DIxNr+paB9X5Obpo66hU2atKDoY8pusPVB4ok1EzwJ5T2K6MZ0DKR5
 CyN64WYq6ttsf+LABxIZBAuAgPlMnYIxMdj6wro1aW2QuG0T0AEGWfXPm2r914IZM+AJ
 jB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787797284; x=1788402084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w5YaH8mokWPLQfhjUseDA3RHoFgBNedWh0XDxf4FNzc=;
 b=flcCGMiCOqz1TjY/l86NhVQ3SrrQG09h4NZzfBNClNuuL5K8u/GN2AgXdyodopZSVt
 1bb41FuX1CmybSZTkHSDry60HizJ/h3bpR1Q/VA6ZywwUVBgRUePyFfZzXdvoBdu9g4q
 ssckft8qwNMFKVOLgkXAeI77qEzEVWdAwsywisbmRBAwlISuihjNoc0ePFdC/+2N9+ZH
 QmOLAspk3GJ9zTAi9FQ+W6QuTZaiNLsSG0UQ8PsWLmbNmyNW1Jg6n3x4+lfpA30BXL0M
 eXm/m2FmQn24B0MNwuYSce2bYQQDHF9Pllk/dSAaMNYkDEZ4Kmd0sFLpnjmYAJeW1zf5
 Nqtw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxBXDD0YznLQQcgitmh3TVatLfZ+FJjY3URf3BxDe24upQtnw41v0NHOdLyQUPcVi3v1a/nQmkIAk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mLgNQWV2HC16IEgPPqk5CmNvij93DFl1BiTJUzV6yyT5R1TXQP
 Q4w9tnRCdEfnoxtKn8QqWreI8J5cc7mD28WL2TLNeKmnVc3C09GPuEBY
X-Gm-Gg: AR+sD10QRjdo+L4DrDp7/Q1wablvcmqZp/ddIViR70FtMHzm69h80Uy80RDHJyjNh1E
 z7sfWzWJQlq5hCLRphe97gS+MQBAzrDbXKDHUCMjXMrdTXhm5ro3edrNTjMALngyWes2ow8GmIl
 YX5ZFuFqDD8lhqLCog3Dqy9NksXPNdU0fSD7K81soUOe1U5ZzgTu9QfQaLbgyA9MLVL/Fp/3w/H
 UnhoUFH/H4s3c9VE7xjjyCyGti3sDqJMJwQSwk1iLsKy2U7exdm7/ZmYOLtjAUuVdN6XZOZuBeP
 sYDJ2itQRI3McCEP0oDqyki/RY2ZK5OBn7ZSn8fj7gG3O6WzRZRvgdXgepBaBLYbVZjllThFF6z
 aUJyfQzcpd8yqOet6/rQfuJWGub3Op0ckOHiGhIM51Jqibu5fIhAiJFjz9Pzrth6jfGEt6G4S5m
 qQibJgpVrtQ3ZabcgUqYheVxRVvnzu7oBVOKZcbyzMuBx4VNDeN9d6jP9sgbJ8EMPQSQGFcc3TX
 wh2h/+l6s0YzrF3aMmCF+69+A==
X-Received: by 2002:a17:90b:390a:b0:396:5785:843 with SMTP id
 98e67ed59e1d1-3966d203a94mr21084902a91.8.1787797284194; 
 Wed, 26 Aug 2026 19:21:24 -0700 (PDT)
Received: from DESKTOP-BDFNLNM.localdomain ([223.231.133.255])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm20850538eec.6.2026.08.26.19.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 19:21:23 -0700 (PDT)
From: tarund18303@gmail.com
To: jani.nikula@linux.intel.com
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tarun-tarun143 <tarund18303@gmail.com>
Subject: [PATCH] drm/i915/dp_link_caps: Validate max link rate
Date: Thu, 27 Aug 2026 02:20:34 +0000
Message-ID: <20260827022035.3442-1-tarund18303@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Aug 2026 12:29:43 +0000
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

From: tarun-tarun143 <tarund18303@gmail.com>

Validate the maximum link rate against the source-supported rates
before using the maximum link limits to calculate allowed
configurations.

This prevents an unsupported link rate from being accepted as a
maximum link limit.

Signed-off-by: tarun-tarun143 <tarund18303@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 7b6cc6055da8..0934488153bb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -710,7 +710,10 @@ static bool max_link_limits_valid(struct intel_dp_link_caps *link_caps,
 	    !is_power_of_2(max_link_limits->lane_count))
 		return false;
 
-	/* TODO: Validate max_link_limits->rate against the source supported rates. */
+	if (intel_dp_rate_index(link_caps->dp->source_rates,
+				link_caps->dp->num_source_rates,
+				max_link_limits->rate) < 0)
+		return false;
 
 	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
 	allowed_configs = calc_allowed_config_filter(link_caps, link_caps->enabled_configs,

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.43.0

