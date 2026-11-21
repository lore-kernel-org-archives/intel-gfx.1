Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF2606A327
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=B4+A7EAC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B865A10EF53;
	Mon, 23 Nov 2026 15:18:20 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D5010E9A0
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:58 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-94958650b09so182128985a.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263957; x=1795868757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V3cP60bp82hBpHH77pogbJL154XE0k6A+8yKLVtyUiY=;
 b=B4+A7EACuVRri/L2M5AdXC+cP9ARBukG5XwquRhadjtxdhJGdJ8BNJ3aFkFAbQW8yx
 ODABHN5m18t+qFvX4JyQyGSAB3JPm9U6YfZXSyNgs+Bo6ImfQEIAUU/fsC0eVp5LlsWd
 qXqSeykXsm6N45yffTn3GZ2MedjeAEuUyeAplLlD9LA1f5+kbI1pgdoJq7PqMG8J/owa
 gaMSedFnXPyhGOhD0VF0boUlTxDLPJhT4hoxVioYRMRsRB/KvuDKCMMvnET7w04yJclT
 AYXjTcQ/thc3c4G1EQcXcXn69IugtLcA0Kwd07wtZlN+FHuBZqj4tkcxNsCupmN4havw
 nOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263957; x=1795868757;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V3cP60bp82hBpHH77pogbJL154XE0k6A+8yKLVtyUiY=;
 b=1iDInWO3oI/MVvlGExg2lMtbdRyP/2uovjRpgLTdDECulb3awdUCxI/BnrGsPgCzCV
 ydrJxILsOzFtkD1voQtWfKQeA1R9H4pf11/KrSj2zXIUdqQNg2+LW1/5ndNMQ88NsA/2
 2eR84cYmL84+zBy4zdL0tCKBAR91xDct8UZoJX10Xr+N6+6ZZW5PdRvvlTp8dUWnX4eb
 uKutrcFOHh15EQ/TXf5rjgeelEL1UMqKo/pSRQHhrDQ17LFWYv/46JjGe6+d8q+XkBMx
 iEYAaXkeFpcGA47jFsN5N2mYrl+skQ+LGLc1sAj8s3tGUzoGH8+M8k3raKHEJTi9F6Cl
 lcIQ==
X-Gm-Message-State: APuU4Z/gQUD+m2aNVuSyHX05JByKNrKXQpDnbS1maXFbYn/8VaRs2/Xo
 WB9YpShsspo7gd0bPoGj/Mbo3J7nJv9gqaY9O4q62Vs6gckDMkbHOmq3lRphk/U/CM4ukVvhM3e
 MVrZZ1CuzWg==
X-Gm-Gg: AZFdTZcG59EwDVZU8UZUQZ/o9eR5FCzlow4yYI488zaC3U77t1fgJzZw+LUWNDzQ8rc
 uEtmA4gfCnOKfyuSlbvE9JB6FCkMTrMstimgdFiKLuAG2klF85ifpzV8DDwtOmYEfrl0+kZBxG4
 3I9tvsbXK+su1aNis2xC5x28Vr+YgUnZWSpTm4OJ586bXoCMCXT8ObQBfS0/GW093RmEItSlz86
 x6BaagJpT9pni0IVUrjNjAL0eLzMxJk/f3WAeaMJCYXQ4mrFvKsZ97MWk14mforxV3U1/cdLgO8
 TldMeiWsxrf1V3LYEhtKJo58D6MRVJdwtAsZBCfhuGXDx3Jo7I3dPRMKmPbRpOs/kS2f7iKB3PG
 dpe9/fT56HuW8UWH0NC4qPL2NMWZBVoGdUDHGx2Nzg03+HVsmmTYrWD/GiORNVowzooVpyWUWq6
 gTXJB5+IwhHcF/b8qCqdW8v0MGG0V/OjN36PlIyolimnAZ5aAEPX9ilPpgrJkPcvYqKSCfzHuOa
 d9kLqyYNdvh29GczPvfoSHi9bTcG/vJGBtFvnZAEZi/Uk5emt0pChS8usk9zAoJELpuqwirwADT
 lsT8wKZpzjujTTxXu3XrQ7SPJ0MVhK6mIQJjnobqZ3hEOBAd0pjlsdOzPYghXTae/bcfGo34DwH
 b7FO+ZP0njDeUFQvq1qJbIdsL1eFBIcxvOPFivuYICuntHmzBioyDklXiI/ZWbBkpJ2isjBefHs
 BZEvRinEnMvbufIQul7xQDmAFHg+g4mLzL3psw/SqmjPMRL/7jZPKJ7lbbqSTfPwMgmeK84JEnt
 tYpRCInD6FwoP6edN41sMBzuHgdZw==
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id
 af79cd13be357-949bab2a981mr952734985a.72.1795263957341; 
 Sat, 21 Nov 2026 04:25:57 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:57 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 3/4] drm/i915/alpm: Leave AS SDP Transmission in Active
 Disable to PSR code
Date: Sat, 21 Nov 2026 07:25:49 -0500
Message-ID: <7b1c4022b174d3806130f5814142760a8693e340.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:58 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSR code now sets and clears PR_ALPM_CTL[AS SDP Transmission in Active
Disable] around frame updates. Stop setting it in
intel_alpm_configure_pr_as_sdp() and keep its current value instead, so
that a seamless VRR toggle no longer suspends the AS SDP while frames are
being updated.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 910067d27..6f2beb4a4 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -467,8 +467,12 @@ static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
 	} else {
 		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
 
-		if (crtc_state->disable_as_sdp_when_pr_active)
-			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
+		/*
+		 * AS SDP Transmission in Active Disable follows frame updates
+		 * and is owned by PSR code, keep its current value.
+		 */
+		pr_alpm_ctl |= intel_de_read(display, PR_ALPM_CTL(display, cpu_transcoder)) &
+			PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
 		if (intel_display_power_dc3co_allowed(display))
 			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
-- 
2.56.1

