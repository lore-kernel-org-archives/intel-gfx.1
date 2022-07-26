Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D723C00144
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jul 2022 21:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E5B93F90;
	Tue, 26 Jul 2022 21:15:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91B1B8D907;
 Tue, 26 Jul 2022 21:15:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 896A3A010C;
 Tue, 26 Jul 2022 21:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 26 Jul 2022 21:15:35 -0000
Message-ID: <165887013553.21572.15721080481474532491@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220726205116.3148847-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220726205116.3148847-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/guc=3A_Cancel_GuC_engine_busyness_worker_synchrono?=
 =?utf-8?q?usly?=
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

Series: drm/i915/guc: Cancel GuC engine busyness worker synchronously
URL   : https://patchwork.freedesktop.org/series/106738/
State : warning

== Summary ==

Error: dim checkpatch failed
1dd66d8a76c6 drm/i915/guc: Cancel GuC engine busyness worker synchronously
-:32: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>' != 'Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


