Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF910D14B1
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AC010E6E0;
	Mon, 30 Mar 2026 12:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TjqwWb5G";
	dkim-atps=neutral
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB13910EAF8
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:54:31 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-41708f6aa5fso873544fac.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551271; x=1775156071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYmxGb7uQeQFtcBU/KNsuA+yly7Rfm4LYjwUpGocOHU=;
 b=TjqwWb5GfAnUTWbVAzSskWTaDEPtTz/b7OPVQN/5Ma5Wuf1I567u6DSkxA7iOaovgQ
 IDzHtKn+TzhVCrYhcnDKf1k5sTOpzmgWDa9s+Y3ACvs5B0Xivzk6m7P6CEggnzumVrnS
 buj+xiaFONeP2nQYiZpNFCh8JCghweLMKIGfsdRLyTsvSULY0uO4KexWEIGU+9taJgLA
 B7JUTKsQfvV1BvRc5oXaAkYNK5qgUlSdWN8J6Wo1hGI/bSHnVzWsw6aIlz7/m3lnwZc0
 jwyrC0Djr9CSuXCXYPAzjKO1vEku83BXVv+e1QmnouzWVkOzW23qUQgQ1WRfPqALUbYH
 MsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551271; x=1775156071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gYmxGb7uQeQFtcBU/KNsuA+yly7Rfm4LYjwUpGocOHU=;
 b=jWTh8WU+lfNMxT/PhRLHMMdFIHNIwql1YJB9HbJSSrpV2LGmbc4eoTGeXl9U5bY9Af
 G2sxQREVOigwMdfj0khaX0BTjEqv8tXCKNkBK6Vgf7IJWJPhOeaoLUn3z2+/ndeZqs0i
 zZuSqlf3S3Sfelp/wV/zlIQW5icmWY6GK2jdo7dtnux0W+ZdT6z9oII7rOpuPcZXelrY
 M0BCPik1RabgeG9xGs6zhBjnFkkyFKK7gs3nBweKpSd8ipFmfaVr1/koi6XyhMJ7Md6Y
 vMjgPT+W1Z5+g1luEx8xqjvyVz9V8p8rXkuljh7fgNN1ub+QYppWZIjJ2nO4w14UT06F
 ibHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlJcpHm/LWzdDJtV9x5X2vCTNx32qHw/uGKl8JEGamrbN+AvkF89662W3jaqbScVTeVafejjWzmuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHaUKO41BXSU/tqIDcHYApic7gZv8PyjT/dhJ0FxERZ6KqS9Li
 u1oRJ7tpyYrPfO+PiIaWDz2XoxDTGe63NCyOO5JVjqpE1+jWVncFa36Z
X-Gm-Gg: ATEYQzy8bLgUscPTdRY7/KTTXt8yXxl7XUQ3ap8ZNKUnO9EOcSgSXnhs1zhmNpM+IGu
 X4KXHSjPBVYseBgA0TLV6O06vfErmrkBWYvBO5QE9qQqzArghRvVLLyYwvLlfqfGot7/qphXbVL
 yEcRwz3qC1N1glAkDfbi7sbCtC4T8/AL1aDYuNL/DEo1GNth20Rse/Gh5tToDF2sC/mZDQxbxNW
 ZSODtdAxP//uFBbDarzUYFB8l3tKFgTuOULv9oBRxqpp0SF/nMgboNl6A/gqrgbPoZ3rcNE1PEx
 YFlEROO7dHW9uNm+Q6RvSPwzmuGmoMl5Ir621LEfbEyXlb6udah+7wpp5vUgE8wKi2Y5lkEtm6v
 VF9wtBJ/G7bplS9Gg/LXSVcmniQde4NZDCiW0H65uoZlltBgVhtIuWvx8Blw2P0nBhSV3LICr1b
 jvyt+k95NwqS52g2DVWZgApFfFhLB5mBM7+zAj5Dh+lBBKB3ld
X-Received: by 2002:a05:6870:8131:b0:417:ab68:fbaf with SMTP id
 586e51a60fabf-41ca6ddbde6mr5024881fac.20.1774551271056; 
 Thu, 26 Mar 2026 11:54:31 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:54:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 jbaron@akamai.com, gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel test robot <oliver.sang@intel.com>
Subject: [PATCH v12 01/69] dyndbg: fix NULL ptr on i386 due to section
 mis-alignment
Date: Thu, 26 Mar 2026 12:53:05 -0600
Message-ID: <20260326185413.1205870-2-jim.cromie@gmail.com>
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

When dyndbg classmaps get used (later in this series), the
__dyndbg_classes section (which has 28 byte structs on i386), causes
mis-alignment of the following __dyndbg section, resulting in a NULL
pointer deref in dynamic_debug_init().

Fix this by:

Adding ALIGN(8) to the BOUNDED_SECTION* macros.  This aligns all
sections using those macros, including the problem section above.
Almost all the other macro uses are already ALIGN(8), either
directly or by being below one.

Removing BOUNDED_SECTION* uses in ORC_UNWINDER sections.  These
explicitly have smaller alignments, and using the modified macros here
would override that aligment, which scripts/sorttable.c does not
tolerate.

Move __dyndbg section back above __dyndbg_classes, restoring its
orignal position.  This is cosmetic, given the alignment added to the
macros.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202601211325.7e1f336-lkp@intel.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e1580febe4b..58daa551420b 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -212,11 +212,13 @@
 #endif
 
 #define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	. = ALIGN(8);							\
 	_BEGIN_##_label_ = .;						\
 	KEEP(*(_sec_))							\
 	_END_##_label_ = .;
 
 #define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	. = ALIGN(8);							\
 	_label_##_BEGIN_ = .;						\
 	KEEP(*(_sec_))							\
 	_label_##_END_ = .;
@@ -869,15 +871,21 @@
 #ifdef CONFIG_UNWINDER_ORC
 #define ORC_UNWIND_TABLE						\
 	.orc_header : AT(ADDR(.orc_header) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_header, _orc_header)		\
+		__start_orc_header = .;					\
+		KEEP(*(.orc_header))					\
+		__stop_orc_header = .;					\
 	}								\
 	. = ALIGN(4);							\
 	.orc_unwind_ip : AT(ADDR(.orc_unwind_ip) - LOAD_OFFSET) {	\
-		BOUNDED_SECTION_BY(.orc_unwind_ip, _orc_unwind_ip)	\
+		__start_orc_unwind_ip = .;				\
+		KEEP(*(.orc_unwind_ip))					\
+		__stop_orc_unwind_ip = .;				\
 	}								\
 	. = ALIGN(2);							\
 	.orc_unwind : AT(ADDR(.orc_unwind) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_unwind, _orc_unwind)		\
+		__start_orc_unwind = .;					\
+		KEEP(*(.orc_unwind))					\
+		__stop_orc_unwind = .;					\
 	}								\
 	text_size = _etext - _stext;					\
 	. = ALIGN(4);							\
-- 
2.53.0

