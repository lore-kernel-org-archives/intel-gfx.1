Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99B9C04FFE
	for <intel-gfx@archiver.kernel.org>; Fri, 17 May 2024 14:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA2810EEE8;
	Fri, 17 May 2024 14:12:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBFE10EEE7;
 Fri, 17 May 2024 14:12:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Improve_drm_printer_?=
 =?utf-8?q?code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 17 May 2024 14:12:54 -0000
Message-ID: <171595517432.2143636.2149827623919432046@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517125730.2304-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240517125730.2304-1-michal.wajdeczko@intel.com>
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Improve drm printer code
URL   : https://patchwork.freedesktop.org/series/133749/
State : warning

== Summary ==

Error: dim checkpatch failed
6cab5b4517bb drm/print: Add generic drm dev printk function
-:64: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#64: FILE: drivers/gpu/drm/drm_print.c:288:
+			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",

-:64: WARNING:STRING_FRAGMENTS: Consecutive strings are generally better as a single string
#64: FILE: drivers/gpu/drm/drm_print.c:288:
+			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",

-:67: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#67: FILE: drivers/gpu/drm/drm_print.c:291:
+			printk("%s" "[" DRM_NAME "]%s%s %pV",

-:67: WARNING:STRING_FRAGMENTS: Consecutive strings are generally better as a single string
#67: FILE: drivers/gpu/drm/drm_print.c:291:
+			printk("%s" "[" DRM_NAME "]%s%s %pV",

total: 0 errors, 4 warnings, 0 checks, 93 lines checked
a4fd3a4ec7e7 drm/print: Improve drm_dbg_printer
6b5b0966356e drm/i915: Don't use __func__ as prefix for drm_dbg_printer


