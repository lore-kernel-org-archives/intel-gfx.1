Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50F9C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jul 2022 09:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100611BD01;
	Fri, 15 Jul 2022 09:27:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B682D11BD0A;
 Fri, 15 Jul 2022 09:27:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AFD0FA66C9;
 Fri, 15 Jul 2022 09:27:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mchehab@kernel.org>
Date: Fri, 15 Jul 2022 09:27:57 -0000
Message-ID: <165787727769.10565.17632077460140146451@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <2378da383d043de17172d928e59da0ec423cae76.1657873550.git.mchehab@kernel.org>
In-Reply-To: <2378da383d043de17172d928e59da0ec423cae76.1657873550.git.mchehab@kernel.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gt=3A_Retry_RING=5FHEAD_reset_until_it_sticks?=
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

Series: drm/i915/gt: Retry RING_HEAD reset until it sticks
URL   : https://patchwork.freedesktop.org/series/106377/
State : warning

== Summary ==

Error: dim checkpatch failed
8af7dbc6eea2 drm/i915/gt: Retry RING_HEAD reset until it sticks
-:116: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end' - possible side-effects?
#116: FILE: drivers/gpu/drm/i915/i915_utils.h:264:
+#define until_timeout_ns(end, timeout_ns) \
+	for ((end) = ktime_get() + (timeout_ns); \
+	     ktime_before(ktime_get(), (end)); \
+	     cpu_relax())

total: 0 errors, 0 warnings, 1 checks, 89 lines checked


