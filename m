Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0EF10D14B2
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85610E6FB;
	Mon, 30 Mar 2026 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AtLSE+SM";
	dkim-atps=neutral
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4110EB20
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:54:34 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-40ee9b945d5so939930fac.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551274; x=1775156074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqKdylESk9B/a6b5Oi5X2s5Hl7NPYjGcR39u69Tcphw=;
 b=AtLSE+SM/cyi/AJqCyCwyl8xkqZurtAXHz4zObtgqTH5xjTI0fPfEp/yYvF4Mlq8ev
 lh4a3zdQqi+CNZYibSy0XVgUfGo7lFLcwd5E3hfUSpu2bC+DqcQaqRcDO0LBcIhUH4cg
 KcNNYTFqzj9iInmSQwB02f+Ep0845PSfj1/oi30kn6tSGBSrPUr8aUlS74koGJJUsbGj
 Gspa7dICjzplX0FaeMaKog6SCQ3zHXDuErBBlCEK1NFmvIxm4hj1Jw5aBbx6MHsSk9TK
 kWY2oMZcnqstaGXPRPDO9jPB2FtwEmn06ZEekxHJiMUV15OgFc6ZwtO1Vsl64iWdb22N
 i+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551274; x=1775156074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OqKdylESk9B/a6b5Oi5X2s5Hl7NPYjGcR39u69Tcphw=;
 b=nZ7JCzJ9fNfJE+WWpZbh/fxkEYAlbLf8oXZWqmHeIshUJQlKeA12FA39HUf9CE+Tq9
 Jqz1h14u5p6TerHNBHMQOWxO4Aj9wjB9sGXs3JuR7OdFJXPQF1fjoYQ1e8O24kShFtMZ
 4lOm7AggCVQh9FEMat97vq4PudeCIXbRE10VZRFDXCjD7NvNVa9i2MH2SKJzFAPZm4pl
 xB1Z7EJj5dW4xbBnv+/j7Yj5p+nfvoGOPt+DjmB4hMcvm3ca08THvTE2IYJHvthhvQxZ
 0TPdGSsIeZh7JviRLBYrfpZmPetRIzkZssAfc9FQpmBYrst4irE1s/crpOpiQ9qltP5F
 qT5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbvVs43JawyA/JaNDvZpwNZKdnFvvRnMOjVEI2Dwgpe5qgnTCtCegOQfy0aMQf1wjVJ3Tkw30DZWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJg93lY41LsDvo/fDVcQMon+j5FoGYMDWXiiQuub7vwfJMGvPA
 vQOXJHj95wRNRtHIkSHRFAHa09Jco5e07XtCkMsnZ3co5s+6bRlUsf9t
X-Gm-Gg: ATEYQzy/dvgcvwpYnvYuP2AiE86i8khxFVQqO5iziKO95i4mI1RQJE0vTqIiMp+pNuq
 jh2NmKx0r+ClQ8ODJBu/RqHSttBM9Q1KAQr4V4XMB3GUnWceUz9+1bQhzwS7447YS1NI2U1wNFv
 AoJKYMppJlmmjb7j/5qBHRKW59oOIIVk9M/pp5kRzBwi6/rmp8sM12uMjYLsjgRhDlo11hHgjjh
 9cHeJRrdMzUHTpegWbwvtusgmB+Es6AGrDky1jrh01+Gn7eUx/8H3Fo03xD+lvAilXprIFP56L8
 O9BbddxxUYPfy1vUWdCUb0qVZ///l7OHyIB/IE1AySQVp05700WioPZCBjDFSwEoTZkPA4iRqU6
 uRln5O5rzZlpfx2lfBDnA8WPbw4aC0ZT78Njo+2CSWesUllcT+HiyvUraFmp8CZdZozTotjcbMq
 BmRy8WIJNz+hpG0LnsmkkbtQlN61ePk2docBw5o1MfaennG+Op
X-Received: by 2002:a05:6871:2b0d:b0:41c:4af:7f5f with SMTP id
 586e51a60fabf-41ca6fcdc85mr4146349fac.28.1774551273959; 
 Thu, 26 Mar 2026 11:54:33 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:54:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 jbaron@akamai.com, gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v12 03/69] dyndbg.lds.S: fix lost dyndbg sections in modules
Date: Thu, 26 Mar 2026 12:53:07 -0600
Message-ID: <20260326185413.1205870-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 Mar 2026 12:57:43 +0000
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

In an (unused) experimental variation of this series, I had trouble
with __dyndbg* sections getting lost in drm drivers.  While it didn't
happen in this series, it exposed a non-obvious weakness.  So fix it,
by following the model demonstrated in codetag.lds.h.

Introduce include/asm-generic/dyndbg.lds.h, with 2 macros:

DYNDBG_SECTIONS moves the 2 BOUNDED_SECTION_BY calls from DATA_DATA in
vmlinux.lds.h, which now includes the file and calls the new macro.

MOD_DYNDBG_SECTIONS also has the 2 BOUNDED_SECTION_BY calls, but wraps
them with output section syntax to keep them as known and separate ELF
sections in the module.ko.

dyndbg.lds.h includes (reuses) bounded-section.lds.h

scripts/module.lds.S: now calls MOD_DYNDBG_SECTIONS right before the
CODETAG macro (consistent with their placements in vmlinux.lds.h), and
also includes dyndbg.lds.h

This isolates vmlinux.lds.h from further __dyndbg section additions.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/dyndbg.lds.h  | 19 +++++++++++++++++++
 include/asm-generic/vmlinux.lds.h |  6 ++----
 scripts/module.lds.S              |  2 ++
 3 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 include/asm-generic/dyndbg.lds.h

diff --git a/include/asm-generic/dyndbg.lds.h b/include/asm-generic/dyndbg.lds.h
new file mode 100644
index 000000000000..f95683aa16b6
--- /dev/null
+++ b/include/asm-generic/dyndbg.lds.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DYNDBG_LDS_H
+#define __ASM_GENERIC_DYNDBG_LDS_H
+
+#include <asm-generic/bounded_sections.lds.h>
+#define DYNDBG_SECTIONS()					\
+	. = ALIGN(8);						\
+	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)			\
+	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)
+
+#define MOD_DYNDBG_SECTIONS()                                           \
+	__dyndbg : {							\
+		BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)			\
+	}								\
+	__dyndbg_classes : {						\
+		BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)	\
+	}
+
+#endif /* __ASM_GENERIC_DYNDBG_LDS_H */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 462f124ad457..b59f343818b0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -340,6 +340,7 @@
 /*
  * .data section
  */
+#include <asm-generic/dyndbg.lds.h>
 #define DATA_DATA							\
 	*(.xiptext)							\
 	*(DATA_MAIN)							\
@@ -353,10 +354,7 @@
 	*(.data..do_once)						\
 	STRUCT_ALIGN();							\
 	*(__tracepoints)						\
-	/* implement dynamic printk debug */				\
-	. = ALIGN(8);							\
-	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
-	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
+	DYNDBG_SECTIONS()						\
 	CODETAG_SECTIONS()						\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 054ef99e8288..8a7b0741bf8d 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -10,6 +10,7 @@
 #endif
 
 #include <asm-generic/codetag.lds.h>
+#include <asm-generic/dyndbg.lds.h>
 
 SECTIONS {
 	/DISCARD/ : {
@@ -60,6 +61,7 @@ SECTIONS {
 		*(.rodata..L*)
 	}
 
+	MOD_DYNDBG_SECTIONS()
 	MOD_SEPARATE_CODETAG_SECTIONS()
 }
 
-- 
2.53.0

