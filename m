Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712E510D14B7
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E6C10E757;
	Mon, 30 Mar 2026 12:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YgL126Zf";
	dkim-atps=neutral
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD63C10EBEC
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:40 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7d8b2703f37so1135408a34.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551340; x=1775156140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26vMP3nfkpOdAIVisqGbQnZnw5iiyCO+aaCVYuAOEzg=;
 b=YgL126Zfb5gq5ReaihNiWNA+xK6A8mLKXUZjxzcZaz/s8UwL4YYuGAggdaRJ+JOmdN
 qOFJkldmt5eJ5+K4FA+71zUibjsgOp6ZjIt7CaG6ePBp120kZrjwi91RPb7E903rxtCj
 5D5AhLKhm8fJ1TPiJQgwpzgnjsN8rTcz3jFqHWNu1OP6IOceA1z2+JWlBU/p72QaiT1e
 QFlNjQ1PTUrT/miNS2rAJVyIHTzkpiWON3RX45+936d+YBJQlKFMCjNn4pL1yGuZ9dkL
 02Hr0RLeOBHmYXB9FpLLh4IBpe5qcOXYqvIbRx8bKvyRtL8xeDL/PEltS2VIsBT8KXRt
 T3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551340; x=1775156140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=26vMP3nfkpOdAIVisqGbQnZnw5iiyCO+aaCVYuAOEzg=;
 b=KLiOYwAs2mtLaWIJuNfOyKQZJZuOCxMFw/XGBXGtVdj4g6i3d8gNq/qeNZfBhXpqcq
 EeE1FYare2dDsRq7HVnPew+mC6QWiTVgH8k2Idh7vdd5Kup824MBgjmzqR+hU0SKo1ur
 NJo3GAxTEaCKbdszu2R5nvNMf+AP/tXCMav1xdm/UMp/wFPZL/SpMkMNzRTmnW3hnKEf
 GeJnmDAPL6Mdo4Tmvhw2oZokTYME9lF2dXYonEuLisj4VrqFcCAs1+os7RuOhHXZNVRH
 VkLCVR03xzRObUp1xjNx4Z/3/w8lZEV3vO4lxRC6H5T9tOVJv+EYlXr9BuDb0b5ioCth
 469Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX52tz4HsiFBZ7AD9U1+ViOxILe5eZqTGFr/XyFoHWubzcP0jvy+7yfNieW8uxVWC3igsH87jhqShU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd/3JNgU6ec1UIyq+EyAVDEZeyHiXc2aK/CkOSsJuklaUhmDn7
 oNAsEjqaK2xxoph/VkVTDA48hzZei8PhlWcvJEfsPdfPx/UhDFk+9XCw
X-Gm-Gg: ATEYQzxOks3+9+EN55ouv5i23ChCI4g0Jo9yfinyIEsDeb43hxoWuOpP/UlbUD0G05b
 Ne/kgOAZdzyg+BoKIfyKihvQ5/G1WFDikWx4sbHUqxrhB1U+OQQyFgvzw0KVw37qH6qSNItr9fG
 8x5YIBOGgbby17zgjWjOketj3FiFwGBKzfMCf9sA1HVYUE4ZsMuFZ+4caHaLwNZ5vn0/sju93PN
 yyh3zKquSBnqdE+7Xid3+oS8yY4jglUnLmu1wwzMFbvhBqHYyufGKyVH2p+56NhRH6Ehxh0eOX/
 JskxLeazH+mqEOXSgcnND+SgQY8hqvC9RusYNGVY+p8isrCsIw+j9GPTVgCwzeBg6Zen2OkvfZi
 bNIdGwMvXUhcOp7m9tDfvleMtKSjafacqtIUzUu7sKwqluPgplqyr86jmgLbRSWhqyLP6l3GMBT
 24J8M1He5hgpcJ2BE4JIHXskzYkZJ05oXQjz/LsToaUCip3tA8
X-Received: by 2002:a05:6820:2289:b0:67e:14bd:5ef3 with SMTP id
 006d021491bc7-67e14bd605dmr669706eaf.30.1774551339843; 
 Thu, 26 Mar 2026 11:55:39 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:39 -0700 (PDT)
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
Subject: [PATCH v12 44/69] drm_print: modernize an archaic comment
Date: Thu, 26 Mar 2026 12:53:48 -0600
Message-ID: <20260326185413.1205870-45-jim.cromie@gmail.com>
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

In the year 2025 it is no longer noteworthy that drm.debug logging is
adjustable at runtime, via sysfs node.  Simplify the statement.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 94064ec6c229..c3df2f3f47d8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -89,10 +89,9 @@ extern unsigned long __drm_debug;
  *  - ...
  *  - drm.debug=0x1ff will enable all messages
  *
- * An interesting feature is that it's possible to enable verbose logging at
- * run-time by echoing the debug value in its sysfs node::
+ * You can also alter the logged categories at run-time:
  *
- *   # echo 0xf > /sys/module/drm/parameters/debug
+ *   #> echo 0xf > /sys/module/drm/parameters/debug
  *
  */
 enum drm_debug_category {
-- 
2.53.0

