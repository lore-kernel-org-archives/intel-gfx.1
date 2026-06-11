Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D3BCD98CE
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Jun 2026 13:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374D410F512;
	Fri, 12 Jun 2026 13:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lk6dgaTC";
	dkim-atps=neutral
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762810E7D2
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 14:50:00 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8cccde72aceso12793626d6.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781189399; x=1781794199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DP19gLPJP1jpWVxngAoDyNJY7navrVqVsJRQOoZOUTs=;
 b=lk6dgaTCZS42EE4EwJTdpHyAw7btQBPHGxLvi38OKoEF7wTmLBBA6ruwtynriK1grx
 Dly+3RC+uC9/XUb5TsHgiijTng51IpvL5TGRCbHaOmrMdQZYfPoXGmSxeKa1LY6swDEG
 oJ1R2X+HimmzwIuABnbfNAwB6HnbH0lEzqnF2RU6mKPDkLCuE/zEb7YI+mBkVbjl6jeC
 rauRpXATsdZugh6cfPzYCIxlYat+nP6+DvN9kKG/JrPDqvXOcFqRlUb750bM0HEEmdc/
 /6aBkNfA8P11J37n6iHn3RsSXGpu9YVTMmhAjgNNqW7t5keOOFFl1a7XUV/pc3WtJWgK
 OK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781189399; x=1781794199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DP19gLPJP1jpWVxngAoDyNJY7navrVqVsJRQOoZOUTs=;
 b=fmZGhqsKFgpnwpUOSdQLmzoQgKOPrYtfid6RzyJ1aDE1Bv3zD2pGzw5dL4bHgzl0Sa
 gQSakvXMjkyJnUicSRXvOPYu1106s6oWCkwynzOPEBa1f5ko0laPQn8VUeYe7A/3Lexb
 Ub8scdTZS2jD0pgSiCWg4ERAYTwoDifP184zhjeUwl2kLsgeXXNn2jKYBDPbspTcAZVm
 4UqmMd1Xe2FaAzXwoxu4bJx5vszQ5A6BjUMJOdMwOdDpXk9OPCmsf5KXdH90Qj6o8sv+
 xN8DBFG1XvUx3fn/4NuPqCA6edlex1EreT6tuHpJSj7099VaG9vC8AZsj48wMezBdPBa
 f8qQ==
X-Gm-Message-State: AOJu0YwM6Up469MxYfvYqPBnvT5dgieugmsKGgWRF8n9qsJUj5ieZ5uQ
 UzgxHHeqBSO6YEQEXl/mHdxrFpSin7AXNXaPHuFJjlO9JvJQ8dVX/4kjgZH8zgtJ
X-Gm-Gg: Acq92OGbf2zxwJwd16I9RrvmS69PB1LLbXM/Q1+Ye8BwiYIFU2tPMU+yF2Dgbl4BzBj
 22WNqkO97aUH28j0hJyAZHplSgPynqqIacEJuXY677mZT34Zq9mEUuB8blMSo7mEEwxnpcUd5Sw
 +4OTfAFo1g0K/qz2cQNP2hR7E00AmTgNuOrPYZlsVpjHKfC5/45+dcZv4LTiciUzf3TSi5ozgR/
 M1VHx4jpUmhbs+UmHEhyQ5Z261e4+0Eoyvymz9Lez+eAa+JIj2pYFb6CkIK/UXNvvkojGLgsOjo
 uZov0XXQ1zF4kEcPMmmDuFBunNSEX0yUfyL8mhQ1+g1YWwVrGyOF+k2htArJ+a42RhBUmkZ3Lzp
 lFxsOaKXgZvNmKcqxY6KEUOSFFdqSw0k2bkJJtoF56ECM8uiadLdxKJTG2oepkvp7FeBx1ZynYg
 t+LdW4RehbKy9e9syR0FtA9G5SZMI3IYeKadMJz044ej7FCHJrIoLBANa5CP9dhJAdkhxTAgjP4
 Kn8P07/ZTz5jDG5igtn0FQSFtsRrFUCpnpI21BXHSLVfFJbwTAqRzL2X/cAinqbGzaaq18coJXr
 1w==
X-Received: by 2002:a05:6214:33c2:b0:8d1:d1e1:835f with SMTP id
 6a1803df08f44-8d1dc1a2588mr28820326d6.7.1781189399264; 
 Thu, 11 Jun 2026 07:49:59 -0700 (PDT)
Received: from debian-t14-gen1-fuhrysteve.fuhry.app
 (6.sub-75-230-138.myvzw.com. [75.230.138.6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d1e7bc32acsm20141096d6.5.2026.06.11.07.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 07:49:59 -0700 (PDT)
From: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Stephen J . Fuhry" <fuhrysteve@gmail.com>,
 sashiko AI review <sashiko-bot@kernel.org>
Subject: [PATCH] drm/i915/display: fix ALPM error handling in psr_alpm_check()
Date: Thu, 11 Jun 2026 10:49:56 -0400
Message-ID: <20260611144956.710911-1-fuhrysteve@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260611125408.676626-1-fuhrysteve@gmail.com>
References: <20260611125408.676626-1-fuhrysteve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jun 2026 13:06:10 +0000
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

intel_dp_short_pulse() calls intel_psr_short_pulse() before the direct
intel_alpm_get_error() check.  For PSR2-enabled panels, intel_psr_short_pulse()
calls psr_alpm_check(), which reads and clears DP_ALPM_LOCK_TIMEOUT_ERROR via
intel_alpm_get_error().  The subsequent direct call in intel_dp_short_pulse()
then reads zero and skips calling intel_alpm_disable() and setting
sink_alpm_error, leaving LOBF potentially enabled despite the ALPM error.

Fix this by having psr_alpm_check() also call intel_alpm_disable() and set
sink_alpm_error when it handles an ALPM error.  This mirrors what the direct
call in intel_dp_short_pulse() would have done, ensuring correct cleanup
regardless of which code path consumes the error bit first.

intel_alpm_disable() is already called under psr->lock from
intel_psr_disable_locked() for the Panel Replay path, so the lock ordering
is established and safe.

Suggested-by: sashiko AI review <sashiko-bot@kernel.org>
Fixes: 2063174c22da ("drm/i915/lobf: Check for sink error and disable LOBF")
Signed-off-by: Stephen J. Fuhry <fuhrysteve@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9382ad1e01d8..0701c8b94aa2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3869,6 +3869,8 @@ static void psr_alpm_check(struct intel_dp *intel_dp)
 	if (intel_alpm_get_error(intel_dp)) {
 		intel_psr_disable_locked(intel_dp);
 		psr->sink_not_reliable = true;
+		intel_alpm_disable(intel_dp);
+		intel_dp->alpm.sink_alpm_error = true;
 	}
 }
--
2.39.5
