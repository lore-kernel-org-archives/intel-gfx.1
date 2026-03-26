Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B7010D14B4
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB3810E70A;
	Mon, 30 Mar 2026 12:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gWJBE9iY";
	dkim-atps=neutral
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB8710EBB9
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:06 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-415b23dd6e5so537982fac.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551306; x=1775156106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BtzYjTItScPv3ZPv5u0hQB8QpwmveJQikTbqnzcN8xo=;
 b=gWJBE9iYqkX5ifNy98GcVSPqaILTm3863mWMPbDrajjExuKMvKHWkqOmu8kgBG05KV
 sUnefqoABnDz0K8cuCMdyR9NBJT+Lp2sEM/GJGemLmBAnOFyk1bZSMEuuXUSSFweFj+8
 AnSf5ru/Szg+5l9I63KcTYfOhhKEZFUO9hxPdM0Fjx8L0//mBiX0rmUfDbGAHbfAFYqs
 8RkJNng9X4axFQFR5K4dw8zQZ53vyNpJZ1sP7fJ84Zx//xAZS8msz/oIzg7ubRvDnvE5
 4YXQA5sbzfvsn4Z+3IYApzQcxOSt/o1VGOKnEid0IZM22xAebx9s8IcJA6jGntM8EdEv
 oS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551306; x=1775156106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BtzYjTItScPv3ZPv5u0hQB8QpwmveJQikTbqnzcN8xo=;
 b=CcRC76jk7bqbtY86qbwAR9KLLALK7y5W7JA+wQ5xT00G+pPxO3apPvrNqQAkhM3DQn
 YGq/hNW8pTUUBFS2qiOwnKcWcCBYfIWhVM3ZWOhqdVKhQ4Ep+FqrUxtsVdH2G+Z2zLbR
 aP5Slit4tlwZV9RUgwyr3KC+YAsJ+/St/cAHD/Fo1M/3rBZC9ZbjAy3LB9AX0ILNK0kx
 jtbyL1C0y6812pEn0EyI3lTBRj37WiGh48PZf1O0bwmtMfpmZUxlbMeHJZQfpl3xZ/G3
 MbWEBvZx1hBPzp76g9NBWPBX09ZRMByyV39POwPVqSg8mqAIYIMn4LnOrORAtYZkNAJI
 Z9og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW19ZD4nd1mrST66Ewi1Gp48knMf9qWNYKd+G09xoXBkDHgpoJ4OXIbQMhvC/vZUD+bQUCz6brjhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySOTxTneulVBdWXbPoosBnzZCQZ+rRxPJBSzggihCAxcDwG8pL
 esIhQfKENsw9gHoUZjWVOYOHhZHLjDG2w0/id++EvuNpMWM5LWL3ST/e
X-Gm-Gg: ATEYQzxV2MsD8sibfXCZedPc/jJHE6PXS1IvJCWhvDK9nglu10npJg6ANXMMdRY7VBl
 49FGcqzzn3hISkS+3WIX9d+Cq4XRhqXRSHaFoCE0TjB77eLM63A6ZyFz23cztuRFgeHjHGvQfc/
 1HnAov55t3hEnvMrxIbxAo33awkX2SODaCZDQzkeCUPs1uJMltUmhAe/Z/VAZSSKkVBOmS1+zfw
 2hFWJ7oUHFmg9vCSlkj6nakkQf+TiVlzqrfW7YA4oazornzG1MId6jgfDcEpwYMV50BaKLU+uO/
 WKMdGNFH/ZxH3j8RtZ9QxSEytQ7YwijtzHD2Oac0oq27meNGIGC9u2W3FB1El6XTjA22dDcBtlC
 QWWPKkncVva70WLaf+HayblrxbTrMBaZKMtTidNulOkcZq7Xu3uQpERM9JaEjXNK1l2mms79pNl
 BuwH6MVOKXtnk0c54eBIEvei76Ab5kxiVcTI714vfLRjN+ntFG
X-Received: by 2002:a05:6870:d18d:b0:417:4679:d550 with SMTP id
 586e51a60fabf-41ca6e15946mr4548356fac.22.1774551305958; 
 Thu, 26 Mar 2026 11:55:05 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:05 -0700 (PDT)
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
Subject: [PATCH v12 24/69] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Thu, 26 Mar 2026 12:53:28 -0600
Message-ID: <20260326185413.1205870-25-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 3939b294c647..33291abd8971 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -224,24 +224,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id)) {				\
 		func(&id, ##__VA_ARGS__);			\
 		__dynamic_dump_stack(id);			\
 	}							\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id)) {					\
 		func(__VA_ARGS__);					\
 		__dynamic_dump_stack(id);				\
 	}								\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.53.0

