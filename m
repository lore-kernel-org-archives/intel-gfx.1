Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25530606A31B
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzqqcjHQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB6910FCAA;
	Wed,  4 Nov 2026 15:03:09 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174D610E858
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2026 07:33:30 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-36a6ee9c59aso54380eec.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 03 Nov 2026 23:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793777609; x=1794382409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E1F87bb525awAof1JLFi6O+XOwtmrtsukGBHxsxN3uE=;
 b=VzqqcjHQj+WAUY7atdCCycO3XgpnSEuE8fkreqEpM3zbkBAK7bvV4/6i1kC/czz1HU
 47TyR7PK90KPKUfxMpJhfXDFA6/g6n9/jSaz3VljWW7Pwu2lFsYO6kk9adkMwDyPuysy
 IsGcykYF33s+WNgQdmSMWT3Rvu6kl3XVJ8e1H6NXOnhmCEeyrg9/tZGLihEnhUe7xmOM
 26Lqq+7BvKk3Ml4Wu5ivp6ciZokuqgXBcssG5dgwed2UdbJGXwsMu5nGKcoZ/gxWqsZy
 O1sMRSsOQUbLuI229rgY99/3I/xGeoAUSv6L+4m2/8CtttzlsjmuH49mL6+h/ve9sJfs
 +Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793777609; x=1794382409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E1F87bb525awAof1JLFi6O+XOwtmrtsukGBHxsxN3uE=;
 b=NCk8+lg+3giW6WssJCBNsidGb01zkqlMNx7qVSODeOwUHh+BLmPCcsOjUPVlkjuV/i
 R1ZEHj08ihA/tTxqhgl1FePkLYDb6eisF2M7pXv/YKSITWLJi7EBHz5HIDK95aCu7XrF
 Bqo5JPS25V3huLOhqg3tj2PDBA2DiN8T8DoaKVfhtgNnW9gWuvNm6Yv/9nNT3IfMBSSU
 qLZ128x1mHTtskIvzJBrYOp0D5F5STfZn9q/1udTUy060xgeok4dI8CsTxsehqnnmay2
 0/qrAOzq5qN79Sc3OxIwE1I5twWuMWd3oxTVpKGw9JHy+n/u3Yz+laRESnwPwrynmxgF
 gqqw==
X-Gm-Message-State: APuU4Z/nfc7U+lDl/ZU00w/mzNkzLLZU+F0U8jvMqao+1+RHmguJ0rER
 4XX/HSycBGc2pMKGA2IvhzFJHgqh/0MB85bKZJnSYfmI1mS1vJZpC5YZ3rJeA9sWhfo=
X-Gm-Gg: AYBFou0HON8gI/gE7BP6sHC8+f4xM2TSEmMAkA3WFVwLTwIfKtWmfT8wvxdJwRkBAet
 dyAtAHCCXzTmZjlloY/VWmryvB4WkgY75OQ3NPjQHLeLeFOrBBydR27Wv6UqPG4jbqawOJefnpq
 ly4qA/GCKrX8BvWFarowuTQwmUrEMZQDenlj/Dhi18WVGZFuDhFMJC99mDH/uqV/PDvH8nt+ffu
 mBrvuH0+IfOX1RTnASHLvAsgYJeTEqrH8yaCkESlkKHILDDl6wZuMQ2DElEXlXe3cnadw1UVofl
 ZMR2eAiHr7+Y4XREV/JXB4Bl8DARWKyv/c171zqJ47kTbj3WIikIYgP/JQkq9KPwo7wSLakuBM1
 XevqmWDEEWug+U60tnrDO1mWmaa/SobQzURybvNhf+o/AkCpEPZcmH9r6QFXnRrXGwXizuV7FLC
 bWNDq0YEQsaiXk2JbNkBvUuT/9/G+TmtWQm/t4Xs/j6ifIVBh1cAT95H7DIPzIA387Bw+vH5+BY
 VZP+C7pw6+rjSEEqr2xZVRq8X3mtIUMqK51B21kISGakB3wrzE86/Vu87oPp+uw5DqvQ8n3QCko
 G68f833zdVQw70dFvmgFabSlwAeUsspDJ11PqJsvlw==
X-Received: by 2002:a05:693c:8099:b0:35f:ea17:d171 with SMTP id
 5a478bee46e88-36a42236aa1mr34685392eec.2.1793777609165; 
 Tue, 03 Nov 2026 23:33:29 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d3754sm6295359eec.14.2026.11.03.23.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 23:33:28 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, Chengyu Liu <lui2012qwq@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/2] i915/perf: remove sysfs entry if idr_alloc() fails in
 add_config
Date: Wed,  4 Nov 2026 15:33:11 +0800
Message-Id: <20261104073311.1617823-3-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104073311.1617823-1-lui2012qwq@gmail.com>
References: <20261104073311.1617823-1-lui2012qwq@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2026 15:03:08 +0000
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
index 19b82427aa..40385f991a 100644
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

