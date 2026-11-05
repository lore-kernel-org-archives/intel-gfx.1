Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673C606A338
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2026 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlXX3DTr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849911248A;
	Thu,  5 Nov 2026 14:06:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327D910EE2E
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2026 06:04:47 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3ac6008c914so196593a91.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 04 Nov 2026 22:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793858687; x=1794463487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qq/4vwt5KZIiFWaAeaK5UibLMyaTMg//P8AG8snjRNo=;
 b=qlXX3DTrbRIFQok0wMIJxpFq7+g0PwubwMJLo6iJjj4hBpHE4O4ym36bw30sljo8us
 ByEodnTfVVq1VmvqzuyidmrUxosDI9VrMWpvPOj/ucRKMJukjUi0Nq616sgt6mNfeErG
 aqPeljQ0g017y4WU1unAX1okVewyeKkX5Oex9gfFrOPlhgvNRQhvvpPV9pNGYfz+6ZtP
 kvug4izV6fWWjYYrqY6a9U+7ZqGJVTsQfiNgNlsuCHU0hgGKfmh3bLoI1FG3FSbeXFYt
 TToZahZfqheN3Tx0HugUGltpTD9HwpPW5HBCNqyWynE59qnuy7nxjx+3gDPLUH6wOaZf
 3JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793858687; x=1794463487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qq/4vwt5KZIiFWaAeaK5UibLMyaTMg//P8AG8snjRNo=;
 b=ahInsrW/MheTgMmaVESPywI2DQ1y/YSYr78CjWUiPP8bq1gKjduItJCfZeTo+hRwmc
 ETIlIiULoOfG86SHBntNt5CI0+yYAj9h4y2e/9v7w+q9UY68+Qio1c2FY8a1bbSIPmBm
 3ap3uMT2jAPiC031YDY51jAOZw6yTB673uOdlDRG618tw9JH5cDNDC84XISuSzKBv7kS
 cfEABRAK1nqbvlJfx6sZ3XCM1Ds7a+n3puXfxHI921/Nk6NvtF8FoL4Jd+qQA9viZeLy
 38778zU2N9wNRcP0cSoGtutCfhYkGKYrDLYW4PyVwMnChr586aY6INgcY8nEHRh8lafZ
 dSGA==
X-Gm-Message-State: APuU4Z9FjG3YbQMwzxAHMED6bYM506WwXdzH2JrNuVeSeLaqYT39U/VD
 KMat/gGMWDFJN2rXty7RqFHtT+fjcaW7ji884QEKdODsQ/TO2cwIz4cp3p3BO9jA
X-Gm-Gg: AYBFou09ioq0GetHqiNXmcuKEtL0Nrh30/9KztKb1NIuqKLPTChljBTx6Mi6LJAj9Fo
 hO2e7chtz+a6+vG0V2Rsl2bGTBoF3OTRM6KlkwbRghm1+2VrtgzuJteleHTsoLfWHzgniqnzhVB
 841jFRuP9BByTeTtt+YkgNS0NyFCJwLOquIwCUUoE6CyTlCP+GNpCavqftuVnrHokZc4fZHm9fS
 mGCgQWT82ETVeODqx2faFVklXljuX8V/Qpqp5gOeCf20Bc1rH04Dz3fUVU2F/gzsoLj/AwZtp3I
 nyeC2fzJTbQHbppGeIjOQkZhkeGJmcHJmGhsD5JClGsMF1y0Bd5ahJSGl8itEYq1DJtp+pKFljE
 6AQD7SJsHgw5gL13IOSL1Z2ndooDJjUL7FVRH7RSqyISKlW3JdxZVudSBRcUFLv4kpp4FshsF6S
 mMB4+21H1gHuEn3lmbtQIeXRdb+rX8j0It8F500gHWPfFXNxlaSZgFYnKnGX8RxdKtOeUEd29OU
 S86ZgWQT9owml4tuBJpM8DKcQ/EQFUrZHVjRh4Xr071ZUwabN2/HPeucXspT/ZyN/299ndbT9Gy
 4s5dHS0jycDDRtocclClOqbQM3PqKd2H6MjpkYlSVg==
X-Received: by 2002:a17:90b:2f4f:b0:3a0:c162:51af with SMTP id
 98e67ed59e1d1-3ae89291df0mr25913696a91.0.1793858686515; 
 Wed, 04 Nov 2026 22:04:46 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b313c0dcsm2093100a91.1.2026.11.04.22.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 22:04:46 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, stable@vger.kernel.org,
 Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2 2/2] i915/perf: remove sysfs entry if idr_alloc() fails in
 add_config
Date: Thu,  5 Nov 2026 14:04:22 +0800
Message-Id: <20261105060422.51848-3-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261105060422.51848-1-lui2012qwq@gmail.com>
References: <20261105060422.51848-1-lui2012qwq@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Nov 2026 14:06:18 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

i915_perf_add_config_ioctl() creates the dynamic sysfs entry for the OA
config before allocating its id.  If idr_alloc() fails, the error path
drops the config reference via reg_err: without removing the sysfs
entry - unlike the normal remove path, which does sysfs_remove_group()
first.  The leftover attributes point into the freed oa_config; kernfs
only stores the attribute pointer, and show_dynamic_id() reaches the
freed object via container_of (including the show() callback itself),
so reading /sys/class/drm/cardX/metrics/<uuid>/id afterwards is a
use-after-free.

Remove the sysfs group on the idr_alloc() failure path, mirroring the
remove ioctl's ordering (under metrics_lock).

Found by static analysis.

Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 19b82427aa41..40385f991abb 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4716,6 +4716,7 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
 		drm_dbg(&perf->i915->drm,
 			"Failed to create sysfs entry for OA config\n");
 		err = oa_config->id;
+		sysfs_remove_group(perf->metrics_kobj, &oa_config->sysfs_metric);
 		goto sysfs_err;
 	}
 	id = oa_config->id;
-- 
2.25.1

