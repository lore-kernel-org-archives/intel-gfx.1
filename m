Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DAE606A32A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=Jql1qct1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D04A10EF45;
	Mon, 23 Nov 2026 15:18:20 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAE810E40E
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:59 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-93f20c3aaa5so171380085a.2
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263959; x=1795868759;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=Jql1qct1KY3Qjq8zVZcZWlIV7ggU2P104henqNtHstg39seHOlLx4mOuZAXYPinhvQ
 2Stv75+MbGW7Mz29T5bkTEcWEtD0KcJI6etoJdJuDuBocUl4+yt4EQBmo8S0Yr9zCjfB
 0yJwUa06ey8yQGCQwYLRcT0u2Odi81oGk1tX48ujkK98GbxweQXH18x5uS6faOEk2gCw
 y5bJr8hqz0mZ+yDGSeUqnP5OAZBlBvLx9bOi9pl5XeZjhiT7iZyzwOOACekSkD4aGZNQ
 xoDallDOXsQrPakHTiXWbKybRcBQcPg5Q9/65iYKV7sDDE0oyPWTEhbmgqHY0pdgKnSf
 7RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263959; x=1795868759;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=YC0TZDcZwsVARoWEYQtnVX3wttfZtu+cXrYUUTpfv7obPwv6tl52nM4n30CpVNI7DU
 yChpzxjLXVW7eTCOjrttSBzHdk2CFS9RZz/rovL9EOKrx6yQc/RfGZv1OyxW2yK7gokV
 pObDkal72iY2xLWEUcINJn4dqUl4pzdxR1tqjh1Z6zRrFWOUaav8COl8Q4rbvhpKVFOT
 rHQJqgy/pqe2nh6V6RbCXfWVukEsD2zhBnfujtCFhlteUJXCdGkNK1aUPEkjm9IsQTYR
 EyJtJ+8pppeZTFHCh31IBWY5oBR8ECrF8h67UxUfZ/PJH/iIG6Hzhm4lpwTyaX8MgL/D
 TwIQ==
X-Gm-Message-State: APuU4Z9vY6TukoulyMoGQAs4IcgoYXGgUFFmRrrbySyHjkqSOaaOlqDV
 l1XJ/HiTUX+gCESJIrvvpwJFMbV1Tw/QfDj+iolnoygSVvLfLCz3ummTlLRzlIlS4oI=
X-Gm-Gg: AZFdTZdJz1VgCazZetAa5fFQziEQkAwxB+4DLayepXx4vi5Hq3q9gthLj297MX8vCFw
 NgZZ982wtrv2+9xJ6V0NdjSmxpMJusbt4smz6kcSNDgiRN/AId1n9RAEcLM6+IhXcap2Ob7T6li
 KkwC5tpi2Zhz7+jLBqntdPX26XxHkAFPxbRm+wkr5H0ruZzPtCiksttIJnnUOZgLQqpwV8iX5v+
 n4jdAd+0/rbDP0HC2A/OSPfkZJIQ1pRCNSJAWHMKGAEFn38TZF+6/VMO89zfkMTUkrwoFIt0wqB
 HTxJYbxC/MtXbrUUzaQdWaQXy+mX7saBb+K8omEWQaQ6oAum4g+kspLtMMOwwp3c11kzMdM9meS
 hpVsPguOQ6TzsNl6ZMYGC64HRCYcb7ZzwcGGt9+m7PIY9m2Gr4AObiE9Wb5cdBoHWiyV1161ibt
 WYaT62FbkrrXXAQDF7m1gTKjIoBHCVCGWvCetoEeKlaJXs0nTzI/p9TrdSFzWF0F7bbaKQ2d+55
 X+N5PIYxeYwyLw8/jVdYyNhIQZQtH6isPj/E5VwVmVCAk1zeT/YxeMdVVt+dyo9djqpXL4l23zW
 FfR6kI5w+KIAooWTRh0trKHtrNVYkn9JTHeNa6hoIn2OPqFZuJ6MUDqjimuRPpBGqn0CnqAVA6s
 nYSlVa1uSQvubUQdMhx8JnH5N6nzirAz3o+bNord7jPBjb6Zb6gNdtY3XQqHVJjMKr358BVRbjH
 veJ8jLTft34SHakin2En4qatz9AhMnIQHWFx5ITPzBvE1YqSBCLattBbOWgSqXa/AF9y+sKa62U
 RYPb0iW
X-Received: by 2002:a05:620a:700e:b0:93b:db80:e0cf with SMTP id
 af79cd13be357-949bab5101emr917995085a.60.1795263958848; 
 Sat, 21 Nov 2026 04:25:58 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:58 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 4/4] drm/i915/display: Remove the Panel Replay quirk for
 Dell XPS 16 DA16260
Date: Sat, 21 Nov 2026 07:25:50 -0500
Message-ID: <8f1f576d6f816654a9c24f0bd00f9fde469da061.1795263689.git.j@metarealtyinc.ca>
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

Panel Replay was disabled on the Dell XPS 16 DA16260 because the panel
judders with it. The judder comes from the AS SDP being suspended in PR
Active, which the previous patches fix by sending it while frames are
being updated. Panel Replay Selective Update works on this
laptop now, so remove the quirk.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9119
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a40d..6070440f8 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -289,14 +289,6 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
-	/* Dell XPS 16 DA16260 */
-	{
-		.device = DEVICE_ID_ANY,
-		.subsystem_vendor = 0x1028,
-		.subsystem_device = 0x0dba,
-		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
-		.hook = quirk_disable_edp_panel_replay,
-	},
 	/* TUXEDO InsanityBook 15 v1 */
 	{
 		.device = 0x591b,
-- 
2.56.1

