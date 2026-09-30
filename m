Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3954CA5FCC
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 13:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2000810F41B;
	Wed, 30 Sep 2026 13:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="Gms8TNCE";
	dkim-atps=neutral
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com
 [74.125.229.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A204910E9CF
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 01:03:34 +0000 (UTC)
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33e46a156f4so2733172eec.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 18:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790730214; x=1791335014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k02DnUfueq2SXs3UXLyiifb3Iga2OW/KGZeFQEVs3F0=;
 b=Gms8TNCE2XMQs1rpfPQDMDNSl4FU5LIhmB1wyXJZS3pqxas3taX7xei8zvLelk5Z2n
 ImksXDgNCU6mUYzZ2swnJ39wMAiTEQ+D90EM5XUiFZKXtyJGsXIG7CCjsuXktHbK+k4c
 eaps5FcLR7qjBJydEFuwT3nFCQe7hQV+9CvAntOo6PZC8JNG7TMVDYYXvP9o5NUwxrCT
 YiWcNAn2nUa0d9XzTaubhoR27ybyvcWZqB7R8qeU/rl2/B91kGY2/zPMvkX0FTgCPEUW
 4H+XGl+iKM6K12aMDfPVQz7kr9emNm896VYwXarhs+S7J6EPVeliiiwLJOoffWs9YR9/
 /srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790730214; x=1791335014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k02DnUfueq2SXs3UXLyiifb3Iga2OW/KGZeFQEVs3F0=;
 b=yIibC/vd7/mCcJdKDacfYT6oNI0jpqwMiu8UIzn/TwWCmkenCVlb4TGimjEvXR2ZAm
 VdZtQTG17E4yikaNExR5YLhOQvSr1PClJH5affdVR79KoqFXKIehOz3PApc904OiiFQY
 25LmMcD8X7KFv85VQvz/45sVLqncxKtXt0Wp5CA4jcCBWZxBiXtI6ZuD5SwIuKpMp2XZ
 gkcAEqe+HaznGD5fjSyHp0oVUAFbFo2o4JhEVpcVicwv6/8gDvcNQ13M1E3pr7vsHVMZ
 o0swUhikLwV4eF07lby44Uy9ifb4eZNXF4AgmDpx5ggGlpiv3Tz9s+ENe8qSNGKr4jCm
 l8QA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzlyPHQgHJtORNlD3ue8UR/XjHu9gAZYSBUMjDjsYG6LYPx0gfUdvX7EsOp3EfxCOgrHRXsBDZkFRg=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lUyWZndLoHRBalXByNPBDI5EeUEuBBpR4IdDYnt7Due5LEQPbC
 a0767jBC+06VrENNWE1UffQJbGOiUXoQnc8GNV0uxyyEsg0hZokCS55XRqVEm+Vro5s=
X-Gm-Gg: AYBFou2QHQtW+H9FJC0NotRdBEtgrJA6v8+QtPderUmDGRvOqE7DKTjrwySvILf2Ewb
 W3hO8ZUjQbtBuvzX5+bxwDlJ53n8mZM5Wc6iNlvYttgZY0/YNcZiXqLy1l/XSzitFDtzStlrt8d
 gUIjkY8g+MvrqS/sGVBqDiKMqKfAnmKHD6WJUn/udz39Cbw919dD9vz1WOqdBEYSjH148BqkWxb
 PBcOQ4dVTrecppBcJMkqBW0r9OvePlYMQknqyOeydz3O1KJYBvSEVRYcxc++5+OFavlLWdN7X6f
 hVyC4P8LXItkcQTwmP7RrwLpkKPpW9nttWn9tQU9bKiG7k9t8xzmmigS1CjRGoqDzX+/PKM+/Du
 W9jLqwJRZI/TyGY3uqmqTDJPvVhq/sp9/82lig5rPoWc1PVVj3RCXHfg5B+qgTVQitxQU0gkJi5
 JepbjMg7Kb0sOnR1x+xKT42KVFkPmaUVpsijxknkM+ws0JcjemvhBm0z7fLCZat0SyB/5MNvmyQ
 4Zm+y1EVTWDu4IFZTX5LgBICWdeFmVf7xKMMPWLRwpAmygHjQdmZlopvpJb7dTeBJtOf88=
X-Received: by 2002:a05:7301:4e46:b0:33b:f5b7:f4b3 with SMTP id
 5a478bee46e88-34c646ce08emr1028241eec.27.1790730213667; 
 Tue, 29 Sep 2026 18:03:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Sep 2026 18:03:28 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 0/2] drm/i915/hdcp: guard both capability checks
Date: Tue, 29 Sep 2026 21:03:19 -0400
Message-ID: <20260930010323.93999-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Sep 2026 13:49:08 +0000
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

Hi Greg, Sasha, and i915 maintainers,

Thanks for catching the second dereference.

The code in patch 1 is unchanged from v1.
As Sasha pointed out, on 6.6.y, however, intel_hdcp_info()
calls intel_hdcp_capable() and then intel_hdcp2_capable(). Guarding only
the first helper therefore moves the debugfs NULL dereference to the next
call.

Patch 2 adapts upstream commit d34f4f058edf ("drm/i915/hdcp: Add encoder
check in hdcp2_get_capability") to the older layout. The 6.6.y tree
predates commit 130849f8ec14 ("drm/i915/hdcp: Use intel_connector as
argument for hdcp_2_2_capable"), so its dereference is still in the common
intel_hdcp2_capable() helper rather than the DP and HDMI shims. The
adaptation puts the encoder guard before that dereference and returns
false through the older bool interface.

The CNA record for CVE-2024-53050 starts its affected range at 6.7, but
that range follows the later shim layout. The same unsafe conversion is
already present in the common helper in 6.6.y.

Together, the two patches make both debugfs capability checks return
false before converting the missing encoder to a digital port. Both fixes
entered mainline before v6.12, so every newer supported stable tree
already contains them. The same common HDCP2 dereference is present in
6.1.y and needs separate handling; this series is only for 6.6.y.

Could you please queue both patches for 6.6.y?

An LLM helped adapt and validate both patches; I reviewed the resulting code
and validation evidence.

Changes in v2:
- add the adapted HDCP2 guard identified during review;
- send the two guards as one series because both are required for the
  debugfs path.

v1: https://lore.kernel.org/r/20260929031728.88004-1-artem@trailofbits.com
Review: https://lore.kernel.org/r/2026-09-29-daily-reply-0012-re-i915-hdcp-encoder-check-v2-6-6@kernel.org

Thanks,
Artem Dinaburg

Suraj Kandpal (2):
  drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
  drm/i915/hdcp: Add encoder check in hdcp2_get_capability

 drivers/gpu/drm/i915/display/intel_hdcp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)


base-commit: 79643295eba17affbd16ca97f3ef04c90266b28c
-- 
2.39.5
