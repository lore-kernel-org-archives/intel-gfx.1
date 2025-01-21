Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD0FC02182
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Jan 2025 19:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA2510E625;
	Tue, 21 Jan 2025 19:30:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2BC10E20A;
 Tue, 21 Jan 2025 19:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/backlight?=
 =?utf-8?q?=3A_Return_immediately_when_scale=28=29_finds_invalid_parameters_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 21 Jan 2025 19:30:29 -0000
Message-ID: <173748782963.2713586.7690244829304847944@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121145203.2851237-1-linux@roeck-us.net>
In-Reply-To: <20250121145203.2851237-1-linux@roeck-us.net>
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

Series: drm/i915/backlight: Return immediately when scale() finds invalid parameters (rev2)
URL   : https://patchwork.freedesktop.org/series/143775/
State : warning

== Summary ==

Error: dim checkpatch failed
1cbbd90d5f1b drm/i915/backlight: Return immediately when scale() finds invalid parameters
-:35: WARNING:BAD_SIGN_OFF: Non-standard signature: Analyzed-by:
#35: 
Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


