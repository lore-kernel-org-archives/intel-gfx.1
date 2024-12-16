Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A264E7717F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Dec 2024 22:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18B110E15F;
	Mon, 16 Dec 2024 22:21:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35BB10E15F;
 Mon, 16 Dec 2024 22:21:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Enable_GuC_SLPC_defa?=
 =?utf-8?q?ult_balancing_strategies?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 16 Dec 2024 22:21:46 -0000
Message-ID: <173438770692.3457893.2283328398068690095@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216204404.1621540-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241216204404.1621540-1-rodrigo.vivi@intel.com>
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

Series: Enable GuC SLPC default balancing strategies
URL   : https://patchwork.freedesktop.org/series/142676/
State : warning

== Summary ==

Error: dim checkpatch failed
234da58b3759 drm/i915/guc/slpc: Enable GuC SLPC default strategies
5ca3fb3b7d8c drm/i915/guc/slpc: Print more SLPC debug status information
-:21: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#21: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:778:
+			drm_printf(p, "\tDCC enabled: %s\n",
+			   str_yes_no(slpc_tasks->status &

total: 0 errors, 0 warnings, 1 checks, 23 lines checked


