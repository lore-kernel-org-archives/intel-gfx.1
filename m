Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B1FC88E45
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2026 15:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13C10F673;
	Fri, 11 Sep 2026 15:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="bAv9f4pf";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67ED10F673
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 15:05:13 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49cf4f81d86so7989075e9.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1789139112; x=1789743912; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7/A+IkvGH5yYLsl3B/FA+2ENzgeK330huKjO7uo/XWA=;
 b=bAv9f4pfJGUPJfFmpSAe/nMN+MkKIUfQwlO66RRkerY2TXy1ayMI6m4GMQbrrGEq8P
 BsTTAWkG6TRmCmvI5epva9H7HlgHtsgo+K7UkGW0tpHH/SveHiKL57pnxVnu5OmUOjMP
 KgZz1hgePlH9qMyg+MM2+3ONbTKS6GcyLwNpehALxV2NgmW+cPGHdfxCE8T8JAIoknXL
 8hh6c5Ze7/QWpxGCQ4ezb/Cl1oEePq9QkV52EaSiZKq8DfIrXBjI/Lwfl26sI/cjXjUC
 /VLRJRlzRYAVuggpJkZCHuuQ9gWgzS0wuoV6TgXU0PHFhJNatFHpnm3BC8Ugr2pfyKoD
 me4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139112; x=1789743912;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7/A+IkvGH5yYLsl3B/FA+2ENzgeK330huKjO7uo/XWA=;
 b=M0lXdahgM3hWgEj5lFGxRVkFArdV9kbUa2mBEMbDSD1H7SnkXCI7tRu66HeR86hjSZ
 ZUeO+5uM+/rOJOFg6EoSzwW4t4GJdWK7/asr/8lKepEBJBV2Eyb7/U9LqAD1yWWyDkCI
 mH+yPFdU8GU2UWURib1Q/a3quv792kAG2Z44z8wylA/SOFAvAHPZxaEJeElmLZUdpfP3
 PX4Q21nRVEYNfLDsD2OaT0rfufVwJ6OXCjoJO+vGEdmgYzqcS0igV19rv02PvYeCNwoL
 T77BpBQyTFiCo56QWgc94GgjTqslaK7X86CMT+LRUjOkB/ncW0HFSpzkCTpWJ0GSt63p
 SvJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzQgaioC7fIdWi/y51e/RQCp/AkMApNfhcxBtkbWyVZWy3NURRnBbwmUjNpFeZD7HQ2KWNJZv0pok=@lists.freedesktop.org
X-Gm-Message-State: AFuF++k7dupYwnCG33RR0mD92w0aB07UkHWMYXZo/8GcbcTd3/XiPHg3
 leviM6y6vwGs/fUkdPdhQczz4LQbpAaOWYIQenvoZ3UolwRz5DQsTneEFIOarbdhj1c=
X-Gm-Gg: AYBFou3rElsFDhzf4cDjzIVxON1db7t5a6i4afcY6LOAuZ6IAvBsLNsBpOXX/PLpUI0
 Y+Zk5WwAVcZXcEsHZNGZy28Hmo8rQUoujo+GWtryIKOo/IxNogpU7fhEwpERiGuBJVy/vaWwmYc
 ASA83iyzrw2jXV1GZ6s6dQmROs+hAqJt3MEXyNsNK7zv/APJpW56lFXRUSjQPsDh1G/uB6Hrr0W
 dLUQrfZ3Qs2VDQPk2h79QDgCK8/qNlpkwF23hQpeiKeuPPtpp9Dr7/1xW7j0gM88NYF7+qjJwkW
 xHTNLC5+NiVOL0MtolkROs21aMNzAthfR5V07RaEbb8gpIK7Twz4Ro9nsJ2g/Hth4EEVIc5ki1J
 mBB3KWEkwFeJKMYFl+NwvYuZ+GaHwt9yGDM6wrIIKCugRnjPrrIb3I78o6bdkU1CqgpoEV4z9S3
 A1PxrFDIYUN0QmcoBS6BjnjGg7zwj+6mIgvsDZgW23N1NezOy+pYR5gdASSyePsn0=
X-Received: by 2002:a05:600d:8498:20b0:49c:fc6c:be15 with SMTP id
 5b1f17b1804b1-49e619c6eecmr39713085e9.27.1789139111976; 
 Fri, 11 Sep 2026 08:05:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 08:05:11 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] syscalls: Include error-injection.h for
 ALLOW_ERROR_INJECTION()
Date: Fri, 11 Sep 2026 17:04:03 +0200
Message-ID: <20260911-module-include-error_injection-v1-3-5da895d8c84d@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

include/linux/compat.h and include/linux/syscalls.h use
ALLOW_ERROR_INJECTION(), which is defined in asm-generic/error-injection.h.
They currently rely on that header being included indirectly through other
files, typically via linux/module.h -> linux/error-injection.h.

Add the missing include in preparation for removing the
linux/error-injection.h include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/compat.h   | 1 +
 include/linux/syscalls.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index 8da0a15c95f4..ad37ca617e65 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -18,6 +18,7 @@
 #include <linux/aio_abi.h>	/* for aio_context_t */
 #include <linux/uaccess.h>
 #include <linux/unistd.h>
+#include <linux/error-injection.h>
 
 #include <asm/compat.h>
 #include <asm/siginfo.h>
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 8413b624ad47..552d9710a0d5 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -92,6 +92,7 @@ struct file_attr;
 #include <linux/quota.h>
 #include <linux/key.h>
 #include <linux/personality.h>
+#include <linux/error-injection.h>
 #include <trace/syscall.h>
 
 #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER

-- 
2.55.0
