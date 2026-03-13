Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FFFD58B00
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F53110E4C4;
	Mon, 23 Mar 2026 16:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrZEtlKu";
	dkim-atps=neutral
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1F10EBEF
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:23:06 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-4673790ab85so1445071b6e.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408186; x=1774012986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
 b=FrZEtlKuDuEfFlrIRTNM2hGm6GGCDKItlzdd/w8l+TdKrX2ND6iD0ziBfgO5Czgs62
 9evv8DmgMv/EnjUId0sgIcXW9ofQkAZ0YzGJaIf74VUMUqufCsJuCbKmbSfaiD61G7cq
 JtDRg+ZpKIfMvVDi9DFkwo6kxRs/p1pYU4EEwCVUBrqxG4mc3XTVETEkFWPAGEWnqP8b
 iU11ycRAOS+IrY6RDnJLFGb7KSRPDZS/mi5VAN3zcYC43jiQ4ZiNCZdBwJW1nYY8V6uH
 T1w31A7U0xz0CcMYcraNWtgFfeMNjaU1TK8KD5T9bIam1lHNQ6HCbaSdRi62IS1S9VTK
 DFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408186; x=1774012986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
 b=iVtQchCjqsQ+6NT0me/3No1KE3Kiyf6Xyo05t5cWJ3Yw1gmDeCEhp2N63Pc80DTkLp
 lXvBlThJSBgmQ9903sT8ZCedNMrkXkDRFeF62PFX/qAY0bgan/F59fICYKPpit+L+XK3
 Rvo0oeIxz8Kut8ypRT6HiXdQU2vn+rvNet/WZzfSwLysc8ivs6ArF6S9kQo1kZOcziNi
 Y0CHkWg0LDLsiPsEvq7mIq1XuG+qh8wLe8o8SU/tI6TkBsq0RtQG9RaLhw5poMywdY1X
 ur1MxNh5ng6CbE7+xeeUSR0CWu7JHYDPvBFB+MlpX/kQaaKFExV99H1Xh6yovRdw9Xjz
 RVow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8fLfQrwyVzuDx8Wq7+U3zFmbM9PlsIvmmFUiBNgQ/VYCjG9Ji2RjH9oqShX0B89SK9crZtjynrAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy11+LdnreHTBJth/oKeELKpLsYWuc7Og73Re5FIMC08+8q6Sfv
 nvOcyLrj3BePLC59IjhRUcyTyj011P9jyipAWV5gL+gb/KngyGjihvG+
X-Gm-Gg: ATEYQzwbqoe9Xjo9ewLjzy8SJ0EMWxwTy/ry9oPiFsBMxbDZjHfvx8SG00ZUCaY8AWV
 rjenOcPiV3gxD/jp68To7BK8XtqzLLcVINTE3fGgStq1WGfoLJmUEnxp5+hd3aRdx78kkSLDlrV
 pC+bVFsTJKp1S1ZU90S8DLoHtrme3gBy5S7C280ghung5rCaIeL3OG0XRDvCoCXyj6kOvZDs1HJ
 l8UFm2+TgCD+0Gz1nCjk5L62TDPNZqYMUQpCd/9VNE6G6vdasmqLgdE24E1SKeFcdslcha1qTTT
 GECS5j74looyZIFsUiCwp2uYe5tbPyEIImMY9WBnnBdYeMerhCqOJjIE8hEk1OhSaUpWTPdvzqQ
 1YLG8dGwpB9rw0wg60iPQT9mWzC+H6af1scgJVo3Lc6yJqSZUoY8guCG2BYSUTGScb18GReQnnO
 rpMIJGQhBFZ0/HGF2/E8DeRURbDYEJwP/HGszxuHv2EFY4wi0u
X-Received: by 2002:a05:6808:15a2:b0:467:1e5:6766 with SMTP id
 5614622812f47-4675766748fmr1758674b6e.45.1773408185885; 
 Fri, 13 Mar 2026 06:23:05 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:23:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, pmladek@suse.com, ukaszb@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 05/65] docs/dyndbg: explain flags parse 1st
Date: Fri, 13 Mar 2026 07:19:30 -0600
Message-ID: <20260313132103.2529746-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:03:23 +0000
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

