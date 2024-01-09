Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C820C3DA6E
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Jan 2024 02:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FFA10E331;
	Tue,  9 Jan 2024 02:34:00 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66ED10E2DA;
 Tue,  9 Jan 2024 02:33:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/gt=3A_Use_r?=
 =?utf-8?q?c6=2Esupported_flag_from_intel=5Fgt_for_rc6=5Fenable_sysfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juan Escamilla" <jcescami@wasd.net>
Date: Tue, 09 Jan 2024 02:33:59 -0000
Message-ID: <170476763994.196237.5204080778174355577@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109013030.1450099-1-jcescami@wasd.net>
In-Reply-To: <20240109013030.1450099-1-jcescami@wasd.net>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/gt: Use rc6.supported flag from intel_gt for rc6_enable sysfs
URL   : https://patchwork.freedesktop.org/series/128343/
State : warning

== Summary ==

Error: dim checkpatch failed
eb5660834460 drm/i915/gt: Use rc6.supported flag from intel_gt for rc6_enable sysfs
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
Let's fix it by at least use the rc6.supported flag from intel_gt information.

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


