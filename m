Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4D810D14AF
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479810E720;
	Mon, 30 Mar 2026 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TG25N/Z3";
	dkim-atps=neutral
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD3310EB82
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:54:42 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-67e00a230adso837625eaf.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551282; x=1775156082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
 b=TG25N/Z3YTgPWXOmXhWjfDAVnM5B6uECwSBVH/Jwb7R/cwOeUBFflRFIfFwpgz6hk5
 aG9SGOFnS8nEvkQIeSuO/6t1xRe2TDfpXzuztD8A7oXMCbejTrgkGkVsW9GKizhZcdR2
 UFWLdT6p40MNOkwM573U3qV/2qzAfs4FviP5SwdAXVSZS2uny7XXGINMT95ZN1aJMhZh
 ne8k9pVBnY65GsX7R1+fypPJzgZGmUHfkLnIcbAk8WCgMi4ajlR6n000Hw5jA1fpj+I2
 bLCmFNRi4pm909OaqfQtdnZSJv6zpQo0UDDRlXZTRvHjLMYcZ3p257Lo39PWik60xBgc
 35VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551282; x=1775156082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
 b=EnFHq7cATlsy/blr55dIroWdDU0HOEkX4w0bycL3P3i+pJQuiXyoW/1TSecqjD2UZo
 DjwjyM5myafZ/TQsmcFFDyw3r6yDQrn312rbBG7U+YYXMdi2exIjUsI7mxzIVffYVv4e
 UJptmyaXLGRs4/UY9xpfssR0iHDapKezHeDQROFrHQb55JrGj+KuzuD+nOl6qQAgkCsr
 D+qSCUz50ULC3r4IfQvEXo2L7EyAoG4kDB7WobhAUygrraX9EaHSH8M0Th7q/PQvMefw
 Tn3e0sp+iVwglW6bBF6Iwg7eAOhQyyawH4UHzate6CMPTKgwPlU3/ZUAUFP4rVRQ2wqI
 u3aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL4C+k+oM1M0rTOW34BHysAoXaRRFeq7jLM/9v57bEVHVz9YH9Ls0yCMKcIMQHY66i+C5teWJgIT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydL8R1FqaC985rCQRNOApcGNUda0UNQXfHLjOdYW6HjBfvl84I
 ngxRIvdxPz20sSVonVO2gVbFgHe9qGKHkQ7iEGSGo/K22ItAVfVAxlFs
X-Gm-Gg: ATEYQzzbgyN2cxPLx7ZbVEjrUG/GfAS8nTPguhhaWG6JM8v0KXQkua8J06ijjNzYoRU
 NdBrv24LNiz+OCKgdv3gMSwgeZ9aeRsO5G2tQGvMkzRWhzN36WCA7U5thdFJ6tvrYwVSDjRU/IO
 2aaxiiw2BqCVaLWYQG61C+SU4HkdJL7MgGf6UC03xSYDoNnu7JGTjAWffHIxXCUwk0w0ABY+PR2
 +xyJrjHc8x8bz6vJXDj5dUjYrkr6uO2Q70yhdGoQT+FW4CG8qKKqVoLSXVawZts3u93JFxC9CyT
 oeFflsnDMnK5hvRd0fx1qQ0WZMBVRRoiXJ17NczHOBkVk8kKoDpazrnA4Wx4jJn2ApMTM7OuN91
 LY8SjzsnfC1V9emnxiW26/dWNhqbXwjZQHMDOsaf/8bQl4m/kdJGcFFBWDgKGr2XPzKJyyl3z8t
 6Gc+lF8nzzm9tXi7qxKbBKAg5NxF/HBKAu2ZHuzrn9LzTFHK+5
X-Received: by 2002:a05:6820:174b:b0:67c:2af2:a66a with SMTP id
 006d021491bc7-67dff37caf7mr4976746eaf.11.1774551281759; 
 Thu, 26 Mar 2026 11:54:41 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:54:41 -0700 (PDT)
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
 linux-doc@vger.kernel.org
Subject: [PATCH v12 08/69] docs/dyndbg: explain flags parse 1st
Date: Thu, 26 Mar 2026 12:53:12 -0600
Message-ID: <20260326185413.1205870-9-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.53.0

